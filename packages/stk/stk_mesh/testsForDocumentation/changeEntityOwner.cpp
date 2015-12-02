// Copyright (c) 2013, Sandia Corporation.
// Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
// the U.S. Government retains certain rights in this software.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
// 
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
// 
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
// 
//     * Neither the name of Sandia Corporation nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
// 
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 

#include <gtest/gtest.h>                // for AssertHelper, EXPECT_EQ, etc
#include <stddef.h>                     // for size_t
#include <sstream>                      // for ostringstream, etc
#include <stk_io/StkMeshIoBroker.hpp>   // for StkMeshIoBroker
#include <stk_mesh/base/BulkData.hpp>   // for BulkData
#include <stk_mesh/base/MetaData.hpp>   // for MetaData
#include <stk_topology/topology.hpp>    // for topology, etc
#include <string>                       // for string
#include "stk_io/DatabasePurpose.hpp"   // for DatabasePurpose::READ_MESH
#include "stk_mesh/base/Types.hpp"      // for BucketVector, PartVector
namespace stk { namespace mesh { class Part; } }

namespace
{
//BEGIN
TEST(StkMeshHowTo, changeEntityOwner)
{
    MPI_Comm communicator = MPI_COMM_WORLD;
    if (stk::parallel_machine_size(communicator) != 2) { return; }
    stk::io::StkMeshIoBroker meshReader(communicator);
    const std::string generatedMeshSpecification = "generated:2x2x4"; // syntax creates a 2x2x4 'bar' of hex-8 elements
    meshReader.add_mesh_database(generatedMeshSpecification, stk::io::READ_MESH);
    meshReader.create_input_mesh();
    meshReader.populate_bulk_data();

    stk::mesh::BulkData &stkMeshBulkData = meshReader.bulk_data();

    int myProc = stkMeshBulkData.parallel_rank();
    int otherProc = 1;
    if (myProc == 1) otherProc = 0;

    //element 5 should be on proc 0, but next to the proc-boundary with proc 1
    stk::mesh::EntityId id = 5;
    stk::mesh::Entity elem5 = stkMeshBulkData.get_entity(stk::topology::ELEM_RANK, id);
    //element 5 should be valid on both proc 0 (owner) and proc 1 (as aura/ghost)
    EXPECT_TRUE(stkMeshBulkData.is_valid(elem5));
    EXPECT_EQ(0, stkMeshBulkData.parallel_owner_rank(elem5));

    std::vector<std::pair<stk::mesh::Entity, int> > elemProcPairs;
    if (myProc == 0) {
      elemProcPairs.push_back(std::make_pair(elem5, otherProc));
    }

    stkMeshBulkData.change_entity_owner(elemProcPairs);

    //now we have moved ownership of elem5 from proc 0 to proc 1. It should still be
    //valid on both procs but should now be owned on proc 1.
    elem5 = stkMeshBulkData.get_entity(stk::topology::ELEM_RANK, id);
    EXPECT_TRUE(stkMeshBulkData.is_valid(elem5));
    EXPECT_EQ(1, stkMeshBulkData.parallel_owner_rank(elem5));
}
//END
}
