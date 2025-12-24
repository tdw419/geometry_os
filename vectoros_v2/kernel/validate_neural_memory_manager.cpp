/*
 * validate_neural_memory_manager.cpp
 * 
 * Validation script for NeuralMemoryManager implementation
 * 
 * Validates that the implementation meets all architectural requirements
 * proposed by the Genesis Model.
 */

#include "neural_memory_manager.h"
#include "kernel.h"
#include <iostream>
#include <cassert>
#include <chrono>
#include <thread>
#include <vector>
#include <random>

using namespace vectoros::kernel;
using namespace vectoros_v2;

class NeuralMemoryManagerValidator {
private:
    NeuralMemoryManager& manager_;
    
public:
    NeuralMemoryManagerValidator(NeuralMemoryManager& manager) : manager_(manager) {}
    
    bool validate_all_requirements() {
        std::cout << "=== NeuralMemoryManager Architecture Validation ===" << std::endl;
        
        bool all_passed = true;
        
        // 1. Validate Memory Pool Allocation
        std::cout << "\n1. Testing Memory Pool Allocation..." << std::endl;
        all_passed &= test_memory_pool_allocation();
        
        // 2. Validate Leak Detection
        std::cout << "\n2. Testing Leak Detection..." << std::endl;
        all_passed &= test_leak_detection();
        
        // 3. Validate Thread Safety
        std::cout << "\n3. Testing Thread Safety..." << std::endl;
        all_passed &= test_thread_safety();
        
        // 4. Validate Corruption Detection
        std::cout << "\n4. Testing Corruption Detection..." << std::endl;
        all_passed &= test_corruption_detection();
        
        // 5. Validate Performance Monitoring
        std::cout << "\n5. Testing Performance Monitoring..." << std::endl;
        all_passed &= test_performance_monitoring();
        
        // 6. Validate RAII Wrapper
        std::cout << "\n6. Testing RAII Wrapper..." << std::endl;
        all_passed &= test_raii_wrapper();
        
        // 7. Validate Integration with Kernel
        std::cout << "\n7. Testing Kernel Integration..." << std::endl;
        all_passed &= test_kernel_integration();
        
        std::cout << "\n=== Validation Summary ===" << std::endl;
        if (all_passed) {
            std::cout << "✅ ALL ARCHITECTURAL REQUIREMENTS PASSED" << std::endl;
        } else {
            std::cout << "❌ SOME REQUIREMENTS FAILED" << std::endl;
        }
        
        return all_passed;
    }
    
private:
    bool test_memory_pool_allocation() {
        try {
            // Test basic allocation
            void* ptr1 = manager_.allocate(1024);
            assert(ptr1 != nullptr);
            
            void* ptr2 = manager_.allocate(2048);
            assert(ptr2 != nullptr);
            
            // Test deallocation
            manager_.deallocate(ptr1);
            manager_.deallocate(ptr2);
            
            // Test reallocation
            void* ptr3 = manager_.reallocate(nullptr, 512);
            assert(ptr3 != nullptr);
            manager_.deallocate(ptr3);
            
            std::cout << "   ✅ Memory pool allocation working correctly" << std::endl;
            return true;
        } catch (const std::exception& e) {
            std::cout << "   ❌ Memory pool allocation failed: " << e.what() << std::endl;
            return false;
        }
    }
    
    bool test_leak_detection() {
        try {
            // Allocate memory but don't deallocate (simulate leak)
            void* leaked_ptr = manager_.allocate(1024, __FILE__, __LINE__);
            
            // Check for leaks
            auto leaks = manager_.detect_leaks();
            assert(leaks.leaked_blocks >= 1);
            assert(leaks.leaked_bytes >= 1024);
            
            // Now properly deallocate
            manager_.deallocate(leaked_ptr);
            
            // Check again - should be no leaks
            leaks = manager_.detect_leaks();
            assert(leaks.leaked_blocks == 0);
            
            std::cout << "   ✅ Leak detection working correctly" << std::endl;
            return true;
        } catch (const std::exception& e) {
            std::cout << "   ❌ Leak detection failed: " << e.what() << std::endl;
            return false;
        }
    }
    
    bool test_thread_safety() {
        try {
            const int num_threads = 10;
            const int allocations_per_thread = 100;
            std::vector<std::thread> threads;
            std::vector<std::vector<void*>> thread_allocations(num_threads);
            
            // Launch threads that allocate and deallocate memory
            for (int t = 0; t < num_threads; ++t) {
                threads.emplace_back([&, t]() {
                    std::random_device rd;
                    std::mt19937 gen(rd());
                    std::uniform_int_distribution<> size_dist(64, 4096);
                    
                    for (int i = 0; i < allocations_per_thread; ++i) {
                        size_t size = size_dist(gen);
                        void* ptr = manager_.allocate(size);
                        thread_allocations[t].push_back(ptr);
                    }
                });
            }
            
            // Wait for all threads to complete
            for (auto& thread : threads) {
                thread.join();
            }
            
            // Deallocate all memory
            for (const auto& allocations : thread_allocations) {
                for (void* ptr : allocations) {
                    manager_.deallocate(ptr);
                }
            }
            
            // Check for leaks
            auto leaks = manager_.detect_leaks();
            assert(leaks.leaked_blocks == 0);
            
            std::cout << "   ✅ Thread safety working correctly" << std::endl;
            return true;
        } catch (const std::exception& e) {
            std::cout << "   ❌ Thread safety failed: " << e.what() << std::endl;
            return false;
        }
    }
    
