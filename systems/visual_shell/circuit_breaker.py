"""
Circuit Breakers - Phase 43

Prevent cascade failures with circuit breakers, rate limiters, and graceful degradation.
"""

import asyncio
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class CircuitState(Enum):
    """Circuit breaker states."""
    CLOSED = "closed"  # Normal operation, requests pass through
    OPEN = "open"      # Failing, requests are blocked
    HALF_OPEN = "half_open"  # Testing if service recovered


class RateLimitStrategy(Enum):
    """Rate limiting strategies."""
    TOKEN_BUCKET = "token_bucket"
    SLIDING_WINDOW = "sliding_window"
    FIXED_WINDOW = "fixed_window"


@dataclass
class CircuitConfig:
    """Configuration for a circuit breaker."""
    failure_threshold: int = 5
    success_threshold: int = 3
    timeout: float = 30.0
    half_open_max_calls: int = 1


@dataclass
class CircuitStats:
    """Statistics for a circuit breaker."""
    total_calls: int = 0
    successful_calls: int = 0
    failed_calls: int = 0
    rejected_calls: int = 0
    timeout_calls: int = 0
    last_failure_time: float | None = None
    last_success_time: float | None = None
    state_changed_at: float = field(default_factory=time.time)


@dataclass
class RateLimitConfig:
    """Configuration for rate limiting."""
    max_requests: int = 100
    window_seconds: float = 1.0
    strategy: RateLimitStrategy = RateLimitStrategy.SLIDING_WINDOW


@dataclass
class RateLimitStats:
    """Statistics for rate limiting."""
    total_requests: int = 0
    allowed_requests: int = 0
    rejected_requests: int = 0
    current_rate: float = 0.0


class CircuitBreaker:
    """Circuit breaker to prevent cascade failures."""

    def __init__(
        self,
        name: str,
        config: CircuitConfig | None = None,
        fallback: Callable | None = None,
    ):
        self.name = name
        self.config = config or CircuitConfig()
        self.fallback = fallback
        self._state = CircuitState.CLOSED
        self._stats = CircuitStats()
        self._consecutive_failures = 0
        self._consecutive_successes = 0
        self._half_open_calls = 0
        self._listeners: list[Callable[[CircuitState, CircuitState], None]] = []

    @property
    def state(self) -> CircuitState:
        """Get current circuit state."""
        if self._state == CircuitState.OPEN:
            # Check if timeout has passed
            if self._stats.last_failure_time:
                elapsed = time.time() - self._stats.last_failure_time
                if elapsed >= self.config.timeout:
                    self._transition_to(CircuitState.HALF_OPEN)
        return self._state

    def _transition_to(self, new_state: CircuitState) -> None:
        """Transition to a new state."""
        old_state = self._state
        self._state = new_state
        self._stats.state_changed_at = time.time()

        if new_state == CircuitState.HALF_OPEN:
            self._half_open_calls = 0

        # Notify listeners
        for listener in self._listeners:
            try:
                listener(old_state, new_state)
            except Exception:
                pass

    def can_execute(self) -> bool:
        """Check if execution is allowed."""
        state = self.state

        if state == CircuitState.CLOSED:
            return True
        elif state == CircuitState.OPEN:
            return False
        elif state == CircuitState.HALF_OPEN:
            return self._half_open_calls < self.config.half_open_max_calls

        return False

    def record_success(self) -> None:
        """Record a successful call."""
        self._stats.total_calls += 1
        self._stats.successful_calls += 1
        self._stats.last_success_time = time.time()
        self._consecutive_failures = 0
        self._consecutive_successes += 1

        if self._state == CircuitState.HALF_OPEN:
            self._half_open_calls += 1
            if self._consecutive_successes >= self.config.success_threshold:
                self._transition_to(CircuitState.CLOSED)

    def record_failure(self) -> None:
        """Record a failed call."""
        self._stats.total_calls += 1
        self._stats.failed_calls += 1
        self._stats.last_failure_time = time.time()
        self._consecutive_successes = 0
        self._consecutive_failures += 1

        if self._state == CircuitState.HALF_OPEN:
            self._transition_to(CircuitState.OPEN)
        elif self._state == CircuitState.CLOSED:
            if self._consecutive_failures >= self.config.failure_threshold:
                self._transition_to(CircuitState.OPEN)

    def record_timeout(self) -> None:
        """Record a timed out call."""
        self._stats.timeout_calls += 1
        self.record_failure()

    def record_rejection(self) -> None:
        """Record a rejected call (circuit open)."""
        self._stats.rejected_calls += 1

    async def call(self, func: Callable, *args, **kwargs) -> Any:
        """Execute a function through the circuit breaker."""
        if not self.can_execute():
            self.record_rejection()
            if self.fallback:
                return self.fallback(*args, **kwargs)
            raise CircuitOpenError(f"Circuit '{self.name}' is open")

        try:
            if asyncio.iscoroutinefunction(func):
                result = await func(*args, **kwargs)
            else:
                result = func(*args, **kwargs)
            self.record_success()
            return result
        except Exception:
            self.record_failure()
            if self.fallback:
                return self.fallback(*args, **kwargs)
            raise

    def add_listener(
        self,
        listener: Callable[[CircuitState, CircuitState], None],
    ) -> None:
        """Add a state change listener."""
        self._listeners.append(listener)

    def remove_listener(
        self,
        listener: Callable[[CircuitState, CircuitState], None],
    ) -> None:
        """Remove a state change listener."""
        if listener in self._listeners:
            self._listeners.remove(listener)

    def get_stats(self) -> CircuitStats:
        """Get circuit statistics."""
        return self._stats

    def reset(self) -> None:
        """Reset the circuit breaker."""
        self._state = CircuitState.CLOSED
        self._consecutive_failures = 0
        self._consecutive_successes = 0
        self._half_open_calls = 0
        self._stats = CircuitStats()

    def force_open(self) -> None:
        """Force circuit open."""
        self._transition_to(CircuitState.OPEN)
        self._stats.last_failure_time = time.time()

    def force_close(self) -> None:
        """Force circuit closed."""
        self._transition_to(CircuitState.CLOSED)


