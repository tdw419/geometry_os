"""
Resilience patterns for Pixel LLM error handling.

This module provides circuit breaker, retry, and fallback strategies
for handling failures gracefully.
"""

from .circuit_breaker import (
    CircuitBreaker,
    CircuitBreakerConfig,
    CircuitState,
    with_circuit_breaker,
)
from .fallback import (
    CachedResult,
    FallbackConfig,
    FallbackManager,
    FallbackStrategy,
    with_fallback,
)
from .retry import (
    RetryConfig,
    RetryManager,
    RetryStats,
    RetryStrategy,
    retry,
    retry_on_connection_error,
    retry_on_timeout,
)

__all__ = [
    # Circuit Breaker
    "CircuitState",
    "CircuitBreakerConfig",
    "CircuitBreaker",
    "with_circuit_breaker",
    # Retry
    "RetryStrategy",
    "RetryConfig",
    "RetryStats",
    "RetryManager",
    "retry",
    "retry_on_connection_error",
    "retry_on_timeout",
    # Fallback
    "FallbackStrategy",
    "CachedResult",
    "FallbackConfig",
    "FallbackManager",
    "with_fallback",
]
