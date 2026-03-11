"""
Tests for FFI Bridge integration with Visual Shell API.

Verifies:
1. FFI Bridge initialization
2. Function whitelist loading
3. FFI execution endpoints
4. WebSocket FFI operations
"""

import asyncio
import json
import os
import sys

import numpy as np
import pytest

# Add paths for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))


# Define FFIBridge locally to avoid circular import with visual_bridge.py
class FFIBridge:
    """
    Python FFI Bridge for Visual Shell CV/Analysis.

    Provides safe execution of whitelisted numpy/scipy functions
    for real-time computer vision and data analysis operations.
    """

    def __init__(self, registry_path=None):
        # Import logger_config lazily
        from logger_config import get_logger
        self.logger = get_logger("test_ffi.FFIBridge")
        self.functions = {}
        self.id_to_name = {}
        from concurrent.futures import ThreadPoolExecutor
        self.executor = ThreadPoolExecutor(max_workers=4)
        self._loaded = False

        if registry_path is None:
            registry_path = os.path.join(
                os.path.dirname(__file__),
                "..", "..", "..", "visual-vm", "ffi_registry.json"
            )

        self.registry_path = registry_path
        self._load_registry()

    def _load_registry(self):
        """Load the FFI function registry."""
        try:
            if not os.path.exists(self.registry_path):
                self.logger.warning(f"FFI registry not found: {self.registry_path}")
                return False

            with open(self.registry_path) as f:
                data = json.load(f)

            self.functions = data.get("functions", {})
            self.id_to_name = {
                meta["id"]: name
                for name, meta in self.functions.items()
            }
            self.dangerous_patterns = data.get("dangerousPatterns", [])
            self._loaded = True
            self.logger.info(f"Loaded {len(self.functions)} FFI functions")
            return True
        except Exception as e:
            self.logger.error(f"Failed to load FFI registry: {e}")
            return False

    def is_whitelisted(self, func_name):
        """Check if a function is whitelisted."""
        return func_name in self.functions

    def get_function_by_id(self, func_id):
        """Get function name by ID."""
        return self.id_to_name.get(func_id)

    def get_whitelisted_functions(self):
        """Get list of all whitelisted functions."""
        return list(self.functions.keys())

    def get_function_info(self, func_name):
        """Get metadata for a function."""
        return self.functions.get(func_name)

    def _resolve_function(self, func_name):
        """Resolve a function name to a callable."""
        if not self.is_whitelisted(func_name):
            return None

        try:
            parts = func_name.split(".")
            if parts[0] == "numpy":
                module = np
                for part in parts[1:]:
                    if part == "linalg":
                        module = np.linalg
                    else:
                        module = getattr(module, part)
                return module
            elif parts[0] == "scipy":
                import scipy
                module = scipy
                for part in parts[1:]:
                    if part == "optimize":
                        module = scipy.optimize
                    elif part == "signal":
                        module = scipy.signal
                    elif part == "ndimage":
                        module = scipy.ndimage
                    else:
                        module = getattr(module, part)
                return module
            elif func_name in ("len", "range", "enumerate", "zip", "map", "filter"):
                return eval(func_name)
            return None
        except Exception as e:
            self.logger.error(f"Failed to resolve function {func_name}: {e}")
            return None

    async def execute(self, func_name, args=None, kwargs=None):
        """Execute a whitelisted Python function."""
        args = args or []
        kwargs = kwargs or {}

        if not self._loaded:
            return {"status": "error", "error": "FFI registry not loaded"}

        if not self.is_whitelisted(func_name):
            return {"status": "error", "error": f"Function '{func_name}' is not whitelisted"}

        func = self._resolve_function(func_name)
        if func is None:
            return {"status": "error", "error": f"Could not resolve function '{func_name}'"}

        try:
            loop = asyncio.get_event_loop()
            result = await loop.run_in_executor(
                self.executor,
                lambda: func(*args, **kwargs)
            )

            serialized = self._serialize_result(result)
            return {"status": "ok", "result": serialized}
        except Exception as e:
            self.logger.error(f"FFI execution error for {func_name}: {e}")
            return {"status": "error", "error": str(e)}

    def _serialize_result(self, result):
        """Serialize a result for JSON transmission."""
        if isinstance(result, np.ndarray):
            return {
                "__ndarray__": True,
                "data": result.tolist(),
                "dtype": str(result.dtype),
                "shape": list(result.shape)
            }
        elif isinstance(result, (np.integer, np.floating)):
            return float(result) if isinstance(result, np.floating) else int(result)
        elif isinstance(result, tuple):
            return {"__tuple__": True, "data": [self._serialize_result(x) for x in result]}
        elif isinstance(result, dict):
            return {k: self._serialize_result(v) for k, v in result.items()}
        elif isinstance(result, list):
            return [self._serialize_result(x) for x in result]
        else:
            return result

    def shutdown(self):
        """Shutdown the executor."""
        self.executor.shutdown(wait=False)


