import ctypes
import logging
import os
import time
from collections import OrderedDict
from threading import Lock
from typing import TYPE_CHECKING, Optional

if TYPE_CHECKING:
    from systems.sisyphus.performance_monitor import PerformanceMonitor

logger = logging.getLogger(__name__)


class HilbertLRUCache:
    """
    Thread-safe LRU cache for Hilbert coordinate transformations.
    Size defaults to 1024 entries as per specification.
    """

    def __init__(self, max_size: int = 1024):
        self.max_size = max_size
        self._cache: OrderedDict[tuple[int, int], tuple[int, int]] = OrderedDict()
        self._lock = Lock()
        self._hits = 0
        self._misses = 0

    def get_d2xy(self, n: int, d: int) -> tuple[int, int] | None:
        """Get cached d2xy result if available."""
        key = (n, d)
        with self._lock:
            if key in self._cache:
                # Move to end (most recently used)
                self._cache.move_to_end(key)
                self._hits += 1
                return self._cache[key]
            self._misses += 1
            return None

    def set_d2xy(self, n: int, d: int, result: tuple[int, int]) -> None:
        """Cache a d2xy result."""
        key = (n, d)
        with self._lock:
            if key in self._cache:
                self._cache.move_to_end(key)
            else:
                if len(self._cache) >= self.max_size:
                    # Remove oldest entry
                    self._cache.popitem(last=False)
                self._cache[key] = result

    def get_xy2d(self, n: int, x: int, y: int) -> int | None:
        """Get cached xy2d result if available."""
        key = (n, -x - 1, -y - 1)  # Negative to distinguish from d2xy keys
        with self._lock:
            if key in self._cache:
                self._cache.move_to_end(key)
                self._hits += 1
                return self._cache[key]
            self._misses += 1
            return None

    def set_xy2d(self, n: int, x: int, y: int, result: int) -> None:
        """Cache an xy2d result."""
        key = (n, -x - 1, -y - 1)
        with self._lock:
            if key in self._cache:
                self._cache.move_to_end(key)
            else:
                if len(self._cache) >= self.max_size:
                    self._cache.popitem(last=False)
                self._cache[key] = result

    def get_stats(self) -> dict[str, int]:
        """Get cache statistics."""
        with self._lock:
            total = self._hits + self._misses
            hit_rate = self._hits / total if total > 0 else 0
            return {
                "hits": self._hits,
                "misses": self._misses,
                "hit_rate": hit_rate,
                "size": len(self._cache),
                "max_size": self.max_size
            }

    def clear(self) -> None:
        """Clear the cache."""
        with self._lock:
            self._cache.clear()
            self._hits = 0
            self._misses = 0


