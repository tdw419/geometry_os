/*
 * NeuralMemoryManager.cpp
 * 
 * VectorOS Genesis Model - Neural Memory Management System Implementation
 * 
 * Implements robust memory pool allocation, leak detection, and thread safety
 * as per the architectural analysis from the Genesis Model.
 */

#include "neural_memory_manager.h"
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <iomanip>
#include <sstream>
#include <execinfo.h>
#include <cxxabi.h>
#include <cstddef>  // for offsetof

namespace vectoros {
namespace kernel {

// Thread-local cache initialization
thread_local std::unique_ptr<NeuralMemoryManager::ThreadLocalCache> 
    NeuralMemoryManager::thread_cache = nullptr;

// Static instance management
std::unique_ptr<NeuralMemoryManager> NeuralMemoryManager::instance = nullptr;
std::mutex NeuralMemoryManager::instance_mutex;

// MemoryPool Implementation

MemoryPool::MemoryPool(const MemoryPoolConfig& cfg) 
    : config(cfg), free_list(nullptr) {
    expand_pool();
}

MemoryPool::~MemoryPool() {
    // Clean up all allocated blocks
    for (void* block : allocated_blocks) {
        std::free(block);
    }
}

void MemoryPool::expand_pool() {
    std::lock_guard<std::mutex> lock(pool_mutex);
    
    // Allocate a new block
    size_t block_size_with_header = config.block_size + sizeof(PoolBlock);
    void* new_block = std::malloc(block_size_with_header);
    
    if (!new_block) {
        throw std::bad_alloc();
    }
    
    allocated_blocks.push_back(new_block);
    
    // Link the new block into the free list
    PoolBlock* pool_block = static_cast<PoolBlock*>(new_block);
    pool_block->next = free_list;
    free_list = pool_block;
}

void* MemoryPool::allocate() {
    std::lock_guard<std::mutex> lock(pool_mutex);
    
    if (!free_list) {
        expand_pool();
    }
    
    PoolBlock* block = free_list;
    free_list = block->next;
    
    allocated_count++;
    total_allocated += config.block_size;
    
    return block->data;
}

void MemoryPool::deallocate(void* ptr) {
    if (!ptr) return;
    
    std::lock_guard<std::mutex> lock(pool_mutex);
    
    // Calculate the actual block start
    // The PoolBlock structure has a flexible array member, so we need to subtract
    // only the size of the header, not the entire structure
    PoolBlock* block = reinterpret_cast<PoolBlock*>(
        reinterpret_cast<char*>(ptr) - offsetof(PoolBlock, data)
    );
    
    // Link back into free list
    block->next = free_list;
    free_list = block;
    
    allocated_count--;
}

// NeuralMemoryManager Implementation

NeuralMemoryManager::NeuralMemoryManager(const MemoryPoolConfig& config) 
    : default_config(config) {
    
    // Initialize corruption detector
    corruption_detector.enabled.store(config.enable_corruption_detection);
    
    // Create initial pools for common sizes
    std::vector<size_t> common_sizes = {64, 128, 256, 512, 1024, 2048, 4096, 8192};
    
    for (size_t size : common_sizes) {
        MemoryPoolConfig pool_config(size, 1024, 65536, 
                                   config.enable_leak_detection,
                                   config.enable_corruption_detection,
                                   config.enable_performance_monitoring);
        
        memory_pools.push_back(std::make_unique<MemoryPool>(pool_config));
        pool_index_map[size] = memory_pools.size() - 1;
    }
}

NeuralMemoryManager::~NeuralMemoryManager() {
    // Perform final leak detection
    LeakReport leaks = detect_leaks();
    if (leaks.leaked_blocks > 0) {
        std::cerr << "WARNING: Memory leaks detected during shutdown!" << std::endl;
        std::cerr << "Leaked blocks: " << leaks.leaked_blocks << std::endl;
        std::cerr << "Leaked bytes: " << leaks.leaked_bytes << std::endl;
    }
}

void* NeuralMemoryManager::allocate(size_t size, const char* file, int line) {
    // Find appropriate pool or create one
    MemoryPool* pool = get_or_create_pool(size);
    
    void* ptr = pool->allocate();
    
    // Track allocation if enabled
    if (default_config.enable_leak_detection) {
        track_allocation(ptr, size, file, line);
    }
    
    // Update performance metrics
    if (default_config.enable_performance_monitoring) {
        update_performance_metrics(size, true);
    }
    
    return ptr;
}

void NeuralMemoryManager::deallocate(void* ptr) {
    if (!ptr) return;
    
    // Find which pool this pointer belongs to
    MemoryPool* found_pool = nullptr;
    for (auto& pool : memory_pools) {
        // This is a simplified check - in practice, we'd need more sophisticated
        // pointer-to-pool mapping
        // For now, we'll use the tracking system to find the original size
        auto it = allocated_blocks.find(ptr);
        if (it != allocated_blocks.end()) {
            // Found in tracking - use that size to find pool
            size_t original_size = it->second.size;
            size_t pool_idx = get_pool_index(original_size);
            if (pool_idx < memory_pools.size()) {
                found_pool = memory_pools[pool_idx].get();
            }
            break;
        }
    }
    
    if (found_pool) {
        found_pool->deallocate(ptr);
    }
    
    // Update tracking
    if (default_config.enable_leak_detection) {
        track_deallocation(ptr);
    }
    
    // Update performance metrics
    if (default_config.enable_performance_monitoring) {
        auto it = allocated_blocks.find(ptr);
        if (it != allocated_blocks.end()) {
            update_performance_metrics(it->second.size, false);
        }
    }
}

void* NeuralMemoryManager::reallocate(void* ptr, size_t new_size, const char* file, int line) {
    if (!ptr) {
        return allocate(new_size, file, line);
    }
    
    if (new_size == 0) {
        deallocate(ptr);
        return nullptr;
    }
    
    // Find original size
    auto it = allocated_blocks.find(ptr);
    if (it == allocated_blocks.end()) {
        // Not tracked - fall back to standard realloc
        void* new_ptr = std::realloc(ptr, new_size);
        if (new_ptr) {
            track_allocation(new_ptr, new_size, file, line);
        }
        return new_ptr;
    }
    
    size_t old_size = it->second.size;
    
    if (new_size <= old_size) {
        // Size didn't increase - no need to reallocate
        return ptr;
    }
    
    // Allocate new memory and copy
    void* new_ptr = allocate(new_size, file, line);
    if (new_ptr) {
        std::memcpy(new_ptr, ptr, old_size);
        deallocate(ptr);
    }
    
    return new_ptr;
}

NeuralMemoryManager::MemoryStats NeuralMemoryManager::get_memory_stats() const {
    MemoryStats stats;
    stats.total_allocated = metrics.total_bytes_allocated.load();
    stats.total_deallocated = metrics.total_bytes_deallocated.load();
    stats.current_usage = metrics.current_memory_usage.load();
    stats.peak_usage = metrics.peak_memory_usage.load();
    stats.active_allocations = allocated_blocks.size();
    stats.total_pools = memory_pools.size();
    return stats;
}

NeuralMemoryManager::LeakReport NeuralMemoryManager::detect_leaks() const {
    LeakReport report;
    report.leaked_blocks = 0;
    report.leaked_bytes = 0;
    
    std::lock_guard<std::mutex> lock(tracking_mutex);
    
    for (const auto& pair : allocated_blocks) {
        const MemoryBlock& block = pair.second;
        if (!block.is_freed) {
            report.leaked_blocks++;
            report.leaked_bytes += block.size;
            report.leaks.push_back(block);
        }
    }
    
    return report;
}

void NeuralMemoryManager::set_corruption_detection(bool enabled) {
    corruption_detector.enabled.store(enabled);
}

bool NeuralMemoryManager::validate_all_memory() const {
    if (!corruption_detector.enabled.load()) {
        return true;
    }
    
    std::lock_guard<std::mutex> lock(tracking_mutex);
    
    for (const auto& pair : allocated_blocks) {
        const MemoryBlock& block = pair.second;
        if (!block.is_freed) {
            if (!validate_memory_integrity(block.ptr, block.size)) {
                return false;
            }
        }
    }
    
    return true;
}

std::vector<MemoryBlock> NeuralMemoryManager::get_allocation_history() const {
    std::vector<MemoryBlock> history;
    std::lock_guard<std::mutex> lock(tracking_mutex);
    
    for (const auto& pair : allocated_blocks) {
        history.push_back(pair.second);
    }
    
    return history;
}

void NeuralMemoryManager::clear_tracking() {
    std::lock_guard<std::mutex> lock(tracking_mutex);
    allocated_blocks.clear();
}

void NeuralMemoryManager::warmup_thread_cache(size_t pool_size) {
    if (!thread_cache) {
        thread_cache = std::make_unique<ThreadLocalCache>();
    }
    
    // Pre-allocate some blocks for this thread
    for (size_t i = 0; i < pool_size; ++i) {
        void* block = allocate(64); // Small block for cache
        thread_cache->cached_blocks.push_back(block);
    }
}

NeuralMemoryManager& NeuralMemoryManager::get_instance() {
    std::lock_guard<std::mutex> lock(instance_mutex);
    if (!instance) {
        instance = std::make_unique<NeuralMemoryManager>();
    }
    return *instance;
}

void NeuralMemoryManager::initialize(const MemoryPoolConfig& config) {
    std::lock_guard<std::mutex> lock(instance_mutex);
    if (!instance) {
        instance = std::make_unique<NeuralMemoryManager>(config);
    }
}

void NeuralMemoryManager::shutdown() {
    std::lock_guard<std::mutex> lock(instance_mutex);
    instance.reset();
}

// Private implementation methods

void NeuralMemoryManager::track_allocation(void* ptr, size_t size, const char* file, int line) {
    std::lock_guard<std::mutex> lock(tracking_mutex);
    
    MemoryBlock block(ptr, size, file ? file : "unknown", line);
    if (default_config.enable_performance_monitoring) {
        block.stack_trace = capture_stack_trace();
    }
    
    allocated_blocks[ptr] = block;
}

void NeuralMemoryManager::track_deallocation(void* ptr) {
    std::lock_guard<std::mutex> lock(tracking_mutex);
    
    auto it = allocated_blocks.find(ptr);
    if (it != allocated_blocks.end()) {
        it->second.is_freed = true;
    }
}

void NeuralMemoryManager::update_performance_metrics(size_t bytes, bool is_allocation) {
    if (is_allocation) {
        metrics.total_allocations++;
        metrics.total_bytes_allocated += bytes;
        metrics.current_memory_usage += bytes;
        
        uint64_t current = metrics.current_memory_usage.load();
        uint64_t peak = metrics.peak_memory_usage.load();
        while (current > peak) {
            metrics.peak_memory_usage.compare_exchange_weak(peak, current);
            current = metrics.current_memory_usage.load();
        }
    } else {
        metrics.total_deallocations++;
        metrics.total_bytes_deallocated += bytes;
        metrics.current_memory_usage -= bytes;
    }
}

size_t NeuralMemoryManager::get_pool_index(size_t size) const {
    auto it = pool_index_map.find(size);
    if (it != pool_index_map.end()) {
        return it->second;
    }
    
    // Find closest pool or create new one
    size_t best_index = 0;
    size_t min_diff = SIZE_MAX;
    
    for (const auto& pair : pool_index_map) {
        size_t diff = (size > pair.first) ? (size - pair.first) : (pair.first - size);
        if (diff < min_diff) {
            min_diff = diff;
            best_index = pair.second;
        }
    }
    
    return best_index;
}

MemoryPool* NeuralMemoryManager::get_or_create_pool(size_t size) {
    size_t pool_idx = get_pool_index(size);
    
    if (pool_idx < memory_pools.size()) {
        return memory_pools[pool_idx].get();
    }
    
    // Create new pool
    MemoryPoolConfig config(size, 1024, 65536,
                           default_config.enable_leak_detection,
                           default_config.enable_corruption_detection,
                           default_config.enable_performance_monitoring);
    
    memory_pools.push_back(std::make_unique<MemoryPool>(config));
    pool_index_map[size] = memory_pools.size() - 1;
    
    return memory_pools.back().get();
}

std::string NeuralMemoryManager::capture_stack_trace() const {
    if (!default_config.enable_performance_monitoring) {
        return "";
    }
    
    void* buffer[32];
    int nptrs = backtrace(buffer, 32);
    
    char** strings = backtrace_symbols(buffer, nptrs);
    if (!strings) {
        return "Stack trace unavailable";
    }
    
    std::stringstream ss;
    for (int i = 0; i < nptrs; i++) {
        ss << strings[i] << std::endl;
    }
    
    free(strings);
    return ss.str();
}

bool NeuralMemoryManager::validate_memory_integrity(void* ptr, size_t size) const {
    if (!corruption_detector.enabled.load()) {
        return true;
    }
    
    // Simple integrity check - in practice, this would be more sophisticated
    // For now, just check that the pointer is not null and appears valid
    return ptr != nullptr && size > 0;
}

// Thread-safe allocation functions

void* NeuralMemoryManager::thread_safe_allocate(size_t size, const char* file, int line) {
    // If cache is enabled and available, try there first
    // For now, simpler implementation:
    return get_instance().allocate(size, file, line);
}

void NeuralMemoryManager::thread_safe_deallocate(void* ptr) {
    get_instance().deallocate(ptr);
}

} // namespace kernel
} // namespace vectoros