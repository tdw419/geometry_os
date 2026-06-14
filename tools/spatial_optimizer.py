import subprocess
import json
import re
import os
import time

# --- Configuration ---
TEST_NAME = "vm::tests_middle_out::test_neuron_xor_training"
OLLAMA_MODEL = "phi4" # Fast, reasoning-capable model

# Path to the file we'll modify to tune parameters
TARGET_FILE = "src/vm/ops_substrate.rs"

def run_test():
    """Runs the cargo test and extracts the fitness signal (accuracy/weights)."""
    print(f"[Optimizer] Running {TEST_NAME}...")
    try:
        result = subprocess.run(
            ["cargo", "test", TEST_NAME, "--features", "gpu", "--", "--nocapture"],
            capture_output=True,
            text=True,
            timeout=60
        )
        output = result.stdout + result.stderr
        
        # Extract fitness signals from stdout
        # Looking for lines like: [TEST] Post-training weights: A=255, B=255
        weight_match = re.search(r"Post-training weights: A=(\d+), B=(\d+)", output)
        passed = "test result: ok" in output
        
        wa = int(weight_match.group(1)) if weight_match else 0
        wb = int(weight_match.group(2)) if weight_match else 0
        
        # Fitness Score: 0.0 to 1.0
        # Criteria: Did it pass? And how strong were the weights?
        fitness = 0.0
        if passed:
            fitness += 0.5
            # Reward saturated weights (confidence)
            fitness += (wa / 255.0) * 0.25
            fitness += (wb / 255.0) * 0.25
            
        print(f"[Optimizer] Test Result: {'PASS' if passed else 'FAIL'} | Fitness: {fitness:.2f} (Weights: {wa}, {wb})")
        return fitness, output
    except Exception as e:
        print(f"[Optimizer] Error running test: {e}")
        return 0.0, str(e)

def get_ollama_proposal(history):
    """Asks Ollama to propose new hyperparameters based on history."""
    prompt = f"""
You are a Spatial Circuit Optimizer for Geometry OS. Your goal is to tune hyperparameters for a 2-layer neural network on a 2D substrate.
Input format: JSON list of previous trials (threshold, bump_size, decay_rate, fitness).

HISTORY:
{json.dumps(history, indent=2)}

GOAL: Maximize fitness (1.0).
CONSTRAINTS: 
- Threshold: 100-500
- Bump Size: 1-50
- Decay Rate: 0-100 (maps to 0.0 to 0.39)

Provide the next set of parameters in JSON format:
{{ "threshold": int, "bump_size": int, "decay_rate": int, "reasoning": str }}
"""
    try:
        # Note: This assumes a CLI 'ollama' tool is available as per developer environment norms
        result = subprocess.run(
            ["ollama", "run", OLLAMA_MODEL, prompt],
            capture_output=True,
            text=True
        )
        # Extract JSON from Ollama's response
        match = re.search(r"\{.*\}", result.stdout, re.DOTALL)
        if match:
            return json.loads(match.group(0))
    except Exception as e:
        print(f"[Optimizer] Ollama Error: {e}")
    
    return {"threshold": 200, "bump_size": 10, "decay_rate": 1}

def apply_parameters(params):
    """Patches the Rust source code with new parameters."""
    print(f"[Optimizer] Applying Params: Threshold={params['threshold']}, Weight={params.get('weight', 100)}")
    with open(TARGET_FILE, "r") as f:
        content = f.read()
    
    # Patch Threshold (H1 marker)
    content = re.sub(r"let threshold = \d+u32; // H1", f"let threshold = {params['threshold']}u32; // H1", content)
    
    # Patch Weight (W1 marker)
    if "weight" in params:
        content = re.sub(r"let weight = \d+u32; // W1", f"let weight = {params['weight']}u32; // W1", content)
    
    with open(TARGET_FILE, "w") as f:
        f.write(content)

def main():
    history = []
    for generation in range(5):
        print(f"\n--- Generation {generation} ---")
        
        # 1. Propose
        proposal = get_ollama_proposal(history)
        
        # 2. Apply
        apply_parameters(proposal)
        
        # 3. Evaluate
        fitness, logs = run_test()
        
        # 4. Record
        history.append({
            "threshold": proposal["threshold"],
            "bump_size": proposal["bump_size"],
            "decay_rate": proposal["decay_rate"],
            "fitness": fitness
        })
        
        if fitness >= 0.95:
            print("[Optimizer] Optimal parameters found!")
            break

if __name__ == "__main__":
    main()
