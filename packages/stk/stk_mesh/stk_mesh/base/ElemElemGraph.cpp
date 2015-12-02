#include "ElemElemGraph.hpp"
#include "ElemElemGraphImpl.hpp"

#include <vector>
#include <algorithm>

#include <stk_topology/topology.hpp>
#include <stk_mesh/base/BulkData.hpp>
#include <stk_mesh/base/MetaData.hpp>
#include <stk_mesh/base/Comm.hpp>
#include <stk_mesh/base/FEMHelpers.hpp>
#include <stk_mesh/base/GetEntities.hpp>
#include <stk_mesh/baseImpl/DeletedElementInfo.hpp>
#include <stk_mesh/baseImpl/MeshImplUtils.hpp>

#include <stk_util/parallel/CommSparse.hpp>
#include <stk_util/environment/ReportHandler.hpp>
#include <stk_util/util/SortAndUnique.hpp>


namespace stk { namespace mesh {

const impl::LocalId ElemElemGraph::INVALID_LOCAL_ID = std::numeric_limits<impl::LocalId>::max();
const int ElemElemGraph::INVALID_SIDE_ID = -1;

impl::ElemSideToProcAndFaceId ElemElemGraph::get_element_side_ids_to_communicate() const
{
    stk::mesh::EntityVector elements_to_communicate;
    std::set<stk::mesh::Entity> element_set;
    const stk::mesh::BucketVector& shared_node_buckets = m_bulk_data.get_buckets(stk::topology::NODE_RANK, m_bulk_data.mesh_meta_data().globally_shared_part());
    for(size_t i=0; i<shared_node_buckets.size(); ++i)
    {
        const stk::mesh::Bucket& bucket = *shared_node_buckets[i];
        for(size_t node_index=0; node_index<bucket.size(); ++node_index)
        {
            stk::mesh::Entity node = bucket[node_index];
            const stk::mesh::Entity* elements = m_bulk_data.begin_elements(node);
            unsigned num_elements = m_bulk_data.num_elements(node);
            for(unsigned element_index=0; element_index<num_elements; ++element_index)
            {
                if (m_bulk_data.bucket(elements[element_index]).owned())
                {
                    element_set.insert(elements[element_index]);
                }
            }
        }
    }
    elements_to_communicate.assign(element_set.begin(), element_set.end());

    return impl::build_element_side_ids_to_proc_map(m_bulk_data, elements_to_communicate);
}

ElemElemGraph::ElemElemGraph(stk::mesh::BulkData& bulkData, const stk::mesh::Selector& sel, const stk::mesh::Selector* air) : m_bulk_data(bulkData), m_skinned_selector(sel), m_air_selector(air)
{
    int numElems = size_data_members();

    impl::ElemSideToProcAndFaceId elem_side_comm;
    if (numElems > 0) {
        impl::fill_local_ids_and_fill_element_entities_and_topologies(m_bulk_data, m_local_id_to_element_entity, m_entity_to_local_id, m_element_topologies);
        fill_graph();

        elem_side_comm = get_element_side_ids_to_communicate();
    }

    // Todo: very conservative number (is it worth improving?)
    size_t num_side_ids_needed = elem_side_comm.size(); // parallel boundary faces
    num_side_ids_needed += m_num_edges; // locally_owned_faces

    num_side_ids_needed += 6*m_elem_graph.size(); // skinned faces

    bulkData.generate_new_ids(bulkData.mesh_meta_data().side_rank(), num_side_ids_needed, m_suggested_side_ids);

    fill_parallel_graph(elem_side_comm);

    update_number_of_parallel_edges();

}

void ElemElemGraph::update_number_of_parallel_edges()
{
    // Figure out the real number of sides that can be generated, using
    // the rule of one side entity per element side (with multiple
    // coincident elements each being connected to the same side)
    m_num_parallel_edges = 0;
    for(size_t i = 0; i < m_elem_graph.size(); ++i)
    {
        std::set<int> uniqueRemoteOrdinals;
        const std::vector<impl::LocalId> & localElement = m_elem_graph[i];
        for(size_t j = 0; j < localElement.size(); ++j)
        {
            if(localElement[j] < 0)
            {
                // Connected to remote element through this side
                uniqueRemoteOrdinals.insert(m_via_sides[i][j]);
            }
        }
        m_num_parallel_edges += uniqueRemoteOrdinals.size();
    }
}

stk::mesh::EntityId ElemElemGraph::get_available_side_id()
{
    stk::mesh::EntityId availId = *(m_suggested_side_ids.begin() + m_num_ids_used);
    m_num_ids_used++;
    return availId;
}

void ElemElemGraph::reset_suggested_side_id_iter(size_t numIdsNotReallyUsed)
{
    m_num_ids_used -= numIdsNotReallyUsed;
}

ElemElemGraph::~ElemElemGraph() {}

size_t ElemElemGraph::get_num_connected_elems(stk::mesh::Entity local_element) const
{
    impl::LocalId local_id = get_local_element_id(local_element);
    return m_elem_graph[local_id].size();
}

unsigned ElemElemGraph::get_num_connected_elems(stk::mesh::Entity localElement, int side_id) const
{
    impl::LocalId local_id = get_local_element_id(localElement);
    const std::vector<int>& sides = m_via_sides[local_id];
    return std::count(sides.begin(), sides.end(), side_id);
}

bool ElemElemGraph::is_connected_elem_locally_owned(stk::mesh::Entity localElement, size_t indexConnElement) const
{
    impl::LocalId local_id = get_local_element_id(localElement);
    return m_elem_graph[local_id][indexConnElement] >= 0;
}

int ElemElemGraph::get_side_id_to_connected_element(stk::mesh::Entity localElement, size_t indexConnElement) const
{
    return get_side_id_to_connected_local_id( get_local_element_id(localElement), indexConnElement );
}

int ElemElemGraph::get_side_id_to_connected_local_id(impl::LocalId localElementId, size_t indexConnElement) const
{
    return m_via_sides[localElementId][indexConnElement];
}

stk::mesh::Entity ElemElemGraph::get_connected_element(stk::mesh::Entity localElement, size_t indexConnElement) const
{
    impl::LocalId local_id = get_local_element_id(localElement);
    impl::LocalId other_element_id = m_elem_graph[local_id][indexConnElement];
    return m_local_id_to_element_entity[other_element_id];
}

stk::mesh::EntityId ElemElemGraph::get_entity_id_of_remote_element(stk::mesh::Entity localElement, size_t indexConnElement) const
{
    ThrowRequireMsg(!is_connected_elem_locally_owned(localElement, indexConnElement) , "Program error. Contact sierra-help@sandia.gov for support.");
    impl::LocalId local_id = get_local_element_id(localElement);
    stk::mesh::EntityId id = -m_elem_graph[local_id][indexConnElement];
    return id;
}

int ElemElemGraph::get_owning_proc_id_of_remote_element(stk::mesh::Entity local_element, stk::mesh::EntityId other_element_id) const
{
    impl::LocalId local_id = get_local_element_id(local_element);
    impl::ParallelGraphInfo::const_iterator iter = m_parallel_graph_info.find(std::make_pair(local_id, other_element_id));
    ThrowRequireMsg( iter != m_parallel_graph_info.end(), "Program error. Contact sierra-help@sandia.gov for support.");
    int other_proc = iter->second.m_other_proc;
    return other_proc;
}

int ElemElemGraph::get_side_of_element1_that_is_connected_to_element2(impl::LocalId elem1, impl::LocalId elem2,
                                                               const std::vector<impl::LocalId>& connElements) const
{
    std::vector<impl::LocalId>::const_iterator iter = std::find(connElements.begin(),
                                                                connElements.end(),
                                                                elem2);
    if(connElements.end() == iter) {
      	return INVALID_SIDE_ID;
    }
    const int64_t index = iter - connElements.begin();
    return m_via_sides[elem1][index];
}

impl::LocalId ElemElemGraph::convert_remote_global_id_to_negative_local_id(stk::mesh::EntityId remoteElementId) const
{
    return -remoteElementId;
}

int ElemElemGraph::get_side_from_element1_to_remote_element2(stk::mesh::Entity localElement, stk::mesh::EntityId otherElementId) const
{
    impl::LocalId negativeLocalId = convert_remote_global_id_to_negative_local_id(otherElementId);
    impl::LocalId localElementId = get_local_element_id(localElement);
    const std::vector<impl::LocalId>& connElements = m_elem_graph[localElementId];
    return get_side_of_element1_that_is_connected_to_element2(localElementId, negativeLocalId, connElements);
}

int ElemElemGraph::get_side_from_element1_to_locally_owned_element2(stk::mesh::Entity local_element, stk::mesh::Entity other_element) const
{
    impl::LocalId other_element_id = get_local_element_id(other_element);
    impl::LocalId element1_local_id = get_local_element_id(local_element);

    int side = INVALID_SIDE_ID;
    const std::vector<impl::LocalId>& conn_elements = m_elem_graph[element1_local_id];

    std::vector<impl::LocalId>::const_iterator iter = std::find(conn_elements.begin(), conn_elements.end(), other_element_id);
    if ( iter != conn_elements.end() )
    {
        int64_t index = iter - conn_elements.begin();
        side = m_via_sides[element1_local_id][index];
    }
    return side;
}

bool ElemElemGraph::is_connected_to_other_element_via_side_ordinal(stk::mesh::Entity element, int sideOrdinal) const
{
    impl::LocalId elementLocalId = get_local_element_id(element);
    auto iterOfSide = std::find(m_via_sides[elementLocalId].begin(), m_via_sides[elementLocalId].end(), sideOrdinal);
    return iterOfSide != m_via_sides[elementLocalId].end();
}

size_t ElemElemGraph::num_edges() const
{
    return m_num_edges;
}

impl::parallel_info& ElemElemGraph::get_parallel_edge_info(stk::mesh::Entity element, stk::mesh::EntityId remote_id)
{
    impl::LocalId this_elem_local_id = get_local_element_id(element);

