#pragma once

#include "binary_architect.h"
#include <memory>
#include "neural_state_manager.h"
#include "neural_ide_simple.h"
#include "neural_orchestrator.h"
#include "performance_monitor.h"
#include "distributed_processor.h"
#include "recursive_optimizer.h"
#include "pattern_sharing.h"
#include "logic_synthesis_engine.h"
#include "v4_substrate_launcher.h"
#include "neural_blueprint_manager.h"
// #include "VectorOS.h" // Removed for compatibility
#include "holographic_memory.h"
#include "temporal_engine.h"
#include "zero_point.h"
#include "void_kernel.h"
#include "neural_memory_manager.h"  // New NeuralMemoryManager integration
#include <iostream>
#include <functional>

// Include headers for unique_ptr usage
#include "neural_project_drive.h" // Phase 4: GGUF Persistence
#include "neural_model_binder.h"  // Phase 4: GGUF Binding
#include "neural_engine.h"
#include "memory_manager.h"
#include "security_manager.h"
#include "hallucination_engine.h"   // Phase 29: Singularity

namespace vectoros_v2 {

// Forward declarations
class NeuralEngine;
class MemoryManager;
class SecurityManager;

/**
 * @brief VectorOS v2 Kernel - The core operating system kernel
 * 
 * Implements a microkernel architecture with neural processing capabilities.
 * Designed for high performance with native C++20 and GPU acceleration.
 */
class VectorOSKernel {
private:
    std::unique_ptr<NeuralEngine> neural_engine_;
    std::unique_ptr<MemoryManager> memory_manager_;
    std::unique_ptr<vectoros::kernel::NeuralMemoryManager> neural_memory_manager_;  // New NeuralMemoryManager
    std::unique_ptr<SecurityManager> security_manager_;
    std::unique_ptr<NeuralStateManager> state_manager_;
    std::unique_ptr<NeuralIDE> ide_;
    std::unique_ptr<BinaryArchitect> architect_;
    std::unique_ptr<NeuralOrchestrator> orchestrator_;
    std::unique_ptr<PerformanceMonitor> monitor_;
    std::unique_ptr<DistributedProcessor> distributed_processor_;
    std::unique_ptr<RecursiveOptimizer> recursive_optimizer_;
    std::unique_ptr<PatternSharingManager> pattern_sharing_;
    std::unique_ptr<LogicSynthesisEngine> logic_engine_;
    std::unique_ptr<V4SubstrateLauncher> v4_launcher_;
    std::unique_ptr<VectorOS::NeuralBlueprintManager> blueprint_manager_;
    std::unique_ptr<HolographicMemoryStore> holographic_memory_;
    std::unique_ptr<TemporalEngine> temporal_engine_;
    std::unique_ptr<ZeroPoint> zero_point_;
    std::unique_ptr<VoidKernel> void_kernel_;

    // Phase 4: GGUF Persistence & Singularity
    std::unique_ptr<VectorOS::NeuralModelBinder> model_binder_;
    std::unique_ptr<VectorOS::NeuralProjectDrive> project_drive_;
    std::unique_ptr<VectorOS::HallucinationEngine> hallucination_engine_;
    
    bool initialized_ = false;
    bool booted_ = false;
    
public:
    VectorOSKernel() = default;
    ~VectorOSKernel() = default;
    
    /**
     * @brief Initialize the kernel components
     * @return true if initialization successful, false otherwise
     */
    bool initialize();
    
    /**
     * @brief Boot the operating system
     * @return true if boot successful, false otherwise
     */
    bool boot();

    /**
     * @brief Initiates recursive binary modification to produce v3.
     */
    bool trigger_singularity();
    
    /**
     * @brief Shutdown the operating system
     */
    void shutdown();
    
    /**
     * @brief Get the neural engine instance
     * @return Reference to NeuralEngine
     */
    NeuralEngine& get_neural_engine();
    
    /**
     * @brief Get the memory manager instance
     * @return Reference to MemoryManager
     */
    MemoryManager& get_memory_manager();
    
    /**
     * @brief Get the security manager instance
     * @return Reference to SecurityManager
     */
    SecurityManager& get_security_manager();
    
    /**
     * @brief Get the NeuralMemoryManager instance
     * @return Reference to NeuralMemoryManager
     */
    vectoros::kernel::NeuralMemoryManager& get_neural_memory_manager();
    
    /**
     * @brief Get memory diagnostic report with leak detection
     * @return Diagnostic report string
     */
    std::string get_memory_diagnostic_report() const;
    
    /**
     * @brief Validate memory integrity across all tracked allocations
     * @return true if all memory is valid, false otherwise
     */
    bool validate_memory_integrity() const;
    
    SystemState get_current_state() { return state_manager_->get_current_state(); }
    NeuralIDE& get_ide() { return *ide_; }
    NeuralOrchestrator& get_orchestrator() { return *orchestrator_; }
    PerformanceMonitor& get_monitor() { return *monitor_; }
    DistributedProcessor& get_distributed_processor() { return *distributed_processor_; }
    RecursiveOptimizer& get_recursive_optimizer() { return *recursive_optimizer_; }
    PatternSharingManager& get_pattern_sharing() { return *pattern_sharing_; }
    LogicSynthesisEngine& get_logic_engine() { return *logic_engine_; }
    V4SubstrateLauncher& get_v4_launcher() { return *v4_launcher_; }
    
    /**
     * @brief Check if kernel is initialized
     * @return true if initialized, false otherwise
     */
    bool is_initialized() const { return initialized_; }
    
