#pragma once
#include <string>
#include <vector>
#include <map>
#include <memory>
#include <random>
#include <cmath>
#include <algorithm>
#include <filesystem>
#include <fstream>
#include <iostream>
// #include <nlohmann/json.hpp> // Removed for compatibility

namespace VectorOS {

/**
 * Neural Blueprint System for VectorOS v2
 * Stores and manipulates neural network weights, tensors, and embeddings using GGUF format
 */
struct NeuralTensor {
    std::string name;
    std::vector<float> data;
    std::vector<int64_t> shape;
    std::string dtype;
    float scale = 1.0f;
    float zero_point = 0.0f;
    
    NeuralTensor() = default;
    NeuralTensor(const std::string& n, const std::vector<float>& d, const std::vector<int64_t>& s)
        : name(n), data(d), shape(s), dtype("float32") {}
    
    size_t size() const { return data.size(); }
    size_t elements() const { 
        return std::accumulate(shape.begin(), shape.end(), 1LL, std::multiplies<int64_t>());
    }
};

struct NeuralBlueprint {
    std::string id;
    std::string name;
    std::string type;
    std::map<std::string, NeuralTensor> tensors;
    std::map<std::string, NeuralTensor> embeddings;
    std::map<std::string, NeuralTensor> weights;
    std::map<std::string, std::string> metadata;
    double created_at;
    
    NeuralBlueprint() : created_at(0.0) {}
    NeuralBlueprint(const std::string& bp_id, const std::string& bp_name, const std::string& bp_type)
        : id(bp_id), name(bp_name), type(bp_type), created_at(std::time(nullptr)) {}
};

class NeuralBlueprintManager {
private:
    std::string base_path_;
    std::map<std::string, NeuralBlueprint> blueprints_;
    std::mt19937 rng_;
    
    std::string generate_id(const std::string& prefix = "bp") {
        std::uniform_int_distribution<int> dist(100000, 999999);
        return prefix + "_" + std::to_string(dist(rng_)) + "_" + 
               std::to_string(std::time(nullptr) % 1000000);
    }
    
    std::string tensor_hash(const NeuralTensor& tensor) {
        std::string data_str(reinterpret_cast<const char*>(tensor.data.data()), 
                           tensor.data.size() * sizeof(float));
        return std::to_string(std::hash<std::string>{}(data_str));
    }
    
    float cosine_similarity(const std::vector<float>& a, const std::vector<float>& b) {
        if (a.size() != b.size()) return 0.0f;
        
        float dot = 0.0f, norm_a = 0.0f, norm_b = 0.0f;
        for (size_t i = 0; i < a.size(); i++) {
            dot += a[i] * b[i];
            norm_a += a[i] * a[i];
            norm_b += b[i] * b[i];
        }
        
        if (norm_a == 0.0f || norm_b == 0.0f) return 0.0f;
        return dot / (std::sqrt(norm_a) * std::sqrt(norm_b));
    }
    
    NeuralTensor quantize_tensor(const NeuralTensor& tensor, int bits = 8) {
        NeuralTensor quantized = tensor;
        quantized.dtype = "uint8";
        
        float min_val = *std::min_element(tensor.data.begin(), tensor.data.end());
        float max_val = *std::max_element(tensor.data.begin(), tensor.data.end());
        float range = max_val - min_val;
        
        if (range == 0.0f) range = 1.0f;
        
        quantized.scale = range / 255.0f;
        quantized.zero_point = -min_val / quantized.scale;
        
        quantized.data.resize(tensor.data.size());
        for (size_t i = 0; i < tensor.data.size(); i++) {
            float quant = std::round((tensor.data[i] - min_val) / quantized.scale);
            quantized.data[i] = std::max(0.0f, std::min(255.0f, quant));
        }
        
        return quantized;
    }

public:
    NeuralBlueprintManager(const std::string& base_path = "blueprints_gguf") 
        : base_path_(base_path), rng_(std::random_device{}()) {
        std::filesystem::create_directories(base_path_);
    }
    
    std::string create_blueprint_from_tensor(const NeuralTensor& tensor,
                                           const std::string& name,
                                           const std::string& tensor_type = "weights") {
        std::string bp_id = generate_id("bp_tensor");
        
        NeuralBlueprint blueprint(bp_id, name, tensor_type);
        blueprint.tensors[tensor.name] = tensor;
        blueprint.metadata["tensor_type"] = tensor_type;
        blueprint.metadata["shape"] = std::to_string(tensor.shape.size());
        blueprint.metadata["dtype"] = tensor.dtype;
        blueprint.metadata["size"] = std::to_string(tensor.size());
        
        blueprints_[bp_id] = blueprint;
        
        std::cout << "[Blueprint] Created: " << bp_id << " (" << name << ")\n";
        return bp_id;
    }
    
