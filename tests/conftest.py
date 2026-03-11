"""Test configuration for Geometry OS tests.

Optimized for memory efficiency during test collection with robust
async support and coverage reporting.

Directory structure:
  /home/jericho/zion/projects/geometry_os/         <- repo root (contains geometry_os package)
  /home/jericho/zion/projects/geometry_os/geometry_os/  <- geometry_os package
  /home/jericho/zion/projects/geometry_os/geometry_os/tests/  <- this file

Tests import using 'geometry_os.systems.pixel_compiler' which needs:
  sys.path to include /home/jericho/zion/projects/geometry_os/
  geometry_os/__init__.py to exist
"""

import asyncio
import gc
import os
import sys
import warnings
from collections.abc import AsyncGenerator, Generator
from pathlib import Path
from typing import Any
from unittest.mock import AsyncMock, MagicMock

import pytest

# ============================================================================
# PATH CONFIGURATION
# ============================================================================

# Add the repo root (parent of geometry_os package)
# This enables 'from geometry_os.systems.pixel_compiler import ...'
repo_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(repo_root))

# Also add the geometry_os directory for direct imports like 'from systems.visual_shell import ...'
geometry_os_dir = Path(__file__).parent.parent
sys.path.insert(0, str(geometry_os_dir))

# Add geoasm-cli for GeoASM imports
geoasm_cli = geometry_os_dir / "geoasm-cli"
if geoasm_cli.exists():
    sys.path.insert(0, str(geoasm_cli))

# Add visual-vm for FFI bridge imports
visual_vm = geometry_os_dir / "visual-vm"
if visual_vm.exists():
    sys.path.insert(0, str(visual_vm))

# Add systems directory for direct 'from systems.*' imports
systems_dir = geometry_os_dir / "systems"
if systems_dir.exists():
    sys.path.insert(0, str(systems_dir))

# Add testing framework
testing_framework = geometry_os_dir / "testing_framework"
if testing_framework.exists():
    sys.path.insert(0, str(testing_framework))


# ============================================================================
# MEMORY OPTIMIZATION HOOKS
# ============================================================================


def pytest_collection_modifyitems(session, config, items):
    """Hook to clean up memory after collection."""
    # Force garbage collection after collection to free temporary objects
    gc.collect()


@pytest.hookimpl(trylast=True)
def pytest_collection_finish(session):
    """Final cleanup after collection is complete."""
    # Run aggressive garbage collection
    gc.collect()
    gc.collect()  # Run twice to collect cyclic references


# ============================================================================
# SKIP MARKERS FOR OPTIONAL MODULES
# ============================================================================

# Cache for module availability - use weakref to allow garbage collection
_module_cache: dict = {}


def _check_module_available(module_name: str) -> bool:
    """Check if a module is available, caching the result.

    Uses file-based detection to avoid importing heavy modules during collection.
    This prevents memory bloat from torch, numpy, etc. being loaded just for
    test collection.

    Args:
        module_name: The fully-qualified module name (e.g., "systems.tectonic")

    Returns:
        True if the module file exists on disk, False otherwise
    """
    if module_name not in _module_cache:
        # Convert module name to potential file paths
        # e.g., "systems.tectonic" -> "systems/tectonic.py" or "systems/tectonic/__init__.py"
        parts = module_name.split(".")

        # Search in all sys.path directories
        found = False
        for search_dir in sys.path:
            if not search_dir:
                continue

            base_path = Path(search_dir)
            if not base_path.exists():
                continue

            # Try as a module file
            module_file = base_path.joinpath(*parts[:-1]) / f"{parts[-1]}.py"
            if module_file.exists():
                found = True
                break

            # Try as a package (directory with __init__.py)
            package_init = base_path.joinpath(*parts) / "__init__.py"
            if package_init.exists():
                found = True
                break

        _module_cache[module_name] = found

    return _module_cache[module_name]