    impl::ParallelGraphInfo::iterator iter = m_parallel_graph_info.find(std::make_pair(this_elem_local_id, remote_id));
    ThrowRequireMsg( iter != m_parallel_graph_info.end(), "ERROR: Proc " << m_bulk_data.parallel_rank() << " failed to find parallel graph info for <"
                     <<m_bulk_data.identifier(element)<<","<<remote_id<<">");
    return iter->second;
}

impl::LocalId ElemElemGraph::get_local_element_id(stk::mesh::Entity local_element, bool require_valid_id) const
{
    ThrowRequireMsg(m_entity_to_local_id.size() > local_element.local_offset(),"Program error. Contact sierra-help@sandia.gov for support.");
    impl::LocalId local_id = m_entity_to_local_id[local_element.local_offset()];
    if (require_valid_id)
    {
        ThrowRequireMsg(local_id != INVALID_LOCAL_ID, "Program error. Contact sierra-help@sandia.gov for support.");
    }
    return local_id;
}

int ElemElemGraph::size_data_members()
{
    std::vector<unsigned> counts(stk::topology::NUM_RANKS,0);
    stk::mesh::count_entities(m_bulk_data.mesh_meta_data().locally_owned_part(), m_bulk_data, counts);
    int numElems = counts[stk::topology::ELEM_RANK];

    m_elem_graph.resize(numElems);
    m_via_sides.resize(numElems);
    m_local_id_to_element_entity.resize(numElems, Entity());
    m_entity_to_local_id.resize(m_bulk_data.m_entity_keys.size(), INVALID_LOCAL_ID);
    m_element_topologies.resize(numElems);
    m_num_edges = 0;
    m_num_parallel_edges = 0;
    m_local_id_in_pool.resize(numElems, false);
    m_num_ids_used = 0;

    return numElems;
}

void ElemElemGraph::resize_entity_to_local_id_if_needed(size_t maxIndexOfNewlyAddedEntities)
{
    const size_t minimumNewSize = maxIndexOfNewlyAddedEntities+1;
    const size_t oldSize = m_entity_to_local_id.size();
    const size_t newSize = std::max(minimumNewSize, oldSize);
    m_entity_to_local_id.resize(newSize, INVALID_LOCAL_ID);
}

void ElemElemGraph::get_element_side_pairs(const stk::mesh::MeshIndex &meshIndex, impl::LocalId local_elem_id, std::vector<impl::ElementSidePair> &elem_side_pairs) const
{
    stk::mesh::EntityVector side_nodes;
    stk::mesh::EntityVector connected_elements;
    stk::mesh::Entity element = (*meshIndex.bucket)[meshIndex.bucket_ordinal];
    stk::topology topology = meshIndex.bucket->topology();
    int num_sides = topology.num_sides();
    const stk::mesh::Entity* elem_nodes = meshIndex.bucket->begin_nodes(meshIndex.bucket_ordinal);
    elem_side_pairs.clear();
    for(int side_index=0; side_index<num_sides; ++side_index)
    {
        unsigned num_side_nodes = topology.side_topology(side_index).num_nodes();
        side_nodes.resize(num_side_nodes);
        topology.side_nodes(elem_nodes, side_index, side_nodes.begin());
        connected_elements.clear();
        impl::ConnectedElementDataVector connectedElementDataVector;
        impl::find_locally_owned_elements_these_nodes_have_in_common(m_bulk_data, num_side_nodes, side_nodes.data(), connected_elements);
        add_local_elements_to_connected_list(connected_elements, side_nodes, connectedElementDataVector);
        impl::filter_out_invalid_solid_shell_connections(m_bulk_data, element, side_index, connectedElementDataVector);

        for (const impl::ConnectedElementData & elemData: connectedElementDataVector)
        {
            if (local_elem_id != elemData.m_elementLocalId)
            {
                elem_side_pairs.push_back(std::make_pair(elemData.m_elementLocalId,side_index));
            }
        }
    }
    std::sort(elem_side_pairs.begin(), elem_side_pairs.end());
    std::vector<impl::ElementSidePair>::iterator new_end = std::unique(elem_side_pairs.begin(), elem_side_pairs.end());
    elem_side_pairs.resize(new_end - elem_side_pairs.begin());
}

void ElemElemGraph::fill_graph()
{
    const stk::mesh::BucketVector& elemBuckets = m_bulk_data.get_buckets(stk::topology::ELEM_RANK, m_bulk_data.mesh_meta_data().locally_owned_part());
    for(size_t i=0; i<elemBuckets.size(); ++i)
    {
        const stk::mesh::Bucket& bucket = *elemBuckets[i];
        std::vector<impl::ElementSidePair> elem_side_pairs;

        for(size_t j=0; j<bucket.size(); ++j)
        {
            impl::LocalId local_elem_id = get_local_element_id(bucket[j]);
            get_element_side_pairs(stk::mesh::MeshIndex(elemBuckets[i],j), local_elem_id, elem_side_pairs);
            for(size_t index=0; index<elem_side_pairs.size(); ++index)
            {
                m_elem_graph[local_elem_id].push_back(elem_side_pairs[index].first);
                m_via_sides[local_elem_id].push_back(elem_side_pairs[index].second);
                ++m_num_edges;
            }
        }
    }
}

void ElemElemGraph::fill_parallel_graph(impl::ElemSideToProcAndFaceId& elem_side_comm)
{
    stk::mesh::EntityVector elements_to_ignore;
    fill_parallel_graph(elem_side_comm, elements_to_ignore);
}

void ElemElemGraph::fill_parallel_graph(impl::ElemSideToProcAndFaceId& element_side_data_sent, const stk::mesh::EntityVector & elements_to_ignore)
{
    stk::CommSparse comm(m_bulk_data.parallel());

    size_t num_edge_ids_used = pack_shared_side_nodes_of_elements(comm, element_side_data_sent);
    reset_suggested_side_id_iter(num_edge_ids_used);

    comm.allocate_buffers();

    pack_shared_side_nodes_of_elements(comm, element_side_data_sent);

    comm.communicate();

    stk::mesh::impl::ConnectedElementDataVector communicatedElementDataVector;
    std::map<EntityVector, stk::mesh::impl::ConnectedElementDataVector> element_side_data_received;

    for(int proc_id=0; proc_id<m_bulk_data.parallel_size(); ++proc_id)
    {
        if (proc_id != m_bulk_data.parallel_rank())
        {
            while(comm.recv_buffer(proc_id).remaining())
            {
                stk::mesh::impl::ConnectedElementData elementData;
                elementData.m_procId = proc_id;
                comm.recv_buffer(proc_id).unpack<stk::mesh::EntityId>(elementData.m_elementIdentifier);
                comm.recv_buffer(proc_id).unpack<stk::topology>(elementData.m_elementTopology);
                comm.recv_buffer(proc_id).unpack<unsigned>(elementData.m_sideIndex);
                comm.recv_buffer(proc_id).unpack<stk::mesh::EntityId>(elementData.m_suggestedFaceId);
                comm.recv_buffer(proc_id).unpack<bool>(elementData.m_isInPart);
                if(m_air_selector!=nullptr)
                {
                    comm.recv_buffer(proc_id).unpack<bool>(elementData.m_isAir);
                }

                unsigned num_side_nodes = 0;
                comm.recv_buffer(proc_id).unpack<unsigned>(num_side_nodes);
                elementData.m_sideNodes.resize(num_side_nodes);
                for(unsigned i=0; i<num_side_nodes; ++i)
                {
                    stk::mesh::EntityKey key;
                    comm.recv_buffer(proc_id).unpack<stk::mesh::EntityKey>(key);
                    elementData.m_sideNodes[i] = m_bulk_data.get_entity(key);
                }

                stk::mesh::EntityVector sortedSideNodes = elementData.m_sideNodes;
                std::sort(sortedSideNodes.begin(), sortedSideNodes.end());
                element_side_data_received[sortedSideNodes].push_back(elementData);
            }
        }
    }

    std::vector<impl::SharedEdgeInfo> newlySharedEdges;

    for (std::map<EntityVector, stk::mesh::impl::ConnectedElementDataVector>::value_type & elementData: element_side_data_received)
    {
        add_possibly_connected_elements_to_graph_using_side_nodes(element_side_data_sent, elementData.second, elements_to_ignore, newlySharedEdges);
    }

    std::vector<impl::SharedEdgeInfo> receivedSharedEdges;
    communicate_remote_edges_for_pre_existing_graph_nodes(newlySharedEdges, receivedSharedEdges);

    for (const impl::SharedEdgeInfo &receivedSharedEdge : receivedSharedEdges)
    {
        connect_remote_element_to_existing_graph( receivedSharedEdge);
    }
    //this->write_graph();
}

void ElemElemGraph::write_graph() const
{
    std::ostringstream os;
    os << "Graph for processor " << m_bulk_data.parallel_rank() << std::endl;
    for(size_t i=0;i<m_elem_graph.size();++i)
    {
        stk::mesh::Entity e=m_local_id_to_element_entity[i];
        os << "Element " << m_bulk_data.identifier(e) << " has connections: ";
        for(size_t j=0;j<m_elem_graph[i].size();++j)
        {
            stk::mesh::EntityId other;
            if(m_elem_graph[i][j] < 0)
            {
                other = -1*m_elem_graph[i][j];
            }
            else
            {
                other = m_bulk_data.identifier(m_local_id_to_element_entity[m_elem_graph[i][j]]);
            }
            os << "(" << other << ", " << m_via_sides[i][j] << ") ";
        }
        os << std::endl;
    }
    std::cerr << os.str();
}

size_t ElemElemGraph::pack_shared_side_nodes_of_elements(stk::CommSparse &comm, impl::ElemSideToProcAndFaceId& elements_to_communicate)
{
    impl::ElemSideToProcAndFaceId::iterator iter = elements_to_communicate.begin();
    impl::ElemSideToProcAndFaceId::const_iterator end = elements_to_communicate.end();
    size_t counter = 0;

    for(; iter!= end; ++iter)
    {
        stk::mesh::Entity elem = iter->first.entity;
        unsigned side_index    = iter->first.side_id;
        int sharing_proc       = iter->second.proc;
        stk::mesh::EntityId element_id     = m_bulk_data.identifier(elem);
        stk::mesh::EntityId suggested_side_id = get_available_side_id();
        ++counter;
        iter->second.side_id = suggested_side_id;

        stk::topology topology = m_bulk_data.bucket(elem).topology();
        const bool isSelected = m_skinned_selector(m_bulk_data.bucket(elem));
        const stk::mesh::Entity* elem_nodes = m_bulk_data.begin_nodes(elem);

        unsigned num_nodes_this_side = topology.side_topology(side_index).num_nodes();
        stk::mesh::EntityVector side_nodes(num_nodes_this_side);
        topology.side_nodes(elem_nodes, side_index, side_nodes.begin());

        std::vector<stk::mesh::EntityKey> side_node_entity_keys(num_nodes_this_side);
        for(size_t i=0; i<num_nodes_this_side; ++i)
        {
            side_node_entity_keys[i] = m_bulk_data.entity_key(side_nodes[i]);
        }

        comm.send_buffer(sharing_proc).pack<stk::mesh::EntityId>(element_id);
        comm.send_buffer(sharing_proc).pack<stk::topology>(topology);
        comm.send_buffer(sharing_proc).pack<unsigned>(side_index);
        comm.send_buffer(sharing_proc).pack<stk::mesh::EntityId>(suggested_side_id);
        comm.send_buffer(sharing_proc).pack<bool>(isSelected);
        if(m_air_selector != nullptr)
        {
            bool is_in_air = (*m_air_selector)(m_bulk_data.bucket(elem));
            comm.send_buffer(sharing_proc).pack<bool>(is_in_air);
        }

        comm.send_buffer(sharing_proc).pack<unsigned>(num_nodes_this_side);
        for(size_t i=0; i<num_nodes_this_side; ++i)
        {
            comm.send_buffer(sharing_proc).pack<stk::mesh::EntityKey>(side_node_entity_keys[i]);
        }
    }
    return counter;
}


void ElemElemGraph::communicate_remote_edges_for_pre_existing_graph_nodes(const std::vector<impl::SharedEdgeInfo> &newlySharedEdges,
                                                                          std::vector<impl::SharedEdgeInfo> &receivedSharedEdges)
{
    stk::CommSparse comm(m_bulk_data.parallel());

    impl::pack_newly_shared_remote_edges(comm, m_bulk_data, newlySharedEdges);
    comm.allocate_buffers();

    impl::pack_newly_shared_remote_edges(comm, m_bulk_data, newlySharedEdges);
    comm.communicate();

    for(int proc_id=0; proc_id<m_bulk_data.parallel_size(); ++proc_id)
    {
        if (proc_id != m_bulk_data.parallel_rank())
        {
            while(comm.recv_buffer(proc_id).remaining())
            {
                impl::SharedEdgeInfo remoteEdgeInfo;
                remoteEdgeInfo.m_procId = proc_id;

                comm.recv_buffer(proc_id).unpack<stk::mesh::EntityId>(remoteEdgeInfo.m_remoteElementId);
                comm.recv_buffer(proc_id).unpack<stk::mesh::EntityId>(remoteEdgeInfo.m_locaElementlId);
                comm.recv_buffer(proc_id).unpack<unsigned>(remoteEdgeInfo.m_sideIndex);
                comm.recv_buffer(proc_id).unpack<stk::mesh::EntityId>(remoteEdgeInfo.m_chosenSideId);
                comm.recv_buffer(proc_id).unpack<bool>(remoteEdgeInfo.m_isInPart);
                comm.recv_buffer(proc_id).unpack<bool>(remoteEdgeInfo.m_isInAir);
                comm.recv_buffer(proc_id).unpack<stk::topology>(remoteEdgeInfo.m_remoteElementTopology);
                unsigned numNodes = 0;
                comm.recv_buffer(proc_id).unpack<unsigned>(numNodes);
                stk::mesh::EntityVector nodes;
                for(unsigned i=0; i<numNodes; ++i)
                {
                    stk::mesh::EntityKey key;
                    comm.recv_buffer(proc_id).unpack<stk::mesh::EntityKey>(key);
                    nodes.push_back(m_bulk_data.get_entity(key));
                }
                remoteEdgeInfo.m_sharedNodes = nodes;
                receivedSharedEdges.push_back(remoteEdgeInfo);
            }
        }
    }
}

void ElemElemGraph::connect_remote_element_to_existing_graph( const impl::SharedEdgeInfo &receivedSharedEdge)
{
    // If received element is a shell, it was pre-existing.  Thus, we don't have to unhook the local element graph
    // node from any remote element that has a face that shell is coincident with.

    const stk::mesh::EntityVector &sideNodes = receivedSharedEdge.m_sharedNodes;  // Pick a convenient set of side nodes (same for all elems)
    unsigned num_side_nodes = sideNodes.size();


    stk::mesh::Entity localElem = m_bulk_data.get_entity(stk::topology::ELEM_RANK, receivedSharedEdge.m_locaElementlId);
    stk::topology localElemTopology = m_bulk_data.bucket(localElem).topology();

    const stk::mesh::Entity* localElemNodes = m_bulk_data.begin_nodes(localElem);
    unsigned localElemNumSides = localElemTopology.num_sides();
    for(unsigned side_index=0; side_index<localElemNumSides; ++side_index)
    {
        unsigned num_nodes_this_side = localElemTopology.side_topology(side_index).num_nodes();
        if (num_nodes_this_side != num_side_nodes)
        {
            continue;
        }
        stk::mesh::EntityVector localElemSideNodes(num_nodes_this_side);
        localElemTopology.side_nodes(localElemNodes, side_index, localElemSideNodes.begin());

        std::pair<bool,unsigned> result = localElemTopology.side_topology(side_index).equivalent(localElemSideNodes, sideNodes);
        bool same_type_of_element = localElemTopology == receivedSharedEdge.m_remoteElementTopology;
        bool negative_permutation = result.second < localElemTopology.side_topology(side_index).num_positive_permutations();
        if ((result.first) && (same_type_of_element == negative_permutation))
        {
            impl::LocalId local_elem_id = get_local_element_id(localElem);
            impl::LocalId negSgnRemoteElemId = -1*receivedSharedEdge.m_remoteElementId;

            m_elem_graph[local_elem_id].push_back(negSgnRemoteElemId);
            m_via_sides[local_elem_id].push_back(side_index);
            ++m_num_edges;
            stk::mesh::EntityId chosen_side_id = receivedSharedEdge.m_chosenSideId;

            std::pair<impl::ParallelGraphInfo::iterator, bool> inserted = m_parallel_graph_info.insert(
                    std::make_pair(std::make_pair(local_elem_id, receivedSharedEdge.m_remoteElementId),
                    impl::parallel_info(receivedSharedEdge.m_procId, receivedSharedEdge.m_sideIndex, result.second,
                            chosen_side_id, receivedSharedEdge.m_remoteElementTopology, receivedSharedEdge.m_isInPart, receivedSharedEdge.m_isInAir)));

            ThrowRequireMsg(inserted.second == true, "Program error. Elem/side pair already exists in map. Please contact sierra-help@sandia.gov for support.");
            break;
        }
    }
}

void ElemElemGraph::filter_for_elements_in_graph(stk::mesh::EntityVector &localElements)
{
    stk::mesh::EntityVector filteredElements;
    for (stk::mesh::Entity &element : localElements)
    {
        if (is_valid_graph_element(element))
        {
            filteredElements.push_back(element);
        }
    }
    localElements.swap(filteredElements);
}


stk::mesh::EntityVector get_filtered_element_list_for_received_side_nodes(const stk::mesh::BulkData& bulk_data, const stk::mesh::impl::ConnectedElementDataVector & elemSideDataReceived, const stk::mesh::EntityVector & elements_to_ignore)
{
    const stk::mesh::EntityVector sideNodesOfReceivedElement = elemSideDataReceived[0].m_sideNodes;  // Pick a convenient set of side nodes (same for all elems)
    unsigned num_side_nodes_received_element = sideNodesOfReceivedElement.size();
    stk::mesh::EntityVector localElementsConnectedToReceivedSideNodes;
    impl::find_locally_owned_elements_these_nodes_have_in_common(bulk_data, num_side_nodes_received_element, sideNodesOfReceivedElement.data(), localElementsConnectedToReceivedSideNodes);

    // Trim down the list of local elements, ignoring elements in the provided list (since, e.g., these elements may be deleted soon)
    stk::mesh::EntityVector sortedElementsToIgnore(elements_to_ignore);
    std::sort(sortedElementsToIgnore.begin(), sortedElementsToIgnore.end());  // localElementsConnectedToReceivedSideNodes should already be sorted

    stk::mesh::EntityVector localElementsAttachedToReceivedNodes(localElementsConnectedToReceivedSideNodes.size());
    stk::mesh::EntityVector::iterator resultIter = std::set_difference(localElementsConnectedToReceivedSideNodes.begin(), localElementsConnectedToReceivedSideNodes.end(), sortedElementsToIgnore.begin(), sortedElementsToIgnore.end(), localElementsAttachedToReceivedNodes.begin());
    localElementsAttachedToReceivedNodes.resize(resultIter - localElementsAttachedToReceivedNodes.begin());

    stk::util::sort_and_unique(localElementsAttachedToReceivedNodes);
    return localElementsAttachedToReceivedNodes;
}

void add_shared_edge(const impl::ConnectedElementData& elemData, stk::mesh::EntityId elem_id, const unsigned side_index,
        const stk::mesh::EntityVector localElemSideNodes, stk::topology elem_topology, std::vector<impl::SharedEdgeInfo> &newlySharedEdges)
{
    impl::SharedEdgeInfo sharedEdgeInfo;
    sharedEdgeInfo.m_locaElementlId = elem_id;
    sharedEdgeInfo.m_remoteElementId = elemData.m_elementIdentifier;
    sharedEdgeInfo.m_procId = elemData.m_procId;
    sharedEdgeInfo.m_sideIndex = side_index;
    sharedEdgeInfo.m_sharedNodes = localElemSideNodes;
    sharedEdgeInfo.m_chosenSideId = elemData.m_suggestedFaceId;
    sharedEdgeInfo.m_isInPart = elemData.m_isInPart;
    sharedEdgeInfo.m_remoteElementTopology = elem_topology;
    sharedEdgeInfo.m_isInAir = elemData.m_isAir;
    newlySharedEdges.push_back(sharedEdgeInfo);
}

stk::mesh::EntityId find_side_id(const stk::mesh::impl::ElemSideToProcAndFaceId& elemSideDataSent,
        const stk::mesh::Entity localElem, const unsigned side_index, const int elem_proc_id)
{
    stk::mesh::EntityId chosen_side_id = stk::mesh::InvalidEntityId;
    const auto iterRange = elemSideDataSent.equal_range(impl::EntitySidePair(localElem, side_index));
    for (impl::ElemSideToProcAndFaceId::const_iterator iter = iterRange.first; iter != iterRange.second; ++iter)
    {
        bool is_received_element_data_info_from_proc_in_elem_side_comm = iter->second.proc == elem_proc_id;
        //bool is_received_element_data_info_have_same_side_index_as_in_elem_side_comm = iter->first.side_id == elemData.m_sideIndex;

        if (is_received_element_data_info_from_proc_in_elem_side_comm)
        {
            chosen_side_id = iter->second.side_id;
            break;
        }
    }
    ThrowRequireMsg(chosen_side_id!=stk::mesh::InvalidEntityId, "Program error. Please contact sierra-help@sandia.gov for support");
    return chosen_side_id;
}

void ElemElemGraph::delete_edge_from_graph(impl::LocalId local_elem_id, int offset)
{
    m_via_sides[local_elem_id].erase(m_via_sides[local_elem_id].begin() + offset);
    m_elem_graph[local_elem_id].erase(m_elem_graph[local_elem_id].begin() + offset);
    --m_num_edges;
}

stk::topology ElemElemGraph::get_topology_of_remote_element(impl::LocalId local_elem_id, stk::mesh::EntityId other_element)
{
    stk::mesh::Entity this_element = m_local_id_to_element_entity[local_elem_id];
    impl::parallel_info &parallel_edge_info = this->get_parallel_edge_info(this_element, other_element);
    return parallel_edge_info.m_remote_element_toplogy;
}

stk::topology ElemElemGraph::get_topology_of_connected_element(impl::LocalId local_elem_id, int offset)
{
    impl::LocalId other_element = m_elem_graph[local_elem_id][offset];
    if(other_element<0)
    {
        return this->get_topology_of_remote_element(local_elem_id, -1*other_element);
    }
    return m_element_topologies[other_element];
}

void ElemElemGraph::add_possibly_connected_elements_to_graph_using_side_nodes( const stk::mesh::impl::ElemSideToProcAndFaceId& elemSideDataSent,
                                                                               stk::mesh::impl::ConnectedElementDataVector & elemSideDataReceived,
                                                                               const stk::mesh::EntityVector & elements_to_ignore,
                                                                               std::vector<impl::SharedEdgeInfo> &newlySharedEdges)
{
    if (elemSideDataReceived.empty()) {
        return;  // Nothing to connect to
    }

    // Could be the localElements are discoverable by using elemSideDataSent?

    stk::mesh::EntityVector localElementsAttachedToReceivedNodes =
            get_filtered_element_list_for_received_side_nodes(m_bulk_data, elemSideDataReceived, elements_to_ignore);

    stk::mesh::EntityVector sideNodesOfReceivedElement = elemSideDataReceived[0].m_sideNodes;  // Pick a convenient set of side nodes (same for all elems)
    unsigned num_side_nodes_received_element = sideNodesOfReceivedElement.size();

    add_local_elements_to_connected_list(localElementsAttachedToReceivedNodes, sideNodesOfReceivedElement, elemSideDataReceived);

    std::set<EntityId> localElementsConnectedToRemoteShell;
    for (stk::mesh::Entity localElem: localElementsAttachedToReceivedNodes)
    {
        stk::topology localElemTopology = m_bulk_data.bucket(localElem).topology();

        const stk::mesh::Entity* localElemNodes = m_bulk_data.begin_nodes(localElem);
        unsigned localElemNumSides = localElemTopology.num_sides();
        for(unsigned side_index=0; side_index<localElemNumSides; ++side_index)
        {
            unsigned num_nodes_this_side = localElemTopology.side_topology(side_index).num_nodes();
            if (num_nodes_this_side == num_side_nodes_received_element)
            {
                stk::mesh::EntityVector localElemSideNodes(num_nodes_this_side);
                localElemTopology.side_nodes(localElemNodes, side_index, localElemSideNodes.begin());

                impl::ConnectedElementDataVector filteredCommunicatedElementData = elemSideDataReceived;  // Modify copy for this local element
                impl::filter_out_invalid_solid_shell_connections(m_bulk_data, localElem, side_index, filteredCommunicatedElementData);

                // Loop thru all elements left over to see if they are connected to local elem
                for (const impl::ConnectedElementData & elemDataFromOtherProc : filteredCommunicatedElementData)
                {
                    const bool isRemoteElement = (elemDataFromOtherProc.m_procId != m_bulk_data.parallel_rank());
                    std::pair<bool,unsigned> result = localElemTopology.side_topology(side_index).equivalent(localElemSideNodes, elemDataFromOtherProc.m_sideNodes);
                    bool are_local_element_and_remote_element_connected_via_side_nodes = result.first;
                    if (isRemoteElement && are_local_element_and_remote_element_connected_via_side_nodes)
                    {
                        if (elemDataFromOtherProc.m_elementTopology.is_shell())
                        {
                            localElementsConnectedToRemoteShell.insert(get_local_element_id(localElem));  // Store connection to error-check later
                        }

                        impl::LocalId local_elem_id = get_local_element_id(localElem);
                        impl::LocalId negSgnRemoteElemId = -1*elemDataFromOtherProc.m_elementIdentifier;

                        std::vector<int>::iterator sideIdIter =
                                std::find(m_via_sides[local_elem_id].begin(), m_via_sides[local_elem_id].end(), side_index);

                        const int sideIdOffset = (sideIdIter - m_via_sides[local_elem_id].begin());
                        if (sideIdIter != m_via_sides[local_elem_id].end() && elemDataFromOtherProc.m_elementTopology.is_shell())
                        {
                            delete_edge_from_graph(local_elem_id, sideIdOffset);
                        }

                        stk::topology top_other_remote_element = stk::topology::INVALID_TOPOLOGY;
                        if(sideIdIter != m_via_sides[local_elem_id].end())
                        {
                            top_other_remote_element = this->get_topology_of_connected_element(local_elem_id, sideIdOffset);
                        }

                        if (!top_other_remote_element.is_shell())
                        {
                            stk::mesh::EntityId chosen_side_id = 0;
                            m_elem_graph[local_elem_id].push_back(negSgnRemoteElemId);
                            m_via_sides[local_elem_id].push_back(side_index);
                            ++m_num_edges;

                            stk::mesh::impl::ElemSideToProcAndFaceId::const_iterator iter_elem_side_comm = elemSideDataSent.find(impl::EntitySidePair(localElem, side_index));
                            if(iter_elem_side_comm != elemSideDataSent.end())
                            {
                                if(m_bulk_data.identifier(localElem) < elemDataFromOtherProc.m_elementIdentifier)
                                {
                                    chosen_side_id = find_side_id(elemSideDataSent, localElem, side_index, elemDataFromOtherProc.m_procId);
                                }
                                else
                                {
                                    chosen_side_id = elemDataFromOtherProc.m_suggestedFaceId;
                                }
                            }
                            else
                            {
                                add_shared_edge(elemDataFromOtherProc, m_bulk_data.identifier(localElem), side_index, localElemSideNodes,
                                        m_bulk_data.bucket(localElem).topology(), newlySharedEdges);
                            }

                            std::pair<impl::ParallelGraphInfo::iterator, bool> inserted =m_parallel_graph_info.insert(
                                    std::make_pair(std::make_pair(local_elem_id, elemDataFromOtherProc.m_elementIdentifier),
                                    impl::parallel_info(elemDataFromOtherProc.m_procId, elemDataFromOtherProc.m_sideIndex, result.second,
                                            chosen_side_id, elemDataFromOtherProc.m_elementTopology, elemDataFromOtherProc.m_isInPart, elemDataFromOtherProc.m_isAir)));

                            ThrowRequireMsg(inserted.second == true, "Program error. Elem/side pair already exists in map. Please contact sierra-help@sandia.gov for support.");
                        }
                    }
                }
            }
        }
    }

    break_local_volume_element_connections_across_shells(localElementsConnectedToRemoteShell);
}

void ElemElemGraph::break_local_volume_element_connections_across_shells(const std::set<stk::mesh::EntityId> & localElementsConnectedToRemoteShell)
{
    // Fix the case where the serial graph connected two volume elements together before
    // it was known that there was a remote shell wedged between them (the "sandwich" conundrum).
    // Also, cover the case where the mesh is modified after the graph is created to
    // add a shell between existing volume elements.
    //
    if (localElementsConnectedToRemoteShell.size() > 1) {
        for (impl::LocalId localElemId: localElementsConnectedToRemoteShell) {
            std::vector<impl::LocalId>::iterator it = m_elem_graph[localElemId].begin();
            while (it != m_elem_graph[localElemId].end()) {
                const impl::LocalId connectedElemId = *it;
                if (localElementsConnectedToRemoteShell.find(connectedElemId) != localElementsConnectedToRemoteShell.end()) {
                    const int offset = (it - m_elem_graph[localElemId].begin());
                    it = m_elem_graph[localElemId].erase(it);
                    m_via_sides[localElemId].erase(m_via_sides[localElemId].begin() + offset);
                    --m_num_edges;
                }
                else {
                    ++it;
                }
            }
        }
    }
}

void ElemElemGraph::break_remote_volume_element_connections_across_shells(const std::vector< std::pair< stk::mesh::Entity, stk::mesh::EntityId > > & localAndRemoteElementsConnectedToShell)
{
    for (auto & localAndRemoteElemPair : localAndRemoteElementsConnectedToShell) {
        impl::LocalId localElemId = m_entity_to_local_id[localAndRemoteElemPair.first.local_offset()];
        impl::LocalId remoteElemId = -localAndRemoteElemPair.second;
        std::vector<impl::LocalId>::iterator it = m_elem_graph[localElemId].begin();
        while (it != m_elem_graph[localElemId].end()) {
            if (*it == remoteElemId)
            {
                const int offset = (it - m_elem_graph[localElemId].begin());
                it = m_elem_graph[localElemId].erase(it);
                m_via_sides[localElemId].erase(m_via_sides[localElemId].begin() + offset);
                --m_num_edges;
            }
            else {
                ++it;
            }
        }
    }
}

void report_error_with_invalid_ordinal(std::pair<stk::mesh::ConnectivityOrdinal, stk::mesh::Permutation> ord_and_perm, const stk::mesh::BulkData& bulkData, const stk::mesh::EntityVector& side_nodes_vec,
        stk::mesh::Entity element_with_perm_0, stk::mesh::Entity element_with_perm_4)
{
    if(ord_and_perm.first == stk::mesh::INVALID_CONNECTIVITY_ORDINAL)
    {
        std::ostringstream os;
        os << "Proc: " << bulkData.parallel_rank() << std::endl;
        os << "this element: " << bulkData.identifier(element_with_perm_0) << std::endl;
        os << "other element: " << bulkData.identifier(element_with_perm_4) << std::endl;
        os << "Nodes: ";

        for(stk::mesh::Entity side_node : side_nodes_vec)
        {
            os << bulkData.identifier(side_node) << " ";
        }

        os << std::endl;
        std::cerr << os.str();
    }

    ThrowRequireMsg(ord_and_perm.first != stk::mesh::INVALID_CONNECTIVITY_ORDINAL, "yikes!");
    ThrowRequireMsg(ord_and_perm.second != stk::mesh::INVALID_PERMUTATION, "yikes!");
}

void ensure_fresh_modifiable_state(stk::mesh::BulkData& bulkData)
{
    if(bulkData.in_modifiable_state())
    {
        bulkData.modification_end();
    }
    bulkData.modification_begin();
}

class RemoteDeathBoundary
{
public:
    RemoteDeathBoundary(stk::mesh::BulkData& bulkData, ElemElemGraph& elementGraph,
        const stk::mesh::EntityVector& killedElements, const stk::mesh::PartVector& parts_for_creating_side, stk::mesh::Part& active, const stk::mesh::PartVector* boundary_mesh_parts) :
            m_bulkData(bulkData), m_elementGraph(elementGraph), m_killedElements(killedElements), m_parts_for_creating_side(parts_for_creating_side), m_active(active),
            m_boundary_mesh_parts(boundary_mesh_parts), m_topology_modified(false)
    {}
    ~RemoteDeathBoundary(){}