    std::string create_blueprint_from_weights(const std::map<std::string, NeuralTensor>& weights,
                                            const std::string& name) {
        std::string bp_id = generate_id("bp_weights");
        
        NeuralBlueprint blueprint(bp_id, name, "neural_weights");
        blueprint.weights = weights;
        blueprint.metadata["num_layers"] = std::to_string(weights.size());
        blueprint.metadata["layer_names"] = "layers";
        
        for (const auto& [layer_name, weight] : weights) {
            blueprint.metadata["layer_" + layer_name] = layer_name;
        }
        
        blueprints_[bp_id] = blueprint;
        
        std::cout << "[Blueprint] Created: " << bp_id << " (" << name << ")\n";
        return bp_id;
    }
    
    std::string create_blueprint_from_embedding(const NeuralTensor& embeddings,
                                              const std::string& name,
                                              const std::vector<std::string>& ids = {}) {
        std::string bp_id = generate_id("bp_emb");
        
        NeuralBlueprint blueprint(bp_id, name, "embeddings");
        blueprint.embeddings["main"] = embeddings;
        blueprint.metadata["num_vectors"] = std::to_string(embeddings.shape[0]);
        blueprint.metadata["dim"] = std::to_string(embeddings.shape[1]);
        blueprint.metadata["embedding_ids"] = "ids";
        
        blueprints_[bp_id] = blueprint;
        
        std::cout << "[Blueprint] Created: " << bp_id << " (" << name << ")\n";
        return bp_id;
    }
    
    std::vector<std::pair<std::string, float>> search_similar_tensors(
        const NeuralTensor& query_tensor,
        const std::string& tensor_type = "weights",
        int top_k = 5) {
        
        std::vector<std::pair<std::string, float>> similarities;
        
        for (const auto& [bp_id, blueprint] : blueprints_) {
            if (blueprint.type != tensor_type) continue;
            
            for (const auto& [tensor_name, tensor] : blueprint.tensors) {
                if (tensor.shape == query_tensor.shape) {
                    float similarity = cosine_similarity(query_tensor.data, tensor.data);
                    similarities.emplace_back(bp_id, similarity);
                }
            }
            
            for (const auto& [weight_name, weight] : blueprint.weights) {
                if (weight.shape == query_tensor.shape) {
                    float similarity = cosine_similarity(query_tensor.data, weight.data);
                    similarities.emplace_back(bp_id, similarity);
                }
            }
        }
        
        std::sort(similarities.begin(), similarities.end(),
                 [](const auto& a, const auto& b) { return a.second > b.second; });
        
        if (similarities.size() > top_k) {
            similarities.resize(top_k);
        }
        
        return similarities;
    }
    
    NeuralTensor blend_tensors(const std::string& bp_id1,
                              const std::string& bp_id2,
                              const std::string& tensor_name1,
                              const std::string& tensor_name2,
                              float alpha = 0.5f) {
        
        auto it1 = blueprints_.find(bp_id1);
        auto it2 = blueprints_.find(bp_id2);
        
        if (it1 == blueprints_.end() || it2 == blueprints_.end()) {
            throw std::runtime_error("Blueprint not found");
        }
        
        const NeuralBlueprint& bp1 = it1->second;
        const NeuralBlueprint& bp2 = it2->second;
        
        const NeuralTensor* tensor1 = nullptr;
        const NeuralTensor* tensor2 = nullptr;
        
        // Find tensors
        auto find_tensor = [](const NeuralBlueprint& bp, const std::string& name) -> const NeuralTensor* {
            if (bp.tensors.count(name)) return &bp.tensors.at(name);
            if (bp.weights.count(name)) return &bp.weights.at(name);
            return nullptr;
        };
        
        tensor1 = find_tensor(bp1, tensor_name1);
        tensor2 = find_tensor(bp2, tensor_name2);
        
        if (!tensor1 || !tensor2) {
            throw std::runtime_error("Tensor not found in blueprint");
        }
        
        if (tensor1->shape != tensor2->shape) {
            throw std::runtime_error("Tensor shapes don't match");
        }
        
        NeuralTensor blended;
        blended.name = "blended_" + tensor_name1 + "_" + tensor_name2;
        blended.shape = tensor1->shape;
        blended.dtype = "float32";
        blended.data.resize(tensor1->data.size());
        
        for (size_t i = 0; i < tensor1->data.size(); i++) {
            blended.data[i] = tensor1->data[i] * alpha + tensor2->data[i] * (1.0f - alpha);
        }
        
        return blended;
    }
    
