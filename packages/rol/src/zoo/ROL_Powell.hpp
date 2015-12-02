// @HEADER
// ************************************************************************
//
//               Rapid Optimization Library (ROL) Package
//                 Copyright (2014) Sandia Corporation
//
// Under terms of Contract DE-AC04-94AL85000, there is a non-exclusive
// license for use of this work by or on behalf of the U.S. Government.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
// 1. Redistributions of source code must retain the above copyright
// notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// 3. Neither the name of the Corporation nor the names of the
// contributors may be used to endorse or promote products derived from
// this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY SANDIA CORPORATION "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SANDIA CORPORATION OR THE
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Questions? Contact lead developers:
//              Drew Kouri   (dpkouri@sandia.gov) and
//              Denis Ridzal (dridzal@sandia.gov)
//
// ************************************************************************
// @HEADER

/** \file
    \brief  Contains definitions for Powell's badly scaled function.
    \author Created by D. Ridzal and D. Kouri.
 */

#ifndef USE_HESSVEC 
#define USE_HESSVEC 1
#endif

#ifndef ROL_POWELL_HPP
#define ROL_POWELL_HPP

#include "ROL_StdVector.hpp"
#include "ROL_Objective.hpp"

namespace ROL {
namespace ZOO {

  /** \brief Powell's badly scaled function.
   */
  template<class Real>
  class Objective_Powell : public Objective<Real> {

    typedef std::vector<Real>  vector;
    typedef Vector<Real>       V;
    typedef StdVector<Real>    SV;  

  private:  

    Teuchos::RCP<const vector> getVector( const V& x ) {
      using Teuchos::dyn_cast;
      return dyn_cast<const SV>(x).getVector();
    }

    Teuchos::RCP<vector> getVector( V& x ) {
      using Teuchos::dyn_cast;
      return dyn_cast<SV>(x).getVector();
    }  

  public:
    Objective_Powell() {}

    Real value( const Vector<Real> &x, Real &tol ) {

      using Teuchos::RCP;
      RCP<const vector> xp = getVector(x);

      Real f1 = 1.e4*(*xp)[0]*(*xp)[1] - 1.0;
      Real f2 = std::exp(-(*xp)[0]) + std::exp(-(*xp)[1]) - 1.0001;

      return f1*f1+f2*f2;
    }

