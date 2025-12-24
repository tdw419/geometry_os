#ifndef NEURAL_IDE_H
#define NEURAL_IDE_H

#include <string>
#include <vector>
#include <memory>
#include <functional>
#include <unordered_map>
#include <mutex>
#include <thread>
#include <atomic>
#include <filesystem>
#include <fstream>
#include <sstream>
#include <regex>
#include <chrono>
#include <iostream>

#include "neural_memory_manager.h"
#include "neural_state_manager.h"
#include <unordered_set>

namespace vectoros_v2 {

/**
 * @brief NeuralIDE - The interactive development environment for VectorOS
 * 
 * The NeuralIDE provides a comprehensive interface for:
 * - Code visualization and analysis
 * - Self-modification capabilities
 * - Interactive development sessions
 * - Neural code generation and optimization
 * - Integration with NeuralMemoryManager and NeuralStateManager
 */
class NeuralIDE {
public:
    struct CodeContext {
        std::string file_path;
        std::string content;
        std::string language;
        std::vector<std::string> dependencies;
        std::string last_modified;
        size_t line_count;
        size_t char_count;
    };

    struct VisualizationData {
        std::string type;  // "dependency_graph", "execution_flow", "memory_map"
        std::string data;  // JSON representation of the visualization
        std::string timestamp;
    };

    struct ModificationRequest {
        std::string target_file;
        std::string operation;  // "insert", "replace", "delete", "refactor"
        std::string content;
        std::string reason;
        std::string safety_level;  // "safe", "moderate", "risky"
    };

    struct IDESession {
        std::string session_id;
        std::string user_context;
        std::vector<CodeContext> open_files;
        std::string active_file;
        std::string last_command;
        std::chrono::system_clock::time_point created_at;
        std::chrono::system_clock::time_point last_activity;
    };

    // Constructor and Destructor
    NeuralIDE(std::shared_ptr<NeuralMemoryManager> memory_manager,
              std::shared_ptr<NeuralStateManager> state_manager);
    ~NeuralIDE();

    // Core IDE Operations
    bool initialize();
    void shutdown();
    
    // Session Management
    std::string create_session(const std::string& user_context = "");
    bool close_session(const std::string& session_id);
    bool switch_session(const std::string& session_id);
    
    // File Operations
    bool open_file(const std::string& file_path);
    bool close_file(const std::string& file_path);
    bool save_file(const std::string& file_path, const std::string& content);
    CodeContext get_file_context(const std::string& file_path);
    
    // Code Analysis and Visualization
    std::vector<VisualizationData> generate_visualizations(const std::string& file_path);
    std::string analyze_code_complexity(const std::string& file_path);
    std::vector<std::string> find_code_patterns(const std::string& file_path);
    std::vector<std::string> suggest_optimizations(const std::string& file_path);
    
    // Self-Modification Capabilities
    bool request_modification(const ModificationRequest& request);
    bool execute_safe_modification(const ModificationRequest& request);
    bool validate_modification_safety(const ModificationRequest& request);
    
    // Interactive Development
    std::string generate_code(const std::string& prompt, const std::string& context = "");
    std::string explain_code(const std::string& file_path, const std::string& selection = "");
    std::string debug_code(const std::string& file_path, const std::string& error_context);
    
    // Neural Integration
    bool integrate_with_memory_manager();
    bool integrate_with_state_manager();
    
    // Status and Monitoring
    std::string get_status() const;
    std::vector<IDESession> get_active_sessions() const;
    bool is_initialized() const { return initialized_; }

private:
    // Internal Implementation
    void background_visualization_worker();
    void code_analysis_worker();
    void safety_validation_worker();
    
    // Helper Methods
    std::string generate_dependency_graph(const CodeContext& context);
    std::string generate_execution_flow(const CodeContext& context);
    std::string generate_memory_map(const CodeContext& context);
    
    bool validate_file_access(const std::string& file_path);
    bool check_modification_conflicts(const ModificationRequest& request);
    bool backup_before_modification(const std::string& file_path);
    
    // Neural Processing
    std::string neural_code_generation(const std::string& prompt, const std::string& context);
    std::string neural_code_analysis(const std::string& code, const std::string& analysis_type);
    std::string neural_optimization_suggestions(const std::string& code);
    
    // Helper Methods
    std::string determine_language(const std::string& file_path);
    std::string get_file_modified_time(const std::string& file_path);
    std::vector<std::string> find_dependencies(const std::string& content, const std::string& language);
    
    // State Management
    void update_ide_state(const std::string& operation, const std::string& details);
    void log_ide_event(const std::string& event_type, const std::string& details);
    
    // Member Variables
    std::shared_ptr<NeuralMemoryManager> memory_manager_;
    std::shared_ptr<NeuralStateManager> state_manager_;
    
    std::atomic<bool> initialized_{false};
    std::atomic<bool> running_{false};
    
    // Session Management
    std::unordered_map<std::string, IDESession> sessions_;
    std::string current_session_id_;
    std::mutex session_mutex_;
    
    // File Management
    std::unordered_map<std::string, CodeContext> open_files_;
    std::mutex file_mutex_;
    
    // Background Workers
    std::thread visualization_thread_;
    std::thread analysis_thread_;
    std::thread safety_thread_;
    
    // Configuration
    size_t max_concurrent_visualizations_ = 3;
    size_t max_session_files_ = 10;
    bool enable_neural_processing_ = true;
    bool enable_self_modification_ = true;
    
    // Statistics
    std::atomic<size_t> total_visualizations_{0};
    std::atomic<size_t> total_modifications_{0};
    std::atomic<size_t> total_code_generations_{0};
    
    // Safety and Validation
    std::unordered_set<std::string> protected_files_;
    std::unordered_set<std::string> restricted_operations_;
    
    // Logging
    std::string log_file_path_ = "neural_ide.log";
};

} // namespace vectoros

#endif // NEURAL_IDE_H
