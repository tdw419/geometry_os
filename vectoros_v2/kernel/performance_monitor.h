
// VectorOS v2 Neural Performance Monitor
// Phase 2: Performance Optimization Layer

#pragma once

#include <string>
#include <chrono>
#include <vector>
#include <iostream>

namespace vectoros_v2 {

struct MetricSnapshot {
    std::string name;
    double value;
    std::string unit;
    std::chrono::system_clock::time_point timestamp;
};

class PerformanceMonitor {
private:
    std::vector<MetricSnapshot> metrics_;

public:
    PerformanceMonitor() = default;

    void log_metric(const std::string& name, double value, const std::string& unit) {
        metrics_.push_back({name, value, unit, std::chrono::system_clock::now()});
        std::cout << "[Monitor] " << name << ": " << value << " " << unit << std::endl;
    }

    void print_summary() {
        std::cout << "\n📊 --- Neural Performance Summary ---" << std::endl;
        for (const auto& m : metrics_) {
            std::cout << "  • " << m.name << ": " << m.value << " " << m.unit << std::endl;
        }
    }
};

} // namespace vectoros_v2
