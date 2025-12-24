#pragma once

#include "neural_blueprint_manager.h"
#include <fstream>
#include <vector>
#include <string>
#include <iostream>
#include <cstdlib>
#include <cstdio>
#include <sys/stat.h>

// On Linux, we can use memfd_create for in-memory execution, but for portability/MVP
// we will extract to a temporary file and execute.

namespace VectorOS {

class NeuralBinaryLoader {
public:
    NeuralBinaryLoader() = default;

    /**
     * @brief Loads a GGUF Application "Program"
     * 1. Reads the "binary_data" tensor.
     * 2. Converts Float32 -> Bytes (Reverses the Embedding).
     * 3. Writes it to a temp executable file.
     * 4. Executes it.
     */
    bool execute_gguf_program(const std::string& gguf_path, const std::string& args = "");
};

} // namespace VectorOS