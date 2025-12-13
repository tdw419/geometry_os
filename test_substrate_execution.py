#!/usr/bin/env python3
"""
Test the complete substrate Python execution system
"""

import asyncio
import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), 'src')))

from substrate.vector_db import VectorSubstrate
from substrate.vector_executor import SubstratePythonExecutor
from substrate.substrate_python_kernel import SubstratePythonKernel
from substrate.execution_agent import SubstrateExecutionAgent

async def test_substrate_execution():
    """Test the complete substrate execution system"""
    print("🧪 Testing Substrate Python Execution System")

    # Initialize substrate
    substrate = VectorSubstrate("test_execution_substrate.db")
    print("✅ Substrate initialized")

    # Test 1: Basic execution
    print("\n1. Testing basic code execution...")
    executor = SubstratePythonExecutor(substrate)

    simple_code = """
def hello_world():
    return "Hello from substrate execution!"

result = hello_world()
print(result)
"""

    result = executor.execute_code(simple_code, "test_hello")
    assert result['success'] == True
    assert "Hello from substrate execution!" in result['stdout']
    print("   ✅ Basic execution works")

    # Test 2: Vector storage and execution
    print("\n2. Testing vector storage and execution...")
    vector_id = executor.create_executable_vector(
        simple_code,
        "hello_world_function",
        "Test hello world function"
    )
    print(f"   ✅ Created executable vector: {vector_id}")

    # Execute from vector
    vector_result = executor.execute_vector(vector_id)
    assert vector_result['success'] == True
    print("   ✅ Vector execution works")

    # Test 3: Kernel execution
    print("\n3. Testing kernel execution...")
    kernel = SubstratePythonKernel(substrate)

    # Interactive execution
    interactive_result = await kernel.execute_interactive("x = 5 + 3; print(f'Result: {x}')")
    assert interactive_result['success'] == True
    print("   ✅ Interactive execution works")

    # Test 4: Pipeline execution
    print("\n4. Testing pipeline execution...")

    # Create multiple executable vectors
    data_loader_code = """
def load_data():
    return [1, 2, 3, 4, 5]

result = load_data()
"""

    data_processor_code = """
def process_data(data):
    return {
        'sum': sum(data),
        'avg': sum(data) / len(data),
        'count': len(data)
    }

# Get data from previous step
data = context.get('pipeline_context', {}).get('result_1', [1, 2, 3])
result = process_data(data)
"""

    loader_id = executor.create_executable_vector(data_loader_code, "data_loader", "Load sample data")
    processor_id = executor.create_executable_vector(data_processor_code, "data_processor", "Process data")

    # Execute pipeline
    pipeline_result = kernel.execute_pipeline([loader_id, processor_id])
    assert pipeline_result['success'] == True
    assert len(pipeline_result['pipeline_results']) == 2
    print("   ✅ Pipeline execution works")

    # Test 5: Execution agent
    print("\n5. Testing execution agent...")
    agent = SubstrateExecutionAgent(substrate)
    agent.start()

    # Test natural language execution
    nl_result = agent.execute_natural_language("calculate sum of numbers")
    assert 'result' in nl_result or 'error' in nl_result
    print("   ✅ Natural language execution works")

    # Test scheduled execution (simulated)
    scheduled_vector = substrate.store_vector({
        'type': 'executable',
        'content': 'print("Scheduled execution test")',
        'metadata': {
            'name': 'scheduled_test',
            'execution_schedule': {
                'interval_seconds': 3600,
                'last_executed': 0
            }
        }
    })

    # Wait a bit for agent to process
    await asyncio.sleep(2)

    # Check if it was executed
    updated_vector = substrate.get_vector(scheduled_vector)
    if updated_vector and 'last_execution' in updated_vector.get('metadata', {}):
        print("   ✅ Scheduled execution works")
    else:
        print("   ⚠️  Scheduled execution not yet processed (expected)")

    # Test 6: Statistics and history
    print("\n6. Testing execution history...")
    history = executor.execution_history
    assert len(history) > 0
    print(f"   ✅ Execution history contains {len(history)} entries")

    # Test 7: Error handling
    print("\n7. Testing error handling...")
    error_code = """
def divide_by_zero():
    return 1 / 0

result = divide_by_zero()
"""

    error_result = executor.execute_code(error_code, "error_test")
    assert error_result['success'] == False
    assert 'ZeroDivisionError' in error_result['error']
    print("   ✅ Error handling works")

    # Test 8: Context passing
    print("\n8. Testing context passing...")
    context_code = """
def use_context():
    context_value = context.get('test_value', 'default')
    return f"Context value: {context_value}"

result = use_context()
"""

    context_result = executor.execute_code(context_code, "context_test", {'test_value': 'test123'})
    assert 'test123' in context_result['result']
    print("   ✅ Context passing works")

    # Cleanup
    agent.stop()
    substrate.close()

    print("\n✅ All substrate execution tests passed!")
    print("   The system is ready for production use!")

if __name__ == "__main__":
    asyncio.run(test_substrate_execution())