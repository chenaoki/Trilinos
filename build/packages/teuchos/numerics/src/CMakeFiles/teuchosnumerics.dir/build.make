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
include packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/depend.make

# Include the progress variables for this target.
include packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/progress.make

# Include the compile flags for this target's objects.
include packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o: ../packages/teuchos/numerics/src/Teuchos_Flops.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Flops.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Flops.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Flops.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o: ../packages/teuchos/numerics/src/Teuchos_LAPACK.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_LAPACK.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_LAPACK.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_LAPACK.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o: ../packages/teuchos/numerics/src/Teuchos_CompObject.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_CompObject.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_CompObject.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_CompObject.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o: ../packages/teuchos/numerics/src/Teuchos_MatrixMarket_split.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_4)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_split.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_split.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_split.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o: ../packages/teuchos/numerics/src/Teuchos_Object.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_5)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Object.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Object.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Object.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o: ../packages/teuchos/numerics/src/Teuchos_MatrixMarket_generic.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_6)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_generic.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_generic.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_generic.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o: ../packages/teuchos/numerics/src/Teuchos_MatrixMarket_Banner.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_7)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Banner.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Banner.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_MatrixMarket_Banner.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o: ../packages/teuchos/numerics/src/Teuchos_Details_Lapack128.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_8)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Details_Lapack128.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Details_Lapack128.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_Details_Lapack128.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/flags.make
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o: ../packages/teuchos/numerics/src/Teuchos_BLAS.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/tomii/simenv/trilinos/build/CMakeFiles $(CMAKE_PROGRESS_9)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o -c /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_BLAS.cpp

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.i"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_BLAS.cpp > CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.i

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.s"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && /usr/bin/mpicxx  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/tomii/simenv/trilinos/packages/teuchos/numerics/src/Teuchos_BLAS.cpp -o CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.s

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.requires:
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.provides: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.requires
	$(MAKE) -f packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.provides.build
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.provides

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.provides.build: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o

# Object files for target teuchosnumerics
teuchosnumerics_OBJECTS = \
"CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o" \
"CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o"

# External object files for target teuchosnumerics
teuchosnumerics_EXTERNAL_OBJECTS =

packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build.make
packages/teuchos/numerics/src/libteuchosnumerics.a: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX static library libteuchosnumerics.a"
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && $(CMAKE_COMMAND) -P CMakeFiles/teuchosnumerics.dir/cmake_clean_target.cmake
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/teuchosnumerics.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build: packages/teuchos/numerics/src/libteuchosnumerics.a
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/build

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Flops.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_LAPACK.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_CompObject.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_split.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Object.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_generic.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_MatrixMarket_Banner.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_Details_Lapack128.cpp.o.requires
packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires: packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/Teuchos_BLAS.cpp.o.requires
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/requires

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/clean:
	cd /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src && $(CMAKE_COMMAND) -P CMakeFiles/teuchosnumerics.dir/cmake_clean.cmake
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/clean

packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/depend:
	cd /home/tomii/simenv/trilinos/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/tomii/simenv/trilinos /home/tomii/simenv/trilinos/packages/teuchos/numerics/src /home/tomii/simenv/trilinos/build /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src /home/tomii/simenv/trilinos/build/packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : packages/teuchos/numerics/src/CMakeFiles/teuchosnumerics.dir/depend

