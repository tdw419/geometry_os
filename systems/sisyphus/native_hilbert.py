import ctypes
import os
import logging
import time
from typing import Optional, TYPE_CHECKING

if TYPE_CHECKING:
    from systems.sisyphus.performance_monitor import PerformanceMonitor

logger = logging.getLogger(__name__)

class NativeHilbertLUT:
    def __init__(self, lib_path=None, performance_monitor: Optional["PerformanceMonitor"] = None):
        self._performance_monitor = performance_monitor

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

                logger.info(f"Loaded native Hilbert library (2D/3D) from {lib_path}")
            else:
                logger.warning(f"Native Hilbert library not found at {lib_path}, falling back to slow Python.")
        except Exception as e:
            logger.error(f"Failed to load native Hilbert library: {e}. Falling back to slow Python.")

    def _record_call(self, func_name: str, duration_ms: float) -> None:
        """Record a call to the performance monitor if available."""
        if self._performance_monitor:
            self._performance_monitor.record_call(func_name, duration_ms)

    def d2xy(self, n, d):
        start = time.perf_counter()
        try:
            if self.lib:
                x = ctypes.c_int()
                y = ctypes.c_int()
                self.lib.hilbert_d2xy(n, d, ctypes.byref(x), ctypes.byref(y))
                return x.value, y.value
            else:
                return self._d2xy_python(n, d)
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("d2xy", duration_ms)

    def xy2d(self, n, x, y):
        start = time.perf_counter()
        try:
            if self.lib:
                return self.lib.hilbert_xy2d(n, x, y)
            else:
                return self._xy2d_python(n, x, y)
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("xy2d", duration_ms)

    def d2xyz(self, n, d):
        """Map 1D distance 'd' to 3D coordinates (x, y, z)."""
        start = time.perf_counter()
        try:
            if self.lib:
                x = ctypes.c_int()
                y = ctypes.c_int()
                z = ctypes.c_int()
                self.lib.hilbert_d2xyz(n, d, ctypes.byref(x), ctypes.byref(y), ctypes.byref(z))
                return x.value, y.value, z.value
            return 0, 0, 0 # 3D Python fallback TODO
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("d2xyz", duration_ms)

    def xyz2d(self, n, x, y, z):
        """Map 3D coordinates (x, y, z) to 1D distance 'd'."""
        start = time.perf_counter()
        try:
            if self.lib:
                return self.lib.hilbert_xyz2d(n, x, y, z)
            return 0 # 3D Python fallback TODO
        finally:
            duration_ms = (time.perf_counter() - start) * 1000
            self._record_call("xyz2d", duration_ms)

    def _rot(self, n, x, y, rx, ry):
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            return y, x
        return x, y

    def _d2xy_python(self, n, d):
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
        d = 0
        s = n // 2
        while s > 0:
            rx = 1 if (x & s) else 0
            ry = 1 if (y & s) else 0
            d += s * s * ((3 * rx) ^ ry)
            x, y = self._rot(s, x, y, rx, ry)
            s //= 2
        return d