    void update_death_boundary_for_remotely_killed_elements(std::vector<stk::mesh::sharing_info> &shared_modified, stk::mesh::EntityVector& deletedEntities)
    {
        std::vector<std::pair<stk::mesh::EntityId, stk::mesh::EntityId> > remote_edges = get_remote_edges();

        for(std::pair<stk::mesh::EntityId, stk::mesh::EntityId>& re : remote_edges)
        {
            stk::mesh::EntityId local_id = re.first;
            stk::mesh::EntityId remote_id = re.second;

            stk::mesh::Entity element = m_bulkData.get_entity(stk::topology::ELEM_RANK, local_id);

            impl::parallel_info &parallel_edge_info = m_elementGraph.get_parallel_edge_info(element, remote_id);
            parallel_edge_info.m_in_body_to_be_skinned = false;

            m_topology_modified = true;

            bool create_side = m_bulkData.bucket(element).member(m_active);
            if(create_side==true)
            {
                impl::add_side_into_exposed_boundary(m_bulkData, parallel_edge_info, m_elementGraph, element, remote_id, m_parts_for_creating_side,
                        shared_modified, m_boundary_mesh_parts);
            }
            else
            {
                int side_id = m_elementGraph.get_side_from_element1_to_remote_element2(element, remote_id);
                ThrowRequireMsg(side_id != -1, "Program error. Please contact sierra-help@sandia.gov for support.");
                impl::remove_side_from_death_boundary(m_bulkData, element, m_active, deletedEntities, side_id);
            }
        }
    }

    void set_topology_is_modified()
    {
        m_topology_modified = true;
    }

    bool get_topology_modification_status() const
    {
        return m_topology_modified;
    }

private:

    std::vector<std::pair<stk::mesh::EntityId, stk::mesh::EntityId> > get_remote_edges() const
    {
        std::vector<impl::graphEdgeProc> elements_to_comm = get_elements_to_communicate();
        return impl::communicate_killed_entities(m_bulkData.parallel(), elements_to_comm);
    }

    std::vector<impl::graphEdgeProc> get_elements_to_communicate() const
    {
        std::vector<impl::graphEdgeProc> elements_to_comm;

        for(stk::mesh::Entity this_element :m_killedElements)
        {
            for(size_t j=0;j<m_elementGraph.get_num_connected_elems(this_element);++j)
            {
                if(impl::does_element_have_side(m_bulkData, this_element) && !m_elementGraph.is_connected_elem_locally_owned(this_element, j))
                {
                    stk::mesh::EntityId other_element_id = m_elementGraph.get_entity_id_of_remote_element(this_element,j);
                    int other_proc = m_elementGraph.get_owning_proc_id_of_remote_element(this_element, other_element_id);
                    elements_to_comm.push_back(impl::graphEdgeProc(m_bulkData.identifier(this_element), other_element_id, other_proc));
                }
            }
        }

        return elements_to_comm;
    }

