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

#include "Teuchos_ParameterList.hpp"
#include "Teuchos_XMLParameterListHelpers.hpp"
#include "Teuchos_oblackholestream.hpp"

#ifdef HAVE_MPI
#include "Epetra_MpiComm.h"
#else
#include "Epetra_SerialComm.h"
#endif

#include "ROL_StdVector.hpp"
#include "ROL_StdBoundConstraint.hpp"
#include "ROL_Types.hpp"
#include "ROL_Algorithm.hpp"
#include "ROL_TrustRegionStep.hpp"
#include "ROL_StatusTest.hpp"

#include "ROL_CVaRVector.hpp"
#include "ROL_CVaRBoundConstraint.hpp"
#include "ROL_ParametrizedObjective.hpp"
#include "ROL_MonteCarloGenerator.hpp"
#include "ROL_AbsoluteValue.hpp"
#include "ROL_PlusFunction.hpp"
#include "ROL_RiskMeasure.hpp"
#include "ROL_MeanDeviation.hpp"
#include "ROL_MeanVariance.hpp"
#include "ROL_MeanDeviationFromTarget.hpp"
#include "ROL_MeanVarianceFromTarget.hpp"
#include "ROL_CVaR.hpp"
#include "ROL_CVaRQuadrangle.hpp"
#include "ROL_ExpUtility.hpp"
#include "ROL_RiskAverseObjective.hpp"
#include "ROL_RiskNeutralObjective.hpp"
#include "ROL_StdEpetraBatchManager.hpp"
#include "ROL_DistributionFactory.hpp"

template<class Real> 
class ParametrizedObjectiveEx1 : public ROL::ParametrizedObjective<Real> {
private:
  Real alpha_; 

public:
  ParametrizedObjectiveEx1(Real alpha = 1.e1) : alpha_(alpha) {}

  Real value( const ROL::Vector<Real> &x, Real &tol ) {
    Teuchos::RCP<const std::vector<Real> > ex = 
      (Teuchos::dyn_cast<ROL::StdVector<Real> >(const_cast<ROL::Vector<Real> &>(x))).getVector();
    Real ip  = 0.0;
    Real pen = 0.0; 
    for ( unsigned i = 0; i < ex->size(); i++ ) {
      ip  += (*ex)[i]*(this->getParameter())[i];
      pen += (*ex)[i]; 
    }
    return ip + alpha_*0.5*std::pow(pen-1.0,2.0);
  }

  void gradient( ROL::Vector<Real> &g, const ROL::Vector<Real> &x, Real &tol ) {
    Teuchos::RCP<const std::vector<Real> > ex = 
      (Teuchos::dyn_cast<ROL::StdVector<Real> >(const_cast<ROL::Vector<Real> &>(x))).getVector();
    Teuchos::RCP<std::vector<Real> > eg =
      Teuchos::rcp_const_cast<std::vector<Real> >((Teuchos::dyn_cast<ROL::StdVector<Real> >(g)).getVector());
    Real pen = 0.0;
    for ( unsigned i = 0; i < ex->size(); i++ ) {
      pen += (*ex)[i];
    }
    for ( unsigned i = 0; i < ex->size(); i++ ) {
      (*eg)[i] = (this->getParameter())[i] + alpha_*(pen-1.0);
    } 
  }

  void hessVec( ROL::Vector<Real> &hv, const ROL::Vector<Real> &v, const ROL::Vector<Real> &x, Real &tol ) {
    Teuchos::RCP<const std::vector<Real> > ex = 
      (Teuchos::dyn_cast<ROL::StdVector<Real> >(const_cast<ROL::Vector<Real> &>(x))).getVector();
    Teuchos::RCP<const std::vector<Real> > ev = 
      (Teuchos::dyn_cast<ROL::StdVector<Real> >(const_cast<ROL::Vector<Real> &>(v))).getVector();
    Teuchos::RCP<std::vector<Real> > ehv =
      Teuchos::rcp_const_cast<std::vector<Real> >((Teuchos::dyn_cast<ROL::StdVector<Real> >(hv)).getVector());
    Real pen = 0.0;
    for ( unsigned i = 0; i < ex->size(); i++ ) {
      pen += (*ev)[i];
    }
    for ( unsigned i = 0; i < ex->size(); i++ ) {
      (*ehv)[i] = alpha_*pen; 
    } 
  }
};


