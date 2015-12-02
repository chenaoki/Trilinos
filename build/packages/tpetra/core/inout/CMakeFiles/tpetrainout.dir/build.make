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

# Include any dependencies generated for this target.
include packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/depend.make

# Include the progress variables for this target.
include packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/progress.make

# Include the compile flags for this target's objects.
include packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/flags.make

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/flags.make
packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o: ../packages/tpetra/core/inout/Tpetra_MatrixIO.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o -c /home/tomii/simenv/trilinos/packages/tpetra/core/inout/Tpetra_MatrixIO.cpp

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/tpetra/core/inout/Tpetra_MatrixIO.cpp > CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.i

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/tpetra/core/inout/Tpetra_MatrixIO.cpp -o CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.s

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.requires:
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.requires

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.provides: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.requires
	$(MAKE) -f packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/build.make packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.provides.build
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.provides

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.provides.build: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/flags.make
packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o: ../packages/tpetra/core/inout/MatrixMarket_Tpetra.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o -c /home/tomii/simenv/trilinos/packages/tpetra/core/inout/MatrixMarket_Tpetra.cpp

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/tpetra/core/inout/MatrixMarket_Tpetra.cpp > CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.i

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/tpetra/core/inout/MatrixMarket_Tpetra.cpp -o CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.s

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.requires:
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.requires

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.provides: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.requires
	$(MAKE) -f packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/build.make packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.provides.build
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.provides

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.provides.build: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o

# Object files for target tpetrainout
tpetrainout_OBJECTS = \
"CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o" \
"CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o"

# External object files for target tpetrainout
tpetrainout_EXTERNAL_OBJECTS =

packages/tpetra/core/inout/libtpetrainout.a: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o
packages/tpetra/core/inout/libtpetrainout.a: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o
packages/tpetra/core/inout/libtpetrainout.a: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/build.make
packages/tpetra/core/inout/libtpetrainout.a: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libtpetrainout.a"
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && $(CMAKE_COMMAND) -P CMakeFiles/tpetrainout.dir/cmake_clean_target.cmake
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tpetrainout.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/build: packages/tpetra/core/inout/libtpetrainout.a
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/build

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/requires: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/Tpetra_MatrixIO.cpp.o.requires
packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/requires: packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/MatrixMarket_Tpetra.cpp.o.requires
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/requires

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/clean:
	cd /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout && $(CMAKE_COMMAND) -P CMakeFiles/tpetrainout.dir/cmake_clean.cmake
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/clean

packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/depend:
	cd /home/tomii/simenv/trilinos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tomii/simenv/trilinos /home/tomii/simenv/trilinos/packages/tpetra/core/inout /home/tomii/simenv/trilinos/build /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout /home/tomii/simenv/trilinos/build/packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : packages/tpetra/core/inout/CMakeFiles/tpetrainout.dir/depend

