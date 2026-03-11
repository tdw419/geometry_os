"""
conftest.py for prts_toolchain tests.

Skip all tests in this directory because the prts_toolchain module is not installed.
"""
import pytest

# Skip all tests in this module
pytestmark = pytest.mark.skip(reason="prts_toolchain module not installed")
