# Install script for directory: /home/tomii/simenv/trilinos/packages/kokkos/core/src

# Set the install prefix
IF(NOT DEFINED CMAKE_INSTALL_PREFIX)
  SET(CMAKE_INSTALL_PREFIX "../install")
ENDIF(NOT DEFINED CMAKE_INSTALL_PREFIX)
STRING(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
IF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  IF(BUILD_TYPE)
    STRING(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  ELSE(BUILD_TYPE)
    SET(CMAKE_INSTALL_CONFIG_NAME "RELEASE")
  ENDIF(BUILD_TYPE)
  MESSAGE(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
ENDIF(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)

# Set the component getting installed.
IF(NOT CMAKE_INSTALL_COMPONENT)
  IF(COMPONENT)
    MESSAGE(STATUS "Install component: \"${COMPONENT}\"")
    SET(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  ELSE(COMPONENT)
    SET(CMAKE_INSTALL_COMPONENT)
  ENDIF(COMPONENT)
ENDIF(NOT CMAKE_INSTALL_COMPONENT)

# Install shared libraries without execute permission?
IF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  SET(CMAKE_INSTALL_SO_NO_EXE "1")
ENDIF(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../install/include/impl" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Compare_Exchange_Strong.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/KokkosExp_ViewArray.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Synchronic.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_spinwait.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Traits.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_StaticAssert.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/KokkosExp_SharedAlloc.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_ViewTileLeft.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_AllocationTracker.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Tags.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Serial_TaskPolicy.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_PhysicalLayout.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Singleton.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Exchange.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_ViewDefault.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Fetch_Sub.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Fetch_Or.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/KokkosExp_ViewMapping.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Profiling_DeviceInfo.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Memory_Fence.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Synchronic_Config.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Assembly_X86.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Generic.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Windows.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_ViewOffset.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_BasicAllocators.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_FunctorAdapter.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Fetch_Add.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/KokkosExp_ViewAllocProp.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Synchronic_n3998.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_ViewSupport.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_AnalyzeShape.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_HBWAllocators.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Profiling_Interface.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Volatile_Load.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/KokkosExp_ViewTile.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_Fetch_And.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Shape.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Timer.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Error.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/impl/Kokkos_Atomic_View.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../install/include/Threads" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Threads/Kokkos_ThreadsExec.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Threads/Kokkos_Threads_TaskPolicy.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Threads/Kokkos_ThreadsTeam.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Threads/Kokkos_Threads_Parallel.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../install/include/OpenMP" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/OpenMP/Kokkos_OpenMPexec.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/OpenMP/Kokkos_OpenMP_Parallel.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../install/include/Cuda" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_Internal.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/KokkosExp_Cuda_View.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_Parallel.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_Vectorization.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_View.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_ReduceScan.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_BasicAllocators.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_abort.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_Error.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_CudaExec.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Cuda/Kokkos_Cuda_Alloc.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/../install/include/Qthread" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Qthread/Kokkos_QthreadExec.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Qthread/Kokkos_Qthread_TaskPolicy.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Qthread/Kokkos_Qthread_Parallel.hpp"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosCore")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/home/tomii/simenv/trilinos/build/packages/kokkos/core/src/libkokkoscore.a")
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosCore")

IF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosCore")
  FILE(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Qthread.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_HostSpace.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Atomic.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Core.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Complex.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_CudaSpace.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_View.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Serial.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_ExecPolicy.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_ScratchSpace.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/KokkosExp_View.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Macros.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_OpenMP.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Pair.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Cuda.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Core_fwd.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Array.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_HBWSpace.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_TaskPolicy.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_MemoryTraits.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_hwloc.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Layout.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Vectorization.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Parallel.hpp"
    "/home/tomii/simenv/trilinos/packages/kokkos/core/src/Kokkos_Threads.hpp"
    "/home/tomii/simenv/trilinos/build/packages/kokkos/core/src/KokkosCore_config.h"
    )
ENDIF(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "KokkosCore")

