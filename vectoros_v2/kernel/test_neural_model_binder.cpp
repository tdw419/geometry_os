#include <iostream>
#include <cassert>
#include <filesystem>
#include "neural_model_binder.h"
#include "neural_blueprint_manager.h"

using namespace VectorOS;
namespace fs = std::filesystem;

int main() {
    std::cout << "🧬 Testing Neural Model Binder (Persistence Engine)..." << std::endl;
    std::cout << "===================================================" << std::endl;

    // 1. Initialize Managers
    NeuralBlueprintManager bpm("test_blueprints");
    NeuralModelBinder binder(bpm);

    // 2. Simulate User Conversation / Project State
    std::string user_conversation = 
        "User: How do I build a kernel?\n"
        "AI: First, you start with the bootloader...\n"
        "User: Explain GDT.\n"
        "AI: Global Descriptor Table defines memory segments...";
    
    std::string project_name = "kernel_chat_history";
    std::string output_gguf = "test_memory.gguf";

    // 3. Test Saving to GGUF
    std::cout << "\n📝 Test 1: Saving Context to GGUF..." << std::endl;
    bool saved = binder.save_context_to_gguf(user_conversation, project_name, output_gguf);
    assert(saved);
    assert(fs::exists(output_gguf));
    
    // Verify file size > 0
    assert(fs::file_size(output_gguf) > 100); 

    // 4. Test Binding (Loading) GGUF back
    std::cout << "\n🔄 Test 2: Binding Context back to Memory..." << std::endl;
    bool bound = binder.load_project_memory(output_gguf);
    assert(bound);

    std::cout << "\n✅ Neural Model Binder verified. GGUF Persistence Active." << std::endl;

    // Cleanup
    fs::remove(output_gguf);
    fs::remove_all("test_blueprints");

    return 0;
}
