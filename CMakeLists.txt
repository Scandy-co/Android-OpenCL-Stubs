cmake_minimum_required(VERSION 2.8)
project(OpenCL_Stubs)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DTARGET_PLATFORM_ANDROID -std=c++11")
set(OpenCL_sources "opencl_stubs_20.cpp")
add_library(OpenCL SHARED ${OpenCL_sources})
target_include_directories(OpenCL PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}/CL20")
set_target_properties(OpenCL PROPERTIES SKIP_RPATH TRUE)
