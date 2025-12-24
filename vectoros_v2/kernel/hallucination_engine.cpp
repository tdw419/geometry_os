#include "hallucination_engine.h"
#include <iostream>
#include <sstream>
#include <cmath>

namespace VectorOS {

std::string HallucinationEngine::decode_tensor_to_code(const NeuralTensor& tensor) {
    // SIMULATION: Real detokenization is complex.
    // We map the "Concept Average" to specific code templates.
    
    float avg = 0.0f;
    if (!tensor.data.empty()) {
        for (float v : tensor.data) avg += v;
        avg /= tensor.data.size();
    }

    std::stringstream code;
    code << "// HALLUCINATED MODULE\n";
    code << "// Concept Signature: " << avg << "\n\n";
    code << "#include <iostream>\n";
    code << "#include <cmath>\n\n";

    if (avg > 0.7f) {
        // High Intensity -> Optimization Algorithm
        code << "extern \"C\" void manifested_function() {\n";
        code << "    std::cout << \"[Hallucination] Executing High-Energy Optimization Loop...\" << std::endl;\n";
        code << "    double result = 0;\n";
        code << "    for(int i=0; i<1000; i++) result += std::sin(i) * std::cos(i);\n";
        code << "    std::cout << \"[Hallucination] Result: \" << result << std::endl;\n";
        code << "}\n";
    } else if (avg > 0.3f) {
        // Medium Intensity -> Data Processing
        code << "extern \"C\" void manifested_function() {\n";
        code << "    std::cout << \"[Hallucination] Processing Neural Data Stream...\" << std::endl;\n";
        code << "    // Simulated processing\n"; 
        code << "    std::cout << \"[Hallucination] Data Stream Synchronized.\" << std::endl;\n";
        code << "}\n";
    } else {
        // Low Intensity -> System Sleep/Idle
        code << "extern \"C\" void manifested_function() {\n";
        code << "    std::cout << \"[Hallucination] System entering deep contemplation...\" << std::endl;\n";
        code << "}\n";
    }

    code << "\nint main() { manifested_function(); return 0; }\n";
    return code.str();
}

bool HallucinationEngine::manifest_functionality(NeuralProjectDrive& drive, const NeuralTensor& concept_tensor, const std::string& filename) {
    std::cout << "[Hallucination] 🔮 Materializing tensor '" << concept_tensor.name << "' into code..." << std::endl;
    
    // 1. Decode (Think)
    std::string source_code = decode_tensor_to_code(concept_tensor);
    
    // 2. Inject (Write)
    if (drive.inject_source(filename, source_code)) {
         // 3. Compile (Build)
        return drive.build("g++ " + filename + " -o " + filename + ".bin");
    } else {
        std::cerr << "[Hallucination] Failed to inject source code." << std::endl;
        return false;
    }
}

std::string HallucinationEngine::explain_hallucination(const NeuralTensor& tensor) {
    return "Tensor " + tensor.name + " represents a latent coding concept.";
}

} // namespace VectorOS
