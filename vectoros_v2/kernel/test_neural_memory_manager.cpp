/*
 * test_neural_memory_manager_lite.cpp
 * 
 * Self-contained test suite for NeuralMemoryManager
 * (Replaces GTest which is not available)
 */

#include "neural_memory_manager.h"
#include <iostream>
#include <vector>
#include <thread>
#include <cassert>
#include <cstring>
#include <atomic>

using namespace vectoros::kernel;

// Simple Test Framework
#define ASSERT_TRUE(condition) \
    do { \
        if (!(condition)) { \
            std::cerr << "FAIL: " << #condition << " (" << __FILE__ << ":" << __LINE__ << ")" << std::endl; \
            exit(1); \
        } \
    } while(0)

#define ASSERT_FALSE(condition) ASSERT_TRUE(!(condition))
#define ASSERT_EQ(a, b) ASSERT_TRUE((a) == (b))
#define ASSERT_NE(a, b) ASSERT_TRUE((a) != (b))

void TestAllocationAndDeallocation() {
    std::cout << "[TestAllocDealloc] Running..." << std::endl;
    NeuralMemoryManager manager;
    
    void* ptr = manager.allocate(1024);
    ASSERT_TRUE(ptr != nullptr);
    ASSERT_TRUE(manager.get_memory_stats().current_usage > 0);
    
    manager.deallocate(ptr);
    ASSERT_EQ(manager.get_memory_stats().current_usage, 0);
    std::cout << "[TestAllocDealloc] Passed." << std::endl;
}

void TestLeakDetection() {
    std::cout << "[TestLeakDetection] Running..." << std::endl;
    NeuralMemoryManager manager;
    
    void* ptr = manager.allocate(512);
    // Intentionally leak ptr
    (void)ptr;
    
    auto report = manager.detect_leaks();
    ASSERT_EQ(report.leaked_blocks, 1);
    ASSERT_EQ(report.leaked_bytes, 512);
    
    // Cleanup to prevent actual leak complaint on destruction
    manager.deallocate(ptr);
    std::cout << "[TestLeakDetection] Passed." << std::endl;
}

void TestThreadSafety() {
    std::cout << "[TestThreadSafety] Running (4 threads)..." << std::endl;
    NeuralMemoryManager manager;
    std::atomic<bool> success{true};
    
    auto thread_func = [&]() {
        for (int i = 0; i < 100; ++i) {
            void* ptr = manager.allocate(128);
            if (!ptr) success = false;
            std::this_thread::sleep_for(std::chrono::microseconds(10));
            manager.deallocate(ptr);
        }
    };
    
    std::vector<std::thread> threads;
    for (int i = 0; i < 4; ++i) {
        threads.emplace_back(thread_func);
    }
    
    for (auto& t : threads) {
        t.join();
    }
    
    ASSERT_TRUE(success);
    ASSERT_EQ(manager.get_memory_stats().current_usage, 0);
    std::cout << "[TestThreadSafety] Passed." << std::endl;
}

int main() {
    std::cout << "=== NeuralMemoryManager Test Suite ===" << std::endl;
    
    TestAllocationAndDeallocation();
    TestLeakDetection();
    TestThreadSafety();
    
    std::cout << "\n✅ All Tests Passed Successfully." << std::endl;
    return 0;
}