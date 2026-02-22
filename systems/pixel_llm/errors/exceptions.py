"""
Custom exception classes for Pixel LLM system.

Provides structured error handling with error codes and descriptive messages
for different failure modes in the Pixel LLM pipeline.
"""

from typing import Optional, Dict, Any


class PixelLMError(Exception):
    """Base exception class for all Pixel LLM errors.

    Attributes:
        message: Human-readable error description
        code: Machine-readable error code
        details: Additional error context
    """

    def __init__(self, message: str, code: str = "PIXEL_LLM_ERROR", details: Optional[Dict[str, Any]] = None):
        self.message = message
        self.code = code
        self.details = details or {}
        super().__init__(self.message)

    def __str__(self) -> str:
        if self.details:
            return f"[{self.code}] {self.message} - Details: {self.details}"
        return f"[{self.code}] {self.message}"

    def to_dict(self) -> Dict[str, Any]:
        """Convert error to dictionary for API responses."""
        return {
            "error": self.code,
            "message": self.message,
            "details": self.details
        }


class ConnectionError(PixelLMError):
    """Raised when connection to external service fails.

    Examples:
        - LM Studio WebSocket connection failure
        - Network timeout during connection
        - Service unavailable
    """

    def __init__(self, message: str, service: Optional[str] = None, details: Optional[Dict[str, Any]] = None):
        error_details = details or {}
        if service:
            error_details["service"] = service
        super().__init__(message, code="CONNECTION_ERROR", details=error_details)


class TimeoutError(PixelLMError):
    """Raised when operation exceeds timeout threshold.

    Examples:
        - LLM inference timeout
        - API request timeout
        - Encoder processing timeout
    """

    def __init__(self, message: str, timeout_seconds: Optional[float] = None, details: Optional[Dict[str, Any]] = None):
        error_details = details or {}
        if timeout_seconds is not None:
            error_details["timeout_seconds"] = timeout_seconds
        super().__init__(message, code="TIMEOUT_ERROR", details=error_details)


class ValidationError(PixelLMError):
    """Raised when input validation fails.

    Examples:
        - Invalid prompt format
        - Missing required fields
        - Out-of-range values
    """

    def __init__(self, message: str, field: Optional[str] = None, value: Optional[Any] = None, details: Optional[Dict[str, Any]] = None):
        error_details = details or {}
        if field:
            error_details["field"] = field
        if value is not None:
            error_details["value"] = str(value)
        super().__init__(message, code="VALIDATION_ERROR", details=error_details)


class APIError(PixelLMError):
    """Raised when external API returns error response.

    Examples:
        - HTTP 4xx/5xx responses
        - API rate limit exceeded
        - Invalid API key
    """

    def __init__(self, message: str, status_code: Optional[int] = None, response_body: Optional[str] = None, details: Optional[Dict[str, Any]] = None):
        error_details = details or {}
        if status_code is not None:
            error_details["status_code"] = status_code
        if response_body:
            error_details["response_body"] = response_body[:500]  # Truncate long responses
        super().__init__(message, code="API_ERROR", details=error_details)


class EncoderError(PixelLMError):
    """Raised when encoder/encoder operation fails.

    Examples:
        - Vision encoder failure
        - Embedding generation error
        - Preprocessing failure
    """

    def __init__(self, message: str, encoder_type: Optional[str] = None, details: Optional[Dict[str, Any]] = None):
        error_details = details or {}
        if encoder_type:
            error_details["encoder_type"] = encoder_type
        super().__init__(message, code="ENCODER_ERROR", details=error_details)


class CircuitBreakerOpen(PixelLMError):
    """Raised when circuit breaker is open and requests are blocked.

    The circuit breaker prevents cascading failures by blocking requests
    to a failing service until it recovers.
    """

    def __init__(self, message: str, failure_count: Optional[int] = None, cooldown_until: Optional[float] = None, details: Optional[Dict[str, Any]] = None):
        error_details = details or {}
        if failure_count is not None:
            error_details["failure_count"] = failure_count
        if cooldown_until is not None:
            error_details["cooldown_until"] = cooldown_until
        super().__init__(message, code="CIRCUIT_BREAKER_OPEN", details=error_details)


class RetryExhausted(PixelLMError):
    """Raised when all retry attempts are exhausted.

    This indicates that a operation failed after being retried
    the maximum number of times.
    """

    def __init__(self, message: str, attempts: Optional[int] = None, last_error: Optional[str] = None, details: Optional[Dict[str, Any]] = None):
        error_details = details or {}
        if attempts is not None:
            error_details["attempts"] = attempts
        if last_error:
            error_details["last_error"] = last_error
        super().__init__(message, code="RETRY_EXHAUSTED", details=error_details)


# Error code constants for easy reference
class ErrorCodes:
    """Constants for all error codes used in the system."""

    CONNECTION_ERROR = "CONNECTION_ERROR"
    TIMEOUT_ERROR = "TIMEOUT_ERROR"
    VALIDATION_ERROR = "VALIDATION_ERROR"
    API_ERROR = "API_ERROR"
    ENCODER_ERROR = "ENCODER_ERROR"
    CIRCUIT_BREAKER_OPEN = "CIRCUIT_BREAKER_OPEN"
    RETRY_EXHAUSTED = "RETRY_EXHAUSTED"
    PIXEL_LLM_ERROR = "PIXEL_LLM_ERROR"
