#!/usr/bin/env python3
"""Simple test runner to verify quadtree integration."""
import sys

# Add project root to path
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

# Import test modules
from tests.test_gravity_engine_quadtree import TestGravityEngineQuadtreeMode, TestGravityEnginePerformance

def run_test(test_class, test_method):
    """Run a single test method."""
    instance = test_class()
    method = getattr(instance, test_method)
    try:
        method()
        print(f"  PASS: {test_class.__name__}.{test_method}")
        return True
    except AssertionError as e:
        print(f"  FAIL: {test_class.__name__}.{test_method}")
        print(f"        {e}")
        return False
    except Exception as e:
        print(f"  ERROR: {test_class.__name__}.{test_method}")
        print(f"         {type(e).__name__}: {e}")
        return False

def main():
    print("Running GravityEngine Quadtree Tests")
    print("=" * 60)

    results = []

    # Test class 1
    tests_1 = [
        "test_gravity_engine_quadtree_mode_default",
        "test_gravity_engine_small_n_uses_direct",
        "test_gravity_engine_large_n_uses_quadtree",
        "test_quadtree_forces_approximately_correct"
    ]

    for test in tests_1:
        results.append(run_test(TestGravityEngineQuadtreeMode, test))

    # Test class 2
    tests_2 = [
        "test_quadtree_faster_than_direct"
    ]

    for test in tests_2:
        results.append(run_test(TestGravityEnginePerformance, test))

    print("\n" + "=" * 60)
    passed = sum(results)
    total = len(results)
    print(f"Results: {passed}/{total} tests passed")

    if passed == total:
        print("SUCCESS: All tests passed!")
        return 0
    else:
        print("FAILURE: Some tests failed")
        return 1

if __name__ == "__main__":
    sys.exit(main())
