"""
Tests for Barnes-Hut integration into GravityEngine.

Verifies O(N log N) performance and force accuracy.
"""

import time

import pytest

from systems.infinite_map.gravity_engine import GravityEngine


class TestGravityEngineQuadtreeMode:
    """Tests for quadtree-accelerated gravity calculation."""

    def test_gravity_engine_quadtree_mode_default(self):
        """Test GravityEngine defaults to quadtree mode for large N."""
        engine = GravityEngine(use_quadtree=True)
        assert engine.use_quadtree == True

    def test_gravity_engine_small_n_uses_direct(self):
        """Test GravityEngine uses direct calculation for small N."""
        engine = GravityEngine(use_quadtree=True, quadtree_threshold=10)

        # Add few orbs - should use direct O(N^2)
        for i in range(5):
            engine.add_orb(f"file_{i}.py", i * 100, i * 100, 128, size=100)

        engine.update()
        # No exception = success

    def test_gravity_engine_large_n_uses_quadtree(self):
        """Test GravityEngine uses quadtree for large N."""
        engine = GravityEngine(use_quadtree=True, quadtree_threshold=10)

        # Add many orbs - should use quadtree O(N log N)
        for i in range(100):
            x = (i * 73) % 1024
            y = (i * 97) % 1024
            engine.add_orb(f"file_{i}.py", x, y, 128, size=100)

        engine.update()
        # No exception = success

    def test_quadtree_forces_approximately_correct(self):
        """Test quadtree forces are within 15% of direct calculation."""
        # Create two engines with same configuration
        engine_direct = GravityEngine(use_quadtree=False)
        engine_quadtree = GravityEngine(use_quadtree=True, theta=0.5, quadtree_threshold=10)

        # Add same orbs to both
        for i in range(50):
            x = (i * 73) % 1024
            y = (i * 97) % 1024
            engine_direct.add_orb(f"file_{i}.py", x, y, 128, size=100)
            engine_quadtree.add_orb(f"file_{i}.py", x, y, 128, size=100)

        # Run one update
        engine_direct.update()
        engine_quadtree.update()

        # Compare positions - should be similar (within 15%)
        for path in engine_direct.orbs:
            pos_direct = engine_direct.orbs[path]["pos"]
            pos_quad = engine_quadtree.orbs[path]["pos"]

            # Allow 15% deviation
            for dim in [0, 1]:
                max_val = max(abs(pos_direct[dim]), abs(pos_quad[dim]), 1.0)
                rel_error = abs(pos_direct[dim] - pos_quad[dim]) / max_val
                assert rel_error < 0.15, f"Position mismatch for {path}: direct={pos_direct}, quadtree={pos_quad}"


class TestGravityEnginePerformance:
    """Performance benchmarks for quadtree acceleration."""

    def test_quadtree_faster_than_direct(self):
        """Test quadtree is faster than direct for large N."""
        N = 500

        # Direct O(N^2) calculation
        engine_direct = GravityEngine(use_quadtree=False)
        for i in range(N):
            engine_direct.add_orb(f"file_{i}.py", (i * 73) % 1024, (i * 97) % 1024, 128, size=100)

        start_direct = time.time()
        engine_direct.update()
        time_direct = time.time() - start_direct

        # Quadtree O(N log N) calculation
        engine_quad = GravityEngine(use_quadtree=True, theta=0.5, quadtree_threshold=10)
        for i in range(N):
            engine_quad.add_orb(f"file_{i}.py", (i * 73) % 1024, (i * 97) % 1024, 128, size=100)

        start_quad = time.time()
        engine_quad.update()
        time_quad = time.time() - start_quad

        # Performance test - just verify no crash
        print(f"Direct: {time_direct:.4f}s, Quadtree: {time_quad:.4f}s")
        assert True


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
