/* ***************************************************************** 
    MESQUITE -- The Mesh Quality Improvement Toolkit

    Copyright 2006 Sandia National Laboratories.  Developed at the
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


/** \file AWShape2DNB2.hpp
 *  \brief 
 *  \author Jason Kraftcheck 
 */

#ifndef MSQ_AW_SHAPE_2D_NB_2_HPP
#define MSQ_AW_SHAPE_2D_NB_2_HPP

#include "Mesquite.hpp"
#include "Mesquite_AWMetricNonBarrier.hpp"

namespace MESQUITE_NS {


/** \f$ |A(adj \, W) - [W ( adj\, A )]^t|^2 \f$ */
class AWShape2DNB2 : public AWMetricNonBarrier2D
{
  public:

  MESQUITE_EXPORT virtual
  ~AWShape2DNB2();

  MESQUITE_EXPORT virtual
  std::string get_name() const;

  MESQUITE_EXPORT virtual
  bool evaluate( const MsqMatrix<2,2>& A, 
                 const MsqMatrix<2,2>& W, 
                 double& result, MsqError& err );

  MESQUITE_EXPORT virtual
  bool evaluate_with_grad( const MsqMatrix<2,2>& A,
                           const MsqMatrix<2,2>& W,
                           double& result,
                           MsqMatrix<2,2>& deriv_wrt_A,
                           MsqError& err );
/*
  MESQUITE_EXPORT virtual
  bool evaluate_with_hess( const MsqMatrix<2,2>& A,
                           const MsqMatrix<2,2>& W,
                           double& result,
                           MsqMatrix<2,2>& deriv_wrt_A,
                           MsqMatrix<2,2> second_wrt_A[3],
                           MsqError& err );
*/
};



} // namespace Mesquite

#endif