template<class Real>
Real random(const Teuchos::RCP<Epetra_Comm> &comm) {
  Real val = 0.0;
  if ( comm->MyPID()==0 ) {
    val = (Real)rand()/(Real)RAND_MAX;
  }
  comm->Broadcast(&val,1,0);
  return val;
}

int main(int argc, char* argv[]) {
  Teuchos::RCP<Epetra_Comm> comm;
#ifdef HAVE_MPI
  Teuchos::GlobalMPISession mpiSession(&argc, &argv,0);
  comm = Teuchos::rcp(new Epetra_MpiComm(MPI_COMM_WORLD));
#else
  comm = Teuchos::rcp(new Epetra_SerialComm());
#endif

  // This little trick lets us print to std::cout only if a (dummy) command-line argument is provided.
  int iprint     = argc - 1;
  Teuchos::RCP<std::ostream> outStream;
  Teuchos::oblackholestream bhs; // outputs nothing
  if (iprint > 0 && comm->MyPID()==0)
    outStream = Teuchos::rcp(&std::cout, false);
  else
    outStream = Teuchos::rcp(&bhs, false);

  int errorFlag  = 0;

  try {
    /**********************************************************************************************/
    /************************* CONSTRUCT ROL ALGORITHM ********************************************/
    /**********************************************************************************************/
    // Get ROL parameterlist
    std::string filename = "input.xml";
    Teuchos::RCP<Teuchos::ParameterList> parlist = Teuchos::rcp( new Teuchos::ParameterList() );
    Teuchos::updateParametersFromXmlFile( filename, parlist.ptr() );
    // Build ROL algorithm
    Teuchos::RCP<ROL::StatusTest<double> > status = Teuchos::rcp(new ROL::StatusTest<double>(*parlist));
    Teuchos::RCP<ROL::Step<double> > step;
    Teuchos::RCP<ROL::Algorithm<double> > algo;
    /**********************************************************************************************/
    /************************* CONSTRUCT SOL COMPONENTS *******************************************/
    /**********************************************************************************************/
    // Build vectors
    unsigned dim = 4;
    Teuchos::RCP<std::vector<double> > x_rcp  = Teuchos::rcp( new std::vector<double>(dim,0.0) );
    ROL::StdVector<double> x(x_rcp);
    Teuchos::RCP<std::vector<double> > x0_rcp = Teuchos::rcp( new std::vector<double>(dim,0.0) );
    ROL::StdVector<double> x0(x0_rcp);
    Teuchos::RCP<std::vector<double> > xr_rcp = Teuchos::rcp( new std::vector<double>(dim,0.0) );
    ROL::StdVector<double> xr(xr_rcp);
    Teuchos::RCP<std::vector<double> > d_rcp  = Teuchos::rcp( new std::vector<double>(dim,0.0) );
    ROL::StdVector<double> d(d_rcp);
    for ( unsigned i = 0; i < dim; i++ ) {
      (*x0_rcp)[i] = 1.0/(double)dim;
      (*xr_rcp)[i] = random<double>(comm);
      (*d_rcp)[i]  = random<double>(comm);
    }
    // Build samplers
    int nSamp = 1000;
    std::vector<std::vector<double> > bounds(dim);
    std::vector<double> tmp(2,0.0);
    double inc = 0.125;
    double val = -0.5;
    for (unsigned i = 0; i < dim; i++) {
      tmp[0] = val-inc; tmp[1] = val+inc;
      bounds[i] = tmp;
      inc *= 2.0;
    }
    Teuchos::RCP<ROL::BatchManager<double> > bman =
      Teuchos::rcp(new ROL::StdEpetraBatchManager<double>(comm));
    Teuchos::RCP<ROL::SampleGenerator<double> > sampler =
      Teuchos::rcp(new ROL::MonteCarloGenerator<double>(nSamp,bounds,bman,false,false,100));
    // Build risk-averse objective function
    bool storage = true;
    Teuchos::RCP<ROL::ParametrizedObjective<double> > pObj =
      Teuchos::rcp(new ParametrizedObjectiveEx1<double>(1.e1));
    Teuchos::RCP<ROL::RiskMeasure<double> > rm;
    Teuchos::RCP<ROL::Objective<double> > obj;
    // Build bound constraints
    std::vector<double> l(dim,0.0);
    std::vector<double> u(dim,1.0);
    Teuchos::RCP<ROL::BoundConstraint<double> > con = 
      Teuchos::rcp( new ROL::StdBoundConstraint<double>(l,u) );
    // Test parametrized objective functions
    *outStream << "Check Derivatives of Parametrized Objective Function\n";
    x.set(xr);
    pObj->setParameter(sampler->getMyPoint(0));
    pObj->checkGradient(x,d,true,*outStream);
    pObj->checkHessVec(x,d,true,*outStream);
    /**********************************************************************************************/
    /************************* RISK NEUTRAL *******************************************************/
    /**********************************************************************************************/
    *outStream << "\nRISK NEUTRAL\n";
    rm  = Teuchos::rcp( new ROL::RiskMeasure<double>() );
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    clock_t start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* RISK NEUTRAL *******************************************************/
    /**********************************************************************************************/
    *outStream << "\nRISK NEUTRAL\n";
    obj = Teuchos::rcp( new ROL::RiskNeutralObjective<double>(pObj,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS DEVIATION ************************************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS DEVIATION\n";
    // Absolute value approximation
    double gamma = 0.0;
    ROL::EAbsoluteValue eav = ROL::ABSOLUTEVALUE_C2;
    Teuchos::RCP<ROL::PositiveFunction<double> > pf = Teuchos::rcp( new ROL::AbsoluteValue<double>(gamma,eav) );
    // Moment vector
    std::vector<double> order(2,0.0); order[0] = 2.0; order[1] = 4.0;
    // Moment coefficients
    std::vector<double> coeff(2,0.1);
    rm  = Teuchos::rcp( new ROL::MeanDeviation<double>(order,coeff,pf) );
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS VARIANCE *************************************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS VARIANCE\n";
    rm  = Teuchos::rcp( new ROL::MeanVariance<double>(order,coeff,pf) );
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS DEVIATION FROM TARGET ************************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS DEVIATION FROM TARGET\n";
    // Moment targets
    std::vector<double> target(2,-0.1);
    // Risk measure
    rm  = Teuchos::rcp( new ROL::MeanDeviationFromTarget<double>(target,order,coeff,pf) );
    // Risk averse objective
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS VARIANCE FROM TARGET *************************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS VARIANCE FROM TARGET\n";
    // Risk measure
    coeff[1] = 0.0;
    rm  = Teuchos::rcp( new ROL::MeanVarianceFromTarget<double>(target,order,coeff,pf) );
    coeff[1] = 0.1;
    // Risk averse objective
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS SEMIDEVIATION ********************************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS SEMIDEVIATION\n";
    // Plus function approximation
    gamma = 1.e2;
    Teuchos::ParameterList distList;
    distList.sublist("SOL").sublist("Distribution").set("Name","Parabolic");
    distList.sublist("SOL").sublist("Distribution").sublist("Parabolic").set("Lower Bound",-0.5);
    distList.sublist("SOL").sublist("Distribution").sublist("Parabolic").set("Upper Bound", 0.5);
    Teuchos::RCP<ROL::Distribution<double> > dist2 = ROL::DistributionFactory<double>(distList);
    Teuchos::RCP<ROL::PlusFunction<double> > plusf =
      Teuchos::rcp(new ROL::PlusFunction<double>(dist2,1.0/gamma));
    pf = Teuchos::rcp(new ROL::PlusFunction<double>(dist2,1.0/gamma));
    // Risk measure
    rm  = Teuchos::rcp( new ROL::MeanDeviation<double>(order,coeff,pf) );
    // Risk averse objective
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS SEMIVARIANCE *********************************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS SEMIVARIANCE\n";
    // Risk measure
    rm  = Teuchos::rcp( new ROL::MeanVariance<double>(order,coeff,pf) );
    // Risk averse objective
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS SEMIDEVIATION FROM TARGET ********************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS SEMIDEVIATION FROM TARGET\n";
    // Risk measure
    rm  = Teuchos::rcp( new ROL::MeanDeviationFromTarget<double>(target,order,coeff,pf) );
    // Risk averse objective
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS SEMIVARIANCE FROM TARGET *********************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS SEMIVARIANCE FROM TARGET\n";
    // Risk measure
    rm  = Teuchos::rcp( new ROL::MeanVarianceFromTarget<double>(target,order,coeff,pf) );
    // Risk averse objective
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* MEAN PLUS CVAR *****************************************************/
    /**********************************************************************************************/
    *outStream << "\nMEAN PLUS CONDITIONAL VALUE AT RISK\n";
    double prob = 0.8;
    double c = 0.8;
    rm  = Teuchos::rcp( new ROL::CVaR<double>(prob,c,plusf) );
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    Teuchos::RCP<ROL::BoundConstraint<double> > CVaRcon = 
      Teuchos::rcp( new ROL::CVaRBoundConstraint<double>(con) );
    // Test objective functions
    double xv = 10.0*random<double>(comm)-5.0;
    double dv = 10.0*random<double>(comm)-5.0;
    Teuchos::RCP<ROL::Vector<double> > xp = Teuchos::rcp(&x,false);
    Teuchos::RCP<ROL::Vector<double> > dp = Teuchos::rcp(&d,false);
    ROL::CVaRVector<double> xc(xv,xp);
    ROL::CVaRVector<double> dc(dv,dp);
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(xc,dc,true,*outStream);
    obj->checkHessVec(xc,dc,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(xc,*obj,*CVaRcon,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "t = " << xc.getVaR() << "\n";
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* SMOOTHED CVAR QUADRANGLE *******************************************/
    /**********************************************************************************************/
    *outStream << "\nSMOOTHED CONDITIONAL VALUE AT RISK \n";
    prob = 0.9;
    ROL::CVaRQuadrangle<double> scq(prob,1.0/gamma,plusf);
    //scq.checkRegret();
    rm  = Teuchos::rcp(&scq,false);
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    xv = 10.0*random<double>(comm)-5.0;
    dv = 10.0*random<double>(comm)-5.0;
    xp = Teuchos::rcp(&x,false);
    dp = Teuchos::rcp(&d,false);
    ROL::CVaRVector<double> xq(xv,xp);
    ROL::CVaRVector<double> dq(dv,dp);
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(xr);
    obj->checkGradient(xq,dq,true,*outStream);
    obj->checkHessVec(xq,dq,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(xq,*obj,*CVaRcon,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "t = " << xq.getVaR() << "\n";
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
    /**********************************************************************************************/
    /************************* EXPONENTIAL UTILITY FUNCTION ***************************************/
    /**********************************************************************************************/
    *outStream << "\nEXPONENTIAL UTILITY FUNCTION\n";
    rm  = Teuchos::rcp( new ROL::ExpUtility<double> );
    obj = Teuchos::rcp( new ROL::RiskAverseObjective<double>(pObj,rm,sampler,storage) );
    // Test objective functions
    *outStream << "\nCheck Derivatives of Risk-Averse Objective Function\n";
    x.set(x0);
    obj->checkGradient(x,d,true,*outStream);
    obj->checkHessVec(x,d,true,*outStream);
    // Run ROL algorithm
    step = Teuchos::rcp( new ROL::TrustRegionStep<double>(*parlist) );
    algo = Teuchos::rcp( new ROL::Algorithm<double>(step,status,false) );
    x.set(x0);
    start = clock();
    algo->run(x,*obj,*con,true,*outStream);
    *outStream << "Optimization time: " << (double)(clock()-start)/(double)CLOCKS_PER_SEC << " seconds.\n";
    // Print Solution
    *outStream << "x = (";
    for ( unsigned i = 0; i < dim-1; i++ ) {
      *outStream << (*x_rcp)[i] << ", ";
    }
    *outStream << (*x_rcp)[dim-1] << ")\n";
  }
  catch (std::logic_error err) {
    *outStream << err.what() << "\n";
    errorFlag = -1000;
  }; // end try

  if (errorFlag != 0)
    std::cout << "End Result: TEST FAILED\n";
  else
    std::cout << "End Result: TEST PASSED\n";

  return 0;
}
