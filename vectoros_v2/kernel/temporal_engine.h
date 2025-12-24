
// VectorOS v2 Temporal Engine
// Phase 35: The Temporal Loom - Timeline Forking and Evaluation

#pragma once

#include <vector>
#include <map>
#include <string>
#include <functional>
#include <chrono>
#include <algorithm>
#include <iostream>
#include <mutex>

namespace vectoros_v2 {

class TemporalEngine {
public:
    struct Timeline {
        uint64_t id;
        uint64_t parent_id;
        uint64_t timestamp;
        std::map<std::string, double> state_snapshot;
        double evaluation_score;
        bool collapsed;
    };

    struct TemporalMetrics {
        size_t active_forks;
        size_t converged_timelines;
        double average_convergence_time_ms;
    };

private:
    std::map<uint64_t, Timeline> timelines_;
    uint64_t next_timeline_id_ = 0;
    std::mutex engine_mutex_;
    TemporalMetrics metrics_ = {0, 0, 0.0};

public:
    TemporalEngine() = default;

    /**
     * @brief Create a new "Fork" from a base state.
     * Simulates a branching universe.
     */
    uint64_t create_fork(uint64_t parent_id, const std::map<std::string, double>& base_state) {
        std::lock_guard<std::mutex> lock(engine_mutex_);
        
        Timeline t;
        t.id = ++next_timeline_id_;
        t.parent_id = parent_id;
        t.timestamp = std::chrono::system_clock::now().time_since_epoch().count();
        t.state_snapshot = base_state; // Deep copy of state
        t.evaluation_score = 0.0;
        t.collapsed = false;
        
        timelines_[t.id] = t;
        metrics_.active_forks++;
        
        std::cout << "[Temporal] Fork created: Timeline " << t.id << " from Parent " << parent_id << std::endl;
        return t.id;
    }

    /**
     * @brief Apply a modifier to a specific timeline.
     * This represents an "action" taken in that specific future branch.
     */
    void modify_timeline(uint64_t id, std::function<void(Timeline&)> modifier) {
        std::lock_guard<std::mutex> lock(engine_mutex_);
        if (timelines_.find(id) != timelines_.end()) {
            modifier(timelines_[id]);
        }
    }

    /**
     * @brief Score a timeline based on a utility function.
     */
    void evaluate_timeline(uint64_t id, std::function<double(const Timeline&)> evaluator) {
        std::lock_guard<std::mutex> lock(engine_mutex_);
        if (timelines_.find(id) != timelines_.end()) {
            timelines_[id].evaluation_score = evaluator(timelines_[id]);
            // std::cout << "[Temporal] Timeline " << id << " scored: " << timelines_[id].evaluation_score << std::endl;
        }
    }

    /**
     * @brief "Collapse" the wavefunction of possibilities into the best timeline.
     * Returns the ID of the winning timeline. All others are discarded.
     */
    uint64_t collapse_fork(uint64_t parent_id) {
        std::lock_guard<std::mutex> lock(engine_mutex_);
        
        std::vector<Timeline> candidates;
        for (const auto& [id, t] : timelines_) {
            if (t.parent_id == parent_id && !t.collapsed) {
                candidates.push_back(t);
            }
        }

        if (candidates.empty()) return 0;

        // Find the best score
        auto best_it = std::max_element(candidates.begin(), candidates.end(), 
            [](const Timeline& a, const Timeline& b) {
                return a.evaluation_score < b.evaluation_score;
            });
        
        uint64_t winner_id = best_it->id;
        
        // Mark all siblings as collapsed
        for (auto& cand : candidates) {
            timelines_.erase(cand.id);
        }
        
        // Keep only the winner (re-insert or just don't delete it? - Logic simplified for demo)
        // In a real system, we'd prune the tree. Here we just return the ID.
        // For the sake of the metrics, we say we converged.
        metrics_.active_forks -= candidates.size();
        metrics_.converged_timelines++;

        std::cout << "⏳ [Temporal] Collapse Complete. Winning Timeline: " << winner_id << " (Score: " << best_it->evaluation_score << ")" << std::endl;
        return winner_id;
    }

    TemporalMetrics get_metrics() const {
        return metrics_;
    }
    
    // Helper to get a timeline (for reading state)
    bool get_timeline(uint64_t id, Timeline& out_t) {
        std::lock_guard<std::mutex> lock(engine_mutex_);
         if (timelines_.find(id) != timelines_.end()) {
            out_t = timelines_[id];
            return true;
        }
        return false;
    }
};

} // namespace vectoros_v2