class NativeHilbertLUT:
    """
    High-performance Hilbert curve coordinate transformations.
    
    Optimizations:
    - LRU cache for frequently accessed coordinates (size=1024)
    - Batch coordinate transformations for bulk operations
    - Native C library with ctypes for maximum performance
    """

    # Class-level shared cache for all instances
    _shared_cache: HilbertLRUCache | None = None

    def __init__(self, lib_path=None, performance_monitor: Optional["PerformanceMonitor"] = None,
                 cache_size: int = 1024, use_shared_cache: bool = True):
        self._performance_monitor = performance_monitor

        # Initialize cache (shared or instance-specific)
        if use_shared_cache:
            if NativeHilbertLUT._shared_cache is None:
                NativeHilbertLUT._shared_cache = HilbertLRUCache(max_size=cache_size)
            self._cache = NativeHilbertLUT._shared_cache
        else:
            self._cache = HilbertLRUCache(max_size=cache_size)

        if lib_path is None:
            # Default to the location relative to this file
            # File is at systems/sisyphus/native_hilbert.py
            # Library is at systems/native/libhilbert.so
            base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
            lib_path = os.path.join(base_dir, "native", "libhilbert.so")

        self.lib = None
        try:
            if os.path.exists(lib_path):
                self.lib = ctypes.CDLL(lib_path)
                # Define argtypes and restype for hilbert_d2xy(int n, uint32_t d, int *x, int *y)
                self.lib.hilbert_d2xy.argtypes = [
                    ctypes.c_int,
                    ctypes.c_uint32,
                    ctypes.POINTER(ctypes.c_int),
                    ctypes.POINTER(ctypes.c_int)
                ]
                self.lib.hilbert_d2xy.restype = None

                # Define argtypes and restype for hilbert_xy2d(int n, int x, int y)
                self.lib.hilbert_xy2d.argtypes = [
                    ctypes.c_int,
                    ctypes.c_int,
                    ctypes.c_int
                ]
                self.lib.hilbert_xy2d.restype = ctypes.c_uint32

                # 3D Hilbert (The Holographic Substrate)
                self.lib.hilbert_d2xyz.argtypes = [
                    ctypes.c_int,
                    ctypes.c_uint64,
                    ctypes.POINTER(ctypes.c_int),
                    ctypes.POINTER(ctypes.c_int),
                    ctypes.POINTER(ctypes.c_int)
                ]
                self.lib.hilbert_d2xyz.restype = None

                self.lib.hilbert_xyz2d.argtypes = [
                    ctypes.c_int,
                    ctypes.c_int,
                    ctypes.c_int,
                    ctypes.c_int
                ]
                self.lib.hilbert_xyz2d.restype = ctypes.c_uint64

                # Batch operations - SIMD optimized
                self.lib.hilbert_batch_d2xy.argtypes = [
                    ctypes.c_int,                                    # n
                    ctypes.POINTER(ctypes.c_uint32),                 # indices
                    ctypes.POINTER(ctypes.c_int),                    # xs
                    ctypes.POINTER(ctypes.c_int),                    # ys
                    ctypes.c_size_t                                  # count
                ]
                self.lib.hilbert_batch_d2xy.restype = None

                self.lib.hilbert_batch_xy2d.argtypes = [
                    ctypes.c_int,                                    # n
                    ctypes.POINTER(ctypes.c_int),                    # xs
                    ctypes.POINTER(ctypes.c_int),                    # ys
                    ctypes.POINTER(ctypes.c_uint32),                 # results
                    ctypes.c_size_t                                  # count
                ]
                self.lib.hilbert_batch_xy2d.restype = None

                logger.info(f"Loaded native Hilbert library (2D/3D/Batch) from {lib_path}")
            else:
                logger.warning(f"Native Hilbert library not found at {lib_path}, falling back to slow Python.")
        except Exception as e:
            logger.error(f"Failed to load native Hilbert library: {e}. Falling back to slow Python.")

    def _record_call(self, func_name: str, duration_ms: float) -> None:
        """Record a call to the performance monitor if available."""
        if self._performance_monitor:
            self._performance_monitor.record_call(func_name, duration_ms)

    def d2xy(self, n, d) -> tuple[int, int]:
        """Convert 1D index to 2D Hilbert coordinates with caching."""
        start = time.perf_counter()
        try:
            # Check cache first
            cached = self._cache.get_d2xy(n, d)
            if cached is not None:
                return cached

            # Compute result
            if self.lib:
                x = ctypes.c_int()
                y = ctypes.c_int()
                self.lib.hilbert_d2xy(n, d, ctypes.byref(x), ctypes.byref(y))
                result = (x.value, y.value)
            else:
                result = self._d2xy_python(n, d)

            # Cache result
            self._cache.set_d2xy(n, d, result)
            return result
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("d2xy", duration_ms)

    def xy2d(self, n, x, y) -> int:
        """Convert 2D coordinates to 1D Hilbert index with caching."""
        start = time.perf_counter()
        try:
            # Check cache first
            cached = self._cache.get_xy2d(n, x, y)
            if cached is not None:
                return cached

            # Compute result
            if self.lib:
                result = self.lib.hilbert_xy2d(n, x, y)
            else:
                result = self._xy2d_python(n, x, y)

            # Cache result
            self._cache.set_xy2d(n, x, y, result)
            return result
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("xy2d", duration_ms)

    def d2xyz(self, n, d) -> tuple[int, int, int]:
        """Map 1D distance 'd' to 3D coordinates (x, y, z)."""
        start = time.perf_counter()
        try:
            if self.lib:
                x = ctypes.c_int()
                y = ctypes.c_int()
                z = ctypes.c_int()
                self.lib.hilbert_d2xyz(n, d, ctypes.byref(x), ctypes.byref(y), ctypes.byref(z))
                return x.value, y.value, z.value
            return 0, 0, 0  # 3D Python fallback TODO
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("d2xyz", duration_ms)

    def xyz2d(self, n, x, y, z) -> int:
        """Map 3D coordinates (x, y, z) to 1D distance 'd'."""
        start = time.perf_counter()
        try:
            if self.lib:
                return self.lib.hilbert_xyz2d(n, x, y, z)
            return 0  # 3D Python fallback TODO
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("xyz2d", duration_ms)

    # =================================================================
    # BATCH OPERATIONS - Bulk coordinate transformations
    # =================================================================

    def batch_d2xy(self, n: int, indices: list[int]) -> list[tuple[int, int]]:
        """
        Batch convert multiple 1D indices to 2D coordinates.
        Optimized for bulk operations - uses native batch function.
        
        Args:
            n: Grid size (must be power of 2)
            indices: List of 1D indices to convert
            
        Returns:
            List of (x, y) coordinate tuples
        """
        start = time.perf_counter()
        try:
            count = len(indices)
            if count == 0:
                return []

            # Check if native batch function is available
            if self.lib and hasattr(self.lib, 'hilbert_batch_d2xy'):
                # Use native batch function for maximum performance
                indices_array = (ctypes.c_uint32 * count)(*indices)
                xs_array = (ctypes.c_int * count)()
                ys_array = (ctypes.c_int * count)()

                self.lib.hilbert_batch_d2xy(n, indices_array, xs_array, ys_array, count)

                results = [(xs_array[i], ys_array[i]) for i in range(count)]

                # Cache results
                for d, result in zip(indices, results):
                    self._cache.set_d2xy(n, d, result)

                return results
            else:
                # Fallback: check cache first, then compute uncached
                results = []
                uncached_indices = []
                uncached_positions = []

                for i, d in enumerate(indices):
                    cached = self._cache.get_d2xy(n, d)
                    if cached is not None:
                        results.append(cached)
                    else:
                        results.append(None)
                        uncached_indices.append(d)
                        uncached_positions.append(i)

                if uncached_indices:
                    for d, pos in zip(uncached_indices, uncached_positions):
                        if self.lib:
                            x = ctypes.c_int()
                            y = ctypes.c_int()
                            self.lib.hilbert_d2xy(n, d, ctypes.byref(x), ctypes.byref(y))
                            result = (x.value, y.value)
                        else:
                            result = self._d2xy_python(n, d)
                        results[pos] = result
                        self._cache.set_d2xy(n, d, result)

                return results
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("batch_d2xy", duration_ms)

    def batch_xy2d(self, n: int, coords: list[tuple[int, int]]) -> list[int]:
        """
        Batch convert multiple 2D coordinates to 1D indices.
        Optimized for bulk operations - uses native batch function.
        
        Args:
            n: Grid size (must be power of 2)
            coords: List of (x, y) coordinate tuples
            
        Returns:
            List of 1D indices
        """
        start = time.perf_counter()
        try:
            count = len(coords)
            if count == 0:
                return []

            # Check if native batch function is available
            if self.lib and hasattr(self.lib, 'hilbert_batch_xy2d'):
                # Use native batch function for maximum performance
                xs = [c[0] for c in coords]
                ys = [c[1] for c in coords]
                xs_array = (ctypes.c_int * count)(*xs)
                ys_array = (ctypes.c_int * count)(*ys)
                results_array = (ctypes.c_uint32 * count)()

                self.lib.hilbert_batch_xy2d(n, xs_array, ys_array, results_array, count)

                results = [results_array[i] for i in range(count)]

                # Cache results
                for (x, y), result in zip(coords, results):
                    self._cache.set_xy2d(n, x, y, result)

                return results
            else:
                # Fallback: check cache first, then compute uncached
                results = []
                uncached_coords = []
                uncached_positions = []

                for i, (x, y) in enumerate(coords):
                    cached = self._cache.get_xy2d(n, x, y)
                    if cached is not None:
                        results.append(cached)
                    else:
                        results.append(None)
                        uncached_coords.append((x, y))
                        uncached_positions.append(i)

                if uncached_coords:
                    for (x, y), pos in zip(uncached_coords, uncached_positions):
                        if self.lib:
                            result = self.lib.hilbert_xy2d(n, x, y)
                        else:
                            result = self._xy2d_python(n, x, y)
                        results[pos] = result
                        self._cache.set_xy2d(n, x, y, result)

                return results
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("batch_xy2d", duration_ms)

    def get_cache_stats(self) -> dict[str, int]:
        """Get cache performance statistics."""
        return self._cache.get_stats()

    def clear_cache(self) -> None:
        """Clear the coordinate cache."""
        self._cache.clear()

    def _rot(self, n, x, y, rx, ry):
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            return y, x
        return x, y

    def _d2xy_python(self, n, d):
        """Pure Python fallback for d2xy."""
        x = y = 0
        t = d
        s = 1
        while s < n:
            rx = 1 & (t // 2)
            ry = 1 & (t ^ rx)
            x, y = self._rot(s, x, y, rx, ry)
            x += s * rx
            y += s * ry
            t //= 4
            s *= 2
        return x, y

    def _xy2d_python(self, n, x, y):
        """Pure Python fallback for xy2d."""
        d = 0
        s = n // 2
        while s > 0:
            rx = 1 if (x & s) else 0
            ry = 1 if (y & s) else 0
            d += s * s * ((3 * rx) ^ ry)
            x, y = self._rot(s, x, y, rx, ry)
            s //= 2
        return d


class HilbertEngine:
    """
    High-level Hilbert curve engine for bulk operations.
    Wraps NativeHilbertLUT with additional utilities.
    """

    def __init__(self, cache_size: int = 1024):
        self._lut = NativeHilbertLUT(cache_size=cache_size)

    def d2xy(self, n: int, d: int) -> tuple[int, int]:
        """Convert 1D index to 2D coordinates."""
        return self._lut.d2xy(n, d)

    def xy2d(self, n: int, x: int, y: int) -> int:
        """Convert 2D coordinates to 1D index."""
        return self._lut.xy2d(n, x, y)

    def batch_d2xy(self, n: int, indices: list[int]) -> list[tuple[int, int]]:
        """Batch convert 1D indices to 2D coordinates."""
        return self._lut.batch_d2xy(n, indices)

    def batch_xy2d(self, n: int, coords: list[tuple[int, int]]) -> list[int]:
        """Batch convert 2D coordinates to 1D indices."""
        return self._lut.batch_xy2d(n, coords)

    def get_cache_stats(self) -> dict[str, int]:
        """Get cache statistics."""
        return self._lut.get_cache_stats()


# Benchmark utilities
def run_benchmark(num_lookups: int = 10000, grid_size: int = 1024) -> dict:
    """
    Run a benchmark on Hilbert coordinate transformations.
    
    Args:
        num_lookups: Number of coordinate lookups to perform
        grid_size: Grid size for Hilbert curve
        
    Returns:
        Dictionary with benchmark results
    """

    h = NativeHilbertLUT()

    # Benchmark d2xy
    start = time.time()
    results_d2xy = [h.d2xy(grid_size, i) for i in range(num_lookups)]
    d2xy_time = time.time() - start

    # Benchmark xy2d
    start = time.time()
    results_xy2d = [h.xy2d(grid_size, x, y) for x, y in results_d2xy]
    xy2d_time = time.time() - start

    # Benchmark batch_d2xy
    indices = list(range(num_lookups))
    start = time.time()
    batch_results = h.batch_d2xy(grid_size, indices)
    batch_d2xy_time = time.time() - start

    # Get cache stats
    cache_stats = h.get_cache_stats()

    return {
        "d2xy_time": d2xy_time,
        "xy2d_time": xy2d_time,
        "batch_d2xy_time": batch_d2xy_time,
        "lookups": num_lookups,
        "grid_size": grid_size,
        "cache_stats": cache_stats,
        "native_lib_loaded": h.lib is not None
    }


if __name__ == "__main__":
    # Run benchmark
    results = run_benchmark()
    print("Hilbert Benchmark Results:")
    print(f"  d2xy: {results['d2xy_time']*1000:.2f}ms for {results['lookups']} lookups")
    print(f"  xy2d: {results['xy2d_time']*1000:.2f}ms for {results['lookups']} lookups")
    print(f"  batch_d2xy: {results['batch_d2xy_time']*1000:.2f}ms for {results['lookups']} lookups")
    print(f"  Native lib: {'loaded' if results['native_lib_loaded'] else 'not loaded'}")
    print(f"  Cache stats: {results['cache_stats']}")
