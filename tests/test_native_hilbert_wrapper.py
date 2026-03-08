import pytest
import sys
import os

# Add parent to path to import from systems.sisyphus
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..'))

from systems.sisyphus.native_hilbert import NativeHilbertLUT


class TestNativeHilbertWrapper:
    """Tests for native Hilbert library wrapper."""

    def test_loads_library_or_fallback(self):
        """Test that the wrapper initializes (native or fallback)."""
        lut = NativeHilbertLUT()
        # Either native lib loaded or using Python fallback
        assert lut.lib is not None or lut.d2xy is not None

    def test_d2xy_origin(self):
        """Test distance to xy conversion at origin."""
        lut = NativeHilbertLUT()
        x, y = lut.d2xy(16, 0)
        assert x == 0
        assert y == 0

    def test_d2xy_known_values(self):
        """Test distance to xy conversion with known values."""
        lut = NativeHilbertLUT()
        # For n=16, d=1 should give (1, 0) or (0, 1) depending on curve orientation
        x, y = lut.d2xy(16, 1)
        assert 0 <= x < 16
        assert 0 <= y < 16

    def test_xy2d_origin(self):
        """Test xy to distance conversion at origin."""
        lut = NativeHilbertLUT()
        d = lut.xy2d(16, 0, 0)
        assert d == 0

    def test_roundtrip(self):
        """Test roundtrip conversion d -> xy -> d."""
        lut = NativeHilbertLUT()
        n = 16
        for d in [0, 1, 5, 10, 50, 100, 200, 255]:
            x, y = lut.d2xy(n, d)
            recovered = lut.xy2d(n, x, y)
            assert recovered == d, f"Roundtrip failed: {d} -> ({x},{y}) -> {recovered}"

    def test_roundtrip_xy(self):
        """Test roundtrip conversion xy -> d -> xy."""
        lut = NativeHilbertLUT()
        n = 16
        for x, y in [(0, 0), (1, 0), (0, 1), (5, 5), (15, 15)]:
            d = lut.xy2d(n, x, y)
            rx, ry = lut.d2xy(n, d)
            assert (rx, ry) == (x, y), f"Roundtrip failed: ({x},{y}) -> {d} -> ({rx},{ry})"

    def test_bounds(self):
        """Test that coordinates stay within bounds."""
        lut = NativeHilbertLUT()
        n = 64
        for d in range(0, n * n, 100):
            x, y = lut.d2xy(n, d)
            assert 0 <= x < n, f"x={x} out of bounds for n={n}"
            assert 0 <= y < n, f"y={y} out of bounds for n={n}"

    def test_python_fallback_works(self):
        """Test that Python fallback implementation works."""
        lut = NativeHilbertLUT()
        # Force using Python methods by calling them directly
        x, y = lut._d2xy_python(16, 10)
        assert 0 <= x < 16
        assert 0 <= y < 16

        d = lut._xy2d_python(16, x, y)
        assert d == 10


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
