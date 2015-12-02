/* ***************************************************************** 
    MESQUITE -- The Mesh Quality Improvement Toolkit

    Copyright 2010 Sandia National Laboratories.  Developed at the
    University of Wisconsin--Madison under SNL contract number
    624796.  The U.S. Government and the University of Wisconsin
    retain certain rights to this software.

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License 
    (lgpl.txt) along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA

    (2010) kraftche@cae.wisc.edu    

  ***************************************************************** */


/** \file TMetric.cpp
 *  \brief 
 *  \author Jason Kraftcheck 
 */

#include "Mesquite.hpp"
#include "Mesquite_TMetricNonBarrier.hpp"
#include "Mesquite_MsqMatrix.hpp"
#include "Mesquite_MsqError.hpp"
#include <limits>

namespace MESQUITE_NS {

TMetricNonBarrier::~TMetricNonBarrier() {}

TMetricNonBarrier2D::~TMetricNonBarrier2D() {}
TMetricNonBarrier3D::~TMetricNonBarrier3D() {}

bool TMetricNonBarrier2D::evaluate( const MsqMatrix<3,3>&, double&, MsqError& err )
{
  MSQ_SETERR(err)("2D target metric cannot be evaluated for volume elements",
                  MsqError::UNSUPPORTED_ELEMENT);
  return false;
}

bool TMetricNonBarrier3D::evaluate( const MsqMatrix<2,2>&, double&, MsqError& err )
{
  MSQ_SETERR(err)("2D target metric cannot be evaluated for volume elements",
                  MsqError::UNSUPPORTED_ELEMENT);
  return false;
}


} // namespace Mesquite

