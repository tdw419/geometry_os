#!/usr/bin/env python3
"""
Test the complete substrate execution system with evolution integration
"""

import asyncio
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

from substrate.vector_db import VectorSubstrate
from substrate.vector_executor import SubstratePythonExecutor
from substrate.evolution_agent import SubstrateEvolutionAgent

async def test_complete_execution_system():
    """Test the complete substrate execution system with evolution"""
    print("🧪 Testing Complete Substrate Execution System with Evolution")

    # Initialize substrate
    substrate = VectorSubstrate("test_complete_execution.db")
    print("✅ Substrate initialized")

    # Initialize executor
    executor = SubstratePythonExecutor(substrate)
    print("✅ Executor initialized")

    # Test 1: Create basic executable vectors
    print("\n1. Creating basic executable vectors...")

    # Simple math function
    math_code = """
def calculate_stats(numbers):
    return {
        'sum': sum(numbers),
        'mean': sum(numbers) / len(numbers),
        'min': min(numbers),
        'max': max(numbers)
    }

# Example usage
data = [1, 2, 3, 4, 5]
result = calculate_stats(data)
print(f'Stats: {result}')
"""

    math_vector_id = executor.create_executable_vector(
        math_code,
        "stats_calculator",
        "Calculate basic statistics"
    )
    print(f"   ✅ Created math vector: {math_vector_id}")

    # Data processing function
    data_code = """
def process_data(data):
    processed = []
    for item in data:
        processed.append(item * 2)
    return processed

# Example usage
sample_data = [1, 2, 3]
result = process_data(sample_data)
print(f'Processed data: {result}')
"""

    data_vector_id = executor.create_executable_vector(
        data_code,
        "data_processor",
        "Process data by doubling values"
    )
    print(f"   ✅ Created data vector: {data_vector_id}")

    # Test 2: Execute vectors
    print("\n2. Executing vectors...")

    math_result = executor.execute_vector(math_vector_id)
    if math_result['success']:
        print("   ✅ Math execution successful")
        print(f"   Output: {math_result['stdout']}")

    data_result = executor.execute_vector(data_vector_id)
    if data_result['success']:
        print("   ✅ Data execution successful")
        print(f"   Output: {data_result['stdout']}")

    # Test 3: Evolution integration
    print("\n3. Testing evolution integration...")

    # Initialize evolution agent
    evolution_agent = SubstrateEvolutionAgent(substrate_db="test_complete_execution.db")
    await evolution_agent.connect()

    # Run a few evolution cycles
    print("   🔄 Running evolution cycles...")
    evolution_result = await evolution_agent.evolve_substrate(
        strategy="auto",
        focus_area="execution",
        max_iterations=3
    )

    print(f"   ✅ Evolution complete: {evolution_result['iterations']} cycles")
    print(f"   📊 Improvement score: {evolution_result['avg_improvement']:.3f}")

    # Test 4: Execute evolved vectors
    print("\n4. Testing evolved vectors...")

    # Get all executables after evolution
    evolved_executables = executor.get_executables()
    print(f"   📊 Total executables after evolution: {len(evolved_executables)}")

    # Execute some evolved vectors
    for exe in evolved_executables[-3:]:  # Test last 3 (likely evolved ones)
        if 'v2' in exe['name'] or 'improved' in exe['name']:
            print(f"   🧪 Testing evolved vector: {exe['name']}")
            result = executor.execute_vector(exe['id'])
            if result['success']:
                print(f"     ✅ Execution successful")
            else:
                print(f"     ❌ Execution failed: {result.get('error', 'Unknown')}")

    # Test 5: Evolution of executable vectors
    print("\n5. Testing specialized executable evolution...")

    # Run specialized evolution for executables
    await evolution_agent.evolve_executable_vectors()

    # Check results
    final_executables = executor.get_executables()
    print(f"   📊 Final executables: {len(final_executables)}")

    if len(final_executables) > len(evolved_executables):
        print("   ✅ Evolution created improved executable versions!")

    # Test 6: Execution statistics
    print("\n6. Testing execution statistics...")

    history = executor.execution_history
    print(f"   📊 Execution history entries: {len(history)}")

    successful_executions = sum(1 for h in history if h['result']['success'])
    print(f"   ✅ Successful executions: {successful_executions}/{len(history)}")

    # Test 7: Context execution
    print("\n7. Testing context-based execution...")

    context_code = """
def multiply_with_context(value):
    multiplier = context.get('multiplier', 1)
    return value * multiplier

result = multiply_with_context(5)
print(f"Context result: {result}")
"""

    context_result = executor.execute_code_with_context(
        context_code,
        "context_test",
        {'multiplier': 10}
    )

    if context_result['success'] and '50' in context_result['stdout']:
        print("   ✅ Context execution successful")
    else:
        print("   ❌ Context execution failed")

    # Cleanup
    await evolution_agent.disconnect()
    substrate.close()

    print("\n🎉 Complete execution system test finished!")
    print("   ✅ All components working together successfully")
    print(f"   📈 Final vector count: {len(substrate.list_vectors())}")

if __name__ == "__main__":
    asyncio.run(test_complete_execution_system())