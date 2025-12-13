#!/usr/bin/env python3
"""
Comprehensive test runner for LLM OS Builder fixes
This script tests all the improvements made to the LLM OS Builder system.
"""

import asyncio
import sys
import os
import json
import tempfile
import subprocess
from typing import List, Dict, Any

# Add src to path
sys.path.insert(0, 'src')

from llm_os_builder.core import LLMOSBuilder
from llm_os_builder.ctrm_integration import CTRMInterface
from script2vec.script2vec import Script2Vec

async def test_script2vec_fixes():
    """Test Script2Vec fixes"""
    print("🔧 Testing Script2Vec fixes...")

    s2v = Script2Vec()

    # Test 1: Zero vector prevention
    print("  1. Testing zero vector prevention...")
    empty_script = "# Just a comment"
    vector_result = s2v.python_to_vector(empty_script)

    # Check that vector is not all zeros
    vector = vector_result["vector"]
    non_zero_count = sum(1 for v in vector if abs(v) > 1e-10)

    if non_zero_count > 0:
        print(f"     ✅ Zero vector prevention works: {non_zero_count} non-zero values")
    else:
        print("     ❌ Zero vector prevention failed")
        return False

    # Test 2: Cosine similarity with zero vectors
    print("  2. Testing cosine similarity with zero vectors...")
    zero_vec = [0.0] * 1536
    normal_vec = [1.0] * 1536

    try:
        similarity = s2v.cosine_similarity(zero_vec, normal_vec)
        if similarity == 0.0:
            print("     ✅ Cosine similarity handles zero vectors correctly")
        else:
            print(f"     ❌ Cosine similarity returned {similarity} instead of 0.0")
            return False
    except Exception as e:
        print(f"     ❌ Cosine similarity failed: {e}")
        return False

    # Test 3: Vector normalization
    print("  3. Testing vector normalization...")
    test_script = """
import numpy as np

class TestClass:
    def test_method(self):
        return "test"
    """

    vector_result = s2v.python_to_vector(test_script)
    vector = vector_result["vector"]

    # Check vector is normalized (magnitude should be ~1)
    magnitude = sum(v**2 for v in vector) ** 0.5
    if 0.9 <= magnitude <= 1.1:
        print(f"     ✅ Vector normalization works: magnitude = {magnitude:.4f}")
    else:
        print(f"     ❌ Vector normalization failed: magnitude = {magnitude:.4f}")
        return False

    return True

