#ifndef elementgraphtester_hpp
#define elementgraphtester_hpp

#include <stddef.h>                     // for size_t
#include <stk_mesh/base/BulkData.hpp>   // for BulkData
#include <stk_mesh/base/ElemElemGraph.hpp>  // for ElemElemGraph
#include <stk_mesh/base/ElemElemGraphImpl.hpp>
#include <stk_mesh/base/MetaData.hpp>   // for MetaData
#include <stk_topology/topology.hpp>    // for topology, etc
#include <stk_util/environment/ReportHandler.hpp>  // for ThrowRequire
#include <vector>                       // for allocator, vector
#include "stk_mesh/base/Bucket.hpp"     // for Bucket
#include "stk_mesh/base/BulkDataInlinedMethods.hpp"
#include "stk_mesh/base/Entity.hpp"     // for Entity
#include "stk_mesh/base/Selector.hpp"   // for Selector
#include "stk_mesh/base/Types.hpp"      // for EntityId, EntityVector
namespace stk { namespace mesh { class Part; } }








class ElemElemGraphTester : public stk::mesh::ElemElemGraph
{
public:
    ElemElemGraphTester(stk::mesh::BulkData& bulkData)
      : ElemElemGraph(bulkData, bulkData.mesh_meta_data().universal_part()) {};

    ElemElemGraphTester(stk::mesh::BulkData& bulkData, stk::mesh::Part &part)
      : ElemElemGraph(bulkData, part) {};

    virtual ~ElemElemGraphTester() {}

    void fill_graph() { ElemElemGraph::fill_graph(); }

    void fill_parallel_graph(stk::mesh::impl::ElemSideToProcAndFaceId& elem_side_comm) { ElemElemGraph::fill_parallel_graph(elem_side_comm); }

    stk::mesh::impl::ElementGraph & get_element_graph() { return m_elem_graph; }
    stk::mesh::impl::SidesForElementGraph & get_via_sides() { return m_via_sides; }
    stk::mesh::impl::ParallelGraphInfo & get_parallel_graph_info() { return m_parallel_graph_info; }
    stk::mesh::BulkData & get_bulk_data() { return m_bulk_data; }
    size_t get_graph_size() { return m_local_id_to_element_entity.size(); }

    int check_local_connectivity(stk::mesh::Entity elem1, stk::mesh::Entity elem2)
    {
        int side=-1;
        if (is_valid_graph_element(elem1) && is_valid_graph_element(elem2)) {
            side = get_side_from_element1_to_locally_owned_element2(elem1, elem2);
        }
        return side;
    }

    int check_remote_connectivity(stk::mesh::Entity elem, stk::mesh::EntityId other_elem_id)
    {
        int side=-1;
        if (is_valid_graph_element(elem)) {
            side = get_side_from_element1_to_remote_element2(elem, other_elem_id);
        }
        return side;
    }
    int check_connectivity(stk::mesh::EntityId elem1_id, stk::mesh::EntityId elem2_id)
    {
        int side = -1;
        stk::mesh::Entity elem1 = m_bulk_data.get_entity(stk::topology::ELEM_RANK, elem1_id);
        stk::mesh::Entity elem2 = m_bulk_data.get_entity(stk::topology::ELEM_RANK, elem2_id);
        bool isElem1Local = m_bulk_data.is_valid(elem1) && m_bulk_data.bucket(elem1).owned();
        bool isElem2Local = m_bulk_data.is_valid(elem2) && m_bulk_data.bucket(elem2).owned();

        ThrowRequire(isElem1Local);

        if(isElem2Local)
        {
            side = check_local_connectivity(elem1, elem2);
        }
        else
        {
            side = check_remote_connectivity(elem1, elem2_id);
        }

        return side;
    }

    std::vector<stk::mesh::EntityId> get_copy_of_all_ids() const
    {
        return m_suggested_side_ids;
    }
};

#endif
