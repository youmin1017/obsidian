---
tags:
  - CPP
  - CMake
---

## CMakeLists.txt

```cmake
cmake_minimum_required(VERSION 3.0)  
  
set(BOOST_ROOT /opt/homebrew/Cellar/boost/1.80.0)  
#set(BOOST_INCLUDEDIR /usr/local/include/boost)  
#set(BOOST_LIBRARYDIR /usr/local/xxx)  
  
find_package(Boost REQUIRED COMPONENTS system)  
if(Boost_FOUND)  
    MESSAGE(STATUS "Boost_INCLUDE_DIRS = ${Boost_INCLUDE_DIRS}")  
    MESSAGE(STATUS "Boost_LIBRARIES = ${Boost_LIBRARIES}")  
    MESSAGE(STATUS "Boost_VERSION = ${Boost_VERSION}")  
    MESSAGE(STATUS "Boost_LIB_VERSION = ${Boost_LIB_VERSION}")  
  
    include_directories(${Boost_INCLUDE_DIRS})  
    add_executable(a.out boost-filesystem-create-directory.cpp)  
    target_link_libraries(a.out ${Boost_LIBRARIES})  
endif()
```

## Refs

[在 Ubuntu 用 cmake 專案寫 Boost 程式 | ShengYu Talk (shengyu7697.github.io)](https://shengyu7697.github.io/boost-use-cmake-in-ubuntu/)