class CircuitOpenError(Exception):
    """Exception raised when circuit is open."""
    pass


class RateLimiter:
    """Rate limiter to prevent overwhelming services."""

    def __init__(
        self,
        name: str,
        config: RateLimitConfig | None = None,
    ):
        self.name = name
        self.config = config or RateLimitConfig()
        self._stats = RateLimitStats()
        self._tokens: float = float(self.config.max_requests)
        self._last_refill: float = time.time()
        self._sliding_window: list[float] = []
        self._fixed_window_count: int = 0
        self._fixed_window_start: float = time.time()

    def can_proceed(self) -> bool:
        """Check if request can proceed."""
        if self.config.strategy == RateLimitStrategy.TOKEN_BUCKET:
            return self._check_token_bucket()
        elif self.config.strategy == RateLimitStrategy.SLIDING_WINDOW:
            return self._check_sliding_window()
        else:
            return self._check_fixed_window()

    def _check_token_bucket(self) -> bool:
        """Token bucket algorithm."""
        self._refill_tokens()
        return self._tokens >= 1.0

    def _refill_tokens(self) -> None:
        """Refill tokens based on elapsed time."""
        now = time.time()
        elapsed = now - self._last_refill
        refill_rate = self.config.max_requests / self.config.window_seconds
        self._tokens = min(
            self.config.max_requests,
            self._tokens + elapsed * refill_rate
        )
        self._last_refill = now

    def _check_sliding_window(self) -> bool:
        """Sliding window algorithm."""
        now = time.time()
        cutoff = now - self.config.window_seconds

        # Remove old entries
        self._sliding_window = [t for t in self._sliding_window if t > cutoff]

        return len(self._sliding_window) < self.config.max_requests

    def _check_fixed_window(self) -> bool:
        """Fixed window algorithm."""
        now = time.time()

        # Check if window has reset
        if now - self._fixed_window_start >= self.config.window_seconds:
            self._fixed_window_count = 0
            self._fixed_window_start = now

        return self._fixed_window_count < self.config.max_requests

    def consume(self) -> bool:
        """Attempt to consume a rate limit token."""
        self._stats.total_requests += 1

        if not self.can_proceed():
            self._stats.rejected_requests += 1
            self._update_rate()
            return False

        self._stats.allowed_requests += 1

        if self.config.strategy == RateLimitStrategy.TOKEN_BUCKET:
            self._tokens -= 1.0
        elif self.config.strategy == RateLimitStrategy.SLIDING_WINDOW:
            self._sliding_window.append(time.time())
        else:
            self._fixed_window_count += 1

        self._update_rate()
        return True

    def _update_rate(self) -> None:
        """Update current rate calculation."""
        if self._stats.total_requests > 0:
            self._stats.current_rate = (
                self._stats.allowed_requests / self._stats.total_requests * 100
            )

    def get_stats(self) -> RateLimitStats:
        """Get rate limiter statistics."""
        return self._stats

    def reset(self) -> None:
        """Reset rate limiter."""
        self._stats = RateLimitStats()
        self._tokens = float(self.config.max_requests)
        self._last_refill = time.time()
        self._sliding_window = []
        self._fixed_window_count = 0
        self._fixed_window_start = time.time()