def pytest_ignore_collect(collection_path, config):
    """Skip test files that have import errors for optional modules.

    This prevents pytest from trying to collect tests from files that
    import modules not available in the current environment, avoiding
    import errors and unnecessary module loading during collection.
    """
    path_str = str(collection_path)

    # Map of path patterns to required modules
    # Tests matching these patterns will be skipped if the module is not available
    path_module_map = [
        (
            ["tests/intelligence/", "tests/integration/neural_pipeline"],
            ["systems.intelligence.core", "systems.neural_substrate"],
        ),
        (
            ["tests/system/test_visual"],
            ["systems.visual_shell.swarm.worker_agent"],
        ),
        (
            ["tests/test_directive"],
            ["systems.intelligence.directive_agent"],
        ),
        (
            [
                "tests/test_amp_lightning",
                "tests/test_amp_trainer",
                "tests/test_lightning_trainer",
            ],
            ["geometry_os.systems.pixel_compiler.amp_config"],
        ),
        (
            ["tests/test_gpu_test_generation"],
            ["geometry_os.systems.pixel_compiler.cuda_detector"],
        ),
        (
            ["tests/test_live_evolution", "tests/test_tectonic"],
            ["systems.tectonic"],
        ),
        (
            ["tests/test_unified_config"],
            ["geometry_os.systems.pixel_compiler.unified_config"],
        ),
        (
            ["tests/test_wp_evolution"],
            ["systems.evolution_daemon.wordpress"],
        ),
        (
            ["tests/unit/test_phase1_benchmark"],
            ["geometry_os.systems.pixel_compiler.benchmarks"],
        ),
    ]

    # Check if any pattern matches and module is unavailable
    for patterns, modules in path_module_map:
        for pattern in patterns:
            if pattern in path_str:
                for module in modules:
                    if not _check_module_available(module):
                        return True  # Skip this file
    return False  # Don't skip


def pytest_configure(config):
    """Register custom markers for optional module tests."""
    # Standard markers
    config.addinivalue_line("markers", "unit: Fast, isolated unit tests")
    config.addinivalue_line("markers", "integration: Integration tests")
    config.addinivalue_line("markers", "slow: Slow tests (>1s)")

    # Resource requirement markers
    config.addinivalue_line(
        "markers", "requires_cuda: skip test if CUDA modules not available"
    )
    config.addinivalue_line(
        "markers",
        "requires_amp: skip test if AMP/PyTorch Lightning modules not available",
    )
    config.addinivalue_line(
        "markers", "requires_intelligence: skip test if intelligence modules not available"
    )
    config.addinivalue_line("markers", "requires_gpu: skip test if no GPU available")
    config.addinivalue_line("markers", "requires_network: skip test if network unavailable")
    config.addinivalue_line("markers", "requires_docker: skip test if Docker unavailable")


# ============================================================================
# LAZY IMPORT FIXTURES
# ============================================================================


@pytest.fixture(scope="session")
def numpy():
    """Session-scoped fixture for numpy - only imported when used.

    Usage:
        def test_something(numpy):
            arr = numpy.array([1, 2, 3])
    """
    return pytest.importorskip("numpy")


@pytest.fixture(scope="session")
def torch():
    """Session-scoped fixture for torch - only imported when used.

    Usage:
        def test_something(torch):
            tensor = torch.tensor([1, 2, 3])
    """
    return pytest.importorskip("torch")


@pytest.fixture(scope="session")
def PIL():
    """Session-scoped fixture for PIL - only imported when used."""
    return pytest.importorskip("PIL")


# ============================================================================
# MEMORY PROFILING UTILITIES (for debugging)
# ============================================================================


def get_memory_usage_mb() -> float:
    """Get current process memory usage in MB.

    Useful for debugging memory issues during test development.
    """
    try:
        import psutil

        process = psutil.Process()
        return process.memory_info().rss / 1024 / 1024
    except ImportError:
        return 0.0


# Debug flag to enable memory logging
_MEMORY_DEBUG = False


if _MEMORY_DEBUG:

    @pytest.hookimpl(hookwrapper=True)
    def pytest_runtest_protocol(item, nextitem):
        """Log memory usage before and after each test (debug mode only)."""
        before = get_memory_usage_mb()
        yield
        after = get_memory_usage_mb()
        if after - before > 10:  # Only log if > 10MB increase
            print(f"\n  Memory: {before:.1f}MB -> {after:.1f}MB (+{after - before:.1f}MB)")


# ============================================================================
# ASYNC SUPPORT
# ============================================================================


@pytest.fixture(scope="session")
def event_loop():
    """Create an event loop for async tests.

    Session-scoped for better performance with many async tests.
    """
    policy = asyncio.get_event_loop_policy()
    loop = policy.new_event_loop()
    yield loop
    loop.close()


