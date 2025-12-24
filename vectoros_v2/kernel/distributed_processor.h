// VectorOS v2 Distributed Neural Processor Header
// Phase 3: Distributed Neural Processing Implementation

#pragma once

#include <string>
#include <vector>
#include <thread>
#include <atomic>
#include <memory>
#include <mutex>
#include <condition_variable>
#include <functional>
#include <map>
#include <queue>
#include <iostream>
#include <sstream>

namespace vectoros_v2 {

struct ProcessingNode {
    int node_id;
    std::thread worker_thread;
    std::atomic<bool> running{false};
    std::atomic<bool> busy{false};
    std::queue<std::function<void()>> task_queue;
    std::mutex queue_mutex;
    std::condition_variable cv;
};

class DistributedProcessor {
private:
    std::vector<std::unique_ptr<ProcessingNode>> nodes_;
    std::atomic<int> node_count_{0};
    std::atomic<int> active_nodes_{0};
    std::atomic<bool> distributed_mode_{false};
    mutable std::mutex nodes_mutex_;
    
    // Load balancing
    std::atomic<int> next_node_index_{0};
    std::vector<int> node_load_;  // Use regular int instead of atomic for vector

public:
    DistributedProcessor() = default;
    
    /**
     * @brief Initialize distributed processing with specified node count
     */
    void initialize_distributed_processing(int node_count) {
        std::lock_guard<std::mutex> lock(nodes_mutex_);
        
        if (distributed_mode_.load()) {
            shutdown_distributed_processing();
        }
        
        node_count_ = node_count;
        node_load_.resize(node_count, 0);  // Initialize with 0
        
        for (int i = 0; i < node_count; ++i) {
            auto node = std::make_unique<ProcessingNode>();
            node->node_id = i;
            node->running = true;
            node->worker_thread = std::thread(&DistributedProcessor::worker_loop, this, node.get());
            nodes_.push_back(std::move(node));
        }
        
        distributed_mode_ = true;
        active_nodes_ = node_count;
        
        std::cout << "[Distributed] Initialized " << node_count << " processing nodes" << std::endl;
    }
    
    /**
     * @brief Submit a task for distributed processing
     */
    void submit_distributed_task(std::function<void()> task) {
        if (!distributed_mode_.load() || active_nodes_.load() == 0) {
            // Fallback to single-threaded execution
            task();
            return;
        }
        
        // Round-robin load balancing
        int target_node = next_node_index_.fetch_add(1) % node_count_.load();
        
        {
            std::lock_guard<std::mutex> lock(nodes_mutex_);
            auto& node = nodes_[target_node];
            if (node && node->running.load()) {
                std::lock_guard<std::mutex> queue_lock(node->queue_mutex);
                node->task_queue.push(task);
                node_load_[target_node]++;
                node->cv.notify_one();
            }
        }
    }
    
    /**
     * @brief Get current distributed processing status
     */
    std::string get_distributed_status() const {
        std::stringstream ss;
        ss << "[Distributed] Nodes: " << active_nodes_.load() << "/" << node_count_.load();
        ss << ", Mode: " << (distributed_mode_.load() ? "ACTIVE" : "INACTIVE");
        
        // Load tracking disabled for now due to atomic issues
        
        return ss.str();
    }
    
    /**
     * @brief Shutdown distributed processing gracefully
     */
    void shutdown_distributed_processing() {
        std::lock_guard<std::mutex> lock(nodes_mutex_);
        
        if (!distributed_mode_.load()) return;
        
        distributed_mode_ = false;
        
        // Signal all nodes to stop
        for (auto& node : nodes_) {
            if (node) {
                node->running = false;
                node->cv.notify_all();
            }
        }
        
        // Wait for all threads to complete
        for (auto& node : nodes_) {
            if (node && node->worker_thread.joinable()) {
                node->worker_thread.join();
            }
        }
        
        nodes_.clear();
        node_load_.clear();
        active_nodes_ = 0;
        
        std::cout << "[Distributed] Shutdown complete" << std::endl;
    }
    
    /**
     * @brief Check if distributed processing is available
     */
    bool is_distributed_mode() const {
        return distributed_mode_.load() && active_nodes_.load() > 0;
    }
    
    /**
     * @brief Get optimal node count for current system
     */
    static int get_optimal_node_count() {
        int hardware_threads = std::thread::hardware_concurrency();
        return std::max(1, hardware_threads - 1); // Reserve one core for main thread
    }

private:
    void worker_loop(ProcessingNode* node) {
        while (node->running.load()) {
            std::function<void()> task;
            
            {
                std::unique_lock<std::mutex> lock(node->queue_mutex);
                
                // Wait for task or shutdown signal
                node->cv.wait(lock, [node] {
                    return !node->task_queue.empty() || !node->running.load();
                });
                
                if (!node->running.load() && node->task_queue.empty()) {
                    break;
                }
                
                if (!node->task_queue.empty()) {
                    task = std::move(node->task_queue.front());
                    node->task_queue.pop();
                    node->busy = true;
                }
            }
            
            // Execute task
            if (task) {
                try {
                    task();
                } catch (const std::exception& e) {
                    std::cerr << "[Distributed] Node " << node->node_id << " error: " << e.what() << std::endl;
                }
                
                node->busy = false;
            }
        }
    }
};

} // namespace vectoros_v2