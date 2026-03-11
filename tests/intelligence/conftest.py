"""
Pytest configuration for intelligence tests.

Skips all tests in this directory if required modules are not available.
"""

import pytest

# Check if the intelligence core module exists
try:
    import systems.intelligence.core  # noqa: F401
    INTELLIGENCE_AVAILABLE = True
except ImportError:
    INTELLIGENCE_AVAILABLE = False


def pytest_collection_modifyitems(config, items):
    """Skip all tests in this directory if intelligence module not available."""
    if not INTELLIGENCE_AVAILABLE:
        skip_reason = "systems.intelligence.core module not available"
        for item in items:
            item.add_marker(pytest.mark.skip(reason=skip_reason))
