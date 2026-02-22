"""
Pixel LLM error handling package.

Provides comprehensive error handling, classification, and recovery
guidance for the Pixel LLM system.

Example:
    ```python
    from geometry_os.systems.pixel_llm.errors import (
        PixelLMError,
        ConnectionError,
        TimeoutError,
        ValidationError,
        APIError,
        EncoderError,
        CircuitBreakerOpen,
        RetryExhausted,
        ErrorCodes,
        ErrorClassifier,
        ErrorClassification,
        ErrorCategory,
        ErrorSeverity,
        classify_error,
        get_recovery_suggestion,
        is_retryable,
    )

    # Raise an error
    raise ConnectionError("LM Studio unavailable", service="LM Studio")

    # Classify an error
    try:
        await llm.generate(prompt)
    except Exception as e:
        classification = classify_error(e)
        if classification.can_retry():
            # Retry with backoff
            pass
    ```
"""

# Export all exception classes
from .exceptions import (
    PixelLMError,
    ConnectionError,
    TimeoutError,
    ValidationError,
    APIError,
    EncoderError,
    CircuitBreakerOpen,
    RetryExhausted,
    ErrorCodes,
)

# Export error classifier
from .classifier import (
    ErrorClassifier,
    ErrorClassification,
    ErrorCategory,
    ErrorSeverity,
    classify_error,
    get_recovery_suggestion,
    is_retryable,
)

# Export error codes and utilities
from .codes import (
    # Error code constants
    ERR_CONNECTION_FAILED,
    ERR_CONNECTION_TIMEOUT,
    ERR_CONNECTION_REFUSED,
    ERR_SERVICE_UNAVAILABLE,
    ERR_TIMEOUT_LLM_INFERENCE,
    ERR_TIMEOUT_API_REQUEST,
    ERR_TIMEOUT_ENCODER,
    ERR_VALIDATION_INVALID_FORMAT,
    ERR_VALIDATION_MISSING_FIELD,
    ERR_VALIDATION_OUT_OF_RANGE,
    ERR_VALIDATION_INVALID_TYPE,
    ERR_API_HTTP_4XX,
    ERR_API_HTTP_5XX,
    ERR_API_RATE_LIMIT,
    ERR_API_INVALID_KEY,
    ERR_ENCODER_VISION_FAILED,
    ERR_ENCODER_EMBEDDING_FAILED,
    ERR_ENCODER_PREPROCESSING_FAILED,
    ERR_CIRCUIT_BREAKER_OPEN,
    ERR_CIRCUIT_BREAKER_TIMEOUT,
    ERR_RETRY_EXHAUSTED,
    ERR_CACHE_MISS,
    ERR_UNKNOWN,
    # Error code utilities
    ERROR_MESSAGES,
    get_error_message,
    get_all_error_codes,
    get_error_category,
    is_retryable_error,
    is_client_error,
    # Error code categories
    CONNECTION_ERROR_CODES,
    TIMEOUT_ERROR_CODES,
    VALIDATION_ERROR_CODES,
    API_ERROR_CODES,
    ENCODER_ERROR_CODES,
    CIRCUIT_BREAKER_ERROR_CODES,
    RETRY_ERROR_CODES,
)

__all__ = [
    # Exception classes
    "PixelLMError",
    "ConnectionError",
    "TimeoutError",
    "ValidationError",
    "APIError",
    "EncoderError",
    "CircuitBreakerOpen",
    "RetryExhausted",
    "ErrorCodes",
    # Error classifier
    "ErrorClassifier",
    "ErrorClassification",
    "ErrorCategory",
    "ErrorSeverity",
    "classify_error",
    "get_recovery_suggestion",
    "is_retryable",
    # Error code constants
    "ERR_CONNECTION_FAILED",
    "ERR_CONNECTION_TIMEOUT",
    "ERR_CONNECTION_REFUSED",
    "ERR_SERVICE_UNAVAILABLE",
    "ERR_TIMEOUT_LLM_INFERENCE",
    "ERR_TIMEOUT_API_REQUEST",
    "ERR_TIMEOUT_ENCODER",
    "ERR_VALIDATION_INVALID_FORMAT",
    "ERR_VALIDATION_MISSING_FIELD",
    "ERR_VALIDATION_OUT_OF_RANGE",
    "ERR_VALIDATION_INVALID_TYPE",
    "ERR_API_HTTP_4XX",
    "ERR_API_HTTP_5XX",
    "ERR_API_RATE_LIMIT",
    "ERR_API_INVALID_KEY",
    "ERR_ENCODER_VISION_FAILED",
    "ERR_ENCODER_EMBEDDING_FAILED",
    "ERR_ENCODER_PREPROCESSING_FAILED",
    "ERR_CIRCUIT_BREAKER_OPEN",
    "ERR_CIRCUIT_BREAKER_TIMEOUT",
    "ERR_RETRY_EXHAUSTED",
    "ERR_CACHE_MISS",
    "ERR_UNKNOWN",
    # Error code utilities
    "ERROR_MESSAGES",
    "get_error_message",
    "get_all_error_codes",
    "get_error_category",
    "is_retryable_error",
    "is_client_error",
    # Error code categories
    "CONNECTION_ERROR_CODES",
    "TIMEOUT_ERROR_CODES",
    "VALIDATION_ERROR_CODES",
    "API_ERROR_CODES",
    "ENCODER_ERROR_CODES",
    "CIRCUIT_BREAKER_ERROR_CODES",
    "RETRY_ERROR_CODES",
]

# Version info
__version__ = "1.0.0"
__author__ = "Geometry OS Team"
