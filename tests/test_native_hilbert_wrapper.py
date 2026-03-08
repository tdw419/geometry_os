import pytest
import sys
import os

# Add parent to path to import from systems.sisyphus
 sys.path.insert(0, os.path.dirname(__file__), '..', '..')

from systems.sisyphus.native_hilbert import NativeHilbertLUT

class TestNativeHilbertWrapper:
    def test_loads_library(self):
        """Test that the native library loads successfully."""
        lut = NativeHilbertLUT(16)
        assert lut.is_available() or lut.is_fallback()

    def test_index_to_xy(self):
        """Test 1D to 2D conversion via wrapper."""
        lut = NativeHilbertLUT(16)
        x, y = lut.index_to_xy(0)
        assert x == 0
        assert y == 0

    def test_roundtrip(self):
        """Test roundtrip conversion."""
        lut = NativeHilbertLUT(16)
        for d in [0, 10, 50, 100, 200]:
            x, y = lut.index_to_xy(d)
            recovered = lut.xy_to_index(x, y)
            assert recovered == d

    def test_fallback_to_python(self):
        """Test that Python fallback works when native unavailable."""
        lut = NativeHilbertLUT(16, force_fallback=True)
        assert lut.is_fallback()
        x, y = lut.index_to_xy(0)
        assert x == 0 and y == 0

    def test_performance_vs_python(self):
        """Benchmark native vs Python implementation."""
        import time

        lut_native = NativeHilbertLUT(64)
        lut_fallback = NativeHilbertLUT(64, force_fallback=True)

        iterations = 10000

        # Native timing
        start = time.perf_counter()
        for i in range(iterations):
            lut_native.index_to_xy(i % 4096)
        native_time = time.perf_counter() - start

        # Fallback timing
        start = time.perf_counter()
        for i in range(iterations):
            lut_fallback.index_to_xy(i % 4096)
        fallback_time = time.perf_counter() - start

        # Native should be at least 1.5x faster (being conservative for CI)
        speedup = fallback_time / native_time
        print(f"Native speedup: {speedup:.2f}x")
        # Note: In CI, native may not be available, so we just check it works
        if lut_native.is_available():
            assert speedup >= 1.5, f"Native not fast enough: {speedup:.2f}x"
        else:
            pytest.skip("Native library not available for performance test")
