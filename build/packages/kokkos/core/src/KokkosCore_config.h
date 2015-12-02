#ifndef KOKKOS_CORE_CONFIG_H
#define KOKKOS_CORE_CONFIG_H

/* The trivial 'src/build_common.sh' creates a config
 * that must stay in sync with this file.
 */
/* #undef KOKKOS_FOR_SIERRA */

#if !defined( KOKKOS_FOR_SIERRA )

#define KOKKOS_HAVE_MPI
/* #undef KOKKOS_HAVE_CUDA */

// mfh 16 Sep 2014: If passed in on the command line, that overrides
// any value of KOKKOS_USE_CUDA_UVM here.  Doing this should prevent build
// warnings like this one:
//
// packages/kokkos/core/src/KokkosCore_config.h:13:1: warning: "KOKKOS_USE_CUDA_UVM" redefined
//
// At some point, we should edit the test-build scripts in
// Trilinos/cmake/ctest/drivers/perseus/, and take
// -DKOKKOS_USE_CUDA_UVM from the command-line arguments there.  I
// hesitate to do that now, because I'm not sure if all the files are
// including KokkosCore_config.h (or a header file that includes it) like
// they should.

#if ! defined(KOKKOS_USE_CUDA_UVM)
/* #undef KOKKOS_USE_CUDA_UVM */
#endif // ! defined(KOKKOS_USE_CUDA_UVM)

#define KOKKOS_HAVE_PTHREAD
#define KOKKOS_HAVE_SERIAL
/* #undef KOKKOS_HAVE_QTHREAD */
/* #undef KOKKOS_HAVE_Winthread */
/* #undef KOKKOS_HAVE_OPENMP */
/* #undef KOKKOS_HAVE_HWLOC */
/* #undef KOKKOS_ENABLE_DEBUG_BOUNDS_CHECK */
#define KOKKOS_HAVE_CXX11
/* #undef KOKKOS_HAVE_CUSPARSE */
/* #undef KOKKOS_ENABLE_PROFILING_COLLECT_KERNEL_DATA */
/* #undef KOKKOS_ENABLE_PROFILING_AGGREGATE_MPI */

// Don't forbid users from defining this macro on the command line,
// but still make sure that CMake logic can control its definition.
#if ! defined(KOKKOS_HAVE_CXX11_DISPATCH_LAMBDA)
#define KOKKOS_HAVE_CXX11_DISPATCH_LAMBDA 1
#endif // KOKKOS_HAVE_CXX11_DISPATCH_LAMBDA

#endif // KOKKOS_FOR_SIERRA
#endif // KOKKOS_CORE_CONFIG_H
