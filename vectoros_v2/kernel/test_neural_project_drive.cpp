#include "neural_project_drive.h"
#include <iostream>
#include <filesystem>
#include <fstream>

using namespace VectorOS;
namespace fs = std::filesystem;

// Mock implementations for the Binder dependencies if they aren't fully linked
// (Since we are testing just the binding logic)
// Actually we link with kernel so it's fine.

int main() {
    std::cout << "============================================" << std::endl;
    std::cout << "   TEST: Neural Project Drive (GGUF Build)" << std::endl;
    std::cout << "============================================" << std::endl;

    // 1. Setup Test Environment
    std::string test_dir = "test_project_env";
    fs::create_directory(test_dir);
    
    // Create a dummy main.cpp
    std::ofstream src(test_dir + "/main.cpp");
    src << "#include <iostream>\nint main() { std::cout << \"Hello from GGUF Built Project!\" << std::endl; return 0; }";
    src.close();

    // Create a dummy Makefile
    std::ofstream mk(test_dir + "/Makefile");
    mk << "all:\n\tg++ main.cpp -o app_output";
    mk.close();

    // 2. Initialize Components
    NeuralBlueprintManager bpm;
    NeuralModelBinder binder(bpm);
    NeuralProjectDrive drive(binder);

    // 3. Mount Project
    drive.mount(test_dir, "test_project_v1");

    // 4. Execute Build (Hardware Access)
    // The GGUF "Brain" decides to run 'make'
    drive.build("make");

    // 5. Sync State to GGUF (Write Back)
    // We expect the build logs and source to be saved into the gguf
    std::string output_gguf = "project_snapshot.gguf";
    if (drive.sync_to_gguf(output_gguf)) {
        std::cout << "PASS: Project successfully compiled and saved to " << output_gguf << std::endl;
    } else {
        std::cerr << "FAIL: Could not save project GGUF." << std::endl;
        return 1;
    }

    // Cleanup
    fs::remove_all(test_dir);
    // fs::remove(output_gguf); // Keep it to inspect if needed

    return 0;
}
