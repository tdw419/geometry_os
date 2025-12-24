#include <gtest/gtest.h>
#include <memory>
#include <thread>
#include <chrono>

#include "kernel/neural_ide.h"
#include "kernel/neural_memory_manager.h"
#include "kernel/neural_state_manager.h"
#include "kernel/tensor_execution_engine.h"

using namespace vectoros;

class NeuralIDETest : public ::testing::Test {
protected:
    void SetUp() override {
        // Create mock dependencies
        memory_manager_ = std::make_shared<NeuralMemoryManager>();
        state_manager_ = std::make_shared<NeuralStateManager>();
        tensor_engine_ = std::make_shared<TensorExecutionEngine>();
        
        // Initialize dependencies
        memory_manager_->initialize();
        state_manager_->initialize();
        tensor_engine_->initialize();
        
        // Create NeuralIDE
        neural_ide_ = std::make_unique<NeuralIDE>(memory_manager_, state_manager_, tensor_engine_);
    }
    
    void TearDown() override {
        neural_ide_.reset();
        tensor_engine_->shutdown();
        state_manager_->shutdown();
        memory_manager_->shutdown();
    }
    
    std::shared_ptr<NeuralMemoryManager> memory_manager_;
    std::shared_ptr<NeuralStateManager> state_manager_;
    std::shared_ptr<TensorExecutionEngine> tensor_engine_;
    std::unique_ptr<NeuralIDE> neural_ide_;
};

TEST_F(NeuralIDETest, Initialization) {
    EXPECT_FALSE(neural_ide_->is_initialized());
    
    bool result = neural_ide_->initialize();
    EXPECT_TRUE(result);
    EXPECT_TRUE(neural_ide_->is_initialized());
}

TEST_F(NeuralIDETest, SessionManagement) {
    neural_ide_->initialize();
    
    // Create session
    std::string session_id = neural_ide_->create_session("test_user");
    EXPECT_FALSE(session_id.empty());
    
    // Get active sessions
    auto sessions = neural_ide_->get_active_sessions();
    EXPECT_EQ(sessions.size(), 1);
    EXPECT_EQ(sessions[0].session_id, session_id);
    
    // Switch session
    bool switched = neural_ide_->switch_session(session_id);
    EXPECT_TRUE(switched);
    
    // Close session
    bool closed = neural_ide_->close_session(session_id);
    EXPECT_TRUE(closed);
    
    sessions = neural_ide_->get_active_sessions();
    EXPECT_EQ(sessions.size(), 0);
}

TEST_F(NeuralIDETest, FileOperations) {
    neural_ide_->initialize();
    
    // Create a test file
    std::string test_file = "test_neural_ide_file.cpp";
    std::ofstream file(test_file);
    file << "#include <iostream>\n\nint main() {\n    std::cout << \"Hello World\" << std::endl;\n    return 0;\n}\n";
    file.close();
    
    // Create session and open file
    std::string session_id = neural_ide_->create_session("test_user");
    neural_ide_->switch_session(session_id);
    
    bool opened = neural_ide_->open_file(test_file);
    EXPECT_TRUE(opened);
    
    // Get file context
    auto context = neural_ide_->get_file_context(test_file);
    EXPECT_EQ(context.file_path, test_file);
    EXPECT_EQ(context.language, "C++");
    EXPECT_GT(context.line_count, 0);
    EXPECT_GT(context.char_count, 0);
    
    // Save file with modifications
    std::string modified_content = context.content + "\n// Added comment\n";
    bool saved = neural_ide_->save_file(test_file, modified_content);
    EXPECT_TRUE(saved);
    
    // Close file
    bool closed = neural_ide_->close_file(test_file);
    EXPECT_TRUE(closed);
    
    // Clean up test file
    std::remove(test_file.c_str());
}

TEST_F(NeuralIDETest, CodeAnalysis) {
    neural_ide_->initialize();
    
    // Create a test file with known patterns
    std::string test_file = "test_analysis.cpp";
    std::ofstream file(test_file);
    file << "#include <iostream>\n\nint main() {\n    for(int i = 0; i < 10; i++) {\n        std::cout << i << std::endl;\n    }\n    return 0;\n}\n";
    file.close();
    
    std::string session_id = neural_ide_->create_session("test_user");
    neural_ide_->switch_session(session_id);
    
    bool opened = neural_ide_->open_file(test_file);
    EXPECT_TRUE(opened);
    
    // Test code complexity analysis
    std::string complexity = neural_ide_->analyze_code_complexity(test_file);
    EXPECT_FALSE(complexity.empty());
    EXPECT_TRUE(complexity.find("Lines of Code") != std::string::npos);
    
    // Test pattern detection
    auto patterns = neural_ide_->find_code_patterns(test_file);
    EXPECT_GT(patterns.size(), 0);
    
    // Test optimization suggestions
    auto suggestions = neural_ide_->suggest_optimizations(test_file);
    EXPECT_GT(suggestions.size(), 0);
    
    // Clean up
    neural_ide_->close_file(test_file);
    std::remove(test_file.c_str());
}

