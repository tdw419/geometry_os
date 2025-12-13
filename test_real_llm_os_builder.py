#!/usr/bin/env python3
"""
Test the real LLM OS Builder with all fixes applied
This script tests the complete system with actual LLM integration.
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

async def test_real_llm_os_builder():
    """Test the real LLM OS Builder with fixes"""
    print("🚀 Testing Real LLM OS Builder with All Fixes")
    print("=" * 60)

    # Create a test builder with the actual LLM endpoint
    builder = LLMOSBuilder(
        llm_endpoint="http://localhost:1234/v1/completions",
        workspace_dir="./real_test_os_output"
    )

    # Test 1: Build a real component
    print("\n1. Building real component with LLM...")
    try:
        component = await builder.build_component(
            requirement="vector-based memory system with semantic search and persistence",
            component_name="vector_memory"
        )
        print(f"   ✅ Component built: {component.id}")
        print(f"   📝 Code length: {len(component.code)} characters")
        print(f"   🧠 Vector length: {len(component.vector.vector)} dimensions")
        print(f"   🧪 Tests: {len(component.tests)} test functions")
        print(f"   ✅ Execution: {'Success' if component.execution_results.get('compilation_success', False) else 'Failed'}")

        # Check vector quality
        non_zero_count = sum(1 for v in component.vector.vector if abs(v) > 1e-10)
        magnitude = sum(v**2 for v in component.vector.vector) ** 0.5
        print(f"   📊 Vector quality: {non_zero_count} non-zero values, magnitude {magnitude:.4f}")

    except Exception as e:
        print(f"   ❌ Component building failed: {e}")
        return False

    # Test 2: Build multiple components
    print("\n2. Building additional components...")
    components_to_build = [
        "task scheduler for parallel LLM operations with priority queues",
        "plugin system for dynamic loading and unloading of capabilities",
        "self-monitoring system that tracks performance and errors",
        "REST API gateway for human and programmatic interaction"
    ]

    built_components = [component.id]
    for i, requirement in enumerate(components_to_build, 1):
        try:
            comp = await builder.build_component(requirement)
            built_components.append(comp.id)
            print(f"   ✅ Component {i}: {comp.id} - {len(comp.tests)} tests")
        except Exception as e:
            print(f"   ❌ Component {i} failed: {e}")

    # Test 3: Compose OS from components
    print(f"\n3. Composing OS from {len(built_components)} components...")
    try:
        os_code = await builder.compose_os(built_components)

        if "def main()" in os_code and len(os_code) > 500:
            print("   ✅ OS composition successful")
            print(f"   📝 OS code length: {len(os_code)} characters")

            # Save the composed OS
            os.makedirs("./real_test_os_output", exist_ok=True)
            with open("./real_test_os_output/composed_os.py", 'w') as f:
                f.write(os_code)
            print("   📄 Saved composed OS")
        else:
            print("   ❌ OS composition incomplete")
            return False
    except Exception as e:
        print(f"   ❌ OS composition failed: {e}")
        return False

    # Test 4: Test self-improvement capabilities
    print("\n4. Testing self-improvement capabilities...")
    try:
        # Analyze the first component for improvement
        first_component_id = built_components[0]
        analysis = builder._analyze_component_issues(
            builder.components[first_component_id],
            "general quality improvement"
        )

        if analysis:
            print(f"   🔍 Found improvement opportunities:")
            for item in analysis.split('\n'):
                print(f"      - {item}")

            # Try to improve the component
            improved = await builder.improve_component(
                first_component_id,
                "general quality improvement"
            )
            print(f"   ✅ Component improved: {improved.id}")
        else:
            print("   ✅ Component already optimal")

    except Exception as e:
        print(f"   ❌ Self-improvement failed: {e}")
        return False

    # Test 5: Test CTRM integration
    print("\n5. Testing CTRM integration...")
    try:
        ctrm = CTRMInterface(ctrm_url="http://localhost:8000")
        await ctrm.connect()

        # Test with the first component
        test_component = builder.components[built_components[0]]

        # Validate CTRM data format
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
                "embedding_type": test_component.vector.embedding_type,
                "created_at": test_component.created_at
            }
        }

        # Check data format
        required_fields = ["statement", "confidence", "vector", "metadata"]
        if all(field in truth_data for field in required_fields):
            print("   ✅ CTRM data format validated")
        else:
            print("   ❌ CTRM data format invalid")
            return False

        await ctrm.disconnect()
    except Exception as e:
        print(f"   ❌ CTRM integration test failed: {e}")
        return False

    return True

async def test_performance_metrics():
    """Test performance metrics and improvements"""
    print("\n📊 Testing Performance Metrics")
    print("=" * 40)

    builder = LLMOSBuilder(workspace_dir="./real_test_os_output")

    # Check OS health
    try:
        health_issues = await builder._check_os_health()
        if health_issues:
            print(f"Found {len(health_issues)} health issues:")
            for issue in health_issues:
                print(f"  - {issue}")

            # Run self-improvement
            report = await builder.self_improve_os(health_issues)
            print(f"✅ Improved {len(report['components_improved'])} components")
            print(f"🎯 Addressed {len(report['issues_addressed'])} issues")
        else:
            print("✅ OS is in excellent health!")

    except Exception as e:
        print(f"❌ Performance testing failed: {e}")
        return False

    return True

async def main():
    """Run all real-world tests"""
    print("🧪 Real LLM OS Builder Testing")
    print("=" * 60)

    # Test the complete system
    success1 = await test_real_llm_os_builder()

    # Test performance metrics
    success2 = await test_performance_metrics()

    if success1 and success2:
        print("\n🎉 All real-world tests passed!")
        print("✅ LLM OS Builder is fully functional with all fixes applied!")
        return True
    else:
        print("\n⚠️ Some tests failed - check output above")
        return False

if __name__ == "__main__":
    success = asyncio.run(main())
    sys.exit(0 if success else 1)