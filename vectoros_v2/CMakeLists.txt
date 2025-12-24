# VectorOS v2 Main CMakeLists.txt

cmake_minimum_required(VERSION 3.20)
project(VectorOS_v2)

# Set C++20 standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add subdirectories
add_subdirectory(kernel)

# Main executable
add_executable(vectoros_v2 main.cpp)

# Link kernel library
target_link_libraries(vectoros_v2 kernel)

# Compiler optimizations for release builds
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_options(vectoros_v2 PRIVATE -O3 -march=native -flto)
    target_link_options(vectoros_v2 PRIVATE -flto)
endif()

# Test executable for Logic Synthesis Engine
add_executable(test_logic_synthesis kernel/test_logic_synthesis_engine.cpp)
target_link_libraries(test_logic_synthesis kernel)
target_include_directories(test_logic_synthesis PRIVATE kernel)

# Test executable for Logic Synthesis Engine
add_executable(test_logic_synthesis_engine kernel/test_logic_synthesis_engine.cpp)
target_link_libraries(test_logic_synthesis_engine kernel)
target_include_directories(test_logic_synthesis_engine PRIVATE kernel)

# Install rules
install(TARGETS vectoros_v2
    RUNTIME DESTINATION bin
)

install(DIRECTORY kernel/
    DESTINATION include/kernel
    FILES_MATCHING PATTERN "*.h"
)

# Test executable for Neural Model Binder
add_executable(test_neural_binder kernel/test_neural_model_binder.cpp)
target_link_libraries(test_neural_binder kernel)
target_include_directories(test_neural_binder PRIVATE kernel)

# Demo executables
add_executable(demo_phase32_blueprints demo_phase32_blueprints.cpp)
target_link_libraries(demo_phase32_blueprints kernel)

add_executable(demo_multi_intelligence_integration demo_multi_intelligence_integration.cpp)
target_link_libraries(demo_multi_intelligence_integration kernel)

add_executable(demo_self_hosting demo_self_hosting.cpp)
target_link_libraries(demo_self_hosting kernel)

# Hallucination Demo (Singularity)
add_executable(demo_hallucination demo_hallucination.cpp)
target_link_libraries(demo_hallucination kernel)

# Nested GGUF Demo (Binary Tensorization)
add_executable(demo_nested_gguf demo_nested_gguf.cpp)
target_link_libraries(demo_nested_gguf kernel)

# Test executable for Neural Project Drive
add_executable(test_project_drive kernel/test_neural_project_drive.cpp)
target_link_libraries(test_project_drive kernel)
target_include_directories(test_project_drive PRIVATE kernel)

# GGUF Desktop Demo (Simple)
add_executable(demo_gguf_desktop demo_gguf_desktop.cpp)
target_link_libraries(demo_gguf_desktop kernel)

# Nested GGUF Architecture Demo (Simple)
add_executable(demo_nested_gguf_simple demo_nested_gguf_simple.cpp)
target_link_libraries(demo_nested_gguf_simple kernel)

# Test executable for Nested GGUF Filesystem
add_executable(test_nested_gguf kernel/test_nested_gguf_filesystem.cpp)
target_link_libraries(test_nested_gguf kernel)
target_include_directories(test_nested_gguf PRIVATE kernel)

# === PHASE 40: VECTOROS v3 RELEASE ===
add_executable(vectoros_v3 vectoros_v3_launch.cpp)
target_link_libraries(vectoros_v3 kernel)
