# VectorOS v2 Kernel CMakeLists.txt

cmake_minimum_required(VERSION 3.20)

# Kernel library
add_library(kernel
    kernel.cpp
    neural_engine.cpp
    memory_manager.cpp
    security_manager.cpp
    neural_ide_simple.cpp
    binary_architect.cpp
    v4_substrate_launcher.cpp
    neural_memory_manager.cpp
    neural_state_manager.cpp
    neural_ide_components.cpp
    logic_synthesis_engine.cpp
    hallucination_engine.cpp
    neural_binary_loader.cpp
    nested_gguf_filesystem.cpp
    gguf_desktop_simple.cpp
)

# Set C++20 standard
target_compile_features(kernel PUBLIC cxx_std_20)

# Compiler optimizations for release builds
if(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_options(kernel PRIVATE -O3 -march=native -flto)
    target_link_options(kernel PRIVATE -flto)
endif()

# Include directories
target_include_directories(kernel PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)

# Link libraries (add GPU libraries when available)
# target_link_libraries(kernel PRIVATE CUDA::cuda_driver)  # Uncomment when CUDA is available

# Set library properties
set_target_properties(kernel PROPERTIES
    VERSION 2.0.0
    SOVERSION 1
)

# Install rules
install(TARGETS kernel
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)

install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/
    DESTINATION include/kernel
    FILES_MATCHING PATTERN "*.h"
)