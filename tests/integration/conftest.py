"""
Pytest configuration for integration tests.

Skips tests if required modules are not available.
"""

import pytest

# Check for neural_substrate
try:
    import systems.neural_substrate  # noqa: F401
    NEURAL_SUBSTRATE_AVAILABLE = True
except ImportError:
    NEURAL_SUBSTRATE_AVAILABLE = False


def pytest_collection_modifyitems(config, items):
    """Skip tests if neural_substrate not available."""
    if not NEURAL_SUBSTRATE_AVAILABLE:
        skip_reason = "systems.neural_substrate module not available"
        for item in items:
            # Only skip tests that actually need neural_substrate
            if "neural" in str(item.fspath if hasattr(item, 'fspath') else item.path).lower():
                item.add_marker(pytest.mark.skip(reason=skip_reason))
