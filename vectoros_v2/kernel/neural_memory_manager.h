/*
 * NeuralMemoryManager.h
 * 
 * VectorOS Genesis Model - Neural Memory Management System
 * 
 * This component implements robust memory pool allocation and leak detection
 * as per the architectural analysis from the Genesis Model.
 * 
 * Key Features:
 * - Memory pool allocation with configurable block sizes
 * - Leak detection and tracking
 * - Thread-safe operations
 * - Memory corruption detection
 * - Performance optimization through caching
 */

#pragma once

#include <cstdint>
#include <cstddef>
#include <memory>
#include <vector>
#include <unordered_map>
#include <mutex>
#include <atomic>
#include <chrono>
#include <string>
#include <functional>
#include <optional>

namespace vectoros {
namespace kernel {

/**
 * Memory allocation metadata for leak detection and tracking
 */
struct MemoryBlock {
    void* ptr;
    size_t size;
    const char* file;
    int line;
    std::chrono::high_resolution_clock::time_point allocation_time;
    std::string stack_trace;
    bool is_freed;
    
    MemoryBlock() = default;

    MemoryBlock(void* p, size_t s, const char* f, int l)
        : ptr(p), size(s), file(f), line(l), is_freed(false) {
        allocation_time = std::chrono::high_resolution_clock::now();
    }
};

/**
 * Memory pool configuration
 */
struct MemoryPoolConfig {
    size_t block_size;
    size_t initial_capacity;
    size_t max_capacity;
    bool enable_leak_detection;
    bool enable_corruption_detection;
    bool enable_performance_monitoring;
    
    MemoryPoolConfig(size_t block_sz = 4096, 
                     size_t init_cap = 1024,
                     size_t max_cap = 65536,
                     bool leak_detection = true,
                     bool corruption_detection = true,
                     bool perf_monitoring = true)
        : block_size(block_sz), initial_capacity(init_cap), 
          max_capacity(max_cap), enable_leak_detection(leak_detection),
          enable_corruption_detection(corruption_detection),
          enable_performance_monitoring(perf_monitoring) {}
};

/**
 * Memory pool for efficient allocation of fixed-size blocks
 */
class MemoryPool {
private:
    struct PoolBlock {
        PoolBlock* next;
        char data[1]; // Flexible array member
    };
    
    std::mutex pool_mutex;
    PoolBlock* free_list;
    std::vector<void*> allocated_blocks;
    MemoryPoolConfig config;
    std::atomic<size_t> allocated_count{0};
    std::atomic<size_t> total_allocated{0};
    
    void expand_pool();
    
public:
    explicit MemoryPool(const MemoryPoolConfig& cfg);
    ~MemoryPool();
    
    void* allocate();
    void deallocate(void* ptr);
    
    size_t get_allocated_count() const { return allocated_count.load(); }
    size_t get_total_allocated() const { return total_allocated.load(); }
    size_t get_pool_size() const { return config.initial_capacity; }
};

/**
 * Neural Memory Manager - Core component for memory management
 * 
 * Implements the architectural requirements:
 * - Robust memory pool allocation
 * - Leak detection and prevention
 * - Thread safety
 * - Performance optimization
 * - Corruption detection
 */
class NeuralMemoryManager {
private:
    // Configuration
    MemoryPoolConfig default_config;
    
    // Memory pools for different block sizes
    std::vector<std::unique_ptr<MemoryPool>> memory_pools;
    std::unordered_map<size_t, size_t> pool_index_map;
    
    // Leak detection and tracking
    std::unordered_map<void*, MemoryBlock> allocated_blocks;
    mutable std::mutex tracking_mutex;
    
    // Performance monitoring
    struct PerformanceMetrics {
        std::atomic<uint64_t> total_allocations{0};
        std::atomic<uint64_t> total_deallocations{0};
        std::atomic<uint64_t> total_bytes_allocated{0};
        std::atomic<uint64_t> total_bytes_deallocated{0};
        std::atomic<uint64_t> peak_memory_usage{0};
        std::atomic<uint64_t> current_memory_usage{0};
    } metrics;
    
    // Corruption detection
    struct CorruptionDetector {
        std::atomic<bool> enabled{false};
        std::atomic<uint32_t> magic_value{0xDEADBEEF};
        
        bool validate_pointer(void* ptr) const;
        void mark_corrupted(void* ptr);
    } corruption_detector;
    
    // Thread-local cache for performance
    struct ThreadLocalCache {
        std::vector<void*> cached_blocks;
        size_t pool_index;
        std::mutex cache_mutex;
    };
    
    thread_local static std::unique_ptr<ThreadLocalCache> thread_cache;
    
    // Internal allocation tracking
    void track_allocation(void* ptr, size_t size, const char* file, int line);
    void track_deallocation(void* ptr);
    void update_performance_metrics(size_t bytes, bool is_allocation);
    
    // Pool management
    size_t get_pool_index(size_t size) const;
    MemoryPool* get_or_create_pool(size_t size);
    
    // Stack trace capture for debugging
    std::string capture_stack_trace() const;
    
