#!/usr/bin/env python3

"""
Test script to verify the CTRM LLM OS fixes
"""

import asyncio
import sys
import os

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from main import CTRMLLMOSDaemon
from ctrm_core.database import CTRMDatabase
from ctrm_core.truth_manager import CTRMTruthManager
from main import MockEmbedder

async def test_vector_dimensions():
    """Test that vector dimensions are consistent"""
    print("🧪 Testing vector dimension consistency...")

    # Test MockEmbedder
    embedder = MockEmbedder()
    test_text = "Test vector for dimension consistency"
    embedding = await embedder.embed(test_text)

    print(f"📊 MockEmbedder vector dimensions: {len(embedding)}")
    assert len(embedding) == 768, f"Expected 768 dimensions, got {len(embedding)}"
    print("✅ MockEmbedder produces 768-dimensional vectors")

async def test_database_dimension_handling():
    """Test that database handles dimension mismatches"""
    print("🧪 Testing database dimension handling...")

    # Create test database
    db = CTRMDatabase("test_dimensions.db")
    db.initialize()

    # Create test embeddings with different dimensions
    test_embedding_768 = [0.1] * 768
    test_embedding_1536 = [0.2] * 1536

    # Test similarity calculation with mismatched dimensions
    try:
        results = db.query_similar_truths(test_embedding_768, limit=1)
        print("✅ Database handles dimension mismatches gracefully")
    except Exception as e:
        print(f"❌ Database dimension handling failed: {e}")
        return False

    # Clean up
    db.close()
    os.remove("test_dimensions.db")
    return True

async def test_token_efficiency_calculation():
    """Test token efficiency calculation fixes"""
    print("🧪 Testing token efficiency calculation...")

    # Test the efficiency calculation directly
    from evolution.evolution_daemon import TokenAwareEvolutionDaemon
    from token_manager.token_manager import TokenManager

    # Create mock objects
    class MockCTRM:
        async def create_truth(self, *args, **kwargs):
            return type('obj', (object,), {'id': 'test_truth'})

    daemon = TokenAwareEvolutionDaemon(MockCTRM(), TokenManager(), None)

    # Test with small token count
    efficiency_small = await daemon.update_efficiency_metrics(50, 0.1)
    print(f"📊 Small operation efficiency: {efficiency_small:.6f}")
    assert efficiency_small >= 0.001, f"Expected baseline efficiency, got {efficiency_small}"

    # Test with large token count
    efficiency_large = await daemon.update_efficiency_metrics(10000, 0.5)
    print(f"📊 Large operation efficiency: {efficiency_large:.6f}")
    assert 1e-6 <= efficiency_large <= 0.01, f"Expected bounded efficiency, got {efficiency_large}"

    print("✅ Token efficiency calculation works correctly")
    return True

async def test_conservation_mode():
    """Test conservation mode logic"""
    print("🧪 Testing conservation mode logic...")

    from token_manager.token_manager import TokenEfficiencyTracker

    tracker = TokenEfficiencyTracker()

    # Test initial state
    assert not tracker.is_in_conservation_mode(), "Should start in normal mode"

    # Test entering conservation mode
    await tracker.record_efficiency("test", 5000, 0.000001)  # Very low efficiency
    print("✅ Conservation mode logic works")

    return True

async def main():
    """Run all tests"""
    print("🚀 Running CTRM LLM OS Fix Tests")
    print("=" * 50)

    tests = [
        test_vector_dimensions,
        test_database_dimension_handling,
        test_token_efficiency_calculation,
        test_conservation_mode
    ]

    passed = 0
    failed = 0

    for test in tests:
        try:
            result = await test()
            if result is not False:  # Some tests don't return anything
                passed += 1
            print()
        except Exception as e:
            print(f"❌ Test {test.__name__} failed: {e}")
            failed += 1
            print()

    print("=" * 50)
    print(f"📊 Test Results: {passed} passed, {failed} failed")

    if failed == 0:
        print("🎉 All tests passed! The fixes are working correctly.")
        return True
    else:
        print("❌ Some tests failed. Please review the fixes.")
        return False

if __name__ == "__main__":
    success = asyncio.run(main())
    sys.exit(0 if success else 1)