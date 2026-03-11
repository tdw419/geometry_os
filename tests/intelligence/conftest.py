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
            # Only skip tests in this directory (tests/intelligence/)
            item_path = str(item.fspath if hasattr(item, 'fspath') else item.path)
            if "tests/intelligence/" in item_path or "tests\\intelligence\\" in item_path:
                item.add_marker(pytest.mark.skip(reason=skip_reason))