class FallbackStrategies:
    """Collection of common fallback strategies."""

    @staticmethod
    def return_none(*args, **kwargs) -> None:
        """Return None as fallback."""
        return None

    @staticmethod
    def return_default(default_value: Any) -> Callable:
        """Return a default value as fallback."""
        def fallback(*args, **kwargs):
            return default_value
        return fallback

    @staticmethod
    def return_cached(cache: dict[str, Any], key: str) -> Callable:
        """Return cached value as fallback."""
        def fallback(*args, **kwargs):
            return cache.get(key)
        return fallback

    @staticmethod
    def raise_custom(exception: Exception) -> Callable:
        """Raise a custom exception as fallback."""
        def fallback(*args, **kwargs):
            raise exception
        return fallback


class CircuitBreakerRegistry:
    """Registry for managing multiple circuit breakers."""

    def __init__(self):
        self._circuits: dict[str, CircuitBreaker] = {}
        self._rate_limiters: dict[str, RateLimiter] = {}

    def get_or_create_circuit(
        self,
        name: str,
        config: CircuitConfig | None = None,
        fallback: Callable | None = None,
    ) -> CircuitBreaker:
        """Get or create a circuit breaker."""
        if name not in self._circuits:
            self._circuits[name] = CircuitBreaker(
                name=name,
                config=config,
                fallback=fallback,
            )
        return self._circuits[name]

    def get_circuit(self, name: str) -> CircuitBreaker | None:
        """Get a circuit breaker by name."""
        return self._circuits.get(name)

    def get_or_create_rate_limiter(
        self,
        name: str,
        config: RateLimitConfig | None = None,
    ) -> RateLimiter:
        """Get or create a rate limiter."""
        if name not in self._rate_limiters:
            self._rate_limiters[name] = RateLimiter(name=name, config=config)
        return self._rate_limiters[name]

    def get_rate_limiter(self, name: str) -> RateLimiter | None:
        """Get a rate limiter by name."""
        return self._rate_limiters.get(name)

    def get_all_circuits(self) -> dict[str, CircuitBreaker]:
        """Get all circuit breakers."""
        return self._circuits.copy()

    def get_all_rate_limiters(self) -> dict[str, RateLimiter]:
        """Get all rate limiters."""
        return self._rate_limiters.copy()

    def get_stats(self) -> dict[str, Any]:
        """Get aggregate statistics."""
        circuit_stats = {}
        for name, circuit in self._circuits.items():
            circuit_stats[name] = {
                "state": circuit.state.value,
                "total_calls": circuit._stats.total_calls,
                "failed_calls": circuit._stats.failed_calls,
            }

        rate_stats = {}
        for name, limiter in self._rate_limiters.items():
            rate_stats[name] = {
                "allowed": limiter._stats.allowed_requests,
                "rejected": limiter._stats.rejected_requests,
                "current_rate": limiter._stats.current_rate,
            }

        return {
            "circuits": circuit_stats,
            "rate_limiters": rate_stats,
        }

    def reset_all(self) -> None:
        """Reset all circuits and rate limiters."""
        for circuit in self._circuits.values():
            circuit.reset()
        for limiter in self._rate_limiters.values():
            limiter.reset()


def create_circuit_breaker(
    name: str,
    failure_threshold: int = 5,
    timeout: float = 30.0,
) -> CircuitBreaker:
    """Factory function to create a circuit breaker."""
    return CircuitBreaker(
        name=name,
        config=CircuitConfig(
            failure_threshold=failure_threshold,
            timeout=timeout,
        ),
    )


def create_rate_limiter(
    name: str,
    max_requests: int = 100,
    window_seconds: float = 1.0,
) -> RateLimiter:
    """Factory function to create a rate limiter."""
    return RateLimiter(
        name=name,
        config=RateLimitConfig(
            max_requests=max_requests,
            window_seconds=window_seconds,
        ),
    )