    NeuralTensor mutate_tensor(const std::string& bp_id,
                              const std::string& tensor_name,
                              float mutation_rate = 0.1f,
                              float mutation_strength = 0.01f) {
        
        auto it = blueprints_.find(bp_id);
        if (it == blueprints_.end()) {
            throw std::runtime_error("Blueprint not found");
        }
        
        const NeuralBlueprint& blueprint = it->second;
        
        const NeuralTensor* tensor = nullptr;
        if (blueprint.tensors.count(tensor_name)) {
            tensor = &blueprint.tensors.at(tensor_name);
        } else if (blueprint.weights.count(tensor_name)) {
            tensor = &blueprint.weights.at(tensor_name);
        }
        
        if (!tensor) {
            throw std::runtime_error("Tensor not found in blueprint");
        }
        
        NeuralTensor mutated = *tensor;
        
        std::normal_distribution<float> noise_dist(0.0f, mutation_strength);
        
        for (size_t i = 0; i < mutated.data.size(); i++) {
            if (static_cast<float>(rng_()) / std::mt19937::max() < mutation_rate) {
                mutated.data[i] += noise_dist(rng_);
            }
        }
        
        return mutated;
    }
    
    NeuralTensor compress_tensor(const std::string& bp_id,
                                const std::string& tensor_name,
                                const std::string& method = "quantize") {
        
        auto it = blueprints_.find(bp_id);
        if (it == blueprints_.end()) {
            throw std::runtime_error("Blueprint not found");
        }
        
        const NeuralBlueprint& blueprint = it->second;
        
        const NeuralTensor* tensor = nullptr;
        if (blueprint.tensors.count(tensor_name)) {
            tensor = &blueprint.tensors.at(tensor_name);
        } else if (blueprint.weights.count(tensor_name)) {
            tensor = &blueprint.weights.at(tensor_name);
        }
        
        if (!tensor) {
            throw std::runtime_error("Tensor not found in blueprint");
        }
        
        if (method == "quantize") {
            return quantize_tensor(*tensor);
        }
        
        return *tensor; // Return original if no compression
    }
    
    const NeuralBlueprint* get_blueprint(const std::string& bp_id) const {
        auto it = blueprints_.find(bp_id);
        return (it != blueprints_.end()) ? &it->second : nullptr;
    }
    
    std::vector<std::string> get_all_blueprint_ids() const {
        std::vector<std::string> ids;
        for (const auto& [id, _] : blueprints_) {
            ids.push_back(id);
        }
        return ids;
    }
    
    void import_brain(const std::string& path) {
        std::cout << "[Blueprint] Importing Brain from: " << path << std::endl;
        std::ifstream file(path);
        if (!file.is_open()) {
            std::cerr << "   ❌ Failed to open file." << std::endl;
            return;
        }
        
        // Simple manual parsing for demo purposes (robust JSON parsing would be used in prod)
        std::string line;
        std::string name = "Unknown_Brain";
        std::string tensor_name;
        std::vector<float> data;
        
        while (std::getline(file, line)) {
            if (line.find("\"name\":") != std::string::npos) {
                size_t start = line.find(": \"") + 3;
                size_t end = line.find("\"", start);
                name = line.substr(start, end - start);
            }
            if (line.find("\"simulated_data\":") != std::string::npos) {
                // Parse simple array: [0.1, -0.5, ...]
                size_t start = line.find("[") + 1;
                size_t end = line.find("]");
                std::string nums = line.substr(start, end - start);
                
                std::stringstream ss(nums);
                std::string val_str;
                while (std::getline(ss, val_str, ',')) {
                    data.push_back(std::stof(val_str));
                }
            }
        }
        
        // Construct the imported tensor
        if (!data.empty()) {
            NeuralTensor imported_tensor(name + "_cortex", data, {(int64_t)data.size()});
            std::string id = create_blueprint_from_tensor(imported_tensor, name, "imported_brain");
            std::cout << "   ✅ Brain '" << name << "' successfully imported (" << data.size() << " params)." << std::endl;
        }
    }

    void print_statistics() const {
        std::cout << "\n[Blueprint] Statistics:\n";
        std::cout << "  Total Blueprints: " << blueprints_.size() << "\n";
        
        std::map<std::string, int> type_counts;
        for (const auto& [id, bp] : blueprints_) {
            type_counts[bp.type]++;
        }
        
        for (const auto& [type, count] : type_counts) {
            std::cout << "  " << type << ": " << count << "\n";
        }
    }
};

} // namespace VectorOS
