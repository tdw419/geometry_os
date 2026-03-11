"""Error classification and recovery logic for Pixel LLM."""

from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Any, List, Optional


class ErrorCategory(Enum):
    """Broad categories of errors."""
    CONNECTION = auto()
    TIMEOUT = auto()
    VALIDATION = auto()
    API = auto()
    ENCODER = auto()
    SYSTEM = auto()
    UNKNOWN = auto()


class ErrorSeverity(Enum):
    """Severity levels for errors."""
    LOW = auto()
    MEDIUM = auto()
    HIGH = auto()
    CRITICAL = auto()


@dataclass
class ErrorClassification:
    """Detailed classification of an error."""
    category: ErrorCategory
    severity: ErrorSeverity
    retryable: bool = False
    recovery_suggestion: str = "No suggestion available."
    has_fallback: bool = False

    def can_retry(self) -> bool:
        """Check if the operation can be retried."""
        return self.retryable


class ErrorClassifier:
    """Logic for classifying exceptions into ErrorClassification."""

    @staticmethod
    def classify(error: Exception) -> ErrorClassification:
        """Analyze an exception and return its classification."""
        from .exceptions import APIError, CircuitBreakerOpen, ConnectionError, EncoderError, RetryExhausted, TimeoutError, ValidationError
        
        if isinstance(error, ConnectionError):
            return ErrorClassification(ErrorCategory.CONNECTION, ErrorSeverity.HIGH, retryable=True, recovery_suggestion="Check LM Studio status and network connectivity.", has_fallback=True)
        if isinstance(error, TimeoutError):
            return ErrorClassification(ErrorCategory.TIMEOUT, ErrorSeverity.MEDIUM, retryable=True, recovery_suggestion="Increase timeout settings or reduce request size.")
        if isinstance(error, ValidationError):
            return ErrorClassification(ErrorCategory.VALIDATION, ErrorSeverity.LOW, retryable=False, recovery_suggestion="Correct the input data format and try again.")
        if isinstance(error, APIError):
            return ErrorClassification(ErrorCategory.API, ErrorSeverity.HIGH, retryable=False, recovery_suggestion="Check API credentials and parameters.")
        if isinstance(error, EncoderError):
            return ErrorClassification(ErrorCategory.ENCODER, ErrorSeverity.MEDIUM, retryable=True, recovery_suggestion="Verify encoder input and resource availability.", has_fallback=True)
        if isinstance(error, CircuitBreakerOpen):
            return ErrorClassification(ErrorCategory.SYSTEM, ErrorSeverity.HIGH, retryable=False, recovery_suggestion="Wait for the service to recover from repeated failures.", has_fallback=True)
        if isinstance(error, RetryExhausted):
            return ErrorClassification(ErrorCategory.SYSTEM, ErrorSeverity.MEDIUM, retryable=False, recovery_suggestion="Max retries reached. Check for persistent failures.")
            
        return ErrorClassification(ErrorCategory.UNKNOWN, ErrorSeverity.MEDIUM, retryable=False)

    @staticmethod
    def get_recovery_suggestions(error: Exception) -> List[str]:
        """Get recovery suggestions for an error."""
        classification = ErrorClassifier.classify(error)
        return [classification.recovery_suggestion]


def classify_error(error: Exception) -> ErrorClassification:
    """Utility function to classify an error."""
    return ErrorClassifier.classify(error)


def get_recovery_suggestion(error: Exception) -> str:
    """Get a human-readable recovery suggestion for an error."""
    return classify_error(error).recovery_suggestion


def is_retryable(error: Exception) -> bool:
    """Check if an error is considered retryable."""
    return classify_error(error).can_retry()
