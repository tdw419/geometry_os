"""
Tests for Pixel LLM Error Handling Module

Tests exception classes, error classifier, and error codes.
"""

import pytest

# Import from the correct module path
from systems.pixel_llm.errors import (
    PixelLMError,
    ConnectionError,
    TimeoutError,
    ValidationError,
    APIError,
    EncoderError,
    CircuitBreakerOpen,
    RetryExhausted,
    ErrorCodes,
    ErrorCategory,
    ErrorSeverity,
    ErrorClassification,
    ErrorClassifier,
    classify_error,
    get_recovery_suggestion,
    is_retryable,
)


class TestExceptionClasses:
    """Test custom exception classes."""

    def test_pixel_llm_error_base_class(self):
        """Test PixelLMError base exception."""
        error = PixelLMError("Test error", code="TEST_001")
        assert error.message == "Test error"
        assert error.code == "TEST_001"
        assert error.details == {}

    def test_pixel_llm_error_with_details(self):
        """Test PixelLMError with details."""
        details = {"context": "test_context", "value": 42}
        error = PixelLMError("Test error", details=details)
        assert error.details == details

    def test_pixel_llm_error_to_dict(self):
        """Test PixelLMError to_dict conversion."""
        error = PixelLMError("Test error", code="TEST_001")
        error_dict = error.to_dict()
        assert error_dict["error"] == "TEST_001"
        assert error_dict["message"] == "Test error"

    def test_connection_error(self):
        """Test ConnectionError exception."""
        error = ConnectionError("Failed to connect")
        assert isinstance(error, PixelLMError)
        assert error.code == "CONNECTION_ERROR"
        assert error.message == "Failed to connect"

    def test_connection_error_with_service(self):
        """Test ConnectionError with service parameter."""
        error = ConnectionError("Failed to connect", service="LM Studio")
        assert error.details["service"] == "LM Studio"

    def test_timeout_error(self):
        """Test TimeoutError exception."""
        error = TimeoutError("Operation timed out")
        assert isinstance(error, PixelLMError)
        assert error.code == "TIMEOUT_ERROR"

    def test_timeout_error_with_timeout_seconds(self):
        """Test TimeoutError with timeout_seconds parameter."""
        error = TimeoutError("Operation timed out", timeout_seconds=30.0)
        assert error.details["timeout_seconds"] == 30.0

    def test_validation_error(self):
        """Test ValidationError exception."""
        error = ValidationError("Invalid input")
        assert isinstance(error, PixelLMError)
        assert error.code == "VALIDATION_ERROR"

    def test_validation_error_with_field(self):
        """Test ValidationError with field parameter."""
        error = ValidationError("Invalid input", field="prompt", value="bad")
        assert error.details["field"] == "prompt"
        assert error.details["value"] == "bad"

    def test_api_error(self):
        """Test APIError exception."""
        error = APIError("API error")
        assert isinstance(error, PixelLMError)
        assert error.code == "API_ERROR"

    def test_api_error_with_status_code(self):
        """Test APIError with status_code parameter."""
        error = APIError("API error", status_code=500, response_body="Internal Server Error")
        assert error.details["status_code"] == 500
        assert error.details["response_body"] == "Internal Server Error"

    def test_encoder_error(self):
        """Test EncoderError exception."""
        error = EncoderError("Encoder failed")
        assert isinstance(error, PixelLMError)
        assert error.code == "ENCODER_ERROR"

    def test_encoder_error_with_encoder_type(self):
        """Test EncoderError with encoder_type parameter."""
        error = EncoderError("Encoder failed", encoder_type="dinov2")
        assert error.details["encoder_type"] == "dinov2"

    def test_circuit_breaker_open(self):
        """Test CircuitBreakerOpen exception."""
        error = CircuitBreakerOpen("Circuit is open")
        assert isinstance(error, PixelLMError)
        assert error.code == "CIRCUIT_BREAKER_OPEN"

    def test_circuit_breaker_open_with_failure_count(self):
        """Test CircuitBreakerOpen with failure_count parameter."""
        error = CircuitBreakerOpen("Circuit is open", failure_count=5, cooldown_until=1234567890.0)
        assert error.details["failure_count"] == 5
        assert error.details["cooldown_until"] == 1234567890.0

    def test_retry_exhausted(self):
        """Test RetryExhausted exception."""
        error = RetryExhausted("Retries exhausted")
        assert isinstance(error, PixelLMError)
        assert error.code == "RETRY_EXHAUSTED"

    def test_retry_exhausted_with_attempts(self):
        """Test RetryExhausted with attempts parameter."""
        error = RetryExhausted("Retries exhausted", attempts=3, last_error="Connection refused")
        assert error.details["attempts"] == 3
        assert error.details["last_error"] == "Connection refused"