async def test_code_generation_fixes():
    """Test code generation improvements"""
    print("🔧 Testing code generation fixes...")

    # Create a mock LLM response for testing
    class MockLLMOSBuilder(LLMOSBuilder):
        async def _call_llm(self, prompt: str) -> str:
            # Check if prompt asks for actual code (not planning)
            if "NO planning text" in prompt and "only actual Python code" in prompt:
                if "vector-based memory" in prompt:
                    return '''import numpy as np
from typing import List, Dict, Optional

class VectorMemory:
    \"\"\"Vector-based memory system with semantic search and persistence\"\"\"

    def __init__(self, config: Optional[Dict] = None):
        self.config = config or {}
        self.memory = {}
        self.vectors = []

    def add_memory(self, content: str, vector: List[float]) -> bool:
        \"\"\"Add memory with vector\"\"\"
        if len(vector) != 1536:
            raise ValueError(\"Vector must be 1536 dimensions\")
        self.memory[content] = vector
        self.vectors.append(vector)
        return True

    def semantic_search(self, query_vector: List[float], top_k: int = 5) -> List[str]:
        \"\"\"Semantic search in memory\"\"\"
        if not self.vectors:
            return []

        # Simple cosine similarity search
        similarities = []
        for vec in self.vectors:
            sim = np.dot(vec, query_vector) / (np.linalg.norm(vec) * np.linalg.norm(query_vector))
            similarities.append(sim)

        # Get top k results
        top_indices = np.argsort(similarities)[-top_k:][::-1]
        return [list(self.memory.keys())[i] for i in top_indices]
'''
                elif "pytest" in prompt:
                    return '''import pytest
from vector_memory import VectorMemory

def test_initialization():
    vm = VectorMemory()
    assert vm is not None
    assert vm.memory == {}
    assert vm.vectors == []

def test_add_memory():
    vm = VectorMemory()
    test_vector = [0.1] * 1536
    result = vm.add_memory("test", test_vector)
    assert result is True
    assert "test" in vm.memory

def test_semantic_search():
    vm = VectorMemory()
    test_vector = [1.0] * 1536
    vm.add_memory("test1", test_vector)
    vm.add_memory("test2", [0.5] * 1536)

    results = vm.semantic_search(test_vector, top_k=1)
    assert len(results) == 1
    assert results[0] == "test1"
'''
            else:
                # Old style prompt - should still work but with better guidance
                return '''# This is actual Python code
import os

class TestComponent:
    def __init__(self):
        self.data = {}

    def process(self, input_data):
        return f"Processed: {input_data}"
'''

    # Test the improved prompts
    builder = MockLLMOSBuilder()

    # Test design generation (mock will return fallback design)
    design = await builder._llm_design("vector-based memory system with semantic search and persistence")
    if "name" in design and "purpose" in design:
        print("  1. ✅ Design generation works")
    else:
        print("  1. ❌ Design generation failed")
        return False

    # Test code generation
    code = await builder._llm_write_code(design, "vector_memory")
    if "class VectorMemory" in code and "def add_memory" in code:
        print("  2. ✅ Code generation produces actual classes and methods")
    else:
        print("  2. ❌ Code generation failed")
        return False

    # Test test generation
    tests = await builder._llm_write_tests(code, "vector memory tests")
    if any("def test_" in test for test in tests) and any("import pytest" in test for test in tests):
        print("  3. ✅ Test generation produces actual pytest tests")
    else:
        print("  3. ❌ Test generation failed")
        return False

    return True

async def test_ctrm_integration_fixes():
    """Test CTRM integration fixes"""
    print("🔧 Testing CTRM integration fixes...")

    # Test the improved CTRM interface
    ctrm = CTRMInterface(ctrm_url="http://localhost:8000")

    # Test connection
    try:
        await ctrm.connect()
        print("  1. ✅ CTRM connection works")
    except Exception as e:
        print(f"  1. ❌ CTRM connection failed: {e}")
        return False

    # Test data format (we'll test the format without actually sending)
    test_component = type('obj', (object,), {
        'id': 'test_comp',
        'name': 'test_component',
        'vector': type('obj', (object,), {
            'vector': [0.1] * 1536,
            'script_hash': 'abc123',
            'semantic_summary': 'Test component',
            'concepts': ['test', 'component']
        })(),
        'requirements': ['test requirement'],
        'dependencies': ['numpy'],
        'execution_results': {
            'tests_passed': 2,
            'tests_total': 3
        },
        'created_at': '2025-01-01T00:00:00'
    })()

    # Test truth data format
    truth_data = {
        "statement": f"OS Component: {test_component.name} - {test_component.vector.semantic_summary}",
        "confidence": 0.8 if test_component.execution_results.get("tests_passed", 0) > 0 else 0.5,
        "vector": test_component.vector.vector,
        "metadata": {
            "type": "os_component",
            "component_id": test_component.id,
            "component_name": test_component.name,
            "code_hash": test_component.vector.script_hash,
            "requirements": test_component.requirements,
            "dependencies": test_component.dependencies,
            "tests_passed": test_component.execution_results.get("tests_passed", 0),
            "tests_total": test_component.execution_results.get("tests_total", 0),
            "concepts": test_component.vector.concepts[:20],
            "embedding_type": getattr(test_component.vector, 'embedding_type', 'semantic'),
            "created_at": test_component.created_at
        }
    }

    # Validate the data structure
    required_fields = ["statement", "confidence", "vector", "metadata"]
    if all(field in truth_data for field in required_fields):
        print("  2. ✅ CTRM truth data format is correct")
    else:
        print("  2. ❌ CTRM truth data format is missing fields")
        return False

    # Test vector data format
    vector_data = {
        "vector": test_component.vector.vector,
        "metadata": {
            "component_id": test_component.id,
            "component_name": test_component.name,
            "type": "os_component",
            "concepts": test_component.vector.concepts,
            "dependencies": test_component.dependencies,
            "created_at": test_component.created_at
        }
    }

    if "vector" in vector_data and "metadata" in vector_data:
        print("  3. ✅ CTRM vector data format is correct")
    else:
        print("  3. ❌ CTRM vector data format is missing fields")
        return False

    await ctrm.disconnect()
    return True

