"""
Tests for Pixel LLM Validation Module

Tests tensor validation, config validation, and input sanitization.
"""

import pytest
import numpy as np

from systems.pixel_llm.validation import (
    validate_tensor,
    validate_config,
    sanitize_input,
    validate_image_tensor,
    validate_lm_studio_config,
    validate_encoder_config,
    validate_batch_size,
    validate_file_path,
)

from systems.pixel_llm.errors import ValidationError as PixelLMValidationError


class TestValidateTensor:
    """Test tensor validation."""

    def test_valid_tensor(self):
        """Test validation of a valid tensor."""
        tensor = np.array([[1.0, 2.0], [3.0, 4.0]], dtype=np.float32)
        validate_tensor(tensor)  # Should not raise

    def test_tensor_shape_validation(self):
        """Test tensor shape validation."""
        tensor = np.array([1.0, 2.0, 3.0])

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_tensor(tensor, expected_shape=(2, 2))

        assert "shape" in str(exc_info.value).lower()

    def test_tensor_dtype_validation(self):
        """Test tensor dtype validation."""
        tensor = np.array([1.0, 2.0, 3.0], dtype=np.float32)

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_tensor(tensor, expected_dtype="int64")

        assert "dtype" in str(exc_info.value).lower()

    def test_tensor_value_range_validation(self):
        """Test tensor value range validation."""
        tensor = np.array([1.0, 2.0, 3.0])

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_tensor(tensor, min_value=2.0)

        assert "minimum" in str(exc_info.value).lower() or "range" in str(exc_info.value).lower()

    def test_tensor_max_value_validation(self):
        """Test tensor maximum value validation."""
        tensor = np.array([1.0, 2.0, 3.0])

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_tensor(tensor, max_value=2.0)

        assert "maximum" in str(exc_info.value).lower() or "range" in str(exc_info.value).lower()

    def test_none_tensor(self):
        """Test that None tensor raises validation error."""
        with pytest.raises(PixelLMValidationError):
            validate_tensor(None)


class TestValidateConfig:
    """Test config validation."""

    def test_valid_config(self):
        """Test validation of a valid config."""
        config = {"host": "localhost", "port": 1234, "model": "test"}
        validate_config(
            config,
            required_fields=["host", "port", "model"],
        )

    def test_missing_required_field(self):
        """Test that missing required field raises error."""
        config = {"host": "localhost"}

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_config(
                config,
                required_fields=["host", "port"],
            )

        assert "missing" in str(exc_info.value).lower() or "required" in str(exc_info.value).lower()

    def test_custom_validator(self):
        """Test custom field validator."""
        def validate_port(value):
            if not isinstance(value, int) or value < 1 or value > 65535:
                raise ValueError("Invalid port")

        config = {"host": "localhost", "port": 70000}  # Invalid port

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_config(
                config,
                required_fields=["host", "port"],
                validators={"port": validate_port},
            )

        assert "port" in str(exc_info.value).lower()


class TestSanitizeInput:
    """Test input sanitization."""

    def test_valid_string(self):
        """Test sanitization of a valid string."""
        result = sanitize_input("test input")
        assert result == "test input"

    def test_null_byte_removal(self):
        """Test removal of null bytes."""
        result = sanitize_input("test\x00input", remove_null_bytes=True)
        assert result == "testinput"

    def test_whitespace_stripping(self):
        """Test whitespace stripping."""
        result = sanitize_input("  test input  ", strip_whitespace=True)
        assert result == "test input"

    def test_max_length_validation(self):
        """Test max length validation."""
        with pytest.raises(PixelLMValidationError) as exc_info:
            sanitize_input("a" * 100, max_length=10)

        assert "length" in str(exc_info.value).lower()

    def test_non_string_input(self):
        """Test that non-string input raises error."""
        with pytest.raises(PixelLMValidationError):
            sanitize_input(123)


class TestValidateImageTensor:
    """Test image tensor validation."""

    def test_valid_image_tensor(self):
        """Test validation of a valid image tensor."""
        # CHW format (3, 224, 224)
        tensor = np.random.rand(3, 224, 224).astype(np.float32)
        validate_image_tensor(tensor)  # Should not raise

    def test_hwc_format_tensor(self):
        """Test validation of HWC format tensor."""
        # HWC format (224, 224, 3)
        tensor = np.random.rand(224, 224, 3).astype(np.float32)
        validate_image_tensor(tensor)  # Should not raise

    def test_invalid_shape(self):
        """Test that invalid shape raises error."""
        tensor = np.random.rand(10, 10).astype(np.float32)

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_image_tensor(tensor)

        assert "shape" in str(exc_info.value).lower()

    def test_invalid_channels(self):
        """Test that invalid channel count raises error."""
        # Too many channels (10 channels)
        tensor = np.random.rand(10, 224, 224).astype(np.float32)

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_image_tensor(tensor, max_channels=4)

        assert "channels" in str(exc_info.value).lower()


