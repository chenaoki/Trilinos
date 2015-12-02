#ifndef STK_ELEM_ELEM_GRAPH_UPDATER_HPP
#define STK_ELEM_ELEM_GRAPH_UPDATER_HPP

#include <stddef.h>                     // for size_t
#include <stk_mesh/base/BulkData.hpp>   // for BulkData
#include <stk_mesh/base/ElemElemGraph.hpp>  // for ElemElemGraph
#include <stk_mesh/base/ElemElemGraphImpl.hpp>
#include <stk_mesh/base/ModificationObserver.hpp>
#include <stk_mesh/base/MetaData.hpp>   // for MetaData
#include <stk_topology/topology.hpp>    // for topology, etc
#include <stk_util/environment/ReportHandler.hpp>  // for ThrowRequire
#include <vector>                       // for allocator, vector
#include "stk_mesh/base/Bucket.hpp"     // for Bucket
#include "stk_mesh/base/BulkDataInlinedMethods.hpp"
#include "stk_mesh/base/Entity.hpp"     // for Entity
#include "stk_mesh/base/Selector.hpp"   // for Selector
#include "stk_mesh/base/Types.hpp"      // for EntityId, EntityVector

namespace stk { namespace mesh {

class ElemElemGraphUpdater : public stk::mesh::ModificationObserver
{
public:
    ElemElemGraphUpdater(stk::mesh::BulkData &bulk, stk::mesh::ElemElemGraph &elemGraph_)
    : bulkData(bulk), elemGraph(elemGraph_)
    {
    }

    virtual void entity_added(stk::mesh::Entity entity)
    {
        if(bulkData.entity_rank(entity) == stk::topology::ELEM_RANK)
        {
            elementsAdded.push_back(entity);
        }
    }

    virtual void entity_deleted(stk::mesh::Entity entity)
    {
        if(bulkData.entity_rank(entity) == stk::topology::ELEM_RANK && bulkData.bucket(entity).owned())
        {
            elementsDeleted.push_back({entity, bulkData.identifier(entity), bulkData.bucket(entity).topology().is_shell()});
        }
    }

    virtual void finished_modification_end_notification()
    {
        elemGraph.add_elements(elementsAdded);
        elementsAdded.clear();
    }

    virtual void started_modification_end_notification()
    {
        elemGraph.delete_elements(elementsDeleted);
        elementsDeleted.clear();
    }

    virtual void elements_about_to_move_procs_notification(const stk::mesh::EntityProcVec &elemProcPairsToMove)
    {
        elemGraph.create_parallel_graph_info_needed_once_entities_are_moved(elemProcPairsToMove, newParallelGraphEntries);
    }

    virtual void elements_moved_procs_notification(const stk::mesh::EntityProcVec &elemProcPairsToMove)
    {
        elemGraph.change_entity_owner(elemProcPairsToMove, newParallelGraphEntries);
        newParallelGraphEntries.clear();
    }
private:
    stk::mesh::BulkData &bulkData;
    stk::mesh::ElemElemGraph &elemGraph;
    stk::mesh::impl::ParallelGraphInfo newParallelGraphEntries;
    stk::mesh::EntityVector elementsAdded;
    stk::mesh::impl::DeletedElementInfoVector elementsDeleted;
};

}} // end stk mesh namespaces

#endif
