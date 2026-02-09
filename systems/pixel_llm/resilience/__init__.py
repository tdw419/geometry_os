"""
Resilience patterns for Pixel LLM error handling.

This module provides circuit breaker, retry, and fallback strategies
for handling failures gracefully.
"""

from .circuit_breaker import (
    CircuitState,
    CircuitBreakerConfig,
    CircuitBreaker,
    with_circuit_breaker,
)

from .retry import (
    RetryStrategy,
    RetryConfig,
    RetryStats,
    RetryManager,
    retry,
    retry_on_connection_error,
    retry_on_timeout,
)

from .fallback import (
    FallbackStrategy,
    CachedResult,
    FallbackConfig,
    FallbackManager,
    with_fallback,
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
