#include "neural_binary_loader.h"
#include <iostream>
#include <fstream>
#include <vector>
#include <string>
#include <cstdlib>
#include <cstdio>
#include <sys/stat.h>

namespace VectorOS {

bool NeuralBinaryLoader::execute_gguf_program(const std::string& gguf_path, const std::string& args) {
    std::cout << "[Loader] Loading GGUF Program: " << gguf_path << "..." << std::endl;
    
    std::ifstream file(gguf_path, std::ios::binary);
    if (!file.is_open()) {
        std::cerr << "[Loader] Failed to open file: " << gguf_path << std::endl;
        return false;
    }
    
    // Read entire file into buffer
    std::vector<char> buffer((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    std::string content(buffer.begin(), buffer.end());
    
    // Find the binary_data tensor
    std::string marker = "binary_data";
    size_t name_pos = content.find(marker);
    if (name_pos == std::string::npos) {
        std::cerr << "[Loader] 'binary_data' tensor not found." << std::endl;
        return false;
    }
    
    // Parse GGUF header and tensor info
    size_t cursor = 0;
    auto read_u32 = [&]() { 
        uint32_t v = *reinterpret_cast<uint32_t*>(&buffer[cursor]); 
        cursor += 4; 
        return v; 
    };
    auto read_u64 = [&]() { 
        uint64_t v = *reinterpret_cast<uint64_t*>(&buffer[cursor]); 
        cursor += 8; 
        return v; 
    };
    auto read_str = [&]() { 
        uint64_t len = read_u64(); 
        std::string s(&buffer[cursor], len); 
        cursor += len; 
        return s; 
    };
    
    // Check magic
    if (std::string(&buffer[0], 4) != "GGUF") {
        std::cerr << "[Loader] Invalid GGUF magic." << std::endl;
        return false;
    }
    cursor += 4; // Magic
    cursor += 4; // Version
    uint64_t n_tensors = read_u64();
    uint64_t n_kv = read_u64();
    
    // Skip KVs
    for(size_t i=0; i<n_kv; ++i) {
        read_str(); // Key
        uint32_t type = read_u32(); // Type
        if (type == 8) read_str(); // String value
        else cursor += 8; // Assume 64-bit value for simplicity
    }
    
    // Tensor Info
    read_str(); // Name "binary_data"
    uint32_t n_dims = read_u32();
    uint64_t len = read_u64(); // Length
    read_u32(); // Type
    read_u64(); // Offset
    
    // Align cursor to 32 bytes
    while (cursor % 32 != 0) cursor++;
    
    // Point to data
    float* float_data = reinterpret_cast<float*>(&buffer[cursor]);
    
    // Convert back to bytes
    std::vector<uint8_t> binary_bytes;
    binary_bytes.reserve(len);
    for(size_t i=0; i<len; ++i) {
        binary_bytes.push_back(static_cast<uint8_t>(float_data[i] * 255.0f));
    }
    
    // Write to temp file
    std::string temp_bin = "temp_exec.bin";
    std::ofstream outfile(temp_bin, std::ios::binary);
    outfile.write(reinterpret_cast<char*>(binary_bytes.data()), binary_bytes.size());
    outfile.close();
    
    // Make Executable
    chmod(temp_bin.c_str(), 0755);
    
    // Execute
    std::cout << "[Loader] Executing detensorized binary..." << std::endl;
    std::string cmd = "./" + temp_bin + " " + args;
    int ret = system(cmd.c_str());
    
    // Cleanup
    // remove(temp_bin.c_str());
    
    return (ret == 0);
}

} // namespace VectorOS