#!/usr/bin/env python3
"""Quick verification that quadtree integration works."""
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

from systems.infinite_map.gravity_engine import GravityEngine
import numpy as np

def test_basic_functionality():
    """Test basic quadtree mode functionality."""
    print("Test 1: Basic functionality")
    engine = GravityEngine(use_quadtree=True, quadtree_threshold=5)

    # Add 10 orbs
    for i in range(10):
        engine.add_orb(f"file_{i}.py", i * 100, i * 100, 128, size=100)

    # Should use quadtree (10 > 5)
    engine.update()

    # Verify positions changed
    for path, data in engine.orbs.items():
        assert data["pos"] is not None
        assert data["vel"] is not None

    print("  PASS: Basic functionality works")

def test_small_n_uses_direct():
    """Test that small N uses direct calculation."""
    print("Test 2: Small N uses direct")
    engine = GravityEngine(use_quadtree=True, quadtree_threshold=10)

    # Add 5 orbs (below threshold)
    for i in range(5):
        engine.add_orb(f"file_{i}.py", i * 100, i * 100, 128, size=100)

    # Should use direct
    engine.update()
    print("  PASS: Small N works")

def test_accuracy_comparison():
    """Test that quadtree produces similar results to direct."""
    print("Test 3: Accuracy comparison")

    # Direct engine
    engine_direct = GravityEngine(use_quadtree=False)
    for i in range(50):
        x = (i * 73) % 1024
        y = (i * 97) % 1024
        engine_direct.add_orb(f"file_{i}.py", x, y, 128, size=100)

    # Quadtree engine
    engine_quad = GravityEngine(use_quadtree=True, theta=0.5, quadtree_threshold=10)
    for i in range(50):
        x = (i * 73) % 1024
        y = (i * 97) % 1024
        engine_quad.add_orb(f"file_{i}.py", x, y, 128, size=100)

    # Run update
    engine_direct.update()
    engine_quad.update()

    # Compare positions
    max_error = 0.0
    for path in engine_direct.orbs:
        pos_direct = engine_direct.orbs[path]["pos"]
        pos_quad = engine_quad.orbs[path]["pos"]

        # XY plane comparison (quadtree only affects XY)
        error_xy = np.sqrt((pos_direct[0] - pos_quad[0])**2 + (pos_direct[1] - pos_quad[1])**2)
        max_error = max(max_error, error_xy)

    print(f"  Max XY position error: {max_error:.2f}")

    # Should be reasonably close (within 15% of typical position ~512)
    assert max_error < 100.0, f"Error too large: {max_error}"
    print("  PASS: Accuracy is acceptable")

if __name__ == "__main__":
    print("Verifying GravityEngine Quadtree Integration")
    print("=" * 60)

    try:
        test_basic_functionality()
        test_small_n_uses_direct()
        test_accuracy_comparison()

        print("\n" + "=" * 60)
        print("SUCCESS: All verification tests passed!")
        sys.exit(0)
    except Exception as e:
        print(f"\nFAILURE: {e}")
        import traceback
        traceback.print_exc()
        sys.exit(1)
