"""Test configuration for Geometry OS tests."""
import sys
from pathlib import Path
import pytest

# Directory structure:
#   /home/jericho/zion/projects/geometry_os/         <- repo root (contains geometry_os package)
#   /home/jericho/zion/projects/geometry_os/geometry_os/  <- geometry_os package
#   /home/jericho/zion/projects/geometry_os/geometry_os/tests/  <- this file
#
# Tests import using 'geometry_os.systems.pixel_compiler' which needs:
#   sys.path to include /home/jericho/zion/projects/geometry_os/
#   geometry_os/__init__.py to exist

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


# ============================================================================
# SKIP MARKERS FOR OPTIONAL MODULES
# ============================================================================

# Cache for module availability
_module_cache = {}


def _check_module_available(module_name):
    """Check if a module is available, caching the result."""
    if module_name not in _module_cache:
        try:
            __import__(module_name)
            _module_cache[module_name] = True
        except ImportError:
            _module_cache[module_name] = False
    return _module_cache[module_name]


def pytest_ignore_collect(collection_path, config):
    """Skip test files that have import errors for optional modules."""
    path_str = str(collection_path)

    # Map of path patterns to required modules
    path_module_map = [
        (["tests/intelligence/", "tests/integration/neural_pipeline"], [
            "systems.intelligence.core",
            "systems.neural_substrate"
        ]),
        (["tests/system/test_visual"], [
            "systems.visual_shell.swarm.worker_agent"
        ]),
        (["tests/test_directive"], [
            "systems.intelligence.directive_agent"
        ]),
        (["tests/test_amp_lightning", "tests/test_amp_trainer", "tests/test_lightning_trainer"], [
            "geometry_os.systems.pixel_compiler.amp_config"
        ]),
        (["tests/test_gpu_test_generation"], [
            "geometry_os.systems.pixel_compiler.cuda_detector"
        ]),
        (["tests/test_live_evolution", "tests/test_tectonic"], [
            "systems.tectonic"
        ]),
        (["tests/test_unified_config"], [
            "geometry_os.systems.pixel_compiler.unified_config"
        ]),
        (["tests/test_wp_evolution"], [
            "systems.evolution_daemon.wordpress"
        ]),
        (["tests/unit/test_phase1_benchmark"], [
            "geometry_os.systems.pixel_compiler.benchmarks"
        ]),
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
    config.addinivalue_line(
        "markers", "requires_cuda: skip test if CUDA modules not available"
    )
    config.addinivalue_line(
        "markers", "requires_amp: skip test if AMP/PyTorch Lightning modules not available"
    )
    config.addinivalue_line(
        "markers", "requires_intelligence: skip test if intelligence modules not available"
    )
