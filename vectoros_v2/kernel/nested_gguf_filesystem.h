#pragma once

#include "neural_binary_loader.h"
#include "neural_project_drive.h"
#include <filesystem>
#include <unordered_map>
#include <string>

namespace VectorOS {

/**
 * @brief Nested GGUF Filesystem
 * 
 * Manages a hierarchical GGUF-based filesystem where:
 * - Main GGUF: Bootstrapper/OS kernel
 * - OS GGUF: Core kernel logic and weights
 * - App GGUFs: Executable binaries (QEMU, Linux, etc.) stored as tensors
 */
class NestedGGUFFilesystem {
public:
    NestedGGUFFilesystem(const std::string& root_path);
    
    /**
     * @brief Mount the nested GGUF filesystem
     * Scans for .gguf files and registers them as executable programs
     */
    bool mount();
    
    /**
     * @brief Execute a GGUF program by name
     * @param program_name Name of the program (e.g., "qemu", "linux")
     * @param args Command line arguments for the program
     */
    bool execute_program(const std::string& program_name, const std::string& args = "");
    
    /**
     * @brief List all available GGUF programs
     */
    std::vector<std::string> list_programs() const;
    
    /**
     * @brief Get program information
     */
    struct ProgramInfo {
        std::string name;
        std::string path;
        std::string type;
        size_t size;
    };
    
    std::vector<ProgramInfo> get_program_info() const;
    
    /**
     * @brief Install a new GGUF program
     * @param gguf_path Path to the .gguf file
     * @param program_name Name to register the program as
     */
    bool install_program(const std::string& gguf_path, const std::string& program_name);
    
    /**
     * @brief Uninstall a GGUF program
     */
    bool uninstall_program(const std::string& program_name);

private:
    std::string root_path_;
    std::string programs_dir_;
    std::unordered_map<std::string, std::string> program_paths_;
    std::unordered_map<std::string, ProgramInfo> program_info_;
public:
    NeuralBinaryLoader binary_loader_;
    
    bool scan_for_gguf_files();
    bool validate_gguf_file(const std::string& path);
    ProgramInfo extract_program_info(const std::string& path);
};

} // namespace VectorOS