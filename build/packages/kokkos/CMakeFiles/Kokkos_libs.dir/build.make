# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/tomii/simenv/trilinos

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/tomii/simenv/trilinos/build

# Utility rule file for Kokkos_libs.

# Include the progress variables for this target.
include packages/kokkos/CMakeFiles/Kokkos_libs.dir/progress.make

packages/kokkos/CMakeFiles/Kokkos_libs: packages/kokkos/algorithms/src/libkokkosalgorithms.a
packages/kokkos/CMakeFiles/Kokkos_libs: packages/kokkos/containers/src/libkokkoscontainers.a
packages/kokkos/CMakeFiles/Kokkos_libs: packages/kokkos/core/src/libkokkoscore.a

Kokkos_libs: packages/kokkos/CMakeFiles/Kokkos_libs
Kokkos_libs: packages/kokkos/CMakeFiles/Kokkos_libs.dir/build.make
.PHONY : Kokkos_libs

# Rule to build all files generated by this target.
packages/kokkos/CMakeFiles/Kokkos_libs.dir/build: Kokkos_libs
.PHONY : packages/kokkos/CMakeFiles/Kokkos_libs.dir/build

packages/kokkos/CMakeFiles/Kokkos_libs.dir/clean:
	cd /home/tomii/simenv/trilinos/build/packages/kokkos && $(CMAKE_COMMAND) -P CMakeFiles/Kokkos_libs.dir/cmake_clean.cmake
.PHONY : packages/kokkos/CMakeFiles/Kokkos_libs.dir/clean

packages/kokkos/CMakeFiles/Kokkos_libs.dir/depend:
	cd /home/tomii/simenv/trilinos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tomii/simenv/trilinos /home/tomii/simenv/trilinos/packages/kokkos /home/tomii/simenv/trilinos/build /home/tomii/simenv/trilinos/build/packages/kokkos /home/tomii/simenv/trilinos/build/packages/kokkos/CMakeFiles/Kokkos_libs.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : packages/kokkos/CMakeFiles/Kokkos_libs.dir/depend

