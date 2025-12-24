#include "nested_gguf_filesystem.h"
#include "neural_binary_loader.h"
#include <iostream>
#include <fstream>
#include <filesystem>

namespace fs = std::filesystem;

int main() {
    std::cout << "=== TEST: Nested GGUF Filesystem ===\n\n";
    
    // Create test workspace
    fs::create_directories("./test_workspace/system/bin");
    
    // Create a simple test binary
    std::string test_binary = "./test_workspace/system/bin/test_app";
    std::ofstream binary_file(test_binary, std::ios::binary);
    binary_file << "#!/bin/bash\necho 'Hello from GGUF!'\n";
    binary_file.close();
    fs::permissions(test_binary, fs::perms::owner_all);
    
    // Convert binary to GGUF using our tool
    std::cout << "[Test] Converting binary to GGUF...\n";
    system("python3 ../tools/binary_to_gguf.py ./test_workspace/system/bin/test_app ./test_workspace/system/bin/test_app.gguf --name test_app");
    
    // Test filesystem
    VectorOS::NestedGGUFFilesystem filesystem("./test_workspace");
    
    if (!filesystem.mount()) {
        std::cerr << "Failed to mount filesystem\n";
        return 1;
    }
    
    // List programs
    auto programs = filesystem.list_programs();
    std::cout << "Found programs: ";
    for (const auto& prog : programs) {
        std::cout << prog << " ";
    }
    std::cout << "\n\n";
    
    // Get program info
    auto info = filesystem.get_program_info();
    for (const auto& pinfo : info) {
        std::cout << "Program: " << pinfo.name << "\n";
        std::cout << "  Type: " << pinfo.type << "\n";
        std::cout << "  Size: " << pinfo.size << " bytes\n";
        std::cout << "  Path: " << pinfo.path << "\n\n";
    }
    
    // Test execution
    std::cout << "[Test] Executing test_app...\n";
    if (filesystem.execute_program("test_app")) {
        std::cout << "PASS: Program executed successfully\n";
    } else {
        std::cerr << "FAIL: Program execution failed\n";
        return 1;
    }
    
    // Test installation
    std::cout << "\n[Test] Testing program installation...\n";
    if (filesystem.install_program("./test_workspace/system/bin/test_app.gguf", "installed_app")) {
        std::cout << "PASS: Program installed successfully\n";
    } else {
        std::cerr << "FAIL: Program installation failed\n";
        return 1;
    }
    
    // Test uninstallation
    std::cout << "\n[Test] Testing program uninstallation...\n";
    if (filesystem.uninstall_program("installed_app")) {
        std::cout << "PASS: Program uninstalled successfully\n";
    } else {
        std::cerr << "FAIL: Program uninstallation failed\n";
        return 1;
    }
    
    std::cout << "\n=== ALL TESTS PASSED ===\n";
    return 0;
}