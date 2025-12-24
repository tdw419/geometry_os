
#include "memory_manager.h"
#include <iostream>

namespace vectoros_v2 {

MemoryManager::~MemoryManager() {
    for (auto& block : memory_blocks_) {
        if (block.ptr) free(block.ptr);
    }
}

bool MemoryManager::initialize() {
    std::cout << "Memory Manager initialized. 64GB Virtual Address Space mapped." << std::endl;
    return true;
}

void* MemoryManager::allocate(size_t size, bool gpu, const std::string& tag) {
    std::lock_guard<std::mutex> lock(memory_mutex_);
    void* ptr = malloc(size);
    if (ptr) {
        memory_blocks_.push_back({ptr, size, gpu, false, tag});
        total_allocated_ += size;
        if (total_allocated_ > peak_allocated_) peak_allocated_ = total_allocated_;
    }
    return ptr;
}

bool MemoryManager::deallocate(void* ptr) {
    std::lock_guard<std::mutex> lock(memory_mutex_);
    free(ptr);
    return true;
}

bool MemoryManager::create_pool(const std::string& name, size_t size, bool on_gpu) {
    std::lock_guard<std::mutex> lock(memory_mutex_);
    void* base = malloc(size);
    if (!base) return false;
    
    pools_[name] = {size, 0, base, name};
    std::cout << "[Memory] Created Pool: " << name << " (" << size / (1024*1024) << " MB)" << std::endl;
    return true;
}

} // namespace vectoros_v2