    void gradient( Vector<Real> &g, const Vector<Real> &x, Real &tol ) {

      using Teuchos::RCP;
      RCP<const vector> xp = getVector(x);
      RCP<vector> gp = getVector(g);

      Real f1 = 1.e4*(*xp)[0]*(*xp)[1] - 1.0;
      Real f2 = std::exp(-(*xp)[0]) + std::exp(-(*xp)[1]) - 1.0001;

      Real f11 = 1.e4*(*xp)[1];
      Real f12 = 1.e4*(*xp)[0];
      Real f21 = -std::exp(-(*xp)[0]);
      Real f22 = -std::exp(-(*xp)[1]);

      (*gp)[0] = 2.0*(f11*f1 + f21*f2);
      (*gp)[1] = 2.0*(f12*f1 + f22*f2);
    }
#if USE_HESSVEC
    void hessVec( Vector<Real> &hv, const Vector<Real> &v, const Vector<Real> &x, Real &tol ) {

      using Teuchos::RCP;
      RCP<const vector> xp = getVector(x);
      RCP<const vector> vp = getVector(v);
      RCP<vector> hvp = getVector(hv);

      Real f1 = 1.e4*(*xp)[0]*(*xp)[1] - 1.0;
      Real f2 = std::exp(-(*xp)[0]) + std::exp(-(*xp)[1]) - 1.0001;

      Real f11 = 1.e4*(*xp)[1];
      Real f12 = 1.e4*(*xp)[0];
      Real f21 = -std::exp(-(*xp)[0]);
      Real f22 = -std::exp(-(*xp)[1]);

      Real f111 = 0.0;
      Real f112 = 1.e4;
      Real f121 = 1.e4;
      Real f122 = 0.0;
      Real f211 = std::exp(-(*xp)[0]);
      Real f212 = 0.0;
      Real f221 = 0.0;
      Real f222 = std::exp(-(*xp)[1]);

      Real h11 = 2.0*(f111*f1 + f11*f11) + 2.0*(f211*f2 + f21*f21);
      Real h12 = 2.0*(f112*f1 + f11*f12) + 2.0*(f212*f2 + f21*f22);
      Real h21 = 2.0*(f121*f1 + f21*f11) + 2.0*(f221*f2 + f22*f21);
      Real h22 = 2.0*(f122*f1 + f12*f12) + 2.0*(f222*f2 + f22*f22);

      (*hvp)[0] = h11*(*vp)[0] + h12*(*vp)[1];
      (*hvp)[1] = h21*(*vp)[0] + h22*(*vp)[1];
    }
#endif
    void invHessVec( Vector<Real> &hv, const Vector<Real> &v, const Vector<Real> &x, Real &tol ) {

      using Teuchos::RCP;
      RCP<const vector> xp = getVector(x);
      RCP<const vector> vp = getVector(v);
      RCP<vector> hvp = getVector(hv);

      Real f1 = 1.e4*(*xp)[0]*(*xp)[1] - 1.0;
      Real f2 = std::exp(-(*xp)[0]) + std::exp(-(*xp)[1]) - 1.0001;

      Real f11 = 1.e4*(*xp)[1];
      Real f12 = 1.e4*(*xp)[0];
      Real f21 = -std::exp(-(*xp)[0]);
      Real f22 = -std::exp(-(*xp)[1]);

      Real f111 = 0.0;
      Real f112 = 1.e4;
      Real f121 = 1.e4;
      Real f122 = 0.0;
      Real f211 = std::exp(-(*xp)[0]);
      Real f212 = 0.0;
      Real f221 = 0.0;
      Real f222 = std::exp(-(*xp)[1]);

      Real h11 = 2.0*(f111*f1 + f11*f11) + 2.0*(f211*f2 + f21*f21);
      Real h12 = 2.0*(f112*f1 + f11*f12) + 2.0*(f212*f2 + f21*f22);
      Real h21 = 2.0*(f121*f1 + f21*f11) + 2.0*(f221*f2 + f22*f21);
      Real h22 = 2.0*(f122*f1 + f12*f12) + 2.0*(f222*f2 + f22*f22);

      (*hvp)[0] = (1.0/(h11*h22-h12*h21))*( h22*(*vp)[0] - h21*(*vp)[1]);
      (*hvp)[1] = (1.0/(h11*h22-h12*h21))*(-h12*(*vp)[0] + h11*(*vp)[1]);
    }
  };

  template<class Real>
  void getPowell( Teuchos::RCP<Objective<Real> > &obj, Vector<Real> &x0, Vector<Real> &x ) {

    typedef std::vector<Real> vector;
    typedef StdVector<Real>   SV;

    typedef typename vector::size_type uint;

    using Teuchos::RCP;
    using Teuchos::rcp;
    using Teuchos::dyn_cast;

    // Cast Initial Guess and Solution Vectors
    RCP<vector> x0p = dyn_cast<SV>(x0).getVector();
    RCP<vector> xp  = dyn_cast<SV>(x).getVector();

    uint n = xp->size();
    // Resize Vectors
    n = 2;
    x0p->resize(n);
    xp->resize(n);
    // Instantiate Objective Function
    obj = Teuchos::rcp( new Objective_Powell<Real> );
    // Get Initial Guess
    (*x0p)[0] = 0.0;
    (*x0p)[1] = 1.0;
    // Get Solution
    //(*xp)[0] = 1.0981770261368074e-05;
    (*xp)[0] = 1.098e-05;
    (*xp)[1] = 9.106;
  }

} // End ZOO Namespace
} // End ROL Namespace

#endif
