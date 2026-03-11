"""
Pytest configuration for system tests.

Skips tests if required modules are not available.
"""

import pytest

# Check for visual_shell worker agent
try:
    import systems.visual_shell.swarm.worker_agent  # noqa: F401
    VISUAL_SHELL_AVAILABLE = True
except ImportError:
    VISUAL_SHELL_AVAILABLE = False


def pytest_collection_modifyitems(config, items):
    """Skip tests in this directory if visual_shell module not available."""
    if not VISUAL_SHELL_AVAILABLE:
        skip_reason = "systems.visual_shell.swarm.worker_agent module not available"
        for item in items:
            # Only skip tests in this directory (tests/system/)
            item_path = str(item.fspath if hasattr(item, 'fspath') else item.path)
            if "tests/system/" in item_path or "tests\\system\\" in item_path:
                item.add_marker(pytest.mark.skip(reason=skip_reason))