    stk::mesh::BulkData& m_bulkData;
    ElemElemGraph& m_elementGraph;
    const stk::mesh::EntityVector& m_killedElements;
    const stk::mesh::PartVector& m_parts_for_creating_side;
    stk::mesh::Part& m_active;
    const stk::mesh::PartVector* m_boundary_mesh_parts;
    bool m_topology_modified;
};


bool process_killed_elements(stk::mesh::BulkData& bulkData,
                             ElemElemGraph& elementGraph,
                             const stk::mesh::EntityVector& killedElements,
                             stk::mesh::Part& active,
                             const stk::mesh::PartVector& parts_for_creating_side,
                             const stk::mesh::PartVector* boundary_mesh_parts)
{
    ensure_fresh_modifiable_state(bulkData);
    impl::create_sides_created_during_death_part(bulkData.mesh_meta_data());

    std::vector<stk::mesh::sharing_info> shared_modified;
    stk::mesh::EntityVector deletedEntities;

    RemoteDeathBoundary remote_death_boundary(bulkData, elementGraph, killedElements, parts_for_creating_side, active, boundary_mesh_parts);
    remote_death_boundary.update_death_boundary_for_remotely_killed_elements(shared_modified, deletedEntities);

    std::vector<impl::ElementSidePair> element_side_pairs;
    element_side_pairs.reserve(impl::get_element_side_multiplier() * killedElements.size());

    for(size_t k = 0; k < killedElements.size(); ++k)
    {
        stk::mesh::Entity this_element = killedElements[k];

        for(size_t j = 0; j < elementGraph.get_num_connected_elems(this_element); ++j)
        {
            if(impl::does_element_have_side(bulkData, this_element))
            {
                remote_death_boundary.set_topology_is_modified();
                if(elementGraph.is_connected_elem_locally_owned(this_element, j))
                {
                    stk::mesh::Entity other_element = elementGraph.get_connected_element(this_element, j);
                    if(impl::does_element_have_side(bulkData, other_element))
                    {
                        int side_id = elementGraph.get_side_id_to_connected_element(this_element, j);
                        ThrowRequireMsg(side_id != -1, "Program error. Please contact sierra-help@sandia.gov for support.");

                        bool is_other_element_alive = bulkData.bucket(other_element).member(active);
                        if(is_other_element_alive)
                        {
                            std::string msg = "Program error. Please contact sierra-help@sandia.gov for support.";

                            stk::mesh::Entity side = stk::mesh::impl::get_side_for_element(bulkData, this_element, side_id);

                            if(bulkData.is_valid(side))
                            {
                                if(bulkData.bucket(side).owned())
                                {
                                    stk::mesh::PartVector parts = impl::get_stk_parts_for_moving_parts_into_death_boundary(boundary_mesh_parts);
                                    bulkData.change_entity_parts(side, parts, stk::mesh::PartVector());
                                }
                            }
                            else
                            {
                                stk::mesh::PartVector parts = impl::get_parts_for_creating_side(bulkData, parts_for_creating_side, other_element, side_id);

                                stk::mesh::EntityId side_global_id = elementGraph.get_available_side_id();

                                stk::mesh::EntityRank side_rank = bulkData.mesh_meta_data().side_rank();
                                ThrowRequireMsg(!impl::is_id_already_in_use_locally(bulkData, side_rank, side_global_id), msg);

                                // switch elements
                                stk::mesh::Entity element_with_perm_0 = other_element;
                                stk::mesh::Entity element_with_perm_4 = this_element;

                                int side_id_needed = elementGraph.get_side_from_element1_to_locally_owned_element2(element_with_perm_0,
                                        element_with_perm_4);

                                ThrowRequireMsg(side_id_needed >= 0, "ERROR: proc " << bulkData.parallel_rank() << " found side_id_needed=" << side_id_needed
                                                << " between elem " << bulkData.identifier(element_with_perm_0)<< " and " << bulkData.identifier(element_with_perm_4)
                                                << " in elem-elem-graph");

                                side = stk::mesh::declare_element_side(bulkData, side_global_id, element_with_perm_0, side_id_needed, parts);

                                const stk::mesh::Entity* side_nodes = bulkData.begin_nodes(side);
                                unsigned num_side_nodes = bulkData.num_nodes(side);
                                stk::mesh::EntityVector side_nodes_vec(side_nodes, side_nodes + num_side_nodes);

                                std::pair<stk::mesh::ConnectivityOrdinal, stk::mesh::Permutation> ord_and_perm =
                                        stk::mesh::get_ordinal_and_permutation(bulkData, element_with_perm_4, side_rank, side_nodes_vec);

                                report_error_with_invalid_ordinal(ord_and_perm, bulkData, side_nodes_vec, element_with_perm_0, element_with_perm_4);

                                bulkData.declare_relation(element_with_perm_4, side, ord_and_perm.first, ord_and_perm.second);
                            }
                        }
                        else
                        {
                            impl::remove_side_from_death_boundary(bulkData, this_element, active, deletedEntities, side_id);
                        }
                    }
                }
                else
                {
                    stk::mesh::EntityId remote_id = elementGraph.get_entity_id_of_remote_element(this_element, j);
                    impl::parallel_info &parallel_edge_info = elementGraph.get_parallel_edge_info(this_element, remote_id);
                    bool other_element_active = parallel_edge_info.m_in_body_to_be_skinned;
                    bool create_side = other_element_active;

                    if(create_side)
                    {
                        impl::add_side_into_exposed_boundary(bulkData, parallel_edge_info, elementGraph, this_element, remote_id, parts_for_creating_side,
                                shared_modified, boundary_mesh_parts);
                    }
                    else
                    {
                        int side_id = elementGraph.get_side_from_element1_to_remote_element2(this_element, remote_id);
                        ThrowRequireMsg(side_id != -1, "Program error. Please contact sierra-help@sandia.gov for support.");
                        impl::remove_side_from_death_boundary(bulkData, this_element, active, deletedEntities, side_id);
                    }
                }
            }
        }
    }

    stk::mesh::impl::delete_entities_and_upward_relations(bulkData, deletedEntities);
    bulkData.make_mesh_parallel_consistent_after_element_death(shared_modified, deletedEntities, elementGraph, killedElements, &active);
    return remote_death_boundary.get_topology_modification_status();
}

void ElemElemGraph::add_local_elements_to_connected_list(const stk::mesh::EntityVector & local_elements_attached_to_side_nodes,
                                                         const stk::mesh::EntityVector & side_nodes_received,
                                                         impl::ConnectedElementDataVector & element_data_received) const
{
    for (const stk::mesh::Entity & local_element: local_elements_attached_to_side_nodes)
    {
        impl::ConnectedElementData elemData;
        stk::mesh::EntityVector connectedSideNodes;
        stk::mesh::OrdinalAndPermutation connectedOrdAndPerm = stk::mesh::get_ordinal_and_permutation(m_bulk_data, local_element, m_bulk_data.mesh_meta_data().side_rank(), side_nodes_received);
        const stk::mesh::Bucket & connectedBucket = m_bulk_data.bucket(local_element);
        const stk::mesh::Entity* connectedElemNodes = m_bulk_data.begin_nodes(local_element);

        elemData.m_procId = m_bulk_data.parallel_rank();
        elemData.m_elementLocalId = get_local_element_id(local_element, false);
        if (elemData.m_elementLocalId == INVALID_LOCAL_ID)
        {
            continue;
        }
        elemData.m_elementIdentifier = m_bulk_data.identifier(local_element);
        elemData.m_elementTopology = connectedBucket.topology();
        elemData.m_sideIndex = connectedOrdAndPerm.first;
        elemData.m_suggestedFaceId = 0;
        elemData.m_sideNodes.resize(side_nodes_received.size());
        elemData.m_elementTopology.side_nodes(connectedElemNodes, elemData.m_sideIndex, elemData.m_sideNodes.begin());
        element_data_received.push_back(elemData);

        if (elemData.m_elementTopology.is_shell())
        {
            // Also add the back-side face if this is a shell
            elemData.m_sideIndex = (elemData.m_sideIndex == 0) ? 1 : 0;
            elemData.m_elementTopology.side_nodes(connectedElemNodes, elemData.m_sideIndex, elemData.m_sideNodes.begin());
            element_data_received.push_back(elemData);
        }
    }
}


void ElemElemGraph::pack_remote_connected_element(impl::LocalId elem_local_id, stk::mesh::EntityId connected_global_id,
                                                  stk::CommBuffer &buff, std::vector<moved_parallel_graph_info> &moved_graph_info_vector,
                                                  int destination_proc, int phase)
{
    std::pair<impl::LocalId, stk::mesh::EntityId> key(elem_local_id, connected_global_id);
    auto iter = m_parallel_graph_info.find(key);
    ThrowRequire(iter != m_parallel_graph_info.end());
    impl::parallel_info &p_info = iter->second;
    buff.pack<int>(p_info.m_other_proc);
    buff.pack<int>(p_info.m_other_side_ord);
    buff.pack<int>(p_info.m_permutation);
    buff.pack<bool>(p_info.m_in_body_to_be_skinned);
    buff.pack<stk::mesh::EntityId>(p_info.m_chosen_side_id);

    if (phase == 0 && p_info.m_other_proc != destination_proc)
    {
        stk::mesh::Entity elem = m_local_id_to_element_entity[elem_local_id];
        stk::mesh::EntityId elem_global_id = m_bulk_data.identifier(elem);
        moved_graph_info_vector.push_back(moved_parallel_graph_info(p_info.m_other_proc, connected_global_id, elem_global_id, destination_proc));
    }

    if (phase == 1)
    {
        m_parallel_graph_info.erase(iter);
    }
}

void ElemElemGraph::pack_local_connected_element(impl::LocalId local_id, int side_id, stk::CommBuffer &buff,
                                                 stk::mesh::EntityId suggested_face_id,
                                                 stk::mesh::Part *active_part)
{
    stk::mesh::Entity connected_element = m_local_id_to_element_entity[local_id];
    buff.pack<int>(m_bulk_data.parallel_rank());
    buff.pack<int>(side_id);
    stk::topology elem_topology = m_bulk_data.bucket(connected_element).topology();
    stk::topology side_topology = elem_topology.side_topology(side_id);
    std::vector<stk::mesh::Entity> side_nodes(side_topology.num_nodes());
    const stk::mesh::Entity *elem_nodes = m_bulk_data.begin_nodes(connected_element);
    stk::mesh::EntityRank side_rank = m_bulk_data.mesh_meta_data().side_rank();
    elem_topology.side_nodes(elem_nodes, side_id, side_nodes.begin());

    stk::mesh::OrdinalAndPermutation ordperm = get_ordinal_and_permutation(m_bulk_data, connected_element, side_rank, side_nodes);
    ThrowRequireMsg(ordperm.second != stk::mesh::INVALID_PERMUTATION, "Invalid permutation for connected_element");

    buff.pack<int>(ordperm.second);
    bool in_part = true;
    if (active_part != NULL)
    {
        in_part = m_bulk_data.bucket(connected_element).member(*active_part);
    }
    buff.pack<bool>(in_part);
    buff.pack<stk::mesh::EntityId>(suggested_face_id);
    buff.pack<size_t>(side_nodes.size());
    for(size_t i=0; i<side_nodes.size(); ++i)
    {
        buff.pack<stk::mesh::EntityId>(m_bulk_data.identifier(side_nodes[i]));
    }
}

void ElemElemGraph::unpack_and_store_connected_element(stk::CommBuffer &buf, impl::LocalId recvd_elem_local_id,
                                                       stk::mesh::EntityId recvd_elem_global_id)
{
    bool local_connection_on_source_proc;
    buf.unpack<bool>(local_connection_on_source_proc);
    stk::mesh::EntityId connected_elem_global_id;
    buf.unpack<stk::mesh::EntityId>(connected_elem_global_id);
    int side_from_recvd_elem_to_connected_elem;
    buf.unpack<int>(side_from_recvd_elem_to_connected_elem);
    stk::mesh::Entity connected_elem = m_bulk_data.get_entity(stk::topology::ELEM_RANK, connected_elem_global_id);
    int other_proc, side_from_connected_elem_to_recvd_elem, other_permutation;
    bool in_part;
    stk::mesh::EntityId chosen_face_id;
    buf.unpack<int>(other_proc);
    buf.unpack<int>(side_from_connected_elem_to_recvd_elem);
    buf.unpack<int>(other_permutation);
    buf.unpack<bool>(in_part);
    buf.unpack<stk::mesh::EntityId>(chosen_face_id);
    impl::parallel_info p_info(other_proc, side_from_connected_elem_to_recvd_elem, other_permutation, chosen_face_id, stk::topology::INVALID_TOPOLOGY, in_part);
    size_t num_side_nodes = 0;
    std::vector<stk::mesh::EntityId> side_node_ids;
    stk::mesh::EntityVector side_nodes;
    if (local_connection_on_source_proc)
    {
        buf.unpack<size_t>(num_side_nodes);
        side_node_ids.resize(num_side_nodes);
        side_nodes.resize(num_side_nodes);
        for(size_t i=0; i<num_side_nodes; ++i)
        {
            buf.unpack<stk::mesh::EntityId>(side_node_ids[i]);
            side_nodes[i] = m_bulk_data.get_entity(stk::topology::NODE_RANK, side_node_ids[i]);
        }
    }

    if (p_info.m_other_proc == m_bulk_data.parallel_rank())
    {
        impl::LocalId connected_elem_local_id = get_local_element_id(connected_elem);
        m_elem_graph[recvd_elem_local_id].push_back(connected_elem_local_id);

        std::vector<impl::LocalId>& other_connected_elements = m_elem_graph[connected_elem_local_id];
        impl::LocalId former_remote_id = -recvd_elem_global_id;
        auto iter_found = std::find(other_connected_elements.begin(), other_connected_elements.end(), former_remote_id);
        ThrowRequireMsg(iter_found != other_connected_elements.end(), "Failed to find formerly-remote connected id in elem-elem-graph.");
        size_t index = iter_found - other_connected_elements.begin();
        other_connected_elements[index] = recvd_elem_local_id;

        std::pair<impl::LocalId, stk::mesh::EntityId> key(connected_elem_local_id, recvd_elem_global_id);
        auto iter = m_parallel_graph_info.find(key);
        if (iter != m_parallel_graph_info.end())
        {
            m_parallel_graph_info.erase(iter);
        }

        m_num_parallel_edges--;
    }
    else
    {
        stk::mesh::EntityRank side_rank = m_bulk_data.mesh_meta_data().side_rank();
        stk::mesh::Entity recvd_elem = m_local_id_to_element_entity[recvd_elem_local_id];
        stk::mesh::OrdinalAndPermutation ordperm = get_ordinal_and_permutation(m_bulk_data, recvd_elem, side_rank, side_nodes);
        p_info.m_permutation = ordperm.second;

        m_elem_graph[recvd_elem_local_id].push_back(-connected_elem_global_id);
        std::pair<impl::LocalId, stk::mesh::EntityId> recvd_elem_key(recvd_elem_local_id, connected_elem_global_id);
        m_parallel_graph_info.insert(std::make_pair(recvd_elem_key, p_info));

        m_num_parallel_edges++;
    }
    m_num_edges++;
    m_via_sides[recvd_elem_local_id].push_back(side_from_recvd_elem_to_connected_elem);
}

void ElemElemGraph::communicate_moved_graph_info(std::vector <moved_parallel_graph_info> &moved_graph_info_vector)
{
    stk::CommSparse comm2(m_bulk_data.parallel());
    for(int phase=0; phase <2; ++phase) {
        for (size_t i=0; i<moved_graph_info_vector.size(); ++i)
        {
            moved_parallel_graph_info &info = moved_graph_info_vector[i];
            stk::CommBuffer &buf = comm2.send_buffer(info.proc_to_tell);

            buf.pack<stk::mesh::EntityId>(info.elem_id);
            buf.pack<stk::mesh::EntityId>(info.moved_elem_id);
            buf.pack<int>(info.destination_proc);
        }
        if (phase == 0)
        {
            comm2.allocate_buffers();
        }
        else
        {
            comm2.communicate();
        }
    }

    for(int p = 0; p < m_bulk_data.parallel_size(); ++p)
    {
        stk::CommBuffer & buf = comm2.recv_buffer(p);
        while(buf.remaining())
        {
            stk::mesh::EntityId elem_id, moved_elem_id;
            int destination_proc;
            buf.unpack<stk::mesh::EntityId>(elem_id);
            buf.unpack<stk::mesh::EntityId>(moved_elem_id);
            buf.unpack<int>(destination_proc);

            stk::mesh::Entity local_elem = m_bulk_data.get_entity(stk::topology::ELEM_RANK, elem_id);
            impl::LocalId elem_local_id = get_local_element_id(local_elem);
            std::pair<impl::LocalId, stk::mesh::EntityId> key(elem_local_id, moved_elem_id);
            auto iter = m_parallel_graph_info.find(key);
            if (iter != m_parallel_graph_info.end())
            {
                iter->second.m_other_proc = destination_proc;
            }
        }
    }
}

impl::LocalId ElemElemGraph::create_new_local_id(stk::mesh::Entity new_elem)
{
    if (m_entity_to_local_id.size() > new_elem.local_offset() && m_entity_to_local_id[new_elem.local_offset()] != INVALID_LOCAL_ID)
    {
        return m_entity_to_local_id[new_elem.local_offset()];
    }

