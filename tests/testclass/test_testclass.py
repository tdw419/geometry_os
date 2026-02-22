"""
Tests for testclass class.
"""

import pytest


class Testtestclass:
    """Test suite for testclass."""

    def test_initialization(self):
        """Test testclass initialization."""
        from systems.testclass import testclass
        obj = testclass()
        assert obj is not None

    def test_execute(self):
        """Test execute method."""
        from systems.testclass import testclass
        obj = testclass()
        # TODO: Add actual test
        with pytest.raises(NotImplementedError):
            obj.execute()