@pytest.fixture
def async_mock():
    """Create an async mock function.

    Usage:
        def test_something(async_mock):
            mock = async_mock(return_value=42)
            result = await mock()
            assert result == 42
    """
    return AsyncMock


@pytest.fixture
def mock_async_context():
    """Create an async context manager mock.

    Usage:
        async def test_resource(mock_async_context):
            mock = mock_async_context()
            mock.__aenter__.return_value = "resource"
            async with mock() as resource:
                assert resource == "resource"
    """

    def create_mock(**kwargs):
        mock = AsyncMock(**kwargs)
        mock.__aenter__ = AsyncMock()
        mock.__aexit__ = AsyncMock()
        return mock

    return create_mock


# ============================================================================
# TEST DATA FIXTURES
# ============================================================================


@pytest.fixture
def sample_image_path(tmp_path: Path):
    """Create a sample test image and return its path."""
    from PIL import Image

    img = Image.new("RGB", (100, 100), color=(128, 128, 128))
    path = tmp_path / "test_image.png"
    img.save(path)
    return path


@pytest.fixture
def sample_rgba_image_path(tmp_path: Path):
    """Create a sample RGBA test image and return its path."""
    from PIL import Image

    img = Image.new("RGBA", (100, 100), color=(255, 0, 0, 128))
    path = tmp_path / "test_rgba_image.png"
    img.save(path)
    return path


@pytest.fixture
def temp_rts_file(tmp_path: Path):
    """Create a temporary RTS (Runtime State) file for testing."""

    def create_rts_file(data: bytes = b"test rts data") -> Path:
        path = tmp_path / "test.rts"
        path.write_bytes(data)
        return path

    return create_rts_file


# ============================================================================
# COVERAGE UTILITIES
# ============================================================================


@pytest.fixture(scope="session")
def coverage_config():
    """Get coverage configuration for tests.

    Returns:
        Dict with coverage settings
    """
    return {
        "source": ["systems"],
        "branch": True,
        "omit": ["*/tests/*", "*/__pycache__/*"],
        "fail_under": 30,  # Minimum coverage percentage
    }


# ============================================================================
# TEST REPORTING HOOKS
# ============================================================================


def pytest_terminal_summary(terminalreporter, exitstatus, config):
    """Add custom summary information to test output."""
    # Report test counts by marker
    stats = terminalreporter.stats

    passed = len(stats.get("passed", []))
    failed = len(stats.get("failed", []))
    skipped = len(stats.get("skipped", []))
    errors = len(stats.get("error", []))

    terminalreporter.write_sep("=", "Geometry OS Test Summary", bold=True)
    terminalreporter.write_line(f"  ✅ Passed:  {passed}")
    terminalreporter.write_line(f"  ❌ Failed:  {failed}")
    terminalreporter.write_line(f"  ⏭️  Skipped: {skipped}")
    terminalreporter.write_line(f"  🚫 Errors:  {errors}")

    # Calculate pass rate
    total_run = passed + failed + errors
    if total_run > 0:
        pass_rate = (passed / total_run) * 100
        terminalreporter.write_line(f"  📊 Pass Rate: {pass_rate:.1f}%")


# ============================================================================
# AUTO-SKIP DECORATORS
# ============================================================================


def pytest_collection_modifyitems(config, items):
    """Auto-skip tests based on markers and environment."""
    skip_cuda = pytest.mark.skip(reason="CUDA not available")
    skip_gpu = pytest.mark.skip(reason="GPU not available")
    skip_network = pytest.mark.skip(reason="Network not available")

    # Check availability
    has_cuda = False
    has_gpu = False
    has_network = False

    try:
        import torch

        has_cuda = torch.cuda.is_available()
        has_gpu = has_cuda or (
            hasattr(torch.backends, "mps") and torch.backends.mps.is_available()
        )
    except ImportError:
        pass

    try:
        import socket

        socket.create_connection(("8.8.8.8", 53), timeout=1)
        has_network = True
    except OSError:
        pass

    # Apply skips
    for item in items:
        if "requires_cuda" in item.keywords and not has_cuda:
            item.add_marker(skip_cuda)
        elif "requires_gpu" in item.keywords and not has_gpu:
            item.add_marker(skip_gpu)
        elif "requires_network" in item.keywords and not has_network:
            item.add_marker(skip_network)

    # Clean up memory after collection
    gc.collect()
