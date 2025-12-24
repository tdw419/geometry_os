// VectorOS v2 Cross-Component Neural Pattern Sharing Header
// Phase 3: Cross-Component Neural Pattern Sharing

#pragma once

#include <string>
#include <vector>
#include <map>
#include <memory>
#include <mutex>
#include <atomic>
#include <functional>
#include <chrono>
#include <iostream>
#include <sstream>

namespace vectoros_v2 {

struct NeuralPattern {
    std::string pattern_id;
    std::string component_source;
    std::string pattern_type;
    std::vector<double> pattern_data;
    std::chrono::high_resolution_clock::time_point created_at;
    std::chrono::high_resolution_clock::time_point last_accessed;
    int access_count;
    double quality_score;
};

class PatternSharingManager {
private:
    std::map<std::string, NeuralPattern> shared_patterns_;
    std::map<std::string, std::vector<std::string>> component_patterns_;
    mutable std::mutex patterns_mutex_;
    std::atomic<int> total_patterns_{0};
    std::atomic<int> shared_accesses_{0};
    
    // Pattern compression and optimization
    std::atomic<bool> compression_enabled_{true};
    std::atomic<double> compression_threshold_{0.8};

public:
    PatternSharingManager() = default;
    
    /**
     * @brief Register a neural pattern for sharing
     */
    void register_pattern(const std::string& component, const std::string& pattern_type, 
                         const std::vector<double>& pattern_data, double quality_score = 1.0) {
        std::lock_guard<std::mutex> lock(patterns_mutex_);
        
        std::string pattern_id = generate_pattern_id(component, pattern_type);
        
        NeuralPattern pattern;
        pattern.pattern_id = pattern_id;
        pattern.component_source = component;
        pattern.pattern_type = pattern_type;
        pattern.pattern_data = pattern_data;
        pattern.created_at = std::chrono::high_resolution_clock::now();
        pattern.last_accessed = pattern.created_at;
        pattern.access_count = 0;
        pattern.quality_score = quality_score;
        
        shared_patterns_[pattern_id] = pattern;
        component_patterns_[component].push_back(pattern_id);
        total_patterns_++;
        
        std::cout << "[Pattern] Registered: " << pattern_id << " from " << component << std::endl;
    }
    
    /**
     * @brief Retrieve a shared neural pattern
     */
    std::vector<double> get_shared_pattern(const std::string& pattern_id) {
        std::lock_guard<std::mutex> lock(patterns_mutex_);
        
        auto it = shared_patterns_.find(pattern_id);
        if (it != shared_patterns_.end()) {
            it->second.last_accessed = std::chrono::high_resolution_clock::now();
            it->second.access_count++;
            shared_accesses_++;
            
            std::cout << "[Pattern] Accessed: " << pattern_id << " (Total accesses: " << shared_accesses_.load() << ")" << std::endl;
            return it->second.pattern_data;
        }
        
        return {};
    }
    
    /**
     * @brief Find patterns by component and type
     */
    std::vector<std::string> find_patterns(const std::string& component, const std::string& pattern_type) const {
        std::lock_guard<std::mutex> lock(patterns_mutex_);
        
        std::vector<std::string> results;
        for (const auto& [pattern_id, pattern] : shared_patterns_) {
            if (pattern.component_source == component && pattern.pattern_type == pattern_type) {
                results.push_back(pattern_id);
            }
        }
        return results;
    }
    
    /**
     * @brief Get pattern statistics
     */
    std::string get_pattern_statistics() const {
        std::stringstream ss;
        ss << "[Pattern] Total: " << total_patterns_.load();
        ss << ", Shared Accesses: " << shared_accesses_.load();
        ss << ", Components: " << component_patterns_.size();
        
        // Show component distribution
        ss << ", Distribution: [";
        bool first = true;
        for (const auto& [component, patterns] : component_patterns_) {
            if (!first) ss << ", ";
            ss << component << "(" << patterns.size() << ")";
            first = false;
        }
        ss << "]";
        
        return ss.str();
    }
    
    /**
     * @brief Optimize patterns by removing low-quality or unused patterns
     */
    void optimize_patterns() {
        std::lock_guard<std::mutex> lock(patterns_mutex_);
        
        auto now = std::chrono::high_resolution_clock::now();
        auto one_hour_ago = now - std::chrono::hours(1);
        
        int removed_count = 0;
        std::vector<std::string> to_remove;
        
        for (const auto& [pattern_id, pattern] : shared_patterns_) {
            // Remove patterns that are old, low quality, and rarely accessed
            if (pattern.last_accessed < one_hour_ago && 
                pattern.quality_score < compression_threshold_.load() && 
                pattern.access_count < 5) {
                to_remove.push_back(pattern_id);
            }
        }
        
        for (const auto& pattern_id : to_remove) {
            shared_patterns_.erase(pattern_id);
            removed_count++;
        }
        
        if (removed_count > 0) {
            std::cout << "[Pattern] Optimized: Removed " << removed_count << " unused patterns" << std::endl;
        }
    }
    
    /**
     * @brief Enable or disable pattern compression
     */
    void set_compression_enabled(bool enabled) {
        compression_enabled_ = enabled;
        std::cout << "[Pattern] Compression " << (enabled ? "enabled" : "disabled") << std::endl;
    }
    
    /**
     * @brief Get patterns by quality score threshold
     */
    std::vector<std::string> get_high_quality_patterns(double min_quality = 0.8) const {
        std::vector<std::string> results;
        std::lock_guard<std::mutex> lock(patterns_mutex_);
        
        for (const auto& [pattern_id, pattern] : shared_patterns_) {
            if (pattern.quality_score >= min_quality) {
                results.push_back(pattern_id);
            }
        }
        
        return results;
    }

private:
    std::string generate_pattern_id(const std::string& component, const std::string& pattern_type) {
        auto now = std::chrono::high_resolution_clock::now();
        auto timestamp = std::chrono::duration_cast<std::chrono::milliseconds>(
            now.time_since_epoch()).count();
        
        return component + "_" + pattern_type + "_" + std::to_string(timestamp);
    }
};

} // namespace vectoros_v2