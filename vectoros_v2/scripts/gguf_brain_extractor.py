
import os
import sys
import struct
import numpy as np
import json
import time

# Mock GGUF extraction for demonstration if gguf lib is missing
# In a real scenario, we would import gguf
try:
    import gguf
except ImportError:
    gguf = None

def extract_brain(gguf_path, output_name, layers=None):
    """
    Extracts specific tensors from a GGUF file and packages them into a VectorOS Blueprint.
    """
    print(f"🧠 [Neurosurgeon] Opening GGUF: {gguf_path}")
    
    blueprint = {
        "id": f"bp_{int(time.time())}",
        "name": output_name,
        "type": "extracted_brain",
        "tensors": {},
        "metadata": {
            "source": os.path.basename(gguf_path),
            "extraction_date": time.ctime()
        }
    }

    if gguf and os.path.exists(gguf_path):
        reader = gguf.GGUFReader(gguf_path)
        # print(f"   - Architecture: {reader.architecture.name}") # Attribute not available in this version
        
        for tensor in reader.tensors:
            if layers and not any(l in tensor.name for l in layers):
                continue
                
            print(f"   - Extracting: {tensor.name} {tensor.shape}")
            # In a real implementation, we'd read the data. 
            # For this demo/mock, we simulate the extraction or read if possible.
            # data = tensor.data 
            
            # Since we can't easily Serialize huge numpy arrays to simple JSON for this C++ loader demo,
            # We will save metadata here. The C++ loader would typically mmap this or read a binary blob.
            # For this MVP, we'll create a "Skill Vector" simulation.
            
            blueprint["tensors"][tensor.name] = {
                "shape": [int(d) for d in tensor.shape],
                "dtype": str(tensor.tensor_type),
                # "data_offset": tensor.offset # For binary reading
                "simulated_data": [0.0] * 4 # Placeholder for metadata-only demonstration
            }
    else:
        print("   ⚠️  GGUF library not found or file missing. Simulating extraction...")
        # Simulation of extracting a "Reasoning Head"
        blueprint["tensors"]["blk.12.attn.q.weight"] = {
            "shape": [4096, 4096],
            "dtype": "float32",
            "simulated_data": [0.1, -0.5, 0.2, 0.9] # Truncated
        }
        blueprint["tensors"]["blk.12.ffn.up.weight"] = {
            "shape": [11008, 4096],
            "dtype": "float32",
            "simulated_data": [0.8, 0.1, -0.1, 0.5] # Truncated
        }

    output_file = f"blueprints_gguf/{output_name}.json"
    with open(output_file, "w") as f:
        # Use compact JSON for easier parsing in the simple C++ demo loader
        json.dump(blueprint, f)
        
    print(f"✨ [Neurosurgeon] Brain extracted to {output_file}")
    return output_file

def scan_and_extract(root_path):
    """
    Recursively scans for GGUF models and extracts their brains.
    """
    print(f"🦁 [Neurosurgeon] Scanning for specimens in {root_path}...")
    gguf_files = []
    for root, dirs, files in os.walk(root_path):
        for file in files:
            if file.endswith(".gguf"):
                gguf_files.append(os.path.join(root, file))
    
    print(f"   found {len(gguf_files)} GGUF models.")
    
    for i, gguf_path in enumerate(gguf_files):
        filename = os.path.basename(gguf_path)
        name = os.path.splitext(filename)[0]
        
        # Heuristic Categorization
        intelligence_type = "General"
        if any(x in name.lower() for x in ["coder", "sql", "dev", "python"]):
            intelligence_type = "Coding"
        elif any(x in name.lower() for x in ["chat", "instruct", "creative", "story"]):
            intelligence_type = "Creative"
        
        brain_name = f"{intelligence_type}_{name.replace('-', '_')}"
        
        print(f"\n[{i+1}/{len(gguf_files)}] Harvesting {intelligence_type} Intelligence from: {name}")
        
        # Extract the first 2 layers as the "Brain Stem"
        try:
            extract_brain(gguf_path, brain_name, layers=["blk.0", "blk.1"])
        except Exception as e:
            print(f"   ❌ Extraction Failed: {e}")

if __name__ == "__main__":
    # Mass Extraction from the User's Model Library
    models_dir = "/home/jericho/zion/ai/llms/models/"
    if os.path.exists(models_dir):
        scan_and_extract(models_dir)
    else:
        print(f"Directory not found: {models_dir}")