TEST_F(NeuralIDETest, VisualizationGeneration) {
    neural_ide_->initialize();
    
    // Create a test file
    std::string test_file = "test_visualization.cpp";
    std::ofstream file(test_file);
    file << "#include <iostream>\n#include <vector>\n\nint main() {\n    std::vector<int> vec = {1, 2, 3};\n    for(auto& item : vec) {\n        std::cout << item << std::endl;\n    }\n    return 0;\n}\n";
    file.close();
    
    std::string session_id = neural_ide_->create_session("test_user");
    neural_ide_->switch_session(session_id);
    
    bool opened = neural_ide_->open_file(test_file);
    EXPECT_TRUE(opened);
    
    // Generate visualizations
    auto visualizations = neural_ide_->generate_visualizations(test_file);
    EXPECT_EQ(visualizations.size(), 3); // dependency_graph, execution_flow, memory_map
    
    for (const auto& viz : visualizations) {
        EXPECT_FALSE(viz.type.empty());
        EXPECT_FALSE(viz.data.empty());
        EXPECT_FALSE(viz.timestamp.empty());
    }
    
    // Clean up
    neural_ide_->close_file(test_file);
    std::remove(test_file.c_str());
}

TEST_F(NeuralIDETest, SelfModification) {
    neural_ide_->initialize();
    
    // Create a test file
    std::string test_file = "test_modification.cpp";
    std::ofstream file(test_file);
    file << "#include <iostream>\n\nint main() {\n    std::cout << \"Original\" << std::endl;\n    return 0;\n}\n";
    file.close();
    
    std::string session_id = neural_ide_->create_session("test_user");
    neural_ide_->switch_session(session_id);
    
    bool opened = neural_ide_->open_file(test_file);
    EXPECT_TRUE(opened);
    
    // Test modification request
    NeuralIDE::ModificationRequest request;
    request.target_file = test_file;
    request.operation = "insert";
    request.content = "    std::cout << \"Modified\" << std::endl;";
    request.reason = "Test modification";
    request.safety_level = "safe";
    
    bool modified = neural_ide_->request_modification(request);
    EXPECT_TRUE(modified);
    
    // Verify modification
    auto context = neural_ide_->get_file_context(test_file);
    EXPECT_TRUE(context.content.find("Modified") != std::string::npos);
    
    // Clean up
    neural_ide_->close_file(test_file);
    std::remove(test_file.c_str());
}

TEST_F(NeuralIDETest, InteractiveDevelopment) {
    neural_ide_->initialize();
    
    // Test code generation
    std::string generated = neural_ide_->generate_code("Create a factorial function", "C++");
    EXPECT_FALSE(generated.empty());
    
    // Test code explanation
    std::string code = "int factorial(int n) { return n <= 1 ? 1 : n * factorial(n-1); }";
    std::string explanation = neural_ide_->explain_code("dummy.cpp", code);
    EXPECT_FALSE(explanation.empty());
    
    // Test debugging
    std::string debug_info = neural_ide_->debug_code("dummy.cpp", "Segmentation fault");
    EXPECT_FALSE(debug_info.empty());
}

TEST_F(NeuralIDETest, Integration) {
    neural_ide_->initialize();
    
    // Test integration with memory manager
    bool memory_integrated = neural_ide_->integrate_with_memory_manager();
    EXPECT_TRUE(memory_integrated);
    
    // Test integration with state manager
    bool state_integrated = neural_ide_->integrate_with_state_manager();
    EXPECT_TRUE(state_integrated);
    
    // Test integration with tensor engine
    bool tensor_synced = neural_ide_->sync_with_tensor_engine();
    EXPECT_TRUE(tensor_synced);
}

TEST_F(NeuralIDETest, StatusMonitoring) {
    neural_ide_->initialize();
    
    // Test status retrieval
    std::string status = neural_ide_->get_status();
    EXPECT_FALSE(status.empty());
    EXPECT_TRUE(status.find("NeuralIDE Status") != std::string::npos);
    EXPECT_TRUE(status.find("Initialized: Yes") != std::string::npos);
    
    // Test active sessions
    auto sessions = neural_ide_->get_active_sessions();
    EXPECT_EQ(sessions.size(), 0); // No sessions created in this test
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}