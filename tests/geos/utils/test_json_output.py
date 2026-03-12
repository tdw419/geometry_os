import pytest
from geos.utils.json_output import format_json_output


def test_format_json_output_basic():
    """Test basic JSON formatting."""
    data = {"key": "value", "number": 42}
    result = format_json_output(data)
    assert result == '{"key": "value", "number": 42}'


def test_format_json_output_sorted():
    """Test JSON formatting with sorted keys."""
    data = {"z": 1, "a": 2}
    result = format_json_output(data, sort_keys=True)
    assert result == '{"a": 2, "z": 1}'