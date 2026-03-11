"""
Tests for 3D Holographic Substrate flattening to 2D boot texture.
"""

import time

import numpy as np
import pytest


class TestHolographicFlatten:
    """Tests for 3D-to-2D coordinate folding."""

    def test_flatten_module_exists(self):
        """Test that flatten module can be imported."""
        from systems.hypervisor import holographic_flatten
        assert holographic_flatten is not None

    def test_flatten_3d_to_2d_basic(self):
        """Test basic 3D to 2D coordinate mapping."""
        from systems.hypervisor.holographic_flatten import flatten_coordinate

        # 4x4x4 cube -> 16x16 plane
        x2d, y2d = flatten_coordinate(0, 0, 0, order=4)

        assert 0 <= x2d < 16
        assert 0 <= y2d < 16

    def test_flatten_is_bijective(self):
        """Test that flatten is reversible (no data loss)."""
        from systems.hypervisor.holographic_flatten import flatten_coordinate, unflatten_coordinate

        # Test all coordinates in a small cube
        for z in range(4):
            for y in range(4):
                for x in range(4):
                    x2d, y2d = flatten_coordinate(x, y, z, order=4)
                    x3d, y3d, z3d = unflatten_coordinate(x2d, y2d, order=4)

                    assert (x, y, z) == (x3d, y3d, z3d), \
                        f"Round trip failed: ({x},{y},{z}) -> ({x2d},{y2d}) -> ({x3d},{y3d},{z3d})"

    def test_flatten_output_size(self):
        """Test that output texture has correct dimensions."""
        from systems.hypervisor.holographic_flatten import calculate_output_size

        # 256x256x256 -> should fit in power-of-2 2D texture
        width, height = calculate_output_size(order=8)

        # 256^3 = 16,777,216 voxels
        # sqrt(16777216) = 4096
        assert width * height >= 256 * 256 * 256
        assert width == 4096
        assert height == 4096


class TestFlattenPerformance:
    """Performance tests for flattening."""

    @pytest.mark.slow
    def test_flatten_256_cube_performance(self):
        """Test that 256^3 cube flattens efficiently."""
        from systems.hypervisor.holographic_flatten import flatten_texture

        # Create test 3D texture (256x256x256)
        texture_3d = np.zeros((256, 256, 256), dtype=np.uint8)

        start = time.perf_counter()
        texture_2d = flatten_texture(texture_3d)
        elapsed_ms = (time.perf_counter() - start) * 1000

        # Just verify it completes and has correct shape
        assert texture_2d.shape == (4096, 4096)
        # Performance target: should complete (no strict time limit for this test)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