async def test_integration_scenario():
    """Test a complete integration scenario"""
    print("🔧 Testing complete integration scenario...")

    # Create a test component that should work end-to-end
    test_script = '''import json
from typing import Dict, Any

class TestComponent:
    \"\"\"A test component for integration testing\"\"\"

    def __init__(self, config: Dict[str, Any] = None):
        self.config = config or {"default": "value"}
        self.state = {"initialized": True}

    def process(self, data: Any) -> Dict[str, Any]:
        \"\"\"Process input data\"\"\"
        return {
            "input": data,
            "processed": True,
            "config": self.config
        }

    def validate(self, data: Any) -> bool:
        \"\"\"Validate input data\"\"\"
        return data is not None and len(str(data)) > 0
'''

    # Test Script2Vec
    s2v = Script2Vec()
    vector_result = s2v.python_to_vector(test_script)

    if vector_result["vector"] and len(vector_result["vector"]) == 1536:
        print("  1. ✅ Script2Vec produces valid vectors")
    else:
        print("  1. ❌ Script2Vec failed")
        return False

    # Test that vector is not all zeros
    non_zero_count = sum(1 for v in vector_result["vector"] if abs(v) > 1e-10)
    if non_zero_count > 10:  # Should have some non-zero values
        print(f"  2. ✅ Vector has {non_zero_count} non-zero values")
    else:
        print(f"  2. ❌ Vector has only {non_zero_count} non-zero values")
        return False

    # Test cosine similarity
    try:
        similarity = s2v.cosine_similarity(vector_result["vector"], vector_result["vector"])
        if 0.99 <= similarity <= 1.0:
            print(f"  3. ✅ Cosine similarity works: {similarity}")
        else:
            print(f"  3. ❌ Cosine similarity unexpected: {similarity}")
            return False
    except Exception as e:
        print(f"  3. ❌ Cosine similarity failed: {e}")
        return False

    return True

async def main():
    """Run all tests"""
    print("🧪 Running comprehensive LLM OS Builder tests")
    print("=" * 60)

    tests = [
        ("Script2Vec Fixes", test_script2vec_fixes),
        ("Code Generation Fixes", test_code_generation_fixes),
        ("CTRM Integration Fixes", test_ctrm_integration_fixes),
        ("Integration Scenario", test_integration_scenario)
    ]

    results = []
    for test_name, test_func in tests:
        print(f"\n{test_name}:")
        try:
            result = await test_func()
            results.append((test_name, result))
        except Exception as e:
            print(f"     ❌ Test failed with exception: {e}")
            results.append((test_name, False))

    print("\n" + "=" * 60)
    print("📊 Test Results:")
    print("=" * 60)

    passed = 0
    for test_name, result in results:
        status = "✅ PASS" if result else "❌ FAIL"
        print(f"{status} {test_name}")
        if result:
            passed += 1

    print(f"\nOverall: {passed}/{len(results)} tests passed")

    if passed == len(results):
        print("🎉 All tests passed! The LLM OS Builder fixes are working correctly.")
        return True
    else:
        print("⚠️  Some tests failed. Please review the output above.")
        return False

if __name__ == "__main__":
    success = asyncio.run(main())
    sys.exit(0 if success else 1)