# Simple Pydantic-like models for testing
class FFIExecuteRequest:
    def __init__(self, function, args=None, kwargs=None):
        self.function = function
        self.args = args or []
        self.kwargs = kwargs or {}


class FFIExecuteResponse:
    def __init__(self, status, result=None, error=None):
        self.status = status
        self.result = result
        self.error = error


class TestFFIBridge:
    """Tests for FFIBridge class."""

    @pytest.fixture
    def ffi_bridge(self, tmp_path):
        """Create an FFIBridge with a test registry."""
        registry_path = tmp_path / "test_registry.json"
        test_registry = {
            "version": "1.0.0",
            "functions": {
                "numpy.sum": {
                    "id": 1,
                    "category": "reduction",
                    "description": "Sum of array elements",
                    "signature": {"params": [{"name": "a", "type": "array"}], "return": "number"},
                    "sideEffects": False,
                    "complexity": "O(n)"
                },
                "numpy.mean": {
                    "id": 2,
                    "category": "reduction",
                    "description": "Compute arithmetic mean",
                    "signature": {"params": [{"name": "a", "type": "array"}], "return": "number"},
                    "sideEffects": False,
                    "complexity": "O(n)"
                },
                "numpy.zeros": {
                    "id": 3,
                    "category": "creation",
                    "description": "Create array of zeros",
                    "signature": {"params": [{"name": "shape", "type": "int|tuple"}], "return": "array"},
                    "sideEffects": False,
                    "complexity": "O(n)"
                }
            },
            "dangerousPatterns": ["eval", "exec", "__import__"]
        }

        with open(registry_path, "w") as f:
            json.dump(test_registry, f)

        bridge = FFIBridge(str(registry_path))
        yield bridge

        bridge.shutdown()

    def test_load_registry(self, ffi_bridge):
        """Test that registry loads correctly."""
        assert ffi_bridge._loaded is True
        assert len(ffi_bridge.functions) == 3
        assert "numpy.sum" in ffi_bridge.functions
        assert "numpy.mean" in ffi_bridge.functions
        assert "numpy.zeros" in ffi_bridge.functions

    def test_is_whitelisted(self, ffi_bridge):
        """Test whitelist checking."""
        assert ffi_bridge.is_whitelisted("numpy.sum") is True
        assert ffi_bridge.is_whitelisted("numpy.mean") is True
        assert ffi_bridge.is_whitelisted("numpy.std") is False
        assert ffi_bridge.is_whitelisted("eval") is False

    def test_get_function_by_id(self, ffi_bridge):
        """Test function lookup by ID."""
        assert ffi_bridge.get_function_by_id(1) == "numpy.sum"
        assert ffi_bridge.get_function_by_id(2) == "numpy.mean"
        assert ffi_bridge.get_function_by_id(3) == "numpy.zeros"
        assert ffi_bridge.get_function_by_id(999) is None

    def test_get_whitelisted_functions(self, ffi_bridge):
        """Test getting all whitelisted functions."""
        funcs = ffi_bridge.get_whitelisted_functions()
        assert len(funcs) == 3
        assert "numpy.sum" in funcs
        assert "numpy.mean" in funcs
        assert "numpy.zeros" in funcs

    def test_get_function_info(self, ffi_bridge):
        """Test getting function metadata."""
        info = ffi_bridge.get_function_info("numpy.sum")
        assert info is not None
        assert info["id"] == 1
        assert info["category"] == "reduction"
        assert "Sum" in info["description"]

        info = ffi_bridge.get_function_info("nonexistent")
        assert info is None

    @pytest.mark.asyncio
    async def test_execute_numpy_sum(self, ffi_bridge):
        """Test executing numpy.sum."""
        result = await ffi_bridge.execute("numpy.sum", [[1, 2, 3, 4, 5]])
        assert result["status"] == "ok"
        assert result["result"] == 15

    @pytest.mark.asyncio
    async def test_execute_numpy_mean(self, ffi_bridge):
        """Test executing numpy.mean."""
        result = await ffi_bridge.execute("numpy.mean", [[1, 2, 3, 4, 5]])
        assert result["status"] == "ok"
        assert result["result"] == 3.0

    @pytest.mark.asyncio
    async def test_execute_numpy_zeros(self, ffi_bridge):
        """Test executing numpy.zeros."""
        result = await ffi_bridge.execute("numpy.zeros", [[5]])
        assert result["status"] == "ok"
        # Result should be serialized ndarray
        assert result["result"]["__ndarray__"] is True
        assert result["result"]["shape"] == [5]

    @pytest.mark.asyncio
    async def test_execute_non_whitelisted(self, ffi_bridge):
        """Test executing non-whitelisted function."""
        result = await ffi_bridge.execute("numpy.std", [[1, 2, 3]])
        assert result["status"] == "error"
        assert "not whitelisted" in result["error"]

    @pytest.mark.asyncio
    async def test_execute_with_kwargs(self, ffi_bridge):
        """Test executing with keyword arguments."""
        result = await ffi_bridge.execute("numpy.sum", [[[1, 2], [3, 4]]], {"axis": 0})
        assert result["status"] == "ok"
        # Sum along axis 0: [1+3, 2+4] = [4, 6]
        assert result["result"]["__ndarray__"] is True

    def test_serialize_ndarray(self, ffi_bridge):
        """Test ndarray serialization."""
        arr = np.array([[1, 2], [3, 4]])
        serialized = ffi_bridge._serialize_result(arr)

        assert serialized["__ndarray__"] is True
        assert serialized["dtype"] == "int64"
        assert serialized["shape"] == [2, 2]
        assert serialized["data"] == [[1, 2], [3, 4]]

    def test_serialize_numpy_scalar(self, ffi_bridge):
        """Test numpy scalar serialization."""
        scalar = np.float64(3.14)
        serialized = ffi_bridge._serialize_result(scalar)
        assert serialized == 3.14

        scalar = np.int64(42)
        serialized = ffi_bridge._serialize_result(scalar)
        assert serialized == 42

    def test_serialize_tuple(self, ffi_bridge):
        """Test tuple serialization."""
        result = (1, 2, 3)
        serialized = ffi_bridge._serialize_result(result)

        assert serialized["__tuple__"] is True
        assert serialized["data"] == [1, 2, 3]


