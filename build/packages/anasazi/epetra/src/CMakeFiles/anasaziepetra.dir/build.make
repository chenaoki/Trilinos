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
include packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/depend.make

# Include the progress variables for this target.
include packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/progress.make

# Include the compile flags for this target's objects.
include packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/flags.make

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/flags.make
packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o: ../packages/anasazi/epetra/src/AnasaziEpetraAdapter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o -c /home/tomii/simenv/trilinos/packages/anasazi/epetra/src/AnasaziEpetraAdapter.cpp

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/anasazi/epetra/src/AnasaziEpetraAdapter.cpp > CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.i

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/anasazi/epetra/src/AnasaziEpetraAdapter.cpp -o CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.s

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.requires:
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.requires

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.provides: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.requires
	$(MAKE) -f packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/build.make packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.provides.build
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.provides

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.provides.build: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/flags.make
packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o: ../packages/anasazi/epetra/src/AnasaziSpecializedEpetraAdapter.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o -c /home/tomii/simenv/trilinos/packages/anasazi/epetra/src/AnasaziSpecializedEpetraAdapter.cpp

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/anasazi/epetra/src/AnasaziSpecializedEpetraAdapter.cpp > CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.i

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/anasazi/epetra/src/AnasaziSpecializedEpetraAdapter.cpp -o CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.s

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.requires:
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.requires

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.provides: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.requires
	$(MAKE) -f packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/build.make packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.provides.build
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.provides

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.provides.build: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o

# Object files for target anasaziepetra
anasaziepetra_OBJECTS = \
"CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o" \
"CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o"

# External object files for target anasaziepetra
anasaziepetra_EXTERNAL_OBJECTS =

packages/anasazi/epetra/src/libanasaziepetra.a: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o
packages/anasazi/epetra/src/libanasaziepetra.a: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o
packages/anasazi/epetra/src/libanasaziepetra.a: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/build.make
packages/anasazi/epetra/src/libanasaziepetra.a: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libanasaziepetra.a"
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && $(CMAKE_COMMAND) -P CMakeFiles/anasaziepetra.dir/cmake_clean_target.cmake
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/anasaziepetra.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/build: packages/anasazi/epetra/src/libanasaziepetra.a
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/build

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/requires: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziEpetraAdapter.cpp.o.requires
packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/requires: packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/AnasaziSpecializedEpetraAdapter.cpp.o.requires
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/requires

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/clean:
	cd /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src && $(CMAKE_COMMAND) -P CMakeFiles/anasaziepetra.dir/cmake_clean.cmake
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/clean

packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/depend:
	cd /home/tomii/simenv/trilinos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tomii/simenv/trilinos /home/tomii/simenv/trilinos/packages/anasazi/epetra/src /home/tomii/simenv/trilinos/build /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src /home/tomii/simenv/trilinos/build/packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : packages/anasazi/epetra/src/CMakeFiles/anasaziepetra.dir/depend

