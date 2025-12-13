#!/usr/bin/env python3
"""
Test the complete execution pipeline with LM Studio integration and evolution
"""

import asyncio
import sys
sys.path.insert(0, 'src')

from substrate.execution_engine import SubstrateExecutionEngine

async def test_complete_execution_pipeline():
    """Test the complete execution pipeline with LM Studio and evolution."""
    print("🧪 Testing Complete Execution Pipeline with LM Studio Integration")

    # Initialize execution engine
    engine = SubstrateExecutionEngine("test_pipeline_substrate.db")
    await engine.start()

    # Test 1: Basic execution with LM Studio analysis
    print("\n1. Testing basic execution with LM Studio analysis...")

    simple_code = """
def calculate_sum(numbers):
    total = 0
    for num in numbers:
        total += num
    return total

# Test the function
data = [1, 2, 3, 4, 5]
result = calculate_sum(data)
print(f"Sum of {data} = {result}")
"""

    result = await engine.execute_with_lm_studio_analysis(
        simple_code,
        "sum_calculator",
        "Calculate sum of numbers"
    )

    assert result['original']['success'] == True
    print("   ✅ Basic execution with LM Studio analysis works")

    # Test 2: Complex ML execution with analysis
    print("\n2. Testing complex ML execution with LM Studio analysis...")

    ml_code = """
import numpy as np

class SimpleLinearRegression:
    def __init__(self):
        self.weights = None

    def fit(self, X, y, learning_rate=0.01, epochs=1000):
        # Add bias term
        X = np.c_[np.ones(X.shape[0]), X]

        # Initialize weights
        self.weights = np.zeros(X.shape[1])

        # Gradient descent
        for _ in range(epochs):
            predictions = X.dot(self.weights)
            errors = predictions - y
            gradient = X.T.dot(errors) / X.shape[0]
            self.weights -= learning_rate * gradient

        return self.weights

    def predict(self, X):
        if self.weights is None:
            raise ValueError("Model not fitted yet")
        X = np.c_[np.ones(X.shape[0]), X]
        return X.dot(self.weights)

# Test the model
model = SimpleLinearRegression()
X_train = np.array([[1], [2], [3], [4], [5]])
y_train = np.array([2, 4, 6, 8, 10])  # y = 2x

weights = model.fit(X_train, y_train)
print(f"Trained weights: {weights}")

# Make predictions
X_test = np.array([[6], [7]])
predictions = model.predict(X_test)
print(f"Predictions for {X_test.flatten()}: {predictions}")
"""

    ml_result = await engine.execute_with_lm_studio_analysis(
        ml_code,
        "linear_regression",
        "Simple linear regression implementation"
    )

    assert ml_result['original']['success'] == True
    print("   ✅ ML execution with LM Studio analysis works")

    # Test 3: Execution pipeline creation
    print("\n3. Testing execution pipeline creation...")

    # First create the vectors that will be in the pipeline
    await engine.executor.create_executable_vector(
        simple_code, "sum_calculator", "Calculate sum of numbers"
    )
    await engine.executor.create_executable_vector(
        ml_code, "linear_regression", "Simple linear regression implementation"
    )

    pipeline_result = await engine.create_execution_pipeline(
        "data_science_pipeline",
        ["sum_calculator", "linear_regression"]
    )

    assert 'pipeline_result' in pipeline_result
    print("   ✅ Execution pipeline creation works")

    # Test 4: Queue system
    print("\n4. Testing queue system...")

    queue_response = await engine.queue_execution({
        'type': 'execute_code',
        'name': 'queued_ml_test',
        'code': """
import numpy as np
data = np.random.rand(10)
mean = np.mean(data)
print(f"Mean of random data: {mean}")
"""
    })

    assert queue_response['status'] == 'queued'
    print("   ✅ Queue system works")

    # Test 5: Engine statistics and status
    print("\n5. Testing engine statistics...")

    status = await engine.get_engine_status()
    assert status['execution_count'] > 0
    assert status['success_rate'] > 0
    print(f"   ✅ Engine statistics: {status['execution_count']} executions, {status['success_rate']:.1%} success rate")

    # Test 6: Periodic evolution (simulated)
    print("\n6. Testing periodic evolution...")

    # Trigger evolution manually
    executables = engine.executor.get_executables()
    if len(executables) >= 1:
        await engine.evolution_agent.evolve_executable_vectors()
        print("   ✅ Periodic evolution triggered")

    # Test 7: Comprehensive analysis
    print("\n7. Testing comprehensive code analysis...")

    analysis = await engine.lm_studio.analyze_code_quality(ml_code, "python")
    assert 'code_quality_score' in analysis
    assert 'improvements' in analysis
    print(f"   ✅ Code analysis: Quality score {analysis['code_quality_score']}/10")

    # Test 8: Execution result analysis
    print("\n8. Testing execution result analysis...")

    execution_analysis = await engine.lm_studio.analyze_execution_results(
        ml_code,
        ml_result['original']
    )
    assert 'execution_analysis' in execution_analysis
    print("   ✅ Execution result analysis works")

    # Test 9: Improved code generation
    print("\n9. Testing improved code generation...")

    if analysis.get('improvements'):
        improved_code = await engine.lm_studio.generate_improved_code(ml_code, analysis)
        assert len(improved_code) > 0
        assert improved_code != ml_code
        print("   ✅ Improved code generation works")

    # Test 10: Complete system integration
    print("\n10. Testing complete system integration...")

    # Create a complex workflow
    workflow_code = """
def data_processing_pipeline(data):
    # Step 1: Normalize data
    mean = sum(data) / len(data)
    std = (sum((x - mean) ** 2 for x in data) / len(data)) ** 0.5
    normalized = [(x - mean) / std if std > 0 else x for x in data]

    # Step 2: Apply transformation
    transformed = [x * 2 + 1 for x in normalized]

    # Step 3: Calculate statistics
    stats = {
        'sum': sum(transformed),
        'mean': sum(transformed) / len(transformed),
        'min': min(transformed),
        'max': max(transformed)
    }

    return stats

# Test the pipeline
test_data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
result = data_processing_pipeline(test_data)
print(f"Pipeline result: {result}")
"""

    workflow_result = await engine.execute_with_lm_studio_analysis(
        workflow_code,
        "data_processing_pipeline",
        "Complete data processing workflow"
    )

    assert workflow_result['original']['success'] == True
    print("   ✅ Complete system integration works")

    # Final statistics
    final_status = await engine.get_engine_status()
    print(f"\n🎉 Complete execution pipeline test successful!")
    print(f"   Total executions: {final_status['execution_count']}")
    print(f"   Success rate: {final_status['success_rate']:.1%}")
    print(f"   Executables created: {final_status['executable_count']}")

    # Cleanup
    await engine.stop()

    print("\n✅ All tests passed! The complete execution pipeline is working perfectly!")

if __name__ == "__main__":
    asyncio.run(test_complete_execution_pipeline())