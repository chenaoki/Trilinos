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

# Utility rule file for Tpetra_all.

# Include the progress variables for this target.
include packages/tpetra/CMakeFiles/Tpetra_all.dir/progress.make

packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/core/ext/libtpetraext.a
packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/core/inout/libtpetrainout.a
packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/core/src/libtpetra.a
packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/tsqr/src/libkokkostsqr.a
packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/kernels/src/libtpetrakernels.a
packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/classic/LinAlg/libtpetraclassiclinalg.a
packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/classic/NodeAPI/libtpetraclassicnodeapi.a
packages/tpetra/CMakeFiles/Tpetra_all: packages/tpetra/classic/src/libtpetraclassic.a

Tpetra_all: packages/tpetra/CMakeFiles/Tpetra_all
Tpetra_all: packages/tpetra/CMakeFiles/Tpetra_all.dir/build.make
.PHONY : Tpetra_all

# Rule to build all files generated by this target.
packages/tpetra/CMakeFiles/Tpetra_all.dir/build: Tpetra_all
.PHONY : packages/tpetra/CMakeFiles/Tpetra_all.dir/build

packages/tpetra/CMakeFiles/Tpetra_all.dir/clean:
	cd /home/tomii/simenv/trilinos/build/packages/tpetra && $(CMAKE_COMMAND) -P CMakeFiles/Tpetra_all.dir/cmake_clean.cmake
.PHONY : packages/tpetra/CMakeFiles/Tpetra_all.dir/clean

packages/tpetra/CMakeFiles/Tpetra_all.dir/depend:
	cd /home/tomii/simenv/trilinos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tomii/simenv/trilinos /home/tomii/simenv/trilinos/packages/tpetra /home/tomii/simenv/trilinos/build /home/tomii/simenv/trilinos/build/packages/tpetra /home/tomii/simenv/trilinos/build/packages/tpetra/CMakeFiles/Tpetra_all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : packages/tpetra/CMakeFiles/Tpetra_all.dir/depend