    // Memory validation
    bool validate_memory_integrity(void* ptr, size_t size) const;
    
public:
    /**
     * Constructor with optional configuration
     */
    explicit NeuralMemoryManager(const MemoryPoolConfig& config = MemoryPoolConfig());
    
    /**
     * Destructor - performs final leak detection
     */
    ~NeuralMemoryManager();
    
    /**
     * Allocate memory with leak detection and tracking
     */
    void* allocate(size_t size, const char* file = nullptr, int line = 0);
    
    /**
     * Deallocate memory and update tracking
     */
    void deallocate(void* ptr);
    
    /**
     * Reallocate memory (if supported by underlying allocator)
     */
    void* reallocate(void* ptr, size_t new_size, const char* file = nullptr, int line = 0);
    
    /**
     * Get memory usage statistics
     */
    struct MemoryStats {
        uint64_t total_allocated;
        uint64_t total_deallocated;
        uint64_t current_usage;
        uint64_t peak_usage;
        size_t active_allocations;
        size_t total_pools;
    };
    
    MemoryStats get_memory_stats() const;
    
    /**
     * Perform leak detection and report results
     */
    struct LeakReport {
        size_t leaked_blocks;
        size_t leaked_bytes;
        std::vector<MemoryBlock> leaks;
    };
    
    LeakReport detect_leaks() const;
    
    /**
     * Enable/disable corruption detection
     */
    void set_corruption_detection(bool enabled);
    
    /**
     * Validate all tracked memory blocks
     */
    bool validate_all_memory() const;
    
    /**
     * Get detailed allocation history for debugging
     */
    std::vector<MemoryBlock> get_allocation_history() const;
    
    /**
     * Clear all tracking data (useful for testing)
     */
    void clear_tracking();
    
    /**
     * Thread-safe allocation with caching
     */
    static void* thread_safe_allocate(size_t size, const char* file = nullptr, int line = 0);
    
    /**
     * Thread-safe deallocation
     */
    static void thread_safe_deallocate(void* ptr);
    
    /**
     * Performance optimization: pre-allocate cache for current thread
     */
    void warmup_thread_cache(size_t pool_size);
    
    /**
     * Get singleton instance
     */
    static NeuralMemoryManager& get_instance();
    
    /**
     * Initialize the memory manager (call before use)
     */
    static void initialize(const MemoryPoolConfig& config = MemoryPoolConfig());
    
    /**
     * Shutdown and cleanup (call at program exit)
     */
    static void shutdown();
    
private:
    static std::unique_ptr<NeuralMemoryManager> instance;
    static std::mutex instance_mutex;
};

/**
 * RAII wrapper for automatic memory management
 */
template<typename T>
class NeuralUniquePtr {
private:
    T* ptr;
    bool managed;
    
public:
    explicit NeuralUniquePtr(T* p = nullptr, bool auto_manage = true)
        : ptr(p), managed(auto_manage) {}
    
    ~NeuralUniquePtr() {
        if (ptr && managed) {
            NeuralMemoryManager::get_instance().deallocate(ptr);
        }
    }
    
    NeuralUniquePtr(const NeuralUniquePtr&) = delete;
    NeuralUniquePtr& operator=(const NeuralUniquePtr&) = delete;
    
    NeuralUniquePtr(NeuralUniquePtr&& other) noexcept
        : ptr(other.ptr), managed(other.managed) {
        other.ptr = nullptr;
        other.managed = false;
    }
    
    NeuralUniquePtr& operator=(NeuralUniquePtr&& other) noexcept {
        if (this != &other) {
            if (ptr && managed) {
                NeuralMemoryManager::get_instance().deallocate(ptr);
            }
            ptr = other.ptr;
            managed = other.managed;
            other.ptr = nullptr;
            other.managed = false;
        }
        return *this;
    }
    
    T* get() const { return ptr; }
    T& operator*() const { return *ptr; }
    T* operator->() const { return ptr; }
    
    void reset(T* p = nullptr) {
        if (ptr && managed) {
            NeuralMemoryManager::get_instance().deallocate(ptr);
        }
        ptr = p;
    }
    
    T* release() {
        T* temp = ptr;
        ptr = nullptr;
        managed = false;
        return temp;
    }
};

/**
 * Macro for tracked allocations (similar to new/delete but with tracking)
 */
#define NEURAL_ALLOC(size) \
    NeuralMemoryManager::get_instance().allocate(size, __FILE__, __LINE__)

#define NEURAL_FREE(ptr) \
    NeuralMemoryManager::get_instance().deallocate(ptr)

#define NEURAL_NEW(type, ...) \
    new (NeuralMemoryManager::get_instance().allocate(sizeof(type), __FILE__, __LINE__)) type(__VA_ARGS__)

#define NEURAL_DELETE(ptr) \
    do { \
        if (ptr) { \
            (ptr)->~decltype(*(ptr))(); \
            NeuralMemoryManager::get_instance().deallocate(ptr); \
            ptr = nullptr; \
        } \
    } while(0)

} // namespace kernel
} // namespace vectoros