    impl::LocalId new_local_id = m_elem_graph.size();
    if (m_deleted_element_local_id_pool.size() > 0)
    {
        new_local_id = m_deleted_element_local_id_pool.back();
        m_local_id_in_pool[new_local_id] = false;
        m_deleted_element_local_id_pool.pop_back();
    }
    else
    {
        if (m_local_id_to_element_entity.size() <= static_cast<size_t> (new_local_id))
        {
            m_local_id_to_element_entity.resize(new_local_id+1);
        }
        if (m_entity_to_local_id.size() <= new_elem.local_offset())
        {
            m_entity_to_local_id.resize(new_elem.local_offset()+1);
        }
        m_elem_graph.push_back(std::vector<impl::LocalId>());
        m_via_sides.push_back(std::vector<int>());
    }
    m_local_id_to_element_entity[new_local_id] = new_elem;
    m_entity_to_local_id[new_elem.local_offset()] = new_local_id;

    return new_local_id;
}

void ElemElemGraph::change_entity_owner(const stk::mesh::EntityProcVec &elem_proc_pairs_to_move, impl::ParallelGraphInfo &new_parallel_graph_entries, stk::mesh::Part *active_part)
{
    std::vector <moved_parallel_graph_info> moved_graph_info_vector;

    stk::CommSparse comm(m_bulk_data.parallel());
    for(int phase=0; phase <2; ++phase) {
        for (size_t i=0; i<elem_proc_pairs_to_move.size(); i++)
        {
            stk::mesh::Entity elem_to_send = elem_proc_pairs_to_move[i].first;
            int destination_proc = elem_proc_pairs_to_move[i].second;
            stk::mesh::EntityId elem_global_id = m_bulk_data.identifier(elem_to_send);
            stk::CommBuffer &buff = comm.send_buffer(destination_proc);

            buff.pack<stk::mesh::EntityId>(elem_global_id);
            impl::LocalId elem_local_id = m_entity_to_local_id[elem_to_send.local_offset()];
            std::vector <impl::LocalId> &connected_elements = m_elem_graph[elem_local_id];
            size_t num_connected_elements = connected_elements.size();
            buff.pack<size_t>(num_connected_elements);
            for (size_t k=0; k<num_connected_elements; k++)
            {
                impl::LocalId local_id = connected_elements[k];
                stk::mesh::EntityId connected_global_id;
                bool local_connection = local_id >= 0;

                if (local_connection)
                {
                    stk::mesh::Entity connected_element = m_local_id_to_element_entity[local_id];
                    connected_global_id = m_bulk_data.identifier(connected_element);
                }
                else
                {
                    connected_global_id = -local_id;
                }

                buff.pack<bool>(local_connection);
                buff.pack<stk::mesh::EntityId>(connected_global_id);
                buff.pack<int>(m_via_sides[elem_local_id][k]);

                if (local_connection)
                {
                    stk::mesh::Entity connected_element = m_local_id_to_element_entity[local_id];
                    int side_id = get_side_from_element1_to_locally_owned_element2(connected_element, elem_to_send);
                    std::pair<impl::LocalId,stk::mesh::EntityId> key(local_id,elem_global_id);
                    auto iter_p_info = new_parallel_graph_entries.find(key);
                    ThrowRequireMsg(iter_p_info != new_parallel_graph_entries.end(), "ERROR, failed to find entry in new_parallel_graph_entries"
                                    << " for elem_to_send="<<elem_global_id<<", local-connected="<<connected_global_id);
                    stk::mesh::EntityId suggested_face_id = iter_p_info->second.m_chosen_side_id;
                    pack_local_connected_element(local_id, side_id, buff, suggested_face_id, active_part);
                    if (phase == 1) {
                        std::vector<impl::LocalId>& other_connected_elements = m_elem_graph[local_id];
                        auto iter = std::find(other_connected_elements.begin(), other_connected_elements.end(), elem_local_id);
                        ThrowRequireMsg(iter != other_connected_elements.end(), "Failed to find connected element");
                        size_t index = iter - other_connected_elements.begin();
                        other_connected_elements[index] = -elem_global_id;
                    }
                }
                else
                {
                    pack_remote_connected_element(elem_local_id, connected_global_id, buff, moved_graph_info_vector, destination_proc, phase);
                }
            }

            if (phase == 1)
            {
                for (size_t j=0; j<connected_elements.size(); j++)
                {
                    if (connected_elements[j]>0)
                    {
                        std::vector <impl::LocalId> &elements_connected = m_elem_graph[connected_elements[j]];
                        auto iter = std::find(elements_connected.begin(), elements_connected.end(), elem_local_id);
                        if(iter != elements_connected.end())
                        {
                            int index = iter - elements_connected.begin();
                            elements_connected[index] = -elem_global_id;
                        }
                    }
                }

                for(size_t k=0; k<m_elem_graph[elem_local_id].size(); ++k)
                {
                    if(m_elem_graph[elem_local_id][k] < 0)
                        m_num_parallel_edges--;
                    else
                        m_num_parallel_edges++;
                }

                m_num_edges -= m_elem_graph[elem_local_id].size();

                m_elem_graph[elem_local_id].clear();
                m_via_sides[elem_local_id].clear();
                m_deleted_element_local_id_pool.push_back(elem_local_id);
                m_local_id_in_pool[elem_local_id] = true;
            }
        }

        if (phase == 0)
        {
            comm.allocate_buffers();
        }
        else
        {
            comm.communicate();
        }
    }

    for(int p = 0; p < m_bulk_data.parallel_size(); ++p)
    {
        stk::CommBuffer & buf = comm.recv_buffer(p);
        while(buf.remaining())
        {
            stk::mesh::EntityId recvd_elem_global_id;
            buf.unpack<stk::mesh::EntityId>(recvd_elem_global_id);
            stk::mesh::Entity recvd_elem = m_bulk_data.get_entity(stk::topology::ELEM_RANK, recvd_elem_global_id);
            impl::LocalId recvd_elem_local_id = create_new_local_id(recvd_elem);

            size_t num_connected_elements;
            buf.unpack<size_t>(num_connected_elements);
            for (size_t k=0; k<num_connected_elements; k++)
            {
                unpack_and_store_connected_element(buf, recvd_elem_local_id, recvd_elem_global_id);
            }
        }
    }
    auto iter_begin = new_parallel_graph_entries.begin();
    auto iter_end   = new_parallel_graph_entries.end();
    for (auto iter=iter_begin; iter!=iter_end; ++iter)
    {
        m_parallel_graph_info.insert(std::make_pair(iter->first, iter->second));
    }

    communicate_moved_graph_info(moved_graph_info_vector);
}

impl::LocalId ElemElemGraph::get_new_local_element_id_from_pool()
{
    impl::LocalId new_local_id;
    if (!m_deleted_element_local_id_pool.empty())
    {
        new_local_id = m_deleted_element_local_id_pool.back();
        m_deleted_element_local_id_pool.pop_back();
        m_local_id_in_pool[new_local_id] = false;
    }
    else
    {
        new_local_id = m_elem_graph.size();
        std::vector<impl::LocalId> new_element_connectivity;
        std::vector<int> new_element_via_sides;
        m_elem_graph.push_back(new_element_connectivity);
        m_via_sides.push_back(new_element_via_sides);
        m_local_id_in_pool.push_back(false);
        m_local_id_to_element_entity.push_back(Entity());
        m_element_topologies.push_back(stk::topology::INVALID_TOPOLOGY);
    }
    return new_local_id;
}

bool ElemElemGraph::is_valid_graph_element(stk::mesh::Entity local_element) const
{
    bool value = false;
//    if (m_bulk_data.is_valid(local_element))
    {
        impl::LocalId max_elem_id = static_cast<impl::LocalId>(m_elem_graph.size());
        if (local_element.local_offset() < m_entity_to_local_id.size())
        {
            impl::LocalId elem_id = get_local_element_id(local_element, false);
            value = elem_id >= 0 && elem_id < max_elem_id && !m_local_id_in_pool[elem_id];
        }
    }
    return value;
}

void ElemElemGraph::pack_deleted_element_comm(stk::CommSparse &comm,
                                              const std::vector<impl::DeletedElementData> &local_elem_and_remote_connected_elem)
{
    for(size_t i=0;i<local_elem_and_remote_connected_elem.size();++i)
    {
        int remote_proc = local_elem_and_remote_connected_elem[i].m_remoteProc;

        impl::LocalId elem_to_delete_local_id = local_elem_and_remote_connected_elem[i].m_deletedElement;
        stk::mesh::Entity elem_to_delete = m_local_id_to_element_entity[elem_to_delete_local_id];
        stk::mesh::EntityId elem_to_delete_global_id = m_bulk_data.identifier(elem_to_delete);
        stk::mesh::EntityId connected_elem_global_id = local_elem_and_remote_connected_elem[i].m_remoteElement;

        comm.send_buffer(remote_proc).pack<stk::mesh::EntityId>(elem_to_delete_global_id);
        comm.send_buffer(remote_proc).pack<stk::mesh::EntityId>(connected_elem_global_id);
    }
}

void ElemElemGraph::pack_shell_connectivity(stk::CommSparse & comm,
                                            const std::vector<impl::ShellConnectivityData> & shellConnectivityList,
                                            const stk::mesh::EntityVector &deletedShells)
{
    for(size_t i=0; i<shellConnectivityList.size(); i++)
    {
        const impl::ShellConnectivityData & shellConnectivityData = shellConnectivityList[i];
        if (shellConnectivityData.m_farElementIsRemote) {
            impl::LocalId deletedElementId = get_local_element_id(deletedShells[i]);
            auto iter = m_parallel_graph_info.find( std::make_pair(deletedElementId, shellConnectivityData.m_farElementId) );
            ThrowRequire(iter != m_parallel_graph_info.end());
            int remote_proc = iter->second.m_other_proc;

            comm.send_buffer(remote_proc).pack<stk::mesh::EntityId>(shellConnectivityData.m_nearElementId);
            comm.send_buffer(remote_proc).pack<int>(shellConnectivityData.m_nearElementProc);
            comm.send_buffer(remote_proc).pack<stk::mesh::EntityId>(shellConnectivityData.m_shellElementId);
            comm.send_buffer(remote_proc).pack<stk::mesh::EntityId>(shellConnectivityData.m_farElementId);
        }
    }
}

void ElemElemGraph::collect_local_shell_connectivity_data(const stk::mesh::impl::DeletedElementInfoVector &elements_to_delete,
                                                          std::vector<impl::ShellConnectivityData>& shellConnectivityList,
                                                          stk::mesh::EntityVector &deletedShells)
{
    for (const stk::mesh::impl::DeletedElementInfo &deletedElementInfo : elements_to_delete) {
//        ThrowRequireMsg(m_bulk_data.is_valid(elem_to_delete), "Do not delete entities before removing from ElemElemGraph. Contact sierra-help@sandia.gov for support.");
        stk::mesh::Entity elem_to_delete = deletedElementInfo.entity;
        ThrowRequireMsg(is_valid_graph_element(elem_to_delete), "Program error. Not valid graph element. Contact sierra-help@sandia.gov for support.");

        if (deletedElementInfo.isShell) {
            impl::LocalId shell_to_delete_id = get_local_element_id( elem_to_delete);
            size_t num_connected_elems = get_num_connected_elems(elem_to_delete);
            for (int near_elem_index = num_connected_elems - 1; near_elem_index >= 0; --near_elem_index) {
                impl::ShellConnectivityData shellConnectivityData;

                impl::LocalId near_elem_id = m_elem_graph[shell_to_delete_id][near_elem_index];
                if (near_elem_id >= 0) {
                    std::vector<impl::LocalId>::iterator pos_of_shell_in_near_elem = std::find(m_elem_graph[near_elem_id].begin(), m_elem_graph[near_elem_id].end(), shell_to_delete_id);
                    ThrowRequire(pos_of_shell_in_near_elem != m_elem_graph[near_elem_id].end());
                    int index_of_shell_in_near_elem = pos_of_shell_in_near_elem - m_elem_graph[near_elem_id].begin();
                    stk::mesh::Entity nearElem = m_local_id_to_element_entity[near_elem_id];
                    shellConnectivityData.m_nearElementSide = m_via_sides[near_elem_id][index_of_shell_in_near_elem];
                    shellConnectivityData.m_nearElementId = m_bulk_data.identifier(nearElem);
                    shellConnectivityData.m_nearElementProc = m_bulk_data.parallel_rank();
                }
                else {
                    shellConnectivityData.m_nearElementSide = -1; // Near element is remote, so let it figure out the side
                    shellConnectivityData.m_nearElementId = -near_elem_id;

                    auto iter = m_parallel_graph_info.find( std::make_pair(shell_to_delete_id, shellConnectivityData.m_nearElementId));
                    ThrowRequire(iter != m_parallel_graph_info.end());
                    shellConnectivityData.m_nearElementProc = iter->second.m_other_proc;
                }

                shellConnectivityData.m_shellElementId = deletedElementInfo.identifier;

                std::vector<impl::LocalId> & graphElemIds = m_elem_graph[shell_to_delete_id];
                ThrowAssertMsg(graphElemIds.size() <= 2, "Coincident shells detected.  Please call (505)844-3041 for support.");
                for (impl::LocalId graphElemId : graphElemIds) {
                    if (graphElemId != near_elem_id) {
                        if (graphElemId < 0) {
                            // Remote Element
                            shellConnectivityData.m_farElementId = -graphElemId;
                            shellConnectivityData.m_farElementIsRemote = true;

                            auto iter = m_parallel_graph_info.find( std::make_pair(shell_to_delete_id, shellConnectivityData.m_farElementId));
                            ThrowRequire(iter != m_parallel_graph_info.end());
                            shellConnectivityData.m_farElementProc = iter->second.m_other_proc;
                        }
                        else {
                            // Local Element
                            stk::mesh::Entity remoteElement = m_local_id_to_element_entity[graphElemId];
                            shellConnectivityData.m_farElementId = m_bulk_data.identifier(remoteElement);
                            shellConnectivityData.m_farElementIsRemote = false;
                            shellConnectivityData.m_farElementProc = m_bulk_data.parallel_rank();
                        }
                        // Only add to list if there *is* something connected on the back-side of the shell
                        deletedShells.push_back(elem_to_delete);
                        shellConnectivityList.push_back(shellConnectivityData);
                        break;
                    }
                }
            }
        }
    }
}

void ElemElemGraph::communicate_shell_connectivity(std::vector<impl::ShellConnectivityData>& shellConnectivityList,
                                                   const stk::mesh::EntityVector &deletedShells) {

    stk::CommSparse shellComm(m_bulk_data.parallel());
    pack_shell_connectivity(shellComm, shellConnectivityList, deletedShells);
    shellComm.allocate_buffers();
    pack_shell_connectivity(shellComm, shellConnectivityList, deletedShells);
    shellComm.communicate();

    for (int proc = 0; proc < m_bulk_data.parallel_size(); ++proc) {
        while (shellComm.recv_buffer(proc).remaining()) {
            impl::ShellConnectivityData shellConnectivityData;
            shellComm.recv_buffer(proc).unpack<stk::mesh::EntityId>(shellConnectivityData.m_farElementId); // Flip remote and local
            shellComm.recv_buffer(proc).unpack<int>(shellConnectivityData.m_farElementProc);
            shellComm.recv_buffer(proc).unpack<stk::mesh::EntityId>(shellConnectivityData.m_shellElementId);
            shellComm.recv_buffer(proc).unpack<stk::mesh::EntityId>(shellConnectivityData.m_nearElementId); // Flip remote and local
            shellConnectivityData.m_nearElementProc = m_bulk_data.parallel_rank();

            stk::mesh::Entity nearElement = m_bulk_data.get_entity(stk::topology::ELEM_RANK, shellConnectivityData.m_nearElementId);
            impl::LocalId nearElementId = get_local_element_id(nearElement);

            std::vector<impl::LocalId>& graphElemIds = m_elem_graph[nearElementId];
            for (size_t i = 0; i < graphElemIds.size(); ++i) {
                impl::LocalId shellElementId = -shellConnectivityData.m_shellElementId;
                if (graphElemIds[i] == shellElementId) {
                    shellConnectivityData.m_nearElementSide = m_via_sides[nearElementId][i];
                    break;
                }
            }
            shellConnectivityList.push_back(shellConnectivityData);
        }
    }
}

void ElemElemGraph::delete_local_connections_and_collect_remote(const stk::mesh::impl::DeletedElementInfoVector &elements_to_delete,
                                                                std::vector<impl::DeletedElementData>& local_elem_and_remote_connected_elem)
{
    for (const stk::mesh::impl::DeletedElementInfo &deletedElementInfo : elements_to_delete) {
        stk::mesh::Entity elem_to_delete = deletedElementInfo.entity;
        impl::LocalId elem_to_delete_id = get_local_element_id(elem_to_delete);

//        if (!m_bulk_data.bucket(elem_to_delete).owned()) {
//            continue;
//        }

        size_t num_connected_elems = get_num_connected_elems(elem_to_delete);
        for (int conn_elem_index = num_connected_elems - 1; conn_elem_index >= 0; --conn_elem_index) {
            impl::LocalId connected_elem_id = m_elem_graph[elem_to_delete_id][conn_elem_index];
            bool local_connection = connected_elem_id >= 0;
            if (local_connection) {
                m_via_sides[elem_to_delete_id].erase(m_via_sides[elem_to_delete_id].begin() + conn_elem_index);
                --m_num_edges;

                std::vector<impl::LocalId>::iterator pos_of_elem1_in_elem2 = std::find(m_elem_graph[connected_elem_id].begin(), m_elem_graph[connected_elem_id].end(), elem_to_delete_id);
                ThrowRequire(pos_of_elem1_in_elem2 != m_elem_graph[connected_elem_id].end());
                int index_of_elem1_in_elem2 = pos_of_elem1_in_elem2 - m_elem_graph[connected_elem_id].begin();

                m_via_sides[connected_elem_id].erase(m_via_sides[connected_elem_id].begin() + index_of_elem1_in_elem2);
                --m_num_edges;

            } else {
                stk::mesh::EntityId connected_global_id = -connected_elem_id;
                auto iter = m_parallel_graph_info.find(std::make_pair(elem_to_delete_id, connected_global_id));
                ThrowRequire(iter != m_parallel_graph_info.end());
                int remote_proc = iter->second.m_other_proc;

                impl::DeletedElementData deletedElementData;
                deletedElementData.m_deletedElement = elem_to_delete_id;
                deletedElementData.m_remoteElement = connected_global_id;
                deletedElementData.m_remoteProc = remote_proc;
                local_elem_and_remote_connected_elem.push_back(deletedElementData);

                m_via_sides[elem_to_delete_id].erase(m_via_sides[elem_to_delete_id].begin() + conn_elem_index);
                --m_num_edges;
                m_parallel_graph_info.erase(std::make_pair(elem_to_delete_id, connected_global_id));
            }
        }

        ThrowRequire(m_via_sides[elem_to_delete_id].empty());
        for (size_t id = 0; id < m_elem_graph.size(); ++id) {
            if (id != static_cast<size_t>(elem_to_delete_id) && !m_local_id_in_pool[id]) {
                std::vector<impl::LocalId>::iterator pos_of_deleted_elem_in_current_id = std::find(m_elem_graph[id].begin(), m_elem_graph[id].end(), elem_to_delete_id);
                if (pos_of_deleted_elem_in_current_id != m_elem_graph[id].end()) {
                    int index_of_deleted_elem_in_current_id = pos_of_deleted_elem_in_current_id - m_elem_graph[id].begin();
                    m_elem_graph[id].erase(m_elem_graph[id].begin() + index_of_deleted_elem_in_current_id);
                }
            }
        }
    }
}

void ElemElemGraph::communicate_remote_connections_to_delete(const std::vector<impl::DeletedElementData>& local_elem_and_remote_connected_elem,
                                                             std::vector<std::pair<stk::mesh::EntityId, stk::mesh::EntityId> >& remote_edges)
{
    stk::CommSparse comm(m_bulk_data.parallel());
    pack_deleted_element_comm(comm, local_elem_and_remote_connected_elem);
    comm.allocate_buffers();
    pack_deleted_element_comm(comm, local_elem_and_remote_connected_elem);
    comm.communicate();

    for (int proc = 0; proc < m_bulk_data.parallel_size(); ++proc) {
        while (comm.recv_buffer(proc).remaining()) {
            stk::mesh::EntityId deleted_elem_global_id;
            stk::mesh::EntityId connected_elem_global_id;
            comm.recv_buffer(proc).unpack<stk::mesh::EntityId>(deleted_elem_global_id);
            comm.recv_buffer(proc).unpack<stk::mesh::EntityId>(connected_elem_global_id);
            remote_edges.push_back(std::make_pair(deleted_elem_global_id, connected_elem_global_id));
        }
    }
}

void ElemElemGraph::clear_deleted_element_connections(const stk::mesh::impl::DeletedElementInfoVector &elements_to_delete)
{
    for (const stk::mesh::impl::DeletedElementInfo &deletedElementInfo : elements_to_delete)
    {
        stk::mesh::Entity elem = deletedElementInfo.entity;
        impl::LocalId elem_to_delete_id = m_entity_to_local_id[elem.local_offset()];
        m_elem_graph[elem_to_delete_id].clear();
        ThrowAssertMsg(m_via_sides[elem_to_delete_id].empty(), "Unable to delete element from graph.  Contact sierra-help@sandia.gov for help.");
        m_deleted_element_local_id_pool.push_back(elem_to_delete_id);
        m_local_id_in_pool[elem_to_delete_id] = true;
        m_element_topologies[elem_to_delete_id] = stk::topology::INVALID_TOPOLOGY;
        m_entity_to_local_id[elem.local_offset()] = INVALID_LOCAL_ID;
        m_local_id_to_element_entity[elem_to_delete_id] = stk::mesh::Entity::InvalidEntity;
    }
}

void ElemElemGraph::delete_remote_connections(const std::vector<std::pair<stk::mesh::EntityId, stk::mesh::EntityId> >& remote_edges)
{
    for (auto & edge : remote_edges) {
        stk::mesh::EntityId deleted_elem_global_id = edge.first;
        stk::mesh::EntityId connected_elem_global_id = edge.second;
        stk::mesh::Entity connected_elem = m_bulk_data.get_entity(stk::topology::ELEM_RANK, connected_elem_global_id);
        impl::LocalId connected_elem_id = m_entity_to_local_id[connected_elem.local_offset()];
        if (!is_valid_graph_element(connected_elem)) {
            continue;
        }

        size_t num_conn_elem = get_num_connected_elems(connected_elem);
        bool found_deleted_elem = false;
        for (size_t conn_elem_index = 0; conn_elem_index < num_conn_elem; ++conn_elem_index) {
            if (m_elem_graph[connected_elem_id][conn_elem_index] == static_cast<int64_t>(-deleted_elem_global_id)) {
                m_elem_graph[connected_elem_id].erase(m_elem_graph[connected_elem_id].begin() + conn_elem_index);
                m_via_sides[connected_elem_id].erase(m_via_sides[connected_elem_id].begin() + conn_elem_index);
                --m_num_edges;
                found_deleted_elem = true;
                m_parallel_graph_info.erase(std::make_pair(connected_elem_id, deleted_elem_global_id));
                break;
            }
        }
        ThrowRequireMsg(found_deleted_elem, "Error. Contact sierra-help@sandia.gov for support.");
    }
}

void ElemElemGraph::reconnect_volume_elements_across_deleted_shells(std::vector<impl::ShellConnectivityData> & shellConnectivityList)
{
    // Prune the shell connectivity list for entries that we do not need to act on
    std::vector<impl::ShellConnectivityData>::iterator it = shellConnectivityList.begin();
    while (it != shellConnectivityList.end()) {
        const impl::ShellConnectivityData& shellConnectivityData = *it;
        if (shellConnectivityData.m_nearElementProc != m_bulk_data.parallel_rank()) {
            it = shellConnectivityList.erase(it);
        } else {
            ++it;
        }
    }

    impl::ElemSideToProcAndFaceId shellNeighborsToReconnect;
    for (const impl::ShellConnectivityData& data : shellConnectivityList) {
        stk::mesh::Entity localElement = m_bulk_data.get_entity(stk::topology::ELEM_RANK, data.m_nearElementId);
        if (data.m_nearElementProc == m_bulk_data.parallel_rank() && data.m_farElementProc == m_bulk_data.parallel_rank()) {
            impl::LocalId localElementId = get_local_element_id(localElement);
            stk::mesh::Entity remoteElement = m_bulk_data.get_entity(stk::topology::ELEM_RANK, data.m_farElementId);
            impl::LocalId remoteElementId;
            remoteElementId = get_local_element_id(remoteElement);
            m_elem_graph[localElementId].push_back(remoteElementId);
            m_via_sides[localElementId].push_back(data.m_nearElementSide);
            ++m_num_edges;
        }
        else {
            shellNeighborsToReconnect.insert(
                    std::pair<impl::EntitySidePair, impl::ProcFaceIdPair>(impl::EntitySidePair(localElement, data.m_nearElementSide),
                            impl::ProcFaceIdPair(data.m_farElementProc, 0)));
        }
    }

    this->generate_additional_ids_collective(m_num_edges + shellConnectivityList.size());
    fill_parallel_graph(shellNeighborsToReconnect);

    update_number_of_parallel_edges();
}

void ElemElemGraph::delete_elements(const stk::mesh::impl::DeletedElementInfoVector &elements_to_delete)
{
    std::vector<impl::ShellConnectivityData> shellConnectivityList;
    stk::mesh::EntityVector deletedShells;
    collect_local_shell_connectivity_data(elements_to_delete, shellConnectivityList, deletedShells);

    communicate_shell_connectivity(shellConnectivityList, deletedShells);

    std::vector<impl::DeletedElementData> local_elem_and_remote_connected_elem;
    delete_local_connections_and_collect_remote(elements_to_delete, local_elem_and_remote_connected_elem);

    std::vector< std::pair< stk::mesh::EntityId, stk::mesh::EntityId > > remote_edges;
    communicate_remote_connections_to_delete(local_elem_and_remote_connected_elem, remote_edges);

    clear_deleted_element_connections(elements_to_delete);

    delete_remote_connections(remote_edges);

    reconnect_volume_elements_across_deleted_shells(shellConnectivityList);
}

stk::mesh::ConnectivityOrdinal ElemElemGraph::get_neighboring_side_ordinal(const stk::mesh::BulkData &mesh,
                                                                           stk::mesh::Entity currentElem,
                                                                           stk::mesh::ConnectivityOrdinal currentOrdinal,
                                                                           stk::mesh::Entity neighborElem)
{
    stk::topology currentElemTopology = mesh.bucket(currentElem).topology();
    stk::topology currentSideTopology = currentElemTopology.side_topology(currentOrdinal);
    const stk::mesh::Entity* currentElemNodes = mesh.begin_nodes(currentElem);
    stk::mesh::EntityVector currentElemSideNodes(currentSideTopology.num_nodes());
    currentElemTopology.side_nodes(currentElemNodes, currentOrdinal, currentElemSideNodes.begin());

    stk::topology neighborTopology = mesh.bucket(neighborElem).topology();
    stk::mesh::EntityVector neighborSideNodes;

    bool foundNeighborOrdinal = false;
    unsigned neighborOrdinal = 0;
    for (; neighborOrdinal < neighborTopology.num_sides(); ++neighborOrdinal)
    {
        stk::topology neighborFaceTopology = neighborTopology.side_topology(neighborOrdinal);
        neighborSideNodes.resize(neighborFaceTopology.num_nodes());
        const stk::mesh::Entity* neighborNodes = mesh.begin_nodes(neighborElem);
        neighborTopology.side_nodes(neighborNodes, neighborOrdinal, neighborSideNodes.begin());
        std::pair<bool,unsigned> result = neighborFaceTopology.equivalent(currentElemSideNodes, neighborSideNodes);

        if (result.first && result.second >= neighborFaceTopology.num_positive_permutations())
        {
            foundNeighborOrdinal = true;
            break;
        }
    }
    ThrowRequireMsg(foundNeighborOrdinal, "Error: neighborElem is not a true neighbor of currentElem.");
    return static_cast<stk::mesh::ConnectivityOrdinal>(neighborOrdinal);
}

size_t ElemElemGraph::find_max_local_offset_in_neighborhood(stk::mesh::Entity element)
{
    stk::mesh::EntityVector side_nodes;
    stk::mesh::EntityVector connected_elements;
    stk::mesh::Bucket &elem_bucket = m_bulk_data.bucket(element);
    stk::topology topology = elem_bucket.topology();
    size_t num_sides = topology.num_sides();
    const stk::mesh::Entity* elem_nodes = elem_bucket.begin_nodes(m_bulk_data.bucket_ordinal(element));
    size_t max_local_offset = 0;
    size_t current_offset = element.local_offset();
    if (current_offset > max_local_offset)
    {
        max_local_offset = current_offset;
    }
    for (size_t side_index = 0; side_index < num_sides; ++side_index)
    {
        unsigned num_side_nodes = topology.side_topology(side_index).num_nodes();
        side_nodes.resize(num_side_nodes);
        topology.side_nodes(elem_nodes, side_index, side_nodes.begin());
        connected_elements.clear();
        impl::ConnectedElementDataVector connectedElementDataVector;
        impl::find_locally_owned_elements_these_nodes_have_in_common(m_bulk_data, num_side_nodes, side_nodes.data(), connected_elements);

        for (stk::mesh::Entity & connected_element : connected_elements)
        {
            current_offset = connected_element.local_offset();
            if (current_offset > max_local_offset)
            {
                max_local_offset = current_offset;
            }
        }
    }
    return max_local_offset;
}

void ElemElemGraph::generate_additional_ids_collective(size_t num_additional_ids_needed)
{
    std::vector<stk::mesh::EntityId> new_ids;
    m_bulk_data.generate_new_ids_given_reserved_ids(m_bulk_data.mesh_meta_data().side_rank(), num_additional_ids_needed, m_suggested_side_ids, new_ids);
    m_suggested_side_ids.insert(m_suggested_side_ids.end(), new_ids.begin(), new_ids.end());
}

void ElemElemGraph::make_space_for_new_elements(const stk::mesh::EntityVector& allElementsNotAlreadyInGraph)
{
    size_t max_offset = 0;
    for (const stk::mesh::Entity& element_to_add : allElementsNotAlreadyInGraph)
    {
        const size_t local_max = find_max_local_offset_in_neighborhood(element_to_add);
        max_offset = std::max(local_max, max_offset);
    }
    resize_entity_to_local_id_if_needed(max_offset);
}

void ElemElemGraph::add_edge_between_local_elements(impl::LocalId elem1Id, impl::LocalId elem2Id, int elem1Side)
{
    m_elem_graph[elem1Id].push_back(elem2Id);
    m_via_sides[elem1Id].push_back(elem1Side);
    ++m_num_edges;
}

void ElemElemGraph::add_both_edges_between_local_elements(impl::LocalId elem1Id, impl::LocalId elem2Id, int elem1Side)
{
    add_edge_between_local_elements(elem1Id, elem2Id, elem1Side);

    stk::mesh::Entity elem1 = m_local_id_to_element_entity[elem1Id];
    stk::mesh::Entity elem2 = m_local_id_to_element_entity[elem2Id];
    stk::mesh::ConnectivityOrdinal elem1SideOrdinal = static_cast<stk::mesh::ConnectivityOrdinal>(elem1Side);
    stk::mesh::ConnectivityOrdinal elem2SideOrdinal = get_neighboring_side_ordinal(m_bulk_data, elem1, elem1SideOrdinal, elem2);
    add_edge_between_local_elements(elem2Id, elem1Id, elem2SideOrdinal);
}

void ElemElemGraph::add_local_edges(stk::mesh::Entity elem_to_add, impl::LocalId new_elem_id)
{
    std::vector<impl::ElementSidePair> elemSidePairs;
    std::set<EntityId> localElementsConnectedToNewShell;
    get_element_side_pairs(m_bulk_data.mesh_index(elem_to_add), new_elem_id, elemSidePairs);
    for (impl::ElementSidePair& elemSidePair : elemSidePairs)
    {
        stk::mesh::Entity neighbor = m_local_id_to_element_entity[elemSidePair.first];
        if (is_valid_graph_element(neighbor))
        {
            add_both_edges_between_local_elements(new_elem_id, elemSidePair.first, elemSidePair.second);
            if (m_element_topologies[new_elem_id].is_shell())
            {
                impl::LocalId neighbor_id2 = m_entity_to_local_id[neighbor.local_offset()];
                localElementsConnectedToNewShell.insert(neighbor_id2);
            }
        }
    }
    break_local_volume_element_connections_across_shells(localElementsConnectedToNewShell);
}

void ElemElemGraph::add_vertex(impl::LocalId new_elem_id, stk::mesh::Entity elem_to_add)
{
    m_local_id_to_element_entity[new_elem_id] = elem_to_add;
    m_entity_to_local_id[elem_to_add.local_offset()] = new_elem_id;
    stk::topology elem_topology = m_bulk_data.bucket(elem_to_add).topology();
    m_element_topologies[new_elem_id] = elem_topology;
}

stk::mesh::EntityVector ElemElemGraph::filter_add_elements_arguments(const stk::mesh::EntityVector& allUnfilteredElementsNotAlreadyInGraph) const
{
    stk::mesh::EntityVector allElementsNotAlreadyInGraph;
    allElementsNotAlreadyInGraph.reserve(allUnfilteredElementsNotAlreadyInGraph.size());
    for(stk::mesh::Entity element : allUnfilteredElementsNotAlreadyInGraph)
    {
        ThrowRequire(m_bulk_data.is_valid(element));
        if(m_bulk_data.bucket(element).owned())
        {
            ThrowRequire(!is_valid_graph_element(element));
            allElementsNotAlreadyInGraph.push_back(element);
        }
    }
    return allElementsNotAlreadyInGraph;
}

void ElemElemGraph::add_elements_locally(const stk::mesh::EntityVector& allElementsNotAlreadyInGraph)
{
    make_space_for_new_elements(allElementsNotAlreadyInGraph);
    for(stk::mesh::Entity newElem : allElementsNotAlreadyInGraph)
    {
        impl::LocalId newElemLocalId = get_new_local_element_id_from_pool();
        add_vertex(newElemLocalId, newElem);
        add_local_edges(newElem, newElemLocalId);
    }
}

void ElemElemGraph::add_elements(const stk::mesh::EntityVector &allUnfilteredElementsNotAlreadyInGraph)
{
    stk::mesh::EntityVector allElementsNotAlreadyInGraph = filter_add_elements_arguments(allUnfilteredElementsNotAlreadyInGraph);

    const size_t numEdgesBefore = num_edges();
    add_elements_locally(allElementsNotAlreadyInGraph);
    const size_t numLocalEdgesNeeded = num_edges() - numEdgesBefore;

    impl::ElemSideToProcAndFaceId elem_side_comm = get_element_side_ids_to_communicate();

    ssize_t num_additional_parallel_edges = elem_side_comm.size() - m_num_parallel_edges;
    if(num_additional_parallel_edges < 0)
    {
        num_additional_parallel_edges = 0;
    }
    size_t num_additional_side_ids_needed =  num_additional_parallel_edges + numLocalEdgesNeeded;
    generate_additional_ids_collective(num_additional_side_ids_needed);

    stk::mesh::EntityVector allElementsNotAlreadyInGraph_copy = allElementsNotAlreadyInGraph;
    std::sort(allElementsNotAlreadyInGraph_copy.begin(), allElementsNotAlreadyInGraph_copy.end());

    std::set< stk::mesh::Entity > addedShells;
    impl::ElemSideToProcAndFaceId only_added_elements;
    for(impl::ElemSideToProcAndFaceId::value_type &elemSideToProcAndFaceId : elem_side_comm)
    {
        stk::mesh::Entity element = elemSideToProcAndFaceId.first.entity;
        stk::mesh::EntityVector::iterator elem_iter = std::lower_bound(allElementsNotAlreadyInGraph_copy.begin(), allElementsNotAlreadyInGraph_copy.end(), element);
        if(elem_iter!=allElementsNotAlreadyInGraph_copy.end() && *elem_iter==element)
        {
            only_added_elements.insert(elemSideToProcAndFaceId);
            if (m_bulk_data.bucket(element).topology().is_shell())
            {
                addedShells.insert(element);
            }
        }
    }

    fill_parallel_graph(only_added_elements);

    stk::mesh::EntityVector addedShellsVector;
    for (auto &shell : addedShells)
    {
        addedShellsVector.push_back(shell);
    }

    stk::CommSparse comm(m_bulk_data.parallel());
    for (int phase = 0; phase < 2; ++phase)
    {
        pack_remote_edge_across_shell(comm, addedShellsVector, phase);
        if (0 == phase)
        {
            comm.allocate_buffers();
        }
        if (1 == phase)
        {
            comm.communicate();
        }
    }

    unpack_remote_edge_across_shell(comm);
    update_number_of_parallel_edges();
}

void ElemElemGraph::break_remote_shell_connectivity_and_pack(stk::CommSparse &comm, impl::LocalId leftId, impl::LocalId rightId, int phase)
{
    size_t index = 0;
    while(index < m_elem_graph[leftId].size())
    {
        if(m_elem_graph[leftId][index] == rightId)
        {
            if (phase == 1)
            {
                m_elem_graph[leftId].erase(m_elem_graph[leftId].begin() + index);
                m_via_sides[leftId].erase(m_via_sides[leftId].begin() + index);
                --m_num_edges;
            }
            else
            {
                ++index;
            }

            stk::mesh::Entity localElem = m_local_id_to_element_entity[leftId];
            int sharingProc = get_owning_proc_id_of_remote_element(localElem, -rightId);
            stk::mesh::EntityId localElemId = m_bulk_data.identifier(localElem);

            comm.send_buffer(sharingProc).pack<stk::mesh::EntityId>(localElemId);
            comm.send_buffer(sharingProc).pack<stk::mesh::EntityId>(-rightId);
            break;
        }
        else
        {
            ++index;
        }
    }
}

void ElemElemGraph::pack_both_remote_shell_connectivity(stk::CommSparse &comm, impl::LocalId shellId, impl::LocalId leftId, impl::LocalId rightId)
{
    size_t index = 0;
    while(index < m_elem_graph[shellId].size())
    {
        if (m_elem_graph[shellId][index] == rightId)
        {
            stk::mesh::Entity shellElem = m_local_id_to_element_entity[shellId];
            int sharingProc = get_owning_proc_id_of_remote_element(shellElem, -rightId);

            comm.send_buffer(sharingProc).pack<stk::mesh::EntityId>(-leftId);
            comm.send_buffer(sharingProc).pack<stk::mesh::EntityId>(-rightId);
        }
        else if (m_elem_graph[shellId][index] == leftId)
        {
            stk::mesh::Entity shellElem = m_local_id_to_element_entity[shellId];
            int sharingProc = get_owning_proc_id_of_remote_element(shellElem, -leftId);

            comm.send_buffer(sharingProc).pack<stk::mesh::EntityId>(-rightId);
            comm.send_buffer(sharingProc).pack<stk::mesh::EntityId>(-leftId);
        }
        ++index;
    }
}

void ElemElemGraph::pack_remote_edge_across_shell(stk::CommSparse &comm, stk::mesh::EntityVector &addedShells, int phase)
{
    for(stk::mesh::Entity &shell : addedShells)
    {
        impl::LocalId shellId = m_entity_to_local_id[shell.local_offset()];
        impl::LocalId leftId = INVALID_LOCAL_ID;
        impl::LocalId rightId = INVALID_LOCAL_ID;
        for (impl::LocalId connectedId : m_elem_graph[shellId])
        {
            if (leftId == INVALID_LOCAL_ID)
            {
                leftId = connectedId;
                continue;
            }
            if (rightId == INVALID_LOCAL_ID)
            {
                rightId = connectedId;
                continue;
            }
        }
        bool isLeftRemote = leftId < 0;
        bool isRightRemote = rightId < 0;

        if (leftId == INVALID_LOCAL_ID || rightId == INVALID_LOCAL_ID)
        {
            continue;
        }

        if (!isLeftRemote && !isRightRemote)
        {
            continue;
        }

        if (isLeftRemote && isRightRemote) {
            pack_both_remote_shell_connectivity(comm, shellId, leftId, rightId);
        }
        else if (!isLeftRemote) {
            break_remote_shell_connectivity_and_pack(comm, leftId, rightId, phase);
        }
        else if (!isRightRemote) {
            break_remote_shell_connectivity_and_pack(comm, rightId, leftId, phase);
        }
    }
}

void ElemElemGraph::unpack_remote_edge_across_shell(stk::CommSparse &comm)
{
    for(int i=0;i<m_bulk_data.parallel_size();++i)
    {
        while(comm.recv_buffer(i).remaining())
        {
            stk::mesh::EntityId localElemId;
            stk::mesh::EntityId remoteElemId;
            comm.recv_buffer(i).unpack<stk::mesh::EntityId>(remoteElemId);
            comm.recv_buffer(i).unpack<stk::mesh::EntityId>(localElemId);
            stk::mesh::Entity localElem = m_bulk_data.get_entity(stk::topology::ELEM_RANK, localElemId);
            impl::LocalId localId = m_entity_to_local_id[localElem.local_offset()];

            size_t index = 0;
            while(index < m_elem_graph[localId].size())
            {
                if(m_elem_graph[localId][index] == static_cast<impl::LocalId>(-1*remoteElemId))
                {
                    m_elem_graph[localId].erase(m_elem_graph[localId].begin() + index);
                    m_via_sides[localId].erase(m_via_sides[localId].begin() + index);
                    --m_num_edges;
                    break;
                }
                else
                {
                    ++index;
                }
            }
        }
    }
}

void add_downward_connected_from_elements(stk::mesh::BulkData &bulkData,
                                          std::vector<std::pair<stk::mesh::Entity, int> > &elem_proc_pairs_to_move,
                                          std::vector<std::pair<stk::mesh::Entity, int> > &entity_proc_pairs_to_move)
{
    for(stk::mesh::EntityRank rank=stk::topology::NODE_RANK; rank<stk::topology::ELEMENT_RANK; rank++)
    {
        for(size_t i=0; i<elem_proc_pairs_to_move.size(); i++)
        {
            entity_proc_pairs_to_move.push_back(elem_proc_pairs_to_move[i]);
            stk::mesh::Entity elem = elem_proc_pairs_to_move[i].first;
            int otherProc = elem_proc_pairs_to_move[i].second;
            const unsigned numConnected = bulkData.num_connectivity(elem, rank);
            const stk::mesh::Entity *connectedEntity = bulkData.begin(elem, rank);
            for(unsigned j=0; j<numConnected; j++)
            {
                if(bulkData.bucket(connectedEntity[j]).owned())
                {
                    entity_proc_pairs_to_move.push_back(std::make_pair(connectedEntity[j], otherProc));
                }
            }
        }
    }
}

impl::parallel_info ElemElemGraph::create_parallel_info(stk::mesh::Entity connected_element,
                                                        const stk::mesh::Entity elemToSend,
                                                        int elemToSendSideId,
                                                        const int destination_proc)
{
    stk::mesh::Permutation permutation = get_permutation_given_neighbors_node_ordering(connected_element, elemToSend, elemToSendSideId);
    stk::mesh::EntityId faceId = get_available_side_id();
    stk::topology elemTopology = m_bulk_data.bucket(elemToSend).topology();
    bool inBodyToBeSkinned = m_skinned_selector(m_bulk_data.bucket(connected_element));
    return impl::parallel_info(destination_proc, elemToSendSideId, permutation, faceId, elemTopology, inBodyToBeSkinned);
}

stk::mesh::Permutation ElemElemGraph::get_permutation_given_neighbors_node_ordering(stk::mesh::Entity neighborElem,
                                                                                    const stk::mesh::Entity elemToSend,
                                                                                    int elemToSendSideId)
{
    stk::topology elemTopology = m_bulk_data.bucket(elemToSend).topology();
    const stk::mesh::Entity *elemNodes = m_bulk_data.begin_nodes(elemToSend);

    stk::topology sideTopology = elemTopology.side_topology(elemToSendSideId);
    std::vector<stk::mesh::Entity> sideNodes(sideTopology.num_nodes());

    elemTopology.side_nodes(elemNodes, elemToSendSideId, sideNodes.begin());

    stk::mesh::EntityRank sideRank = m_bulk_data.mesh_meta_data().side_rank();
    stk::mesh::OrdinalAndPermutation ordperm = get_ordinal_and_permutation(m_bulk_data, neighborElem, sideRank, sideNodes);

    return ordperm.second;
}



void ElemElemGraph::update_all_local_neighbors(const stk::mesh::Entity elemToSend,
                                               const int destinationProc,
                                               impl::ParallelGraphInfo &newParallelGraphEntries)
{
    stk::mesh::EntityId elemGlobalId = m_bulk_data.identifier(elemToSend);
    size_t numNeighbors = get_num_connected_elems(elemToSend);