class TestValidateLMStudioConfig:
    """Test LM Studio config validation."""

    def test_valid_config(self):
        """Test validation of valid LM Studio config."""
        config = {
            "host": "localhost",
            "port": 1234,
            "model_name": "test-model",
        }
        validate_lm_studio_config(config)  # Should not raise

    def test_missing_host(self):
        """Test that missing host raises error."""
        config = {"port": 1234, "model_name": "test"}

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_lm_studio_config(config)

        assert "host" in str(exc_info.value).lower()

    def test_invalid_port_type(self):
        """Test that invalid port type raises error."""
        config = {
            "host": "localhost",
            "port": "not_a_number",
            "model_name": "test",
        }

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_lm_studio_config(config)

        assert "port" in str(exc_info.value).lower()

    def test_invalid_port_range(self):
        """Test that invalid port range raises error."""
        config = {
            "host": "localhost",
            "port": 70000,  # Invalid port
            "model_name": "test",
        }

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_lm_studio_config(config)

        assert "port" in str(exc_info.value).lower()

    def test_missing_model_name(self):
        """Test that missing model name raises error."""
        config = {"host": "localhost", "port": 1234}

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_lm_studio_config(config)

        assert "model" in str(exc_info.value).lower()


class TestValidateEncoderConfig:
    """Test encoder config validation."""

    def test_valid_config(self):
        """Test validation of valid encoder config."""
        config = {"encoder_type": "dinov2"}
        validate_encoder_config(config)  # Should not raise

    def test_valid_encoder_types(self):
        """Test all valid encoder types."""
        valid_types = ["dinov2", "clip", "resnet"]

        for encoder_type in valid_types:
            config = {"encoder_type": encoder_type}
            validate_encoder_config(config)  # Should not raise

    def test_invalid_encoder_type(self):
        """Test that invalid encoder type raises error."""
        config = {"encoder_type": "invalid_type"}

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_encoder_config(config)

        assert "encoder" in str(exc_info.value).lower()


class TestValidateBatchSize:
    """Test batch size validation."""

    def test_valid_batch_size(self):
        """Test validation of valid batch size."""
        validate_batch_size(8)  # Should not raise
        validate_batch_size(1)  # Minimum
        validate_batch_size(32)  # Default max

    def test_invalid_type(self):
        """Test that invalid type raises error."""
        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_batch_size("not_a_number")

        assert "integer" in str(exc_info.value).lower() or "type" in str(exc_info.value).lower()

    def test_too_small(self):
        """Test that too small batch size raises error."""
        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_batch_size(0)

        assert ">=" in str(exc_info.value) or "greater" in str(exc_info.value).lower()

    def test_too_large(self):
        """Test that too large batch size raises error."""
        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_batch_size(100, max_batch_size=32)

        assert "<=" in str(exc_info.value) or "less" in str(exc_info.value).lower()


class TestValidateFilePath:
    """Test file path validation."""

    def test_valid_file_path(self):
        """Test validation of valid file path."""
        validate_file_path("/path/to/file.png")  # Should not raise

    def test_empty_path(self):
        """Test that empty path raises error."""
        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_file_path("")

        assert "empty" in str(exc_info.value).lower()

    def test_non_string_path(self):
        """Test that non-string path raises error."""
        with pytest.raises(PixelLMValidationError):
            validate_file_path(123)

    def test_allowed_extensions(self):
        """Test allowed extensions validation."""
        # Valid extension
        validate_file_path("/path/to/file.png", allowed_extensions=[".png", ".jpg"])

        # Invalid extension
        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_file_path(
                "/path/to/file.txt", allowed_extensions=[".png", ".jpg"]
            )

        assert "extension" in str(exc_info.value).lower()

    def test_must_exist_true(self):
        """Test that non-existent file raises error when must_exist=True."""
        import tempfile

        # Create a temporary file
        with tempfile.NamedTemporaryFile(delete=False) as tmp:
            tmp_path = tmp.name

        # Test with existing file
        validate_file_path(tmp_path, must_exist=True)

        # Test with non-existent file
        import os
        os.unlink(tmp_path)

        with pytest.raises(PixelLMValidationError) as exc_info:
            validate_file_path(tmp_path, must_exist=True)

        assert "does not exist" in str(exc_info.value).lower() or "exist" in str(exc_info.value).lower()
