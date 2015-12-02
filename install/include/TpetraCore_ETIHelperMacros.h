#ifndef TPETRACORE_ETIHELPERMACROS_H
#define TPETRACORE_ETIHELPERMACROS_H

#include <Tpetra_ConfigDefs.hpp>

/* Tpetra provides official support for the following nodes */
#include <Kokkos_DefaultNode.hpp>

/* Tpetra provides official support for dd_real and qd_real */
#if defined(HAVE_TPETRA_QD)
#include <qd/qd_real.h>
#endif

#define TPETRA_INSTANTIATE_SLGN( INSTMACRO ) \
  TPETRA_INSTANTIATE_SLGN_NO_ORDINAL_SCALAR( INSTMACRO ) \
  TPETRA_INSTANTIATE_GLGN( INSTMACRO )

#define TPETRA_INSTANTIATE_VECTOR( INSTMACRO ) \
  TPETRA_INSTANTIATE_SLGN( INSTMACRO )

#define TPETRA_INSTANTIATE_GLGN(INSTMACRO)\
	INSTMACRO( int , int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( longlong , int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_GLG(INSTMACRO)\
	INSTMACRO( int , int , int )\
	INSTMACRO( longlong , int , longlong )


#define TPETRA_INSTANTIATE_PLGN(INSTMACRO)\
	INSTMACRO( int , int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( int , int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( longlong , int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( longlong , int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( double , int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( double , int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_LGN(INSTMACRO)\
	INSTMACRO( int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_SLG( INSTMACRO ) \
  TPETRA_INSTANTIATE_SLG_NO_ORDINAL_SCALAR( INSTMACRO ) \
  TPETRA_INSTANTIATE_GLG( INSTMACRO )

#define TPETRA_INSTANTIATE_LG(INSTMACRO)\
	INSTMACRO( int , int )\
	INSTMACRO( int , longlong )


#define TPETRA_INSTANTIATE_SL(INSTMACRO)\
	INSTMACRO( int , int )\
	INSTMACRO( longlong , int )\
	INSTMACRO( double , int )


#define TPETRA_INSTANTIATE_S(INSTMACRO)\
	INSTMACRO( int )\
	INSTMACRO( longlong )\
	INSTMACRO( double )


#define TPETRA_INSTANTIATE_L(INSTMACRO)\
	INSTMACRO( int )


#define TPETRA_INSTANTIATE_N(INSTMACRO)\
	INSTMACRO( Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_TSLGN(INSTMACRO)


#define TPETRA_INSTANTIATE_TSLG(INSTMACRO)


#define TPETRA_INSTANTIATE_CONVERT(INSTMACRO)


#define TPETRA_INSTANTIATE_CONVERT_SSL(INSTMACRO)


// FIXME (mfh 29 Sep 2015) This isn't actually no GPU!
#define TPETRA_INSTANTIATE_SLGN_NOGPU( INSTMACRO ) \
  TPETRA_INSTANTIATE_SLGN_NO_ORDINAL_SCALAR( INSTMACRO ) \
  TPETRA_INSTANTIATE_GLGN_NOGPU( INSTMACRO )

// FIXME (mfh 29 Sep 2015) This isn't actually no GPU!
#define TPETRA_INSTANTIATE_SLG_NOGPU( INSTMACRO ) \
  TPETRA_INSTANTIATE_SLG_NO_ORDINAL_SCALAR( INSTMACRO ) \
  TPETRA_INSTANTIATE_GLG_NOGPU( INSTMACRO )

#define TPETRA_INSTANTIATE_GLGN_NOGPU(INSTMACRO)\
	INSTMACRO( int , int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( longlong , int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_GLG_NOGPU(INSTMACRO)\
	INSTMACRO( int , int , int )\
	INSTMACRO( longlong , int , longlong )


#define TPETRA_INSTANTIATE_LGN_NOGPU(INSTMACRO)\
	INSTMACRO( int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_LG_NOGPU(INSTMACRO)\
	INSTMACRO( int , int )\
	INSTMACRO( int , longlong )


#define TPETRA_INSTANTIATE_SL_NOGPU(INSTMACRO)\
	INSTMACRO( int , int )\
	INSTMACRO( longlong , int )\
	INSTMACRO( double , int )


#define TPETRA_INSTANTIATE_S_NOGPU(INSTMACRO)\
	INSTMACRO( int )\
	INSTMACRO( longlong )\
	INSTMACRO( double )


#define TPETRA_INSTANTIATE_L_NOGPU(INSTMACRO)\
	INSTMACRO( int )


#define TPETRA_INSTANTIATE_N_NOGPU(INSTMACRO)\
	INSTMACRO( Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_TSLGN_NOGPU(INSTMACRO)


#define TPETRA_INSTANTIATE_TSLG_NOGPU(INSTMACRO)


#define TPETRA_INSTANTIATE_CONVERT_NOGPU(INSTMACRO)


#define TPETRA_INSTANTIATE_CONVERT_NOGPU_SSL(INSTMACRO)


#define TPETRA_INSTANTIATE_TESTMV( INSTMACRO ) \
  TPETRA_INSTANTIATE_SLGN_NO_ORDINAL_SCALAR( INSTMACRO )

// FIXME (mfh 29 Sep 2015) This doesn't actually exclude the GPU!
#define TPETRA_INSTANTIATE_TESTMV_NOGPU( INSTMACRO ) \
  TPETRA_INSTANTIATE_SLGN_NO_ORDINAL_SCALAR( INSTMACRO )

#define TPETRA_INSTANTIATE_DOUBLE_INT_INT_N(INSTMACRO)\
	INSTMACRO( double , int , int , Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_SLGN_NO_ORDINAL_SCALAR(INSTMACRO)\
	INSTMACRO( double , int , int , Kokkos_Compat_KokkosSerialWrapperNode )\
	INSTMACRO( double , int , longlong , Kokkos_Compat_KokkosSerialWrapperNode )


#define TPETRA_INSTANTIATE_SLG_NO_ORDINAL_SCALAR(INSTMACRO)\
	INSTMACRO( double , int , int )\
	INSTMACRO( double , int , longlong )


#define TPETRA_INSTANTIATE_SL_NO_ORDINAL_SCALAR(INSTMACRO)\
	INSTMACRO( double , int )


#define TPETRA_INSTANTIATE_S_NO_ORDINAL_SCALAR(INSTMACRO)\
	INSTMACRO( double )


#define TPETRA_ETI_MANGLING_TYPEDEFS()  \
	typedef Kokkos::Compat::KokkosSerialWrapperNode Kokkos_Compat_KokkosSerialWrapperNode; \
	typedef long long longlong;

#endif // TPETRACORE_ETIHELPERMACROS_H