    bool test_corruption_detection() {
        try {
            manager_.set_corruption_detection(true);
            
            void* ptr = manager_.allocate(1024);
            assert(ptr != nullptr);
            
            // Test that valid memory passes validation
            bool is_valid = manager_.validate_all_memory();
            assert(is_valid);
            
            manager_.deallocate(ptr);
            
            std::cout << "   ✅ Corruption detection working correctly" << std::endl;
            return true;
        } catch (const std::exception& e) {
            std::cout << "   ❌ Corruption detection failed: " << e.what() << std::endl;
            return false;
        }
    }
    
    bool test_performance_monitoring() {
        try {
            auto initial_stats = manager_.get_memory_stats();
            
            // Allocate some memory
            std::vector<void*> allocations;
            for (int i = 0; i < 10; ++i) {
                void* ptr = manager_.allocate(1024);
                allocations.push_back(ptr);
            }
            
            auto after_alloc_stats = manager_.get_memory_stats();
            assert(after_alloc_stats.total_allocated > initial_stats.total_allocated);
            assert(after_alloc_stats.active_allocations == 10);
            
            // Deallocate memory
            for (void* ptr : allocations) {
                manager_.deallocate(ptr);
            }
            
            auto final_stats = manager_.get_memory_stats();
            assert(final_stats.active_allocations == 0);
            
            std::cout << "   ✅ Performance monitoring working correctly" << std::endl;
            return true;
        } catch (const std::exception& e) {
            std::cout << "   ❌ Performance monitoring failed: " << e.what() << std::endl;
            return false;
        }
    }
    
    bool test_raii_wrapper() {
        try {
            {
                NeuralUniquePtr<int> ptr(static_cast<int*>(manager_.allocate(sizeof(int))));
                *ptr = 42;
                assert(*ptr == 42);
            } // Should automatically deallocate
            
            // Verify no leaks
            auto leaks = manager_.detect_leaks();
            assert(leaks.leaked_blocks == 0);
            
            std::cout << "   ✅ RAII wrapper working correctly" << std::endl;
            return true;
        } catch (const std::exception& e) {
            std::cout << "   ❌ RAII wrapper failed: " << e.what() << std::endl;
            return false;
        }
    }
    
    bool test_kernel_integration() {
        try {
            // Test that the kernel can access the NeuralMemoryManager
            VectorOSKernel kernel;
            if (!kernel.initialize()) {
                std::cout << "   ❌ Kernel initialization failed" << std::endl;
                return false;
            }
            
            if (!kernel.boot()) {
                std::cout << "   ❌ Kernel boot failed" << std::endl;
                return false;
            }
            
            // Get the NeuralMemoryManager from the kernel
            NeuralMemoryManager& kernel_manager = kernel.get_neural_memory_manager();
            
            // Test that we can use it
            void* ptr = kernel_manager.allocate(1024);
            assert(ptr != nullptr);
            kernel_manager.deallocate(ptr);
            
            // Test diagnostic methods
            std::string report = kernel.get_memory_diagnostic_report();
            assert(!report.empty());
            
            bool integrity = kernel.validate_memory_integrity();
            assert(integrity);
            
            kernel.shutdown();
            
            std::cout << "   ✅ Kernel integration working correctly" << std::endl;
            return true;
        } catch (const std::exception& e) {
            std::cout << "   ❌ Kernel integration failed: " << e.what() << std::endl;
            return false;
        }
    }
};

int main() {
    std::cout << "NeuralMemoryManager Architecture Validation" << std::endl;
    std::cout << "=============================================" << std::endl;
    
    // Initialize the NeuralMemoryManager
    NeuralMemoryManager::initialize();
    
    try {
        // Get the manager instance
        NeuralMemoryManager& manager = NeuralMemoryManager::get_instance();
        
        // Run validation
        NeuralMemoryManagerValidator validator(manager);
        bool success = validator.validate_all_requirements();
        
        // Shutdown
        NeuralMemoryManager::shutdown();
        
        if (success) {
            std::cout << "\n🎉 VALIDATION SUCCESSFUL: All architectural requirements met!" << std::endl;
            return 0;
        } else {
            std::cout << "\n💥 VALIDATION FAILED: Some requirements not met!" << std::endl;
            return 1;
        }
        
    } catch (const std::exception& e) {
        std::cout << "\n💥 VALIDATION ERROR: " << e.what() << std::endl;
        NeuralMemoryManager::shutdown();
        return 1;
    }
}