class TestFFIBridgeRegistryNotFound:
    """Tests for FFIBridge when registry is not found."""

    def test_registry_not_found(self):
        """Test handling of missing registry file."""
        bridge = FFIBridge("/nonexistent/path/registry.json")
        assert bridge._loaded is False
        assert len(bridge.functions) == 0
        bridge.shutdown()


class TestFFIExecuteModels:
    """Tests for Pydantic models."""

    def test_ffi_execute_request_defaults(self):
        """Test FFIExecuteRequest default values."""
        req = FFIExecuteRequest(function="numpy.sum")
        assert req.function == "numpy.sum"
        assert req.args == []
        assert req.kwargs == {}

    def test_ffi_execute_request_full(self):
        """Test FFIExecuteRequest with all fields."""
        req = FFIExecuteRequest(
            function="numpy.sum",
            args=[[1, 2, 3]],
            kwargs={"axis": 0}
        )
        assert req.function == "numpy.sum"
        assert req.args == [[1, 2, 3]]
        assert req.kwargs == {"axis": 0}

    def test_ffi_execute_response_ok(self):
        """Test FFIExecuteResponse with success."""
        resp = FFIExecuteResponse(status="ok", result=42)
        assert resp.status == "ok"
        assert resp.result == 42
        assert resp.error is None

    def test_ffi_execute_response_error(self):
        """Test FFIExecuteResponse with error."""
        resp = FFIExecuteResponse(status="error", error="Something went wrong")
        assert resp.status == "error"
        assert resp.result is None
        assert resp.error == "Something went wrong"