    /**
     * @brief Check if kernel is booted
     * @return true if booted, false otherwise
     */
    bool is_booted() const { return booted_; }
    
    /**
     * @brief Phase 3: Initialize distributed processing
     */
    void initialize_distributed_processing(int node_count);
    
    /**
     * @brief Phase 3: Submit distributed task
     */
    void submit_distributed_task(std::function<void()> task);
    
    /**
     * @brief Phase 3: Get distributed status
     */
    std::string get_distributed_status() const;
    
    /**
     * @brief Phase 3: Start recursive optimization
     */
    void start_recursive_optimization();
    
    /**
     * @brief Phase 3: Stop recursive optimization
     */
    void stop_recursive_optimization();
    
    /**
     * @brief Phase 3: Record optimization metric
     */
    void record_optimization_metric(const std::string& component, const std::string& type, double score);
    
    /**
     * @brief Phase 3: Get optimization status
     */
    std::string get_optimization_status() const;
    
    /**
     * @brief Phase 3: Register neural pattern
     */
    void register_neural_pattern(const std::string& component, const std::string& pattern_type,
                                const std::vector<double>& pattern_data, double quality_score = 1.0);
    
    /**
     * @brief Phase 3: Get shared pattern
     */
    std::vector<double> get_shared_pattern(const std::string& pattern_id);
    
    /**
     * @brief Phase 3: Get pattern statistics
     */
    std::string get_pattern_statistics() const;
    
    /**
     * @brief Phase 30: Distill neural experiences into hardware-native logic.
     */
    bool distill_intelligence();
    
    /**
     * @brief Phase 31: Initialize the v4 Substrate Launcher
     */
    bool initialize_v4_launcher();
    
    /**
     * @brief Phase 31: Flash the v4 substrate with synthesized netlists
     */
    bool flash_v4_substrate();
    
    /**
     * @brief Phase 31: Boot the v4 hardware-native execution environment
     */
    bool boot_v4_substrate();
    
    /**
     * @brief Phase 31: Execute operations using the v4 substrate
     */
    bool execute_v4_operation(const std::string& operation_id, const std::vector<double>& inputs);
    
    /**
     * @brief Phase 31: Get v4 substrate execution statistics
     */
    std::string get_v4_stats() const;
    
    /**
     * @brief Phase 32: Create a new neural blueprint
     */
    std::string create_blueprint(const std::string& name, const std::map<std::string, VectorOS::NeuralTensor>& tensors);
    
    /**
     * @brief Phase 32: Blend two blueprints
     */
    std::string blend_blueprints(const std::string& id1, const std::string& id2, double alpha = 0.5);
    
    /**
     * @brief Phase 32: Mutate a blueprint
     */
    void mutate_blueprint(const std::string& id, double strength = 0.01);
    
    /**
     * @brief Get the blueprint manager instance
     */
    VectorOS::NeuralBlueprintManager& get_blueprint_manager() { return *blueprint_manager_; }
    
    /**
     * @brief Import a brain from GGUF extraction
     */
    void import_brain_from_gguf(const std::string& path);

    /**
     * @brief Phase 33: Synthesize a quantum circuit
     */
    void synthesize_quantum_circuit(const std::string& circuit_id);

    /**
     * @brief Phase 33: Execute quantum logic
     */
    uint32_t execute_quantum_logic();

    /**
     * @brief Phase 34: Encode holographic pattern
     */
    std::string encode_hologram(const std::string& id, const std::vector<double>& data);

    /**
     * @brief Phase 34: Recall fragmented hologram
     */
    std::vector<double> recall_hologram(const std::string& id, double damage_percentage = 0.0);
    
    /**
     * @brief Get kernel version information
     * @return Version string
     */
    static std::string get_version() { return "VectorOS v2.0.0"; }
    
    /**
     * @brief Get boot time in milliseconds
     * @return Boot time if available, 0 if not booted
     */
    uint64_t get_boot_time_ms() const;
    
    /**
     * @brief Phase 35: Initialize the Temporal Engine
     */
    bool initialize_temporal_engine();
    
    /**
     * @brief Phase 35: Create a time fork for parallel timeline evaluation
     */
    uint64_t create_time_fork(uint64_t base_timeline_id,
                             const std::vector<std::function<void(TemporalEngine::Timeline&)>>& timeline_modifiers,
                             std::function<double(const TemporalEngine::Timeline&)> evaluation_function);
    
    /**
     * @brief Phase 35: Evaluate and collapse a time fork
     */
    bool evaluate_and_collapse_time_fork(uint64_t fork_id);
    
    /**
     * @brief Phase 35: Get temporal metrics
     */
    TemporalEngine::TemporalMetrics get_temporal_metrics() const;
    
    /**
     * @brief Get the temporal engine instance
     */
    TemporalEngine& get_temporal_engine() { return *temporal_engine_; }

    /**
     * @brief Phase 36: Get the Zero-Point API (God Mode)
     */
    ZeroPoint& get_zero_point() { return *zero_point_; }

    /**
     * @brief Phase 37: Get the Void Kernel
     */
    /**
     * @brief Phase 37: Get the Void Kernel
     */
    VoidKernel& get_void_kernel() { return *void_kernel_; }

    /**
     * @brief Phase 4: Mount a Neural Project Drive (Recursive GGUF)
     */
    bool mount_drive(const std::string& path, const std::string& name);

    /**
     * @brief Phase 4: Sync active drive state to GGUF
     */
    bool sync_drive();
};

} // namespace vectoros_v2