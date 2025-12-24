#pragma once

#include "neural_model_binder.h"
#include <string>
#include <vector>
#include <filesystem>
#include <cstdlib>
#include <array>
#include <memory>

namespace fs = std::filesystem;

namespace VectorOS {

/**
 * @brief Neural Project Drive
 * 
 * Represents a software project (Codebase) as a dynamic, writable GGUF entity.
 * This class bridges the gap between:
 * 1. The GGUF Static Representation (Wait-State).
 * 2. System Hardware Execution (Build/Compile).
 * 3. Recursive Persistence (Saving Build Artifacts back to GGUF).
 */
class NeuralProjectDrive {
private:
    NeuralModelBinder& binder_;
    std::string project_root_;
    std::string drive_name_;
    
    // In-memory state of the project
    // Files are mapped to "Source Tensors"
    // Build artifacts are mapped to "Binary Tensors"
    struct ProjectAsset {
        std::string path;
        std::string type; // "source", "binary", "log"
        std::vector<uint8_t> data;
    };
    std::vector<ProjectAsset> assets_;

    // execute command and return output
    std::string exec_command(const char* cmd) {
        std::array<char, 128> buffer;
        std::string result;
        std::unique_ptr<FILE, void(*)(FILE*)> pipe(popen(cmd, "r"), [](FILE* f) { 
            if (f) pclose(f); 
        });
        if (!pipe) {
            throw std::runtime_error("popen() failed!");
        }
        while (fgets(buffer.data(), buffer.size(), pipe.get()) != nullptr) {
            result += buffer.data();
        }
        return result;
    }

public:
    NeuralProjectDrive(NeuralModelBinder& binder) : binder_(binder) {}

    /**
     * @brief Mounts a file system directory as a Neural Project.
     * scans files and prepares them for "Ingestion" into the GGUF.
     */
    void mount(const std::string& path, const std::string& drive_name) {
        project_root_ = path;
        drive_name_ = drive_name;
        assets_.clear();

        std::cout << "[ProjectDrive] Mounting '" << path << "' as @" << drive_name << "..." << std::endl;

        if (!fs::exists(path)) {
            std::cerr << "[ProjectDrive] Path does not exist." << std::endl;
            return;
        }

        for (const auto& entry : fs::recursive_directory_iterator(path)) {
            if (entry.is_regular_file()) {
                // In a real OS, we filter for meaningful files
                // Here we just take everything < 1MB for demo
                if (entry.file_size() < 1024 * 1024) { 
                    ProjectAsset asset;
                    asset.path = entry.path().string();
                    asset.type = "source"; // Simplified assumption
                    
                    std::ifstream file(entry.path(), std::ios::binary);
                    asset.data = std::vector<uint8_t>((std::istreambuf_iterator<char>(file)),
                                                      std::istreambuf_iterator<char>());
                    assets_.push_back(asset);
                }
            }
        }
        std::cout << "[ProjectDrive] Mounted " << assets_.size() << " assets." << std::endl;
    }

    /**
     * @brief Compiles the project using System Hardware.
     * This proves the model can access hardware (CPU/Compiler) 
     * and incorporate the results.
     */
    bool build(const std::string& build_command) {
        std::cout << "[ProjectDrive] Executing Hardware Build: '" << build_command << "'..." << std::endl;
        
        // 1. Hardware Access: Run the command in the actual OS shell
        std::string full_cmd = "cd " + project_root_ + " && " + build_command + " 2>&1";
        std::string output = exec_command(full_cmd.c_str());
        
        std::cout << "[ProjectDrive] Build Complete. Output captured." << std::endl;

        // 2. Reflect output back into the GGUF State
        ProjectAsset log;
        log.path = "build_log.txt";
        log.type = "log";
        log.data.assign(output.begin(), output.end());
        assets_.push_back(log);

        // 3. Scan for new artifacts (e.g., binaries)
        // Simplified: just look for 'a.out' or the binary named in CMake
        // In full version, we diff the file system.
        return true;
    }

    /**
     * @brief Injects new source code into the project drive.
     */
    bool inject_source(const std::string& filename, const std::string& content) {
        std::string full_path = project_root_ + "/" + filename;
        std::ofstream file(full_path);
        if (!file.is_open()) return false;
        
        file << content;
        file.close();
        
        // Register asset
        ProjectAsset asset;
        asset.path = full_path;
        asset.type = "hallucinated_source";
        asset.data.assign(content.begin(), content.end());
        assets_.push_back(asset);
        
        std::cout << "[ProjectDrive] Injected code into " << filename << std::endl;
        return true;
    }

    /**
     * @brief Writes the entire project state (Source + Logs + Artifacts)
     * back to a GGUF file. This is the "Self-Updating GGUF".
     */
    bool sync_to_gguf(const std::string& output_gguf_path) {
        std::cout << "[ProjectDrive] Syncing state to " << output_gguf_path << "..." << std::endl;

        // Convert Assets to "Context Data" string for the Binder
        // In reality, each asset would be a separate Tensor.
        // We concatenate them for the Binder's simple "save_context" API.
        std::string unified_context;
        for (const auto& asset : assets_) {
            unified_context += "\n--- FILE: " + asset.path + " ---\n";
            unified_context += std::string(asset.data.begin(), asset.data.end());
        }

        return binder_.save_context_to_gguf(unified_context, drive_name_, output_gguf_path);
    }
};

} // namespace VectorOS
