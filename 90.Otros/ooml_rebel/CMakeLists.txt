cmake_minimum_required (VERSION 2.6)

project (OOM)

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -ggdb")
SET(CMAKE_BUILD_TYPE "debugfull" )
#SET(CMAKE_BUILD_TYPE distribution)
#SET( CMAKE_BUILD_TYPE "Release")
	

SET(OOM_TRUNK_DIR ${CMAKE_CURRENT_SOURCE_DIR})

SET(LIBRARY_OUTPUT_PATH ${OOM_TRUNK_DIR}/lib)
SET(EXECUTABLE_OUTPUT_PATH ${OOM_TRUNK_DIR}/bin)


MESSAGE(STATUS "Configuring OOM project")
INCLUDE("${OOM_TRUNK_DIR}/build_tools/cmake/utils.cmake")

ADD_SUBDIRECTORY(src)