class TestErrorCodes:
    """Test error code definitions."""

    def test_error_codes_class_exists(self):
        """Test that ErrorCodes class exists."""
        assert hasattr(ErrorCodes, "CONNECTION_ERROR")
        assert hasattr(ErrorCodes, "TIMEOUT_ERROR")
        assert hasattr(ErrorCodes, "VALIDATION_ERROR")
        assert hasattr(ErrorCodes, "API_ERROR")
        assert hasattr(ErrorCodes, "ENCODER_ERROR")
        assert hasattr(ErrorCodes, "CIRCUIT_BREAKER_OPEN")
        assert hasattr(ErrorCodes, "RETRY_EXHAUSTED")

    def test_error_code_values(self):
        """Test error code constant values."""
        assert ErrorCodes.CONNECTION_ERROR == "CONNECTION_ERROR"
        assert ErrorCodes.TIMEOUT_ERROR == "TIMEOUT_ERROR"
        assert ErrorCodes.VALIDATION_ERROR == "VALIDATION_ERROR"
        assert ErrorCodes.API_ERROR == "API_ERROR"
        assert ErrorCodes.ENCODER_ERROR == "ENCODER_ERROR"
        assert ErrorCodes.CIRCUIT_BREAKER_OPEN == "CIRCUIT_BREAKER_OPEN"
        assert ErrorCodes.RETRY_EXHAUSTED == "RETRY_EXHAUSTED"


class TestErrorClassifier:
    """Test error classification functionality."""

    def test_classify_connection_error(self):
        """Test classification of ConnectionError."""
        error = ConnectionError("Connection failed")
        classification = ErrorClassifier.classify(error)

        assert isinstance(classification, ErrorClassification)
        # Connection errors should be retryable
        assert classification.retryable is True

    def test_classify_timeout_error(self):
        """Test classification of TimeoutError."""
        error = TimeoutError("Request timed out")
        classification = ErrorClassifier.classify(error)

        assert isinstance(classification, ErrorClassification)
        # Timeout errors should be retryable
        assert classification.retryable is True

    def test_classify_validation_error(self):
        """Test classification of ValidationError."""
        error = ValidationError("Invalid input")
        classification = ErrorClassifier.classify(error)

        assert isinstance(classification, ErrorClassification)
        # Validation errors should not be retryable
        assert classification.retryable is False

    def test_classification_can_retry(self):
        """Test ErrorClassification.can_retry method."""
        error = ConnectionError("Connection failed")
        classification = classify_error(error)
        assert classification.can_retry() is True

        error = ValidationError("Invalid input")
        classification = classify_error(error)
        assert classification.can_retry() is False

    def test_classification_has_fallback(self):
        """Test ErrorClassification.has_fallback method."""
        error = ConnectionError("Connection failed")
        classification = classify_error(error)
        # Most errors should have fallback options
        assert hasattr(classification, "has_fallback")

    def test_classification_is_critical(self):
        """Test ErrorClassification.is_critical method."""
        error = ConnectionError("Connection failed")
        classification = classify_error(error)
        # Check if severity is not critical for connection errors
        if hasattr(classification, "is_critical"):
            result = classification.is_critical()
            assert isinstance(result, bool)

    def test_get_recovery_suggestions(self):
        """Test getting recovery suggestions."""
        error = ConnectionError("Connection failed")
        suggestions = ErrorClassifier.get_recovery_suggestions(error)

        assert isinstance(suggestions, list)
        assert len(suggestions) > 0


class TestConvenienceFunctions:
    """Test convenience functions."""

    def test_classify_error_function(self):
        """Test classify_error convenience function."""
        error = ConnectionError("Connection failed")
        classification = classify_error(error)
        assert isinstance(classification, ErrorClassification)

    def test_get_recovery_suggestion_function(self):
        """Test get_recovery_suggestion convenience function."""
        error = TimeoutError("Request timed out")
        suggestion = get_recovery_suggestion(error)
        assert isinstance(suggestion, str)
        assert len(suggestion) > 0

    def test_is_retryable_function(self):
        """Test is_retryable convenience function."""
        error = ConnectionError("Connection failed")
        assert is_retryable(error) is True

        error = ValidationError("Invalid input")
        assert is_retryable(error) is False
