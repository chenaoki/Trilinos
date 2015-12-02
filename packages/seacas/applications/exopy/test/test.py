#!/opt/local/bin/python
# Copyright (c) 2014, Sandia Corporation.
# Under the terms of Contract DE-AC04-94AL85000 with Sandia Corporation,
# the U.S. Government retains certain rights in this software.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
# 
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
# 
#     * Neither the name of Sandia Corporation nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 

import exopy

path = 'Cyl_Hex.exo'
#mode = int(0)
#comp_ws = int(0)
#io_ws = int(0)
(exoid,comp_ws,io_ws,version) = exopy.ex_open(path) #exopy.ex_open(path,mode,comp_ws,io_ws)
print "exoid = ", exoid
print "comp_ws =", comp_ws
print "io_ws =", io_ws
print "version =", version

(title,num_dim,num_node,num_elem,num_elem_blk,num_node_sets,num_side_sets) = exopy.ex_get_init(exoid)
print "title = ", title
print "num_dim = ", num_dim
print "num_node = ", num_node
print "num_elem = ", num_elem
print "num_elem_blk = ", num_elem_blk
print "num_node_sets = ", num_node_sets
print "num_side_sets = ", num_side_sets

error = exopy.ex_close(exoid)
print "ex_close() error = ", error

