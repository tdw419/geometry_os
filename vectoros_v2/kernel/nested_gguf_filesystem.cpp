#include "nested_gguf_filesystem.h"
#include <iostream>
#include <fstream>
#include <filesystem>

namespace fs = std::filesystem;

namespace VectorOS {

NestedGGUFFilesystem::NestedGGUFFilesystem(const std::string& root_path) 
    : root_path_(root_path), 
      programs_dir_(root_path + "/system/bin") {
}

bool NestedGGUFFilesystem::mount() {
    std::cout << "[NestedGGUF] Mounting filesystem at: " << root_path_ << std::endl;
    
    // Create programs directory if it doesn't exist
    if (!fs::exists(programs_dir_)) {
        fs::create_directories(programs_dir_);
        std::cout << "[NestedGGUF] Created programs directory: " << programs_dir_ << std::endl;
    }
    
    // Scan for existing GGUF files
    if (!scan_for_gguf_files()) {
        std::cerr << "[NestedGGUF] Failed to scan for GGUF files" << std::endl;
        return false;
    }
    
    std::cout << "[NestedGGUF] Filesystem mounted successfully. Found " 
              << program_paths_.size() << " programs." << std::endl;
    return true;
}

bool NestedGGUFFilesystem::scan_for_gguf_files() {
    program_paths_.clear();
    program_info_.clear();
    
    if (!fs::exists(programs_dir_)) {
        return true; // No programs directory, that's fine
    }
    
    for (const auto& entry : fs::directory_iterator(programs_dir_)) {
        if (entry.is_regular_file() && entry.path().extension() == ".gguf") {
            std::string filename = entry.path().filename().string();
            std::string program_name = filename.substr(0, filename.find_last_of('.'));
            
            if (validate_gguf_file(entry.path().string())) {
                program_paths_[program_name] = entry.path().string();
                program_info_[program_name] = extract_program_info(entry.path().string());
                std::cout << "[NestedGGUF] Registered program: " << program_name 
                          << " (" << program_info_[program_name].type << ")" << std::endl;
            } else {
                std::cerr << "[NestedGGUF] Invalid GGUF file: " << filename << std::endl;
            }
        }
    }
    
    return true;
}

bool NestedGGUFFilesystem::validate_gguf_file(const std::string& path) {
    std::ifstream file(path, std::ios::binary);
    if (!file.is_open()) {
        return false;
    }
    
    // Check GGUF magic header
    char magic[4];
    file.read(magic, 4);
    if (std::string(magic, 4) != "GGUF") {
        return false;
    }
    
    // Check for binary_data tensor
    std::vector<char> buffer((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());
    std::string content(buffer.begin(), buffer.end());
    
    return content.find("binary_data") != std::string::npos;
}

NestedGGUFFilesystem::ProgramInfo NestedGGUFFilesystem::extract_program_info(const std::string& path) {
    ProgramInfo info;
    info.path = path;
    info.name = fs::path(path).stem().string();
    info.size = fs::file_size(path);
    
    // Try to extract type from GGUF metadata
    std::ifstream file(path, std::ios::binary);
    if (file.is_open()) {
        // Skip header
        file.seekg(24, std::ios::beg);
        
        // Read KV count
        uint64_t n_kv;
        file.read(reinterpret_cast<char*>(&n_kv), 8);
        
        // Look for vectoros.type
        for (size_t i = 0; i < n_kv; ++i) {
            // Read key
            uint64_t key_len;
            file.read(reinterpret_cast<char*>(&key_len), 8);
            std::string key(key_len, '\0');
            file.read(&key[0], key_len);
            
            // Read type
            uint32_t type;
            file.read(reinterpret_cast<char*>(&type), 4);
            
            if (key == "vectoros.type" && type == 8) { // STRING type
                uint64_t value_len;
                file.read(reinterpret_cast<char*>(&value_len), 8);
                info.type.resize(value_len);
                file.read(&info.type[0], value_len);
                break;
            } else if (type == 8) {
                // Skip string value
                uint64_t value_len;
                file.read(reinterpret_cast<char*>(&value_len), 8);
                file.seekg(value_len, std::ios::cur);
            } else {
                // Skip other value types
                file.seekg(8, std::ios::cur);
            }
        }
    }
    
    if (info.type.empty()) {
        info.type = "unknown";
    }
    
    return info;
}

bool NestedGGUFFilesystem::execute_program(const std::string& program_name, const std::string& args) {
    auto it = program_paths_.find(program_name);
    if (it == program_paths_.end()) {
        std::cerr << "[NestedGGUF] Program not found: " << program_name << std::endl;
        return false;
    }
    
    std::cout << "[NestedGGUF] Executing program: " << program_name 
              << " with args: " << args << std::endl;
    
    return binary_loader_.execute_gguf_program(it->second, args);
}

std::vector<std::string> NestedGGUFFilesystem::list_programs() const {
    std::vector<std::string> programs;
    for (const auto& pair : program_paths_) {
        programs.push_back(pair.first);
    }
    return programs;
}

std::vector<NestedGGUFFilesystem::ProgramInfo> NestedGGUFFilesystem::get_program_info() const {
    std::vector<ProgramInfo> info;
    for (const auto& pair : program_info_) {
        info.push_back(pair.second);
    }
    return info;
}

bool NestedGGUFFilesystem::install_program(const std::string& gguf_path, const std::string& program_name) {
    if (!validate_gguf_file(gguf_path)) {
        std::cerr << "[NestedGGUF] Invalid GGUF file: " << gguf_path << std::endl;
        return false;
    }
    
    std::string target_path = programs_dir_ + "/" + program_name + ".gguf";
    
    try {
        fs::copy_file(gguf_path, target_path, fs::copy_options::overwrite_existing);
        program_paths_[program_name] = target_path;
        program_info_[program_name] = extract_program_info(target_path);
        std::cout << "[NestedGGUF] Installed program: " << program_name << std::endl;
        return true;
    } catch (const std::exception& e) {
        std::cerr << "[NestedGGUF] Failed to install program: " << e.what() << std::endl;
        return false;
    }
}

bool NestedGGUFFilesystem::uninstall_program(const std::string& program_name) {
    auto it = program_paths_.find(program_name);
    if (it == program_paths_.end()) {
        std::cerr << "[NestedGGUF] Program not found: " << program_name << std::endl;
        return false;
    }
    
    try {
        fs::remove(it->second);
        program_paths_.erase(it);
        program_info_.erase(program_name);
        std::cout << "[NestedGGUF] Uninstalled program: " << program_name << std::endl;
        return true;
    } catch (const std::exception& e) {
        std::cerr << "[NestedGGUF] Failed to uninstall program: " << e.what() << std::endl;
        return false;
    }
}

} // namespace VectorOS