    for(size_t k = 0; k < numNeighbors; k++)
    {
        if(is_connected_elem_locally_owned(elemToSend, k))
        {
            int elemToSendSideId = get_side_id_to_connected_element(elemToSend, k);
            stk::mesh::Entity neighborElem = get_connected_element(elemToSend, k);

            impl::LocalId localId = get_local_element_id(neighborElem);
            std::pair<impl::LocalId, stk::mesh::EntityId> key(localId, elemGlobalId);
            impl::parallel_info parallelInfo = create_parallel_info(neighborElem, elemToSend, elemToSendSideId, destinationProc);
            newParallelGraphEntries.insert(std::make_pair(key, parallelInfo));
        }
    }
}


void ElemElemGraph::create_parallel_graph_info_needed_once_entities_are_moved(
        const stk::mesh::EntityProcVec &elemProcPairsToMove,
        impl::ParallelGraphInfo &newParallelGraphEntries)
{
    for(size_t i = 0; i < elemProcPairsToMove.size(); i++)
    {
        stk::mesh::Entity elemToSend = elemProcPairsToMove[i].first;
        int destination_proc = elemProcPairsToMove[i].second;

        update_all_local_neighbors(elemToSend, destination_proc, newParallelGraphEntries);
    }
}

void change_entity_owner(stk::mesh::BulkData &bulkData, stk::mesh::ElemElemGraph &elemGraph, stk::mesh::EntityProcVec &elemProcPairsToMove, stk::mesh::Part *activePart)
{
    impl::ParallelGraphInfo newParallelGraphEntries;
    elemGraph.create_parallel_graph_info_needed_once_entities_are_moved(elemProcPairsToMove, newParallelGraphEntries);

    std::vector< std::pair< stk::mesh::Entity, int > > entityProcPairsToMove;
    add_downward_connected_from_elements(bulkData, elemProcPairsToMove, entityProcPairsToMove);

    bulkData.change_entity_owner(entityProcPairsToMove);

    elemGraph.change_entity_owner(elemProcPairsToMove, newParallelGraphEntries);
}

stk::mesh::Entity ElemElemGraph::add_side_to_mesh(stk::mesh::impl::ElementSidePair& side_pair, const stk::mesh::PartVector& skin_parts, stk::mesh::EntityId side_id)
{
    stk::mesh::Entity element = m_local_id_to_element_entity[side_pair.first];
    int side_ordinal = side_pair.second;
    stk::mesh::Entity side = stk::mesh::impl::get_side_for_element(m_bulk_data, element, side_ordinal);

    if(m_bulk_data.is_valid(side))
    {
        if(m_bulk_data.bucket(side).owned())
        {
            m_bulk_data.change_entity_parts(side, skin_parts, stk::mesh::PartVector());
        }
    }
    else
    {
        stk::mesh::PartVector add_parts = skin_parts;
        stk::topology elem_top = m_bulk_data.bucket(element).topology();
        stk::topology side_top = elem_top.side_topology(side_ordinal);
        add_parts.push_back(&m_bulk_data.mesh_meta_data().get_topology_root_part(side_top));
        ThrowRequireMsg(!impl::is_id_already_in_use_locally(m_bulk_data, m_bulk_data.mesh_meta_data().side_rank(), side_id), "Program error. Id in use.");
        side = stk::mesh::declare_element_side(m_bulk_data, side_id, element, side_ordinal, add_parts);
    }
    return side;
}

void add_skinned_shared_side_to_element(stk::mesh::BulkData& bulkData, const impl::parallel_info& parallel_edge_info, const ElemElemGraph& elementGraph,
        stk::mesh::Entity local_element, stk::mesh::EntityId remote_id, const stk::mesh::PartVector& parts_for_creating_side,
        std::vector<stk::mesh::sharing_info> &shared_modified, const stk::mesh::PartVector *boundary_mesh_parts = nullptr)
{
    int side_id = elementGraph.get_side_from_element1_to_remote_element2(local_element, remote_id);
    ThrowRequireMsg(side_id != -1, "Program error. Please contact sierra-help@sandia.gov for support.");

    stk::mesh::EntityId side_global_id = parallel_edge_info.m_chosen_side_id;
    stk::mesh::ConnectivityOrdinal side_ord = static_cast<stk::mesh::ConnectivityOrdinal>(side_id);
    std::string msg = "Program error. Contact sierra-help@sandia.gov for support.";

    // determine which element is active
    stk::mesh::Permutation perm = stk::mesh::DEFAULT_PERMUTATION;
    int other_proc = parallel_edge_info.m_other_proc;
    int owning_proc = std::min(other_proc, bulkData.parallel_rank());

    if(parallel_edge_info.m_in_body_to_be_skinned)
    {
        perm = static_cast<stk::mesh::Permutation>(parallel_edge_info.m_permutation);
    }

    stk::mesh::Entity side = stk::mesh::impl::get_side_for_element(bulkData, local_element, side_id);

    if(!bulkData.is_valid(side))
    {
        ThrowRequireMsg(!impl::is_id_already_in_use_locally(bulkData, bulkData.mesh_meta_data().side_rank(), side_global_id), msg);
        stk::mesh::PartVector add_parts = parts_for_creating_side;
        stk::topology elem_top = bulkData.bucket(local_element).topology();
        stk::topology side_top = elem_top.side_topology(side_ord);
        add_parts.push_back(&bulkData.mesh_meta_data().get_topology_root_part(side_top));
        side = impl::connect_side_to_element(bulkData, local_element, side_global_id, side_ord, perm, add_parts);
        shared_modified.push_back(stk::mesh::sharing_info(side, other_proc, owning_proc));
    }
    else
    {
        if(bulkData.bucket(side).owned())
        {
            bulkData.change_entity_parts(side, parts_for_creating_side, stk::mesh::PartVector());
        }
        shared_modified.push_back(stk::mesh::sharing_info(side, other_proc, bulkData.parallel_owner_rank(side)));
    }
}

struct LocalEdge
{
    stk::mesh::Entity m_element;
    stk::mesh::Entity m_other_element;
    LocalEdge(stk::mesh::Entity element, stk::mesh::Entity other_element) :
        m_element(element), m_other_element(other_element)
    {}

};

struct RemoteEdge
{
    stk::mesh::Entity m_element;
    stk::mesh::EntityId m_remote_id;
    stk::mesh::impl::parallel_info m_parallel_edge_info;
    RemoteEdge(stk::mesh::Entity element, stk::mesh::EntityId remote_id, stk::mesh::impl::parallel_info parallel_edge_info) :
        m_element(element), m_remote_id(remote_id), m_parallel_edge_info(parallel_edge_info)
    {}

};

void create_remote_sides(const ElemElemGraph& graph, stk::mesh::BulkData& bulk_data, const std::vector<RemoteEdge>& remote_edges, stk::mesh::EntityVector& skinned_elements, const stk::mesh::PartVector& skin_parts,
        const std::vector<unsigned>& side_counts, std::vector<stk::mesh::sharing_info>& shared_modified)
{
    for(size_t k=0;k<remote_edges.size();++k)
    {
        int side_ordinal = graph.get_side_from_element1_to_remote_element2(remote_edges[k].m_element, remote_edges[k].m_remote_id);
        unsigned num_connected_elements_this_side = graph.get_num_connected_elems(remote_edges[k].m_element, side_ordinal);
        if(num_connected_elements_this_side == side_counts[side_ordinal])
        {
            skinned_elements.push_back(remote_edges[k].m_element);
            add_skinned_shared_side_to_element(bulk_data, remote_edges[k].m_parallel_edge_info, graph, remote_edges[k].m_element, remote_edges[k].m_remote_id, skin_parts, shared_modified);
        }
    }
}

void create_remote_sides1(const ElemElemGraph& graph, stk::mesh::BulkData& bulk_data, const std::vector<RemoteEdge>& remote_edges, stk::mesh::EntityVector& skinned_elements, const stk::mesh::PartVector& skin_parts,
        const std::vector<unsigned>& side_counts, std::vector<stk::mesh::sharing_info>& shared_modified)
{
    for(size_t k=0;k<remote_edges.size();++k)
    {
        int side_ordinal = graph.get_side_from_element1_to_remote_element2(remote_edges[k].m_element, remote_edges[k].m_remote_id);
        if(1 == side_counts[side_ordinal])
        {
            skinned_elements.push_back(remote_edges[k].m_element);
            add_skinned_shared_side_to_element(bulk_data, remote_edges[k].m_parallel_edge_info, graph, remote_edges[k].m_element, remote_edges[k].m_remote_id, skin_parts, shared_modified);
        }
    }
}

void ElemElemGraph::skin_mesh(const stk::mesh::PartVector& skin_parts)
{
    const stk::mesh::BucketVector& buckets = m_bulk_data.get_buckets(stk::topology::ELEM_RANK, m_bulk_data.mesh_meta_data().locally_owned_part());

    std::vector<stk::mesh::sharing_info> shared_modified;

    stk::mesh::EntityVector skinned_elements;

    m_bulk_data.modification_begin();
    for(size_t i=0;i<buckets.size();++i)
    {
        const stk::mesh::Bucket &bucket = *buckets[i];
        for(size_t j=0;j<bucket.size();++j)
        {
            stk::mesh::Entity element = bucket[j];
            if(m_skinned_selector(bucket) && impl::does_element_have_side(m_bulk_data, element))
            {
                stk::mesh::impl::LocalId local_id = this->get_local_element_id(element);

                std::vector<stk::mesh::impl::ElementSidePair> element_side_pairs;
                impl::add_element_side_pairs_for_unused_sides(local_id, m_element_topologies[local_id], m_via_sides[local_id], element_side_pairs);

                if(!element_side_pairs.empty())
                {
                    skinned_elements.push_back(element);
                }

                for(size_t side_pair=0;side_pair<element_side_pairs.size();++side_pair)
                {
                    this->add_side_to_mesh(element_side_pairs[side_pair], skin_parts, get_available_side_id());
                }

                if(m_air_selector!=nullptr)
                {
                    std::vector<LocalEdge> local_edges;
                    std::vector<RemoteEdge> remote_edges;
                    std::vector<unsigned> side_counts(bucket.topology().num_sides(),0);
                    for(size_t k=0;k<this->get_num_connected_elems(element);++k)
                    {
                        if(this->is_connected_elem_locally_owned(element, k))
                        {
                            stk::mesh::Entity other_element = this->get_connected_element(element, k);
                            if (((*m_air_selector)(m_bulk_data.bucket(other_element))) && impl::does_element_have_side(m_bulk_data, other_element))
                            {
                                side_counts[this->get_side_from_element1_to_locally_owned_element2(element, other_element)]++;
                                local_edges.push_back(LocalEdge(element, other_element));
                            }
                        }
                        else
                        {
                            stk::mesh::EntityId remote_id = this->get_entity_id_of_remote_element(element, k);
                            impl::parallel_info &parallel_edge_info = this->get_parallel_edge_info(element, remote_id);
                            bool other_element_is_air = parallel_edge_info.m_is_air;
                            if(other_element_is_air)
                            {
                                side_counts[this->get_side_from_element1_to_remote_element2(element, remote_id)]++;
                                remote_edges.push_back(RemoteEdge(element, remote_id, parallel_edge_info));
                            }
                        }
                    }

                    for(size_t k=0;k<local_edges.size();++k)
                    {
                        stk::mesh::Entity this_element = local_edges[k].m_element;
                        stk::mesh::Entity other_element = local_edges[k].m_other_element;
                        int side_ordinal = this->get_side_from_element1_to_locally_owned_element2(this_element, other_element);
                        unsigned num_connected_elements_this_side = this->get_num_connected_elems(this_element, side_ordinal);
                        if(num_connected_elements_this_side == side_counts[side_ordinal])
                        {
                            stk::mesh::impl::ElementSidePair side_pair = std::make_pair(m_entity_to_local_id[this_element.local_offset()], this->get_side_from_element1_to_locally_owned_element2(this_element, other_element));
                            stk::mesh::Entity side = this->add_side_to_mesh(side_pair, skin_parts, get_available_side_id());
                            int side_other = this->get_side_from_element1_to_locally_owned_element2(other_element, this_element);
                            stk::mesh::Permutation perm = static_cast<stk::mesh::Permutation>(m_bulk_data.bucket(other_element).topology().num_positive_permutations());
                            m_bulk_data.declare_relation(other_element, side, side_other, perm);
                            skinned_elements.push_back(other_element);
                        }
                    }

                    create_remote_sides(*this, m_bulk_data, remote_edges, skinned_elements, skin_parts, side_counts, shared_modified);
                }
            }
            else if (impl::does_element_have_side(m_bulk_data, element))
            {
                if(m_air_selector!=nullptr && (*m_air_selector)(bucket))
                {
                    std::vector<RemoteEdge> remote_edges;
                    std::vector<LocalEdge> local_edges;
                    std::vector<unsigned> side_counts(bucket.topology().num_sides(),0);
                    for(size_t k=0;k<this->get_num_connected_elems(element);++k)
                    {
                        if(this->is_connected_elem_locally_owned(element, k))
                        {
                            stk::mesh::Entity other_element = this->get_connected_element(element, k);
                            if (((m_skinned_selector)(m_bulk_data.bucket(other_element))) && impl::does_element_have_side(m_bulk_data, other_element))
                            {
                                side_counts[this->get_side_from_element1_to_locally_owned_element2(element, other_element)]++;
                                local_edges.push_back(LocalEdge(element, other_element));
                            }
                        }
                        else
                        {
                            stk::mesh::EntityId remote_id = this->get_entity_id_of_remote_element(element, k);
                            impl::parallel_info &parallel_edge_info = this->get_parallel_edge_info(element, remote_id);
                            bool is_other_element_selected = parallel_edge_info.m_in_body_to_be_skinned;
                            if(is_other_element_selected)
                            {
                                side_counts[this->get_side_from_element1_to_remote_element2(element, remote_id)]++;
                                remote_edges.push_back(RemoteEdge(element, remote_id, parallel_edge_info));
                            }
                        }
                    }

                    for(size_t k=0;k<local_edges.size();++k)
                    {
                        stk::mesh::Entity this_element = local_edges[k].m_element;
                        stk::mesh::Entity other_element = local_edges[k].m_other_element;
                        int side_ordinal = this->get_side_from_element1_to_locally_owned_element2(this_element, other_element);
                        if(side_counts[side_ordinal] == 1)
                        {
                            stk::mesh::impl::ElementSidePair side_pair = std::make_pair(m_entity_to_local_id[this_element.local_offset()], this->get_side_from_element1_to_locally_owned_element2(this_element, other_element));
                            stk::mesh::Entity side = this->add_side_to_mesh(side_pair, skin_parts, get_available_side_id());
                            int side_other = this->get_side_from_element1_to_locally_owned_element2(other_element, this_element);
                            stk::mesh::Permutation perm = static_cast<stk::mesh::Permutation>(m_bulk_data.bucket(other_element).topology().num_positive_permutations());
                            m_bulk_data.declare_relation(other_element, side, side_other, perm);
                            skinned_elements.push_back(other_element);
                        }
                    }

                    create_remote_sides1(*this, m_bulk_data, remote_edges, skinned_elements, skin_parts, side_counts, shared_modified);
                }
            }
        }
    }
    stk::mesh::EntityVector deletedEntities;
    m_bulk_data.make_mesh_parallel_consistent_after_element_death(shared_modified, deletedEntities, *this, skinned_elements);
}

}} // end namespaces stk mesh