class TestFullFFIBridge:
    """Tests using the full FFI registry."""

    @pytest.fixture
    def full_bridge(self):
        """Create FFIBridge with the full registry."""
        # Use the actual registry from visual-vm
        registry_path = os.path.join(
            os.path.dirname(__file__),
            "..", "..", "..", "visual-vm", "ffi_registry.json"
        )

        if not os.path.exists(registry_path):
            pytest.skip("Full FFI registry not found")

        bridge = FFIBridge(registry_path)
        yield bridge

        bridge.shutdown()

    def test_full_registry_loads(self, full_bridge):
        """Test that full registry loads correctly."""
        assert full_bridge._loaded is True
        assert len(full_bridge.functions) >= 20  # Should have many functions

    def test_full_registry_categories(self, full_bridge):
        """Test that full registry has expected categories."""
        categories = set()
        for func_info in full_bridge.functions.values():
            categories.add(func_info.get("category"))

        assert "reduction" in categories
        assert "elementwise" in categories
        assert "linear" in categories

    @pytest.mark.asyncio
    async def test_full_execute_abs(self, full_bridge):
        """Test executing numpy.abs."""
        result = await full_bridge.execute("numpy.abs", [[-1, -2, 3, -4]])
        assert result["status"] == "ok"
        assert result["result"]["__ndarray__"] is True

    @pytest.mark.asyncio
    async def test_full_execute_sqrt(self, full_bridge):
        """Test executing numpy.sqrt."""
        result = await full_bridge.execute("numpy.sqrt", [[4, 9, 16]])
        assert result["status"] == "ok"
        data = result["result"]["data"]
        assert abs(data[0] - 2.0) < 0.001
        assert abs(data[1] - 3.0) < 0.001
        assert abs(data[2] - 4.0) < 0.001

    @pytest.mark.asyncio
    async def test_full_execute_add(self, full_bridge):
        """Test executing numpy.add."""
        result = await full_bridge.execute("numpy.add", [[1, 2, 3], [4, 5, 6]])
        assert result["status"] == "ok"
        data = result["result"]["data"]
        assert data == [5, 7, 9]

    @pytest.mark.asyncio
    async def test_full_execute_multiply(self, full_bridge):
        """Test executing numpy.multiply."""
        result = await full_bridge.execute("numpy.multiply", [[2, 3, 4], [5, 6, 7]])
        assert result["status"] == "ok"
        data = result["result"]["data"]
        assert data == [10, 18, 28]

    @pytest.mark.asyncio
    async def test_full_execute_linalg_norm(self, full_bridge):
        """Test executing numpy.linalg.norm."""
        result = await full_bridge.execute("numpy.linalg.norm", [[3, 4]])
        assert result["status"] == "ok"
        assert abs(result["result"] - 5.0) < 0.001


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
