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

# Utility rule file for Gtest_all.

# Include the progress variables for this target.
include commonTools/gtest/CMakeFiles/Gtest_all.dir/progress.make

commonTools/gtest/CMakeFiles/Gtest_all: commonTools/gtest/libgtest.a

Gtest_all: commonTools/gtest/CMakeFiles/Gtest_all
Gtest_all: commonTools/gtest/CMakeFiles/Gtest_all.dir/build.make
.PHONY : Gtest_all

# Rule to build all files generated by this target.
commonTools/gtest/CMakeFiles/Gtest_all.dir/build: Gtest_all
.PHONY : commonTools/gtest/CMakeFiles/Gtest_all.dir/build

commonTools/gtest/CMakeFiles/Gtest_all.dir/clean:
	cd /home/tomii/simenv/trilinos/build/commonTools/gtest && $(CMAKE_COMMAND) -P CMakeFiles/Gtest_all.dir/cmake_clean.cmake
.PHONY : commonTools/gtest/CMakeFiles/Gtest_all.dir/clean

commonTools/gtest/CMakeFiles/Gtest_all.dir/depend:
	cd /home/tomii/simenv/trilinos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tomii/simenv/trilinos /home/tomii/simenv/trilinos/commonTools/gtest /home/tomii/simenv/trilinos/build /home/tomii/simenv/trilinos/build/commonTools/gtest /home/tomii/simenv/trilinos/build/commonTools/gtest/CMakeFiles/Gtest_all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : commonTools/gtest/CMakeFiles/Gtest_all.dir/depend

