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

# Utility rule file for Kokkos_all.

# Include the progress variables for this target.
include packages/kokkos/CMakeFiles/Kokkos_all.dir/progress.make

packages/kokkos/CMakeFiles/Kokkos_all: packages/kokkos/algorithms/src/libkokkosalgorithms.a
packages/kokkos/CMakeFiles/Kokkos_all: packages/kokkos/containers/src/libkokkoscontainers.a
packages/kokkos/CMakeFiles/Kokkos_all: packages/kokkos/core/src/libkokkoscore.a

Kokkos_all: packages/kokkos/CMakeFiles/Kokkos_all
Kokkos_all: packages/kokkos/CMakeFiles/Kokkos_all.dir/build.make
.PHONY : Kokkos_all

# Rule to build all files generated by this target.
packages/kokkos/CMakeFiles/Kokkos_all.dir/build: Kokkos_all
.PHONY : packages/kokkos/CMakeFiles/Kokkos_all.dir/build

packages/kokkos/CMakeFiles/Kokkos_all.dir/clean:
	cd /home/tomii/simenv/trilinos/build/packages/kokkos && $(CMAKE_COMMAND) -P CMakeFiles/Kokkos_all.dir/cmake_clean.cmake
.PHONY : packages/kokkos/CMakeFiles/Kokkos_all.dir/clean

packages/kokkos/CMakeFiles/Kokkos_all.dir/depend:
	cd /home/tomii/simenv/trilinos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tomii/simenv/trilinos /home/tomii/simenv/trilinos/packages/kokkos /home/tomii/simenv/trilinos/build /home/tomii/simenv/trilinos/build/packages/kokkos /home/tomii/simenv/trilinos/build/packages/kokkos/CMakeFiles/Kokkos_all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : packages/kokkos/CMakeFiles/Kokkos_all.dir/depend

