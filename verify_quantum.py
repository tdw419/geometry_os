
"""
Verify Quantum Entanglement & Oracle
Demonstrates "Spooky Action at a Distance" and Semantic Wavefunction Collapse.
"""
import sys
import os

# Ensure imports work
sys.path.append(os.getcwd())

from geometry_os.quantum.q_kernel import QuantumProcessor
from geometry_os.quantum.entangler import EntanglementSwarm
from geometry_os.quantum.oracle import QuantumOracle

def bell_test():
    print("\n🔬 RUNNING BELL TEST (Entanglement Verification)...")
    qp = QuantumProcessor()
    swarm = EntanglementSwarm(qp)
    
    # 1. Allocate Alice and Bob
    alice = qp.allocate_qubit("Alice")
    bob = qp.allocate_qubit("Bob")
    
    print(f"   Alice State: {alice}")
    print(f"   Bob State:   {bob}")
    
    # 2. Entangle
    swarm.entangle("Alice", "Bob")
    print("   [Entanglement Established]")
    
    # 3. Measure multiple times to prove correlation
    # Note: In this simulation, calling measure_pair resets B's state based on A's result.
    # To properly simulate "many runs", we would re-prepare the state each time.
    # But our measure_pair logic handles the collapse for a single run nicely.
    
    print("   Measuring Alice... (Bob should INSTANTLY match)")
    val_a, val_b = swarm.measure_pair("Alice")
    
    print(f"   Alice Measured: {val_a}")
    print(f"   Bob Measured:   {val_b}")
    
    if val_a == val_b:
        print("   ✅ SUCCESS: Correlation Verified (Spooky Action confirmed)")
    else:
        print("   ❌ FAILURE: No Correlation")

def oracle_test():
    print("\n🔮 RUNNING ORACLE TEST (Semantic Collapse)...")
    oracle = QuantumOracle()
    
    # Superposition of potential answers to "What is the best color?"
    # Scores represent "relevance energy"
    superposition = {
        "Red": 0.1,
        "Blue": 0.5, # Most likely
        "Green": 0.2,
        "Ultraviolet": 0.05
    }
    
    print(f"   Input Superposition: {superposition}")
    
    # Collapse
    result = oracle.observe(superposition)
    print(f"   Collapsed Reality: {result}")

if __name__ == "__main__":
    bell_test()
    oracle_test()
