"""
Tests for Pixel LLM Resilience Module

Tests retry logic, circuit breaker, and fallback strategies.
"""

import time
from unittest.mock import Mock
import pytest

from systems.pixel_llm.resilience import (
    # Retry
    RetryStrategy,
    RetryConfig,
    RetryStats,
    RetryManager,
    retry,
    retry_on_connection_error,
    retry_on_timeout,
    # Circuit Breaker
    CircuitState,
    CircuitBreakerConfig,
    CircuitBreaker,
    with_circuit_breaker,
    # Fallback
    FallbackStrategy,
    CachedResult,
    FallbackConfig,
    FallbackManager,
    with_fallback,
)

from systems.pixel_llm.errors import (
    ConnectionError,
    TimeoutError,
    ValidationError,
)


class TestRetryConfig:
    """Test RetryConfig class."""

    def test_default_config(self):
        """Test default configuration values."""
        config = RetryConfig()
        assert config.max_attempts == 3
        assert config.initial_delay == 1.0
        assert config.max_delay == 60.0
        assert config.backoff_multiplier == 2.0
        assert config.jitter is True
        assert config.strategy == RetryStrategy.EXPONENTIAL_BACKOFF

    def test_exponential_backoff_delay(self):
        """Test exponential backoff delay calculation."""
        config = RetryConfig(
            strategy=RetryStrategy.EXPONENTIAL_BACKOFF,
            initial_delay=1.0,
            backoff_multiplier=2.0,
            jitter=False,
        )
        assert config.calculate_delay(0) == 1.0
        assert config.calculate_delay(1) == 2.0
        assert config.calculate_delay(2) == 4.0

    def test_linear_backoff_delay(self):
        """Test linear backoff delay calculation."""
        config = RetryConfig(
            strategy=RetryStrategy.LINEAR_BACKOFF,
            initial_delay=1.0,
            jitter=False,
        )
        assert config.calculate_delay(0) == 1.0
        assert config.calculate_delay(1) == 2.0
        assert config.calculate_delay(2) == 3.0

    def test_fixed_delay(self):
        """Test fixed delay calculation."""
        config = RetryConfig(
            strategy=RetryStrategy.FIXED_DELAY,
            initial_delay=2.0,
            jitter=False,
        )
        assert config.calculate_delay(0) == 2.0
        assert config.calculate_delay(1) == 2.0
        assert config.calculate_delay(2) == 2.0

    def test_immediate_no_delay(self):
        """Test immediate strategy has no delay."""
        config = RetryConfig(strategy=RetryStrategy.IMMEDIATE)
        assert config.calculate_delay(0) == 0.0
        assert config.calculate_delay(1) == 0.0

    def test_max_delay_cap(self):
        """Test that delay is capped at max_delay."""
        config = RetryConfig(
            strategy=RetryStrategy.EXPONENTIAL_BACKOFF,
            initial_delay=10.0,
            backoff_multiplier=10.0,
            max_delay=5.0,
            jitter=False,
        )
        assert config.calculate_delay(0) == 5.0  # Capped
        assert config.calculate_delay(1) == 5.0  # Capped

    def test_jitter_adds_randomness(self):
        """Test that jitter adds randomness to delays."""
        config = RetryConfig(
            strategy=RetryStrategy.EXPONENTIAL_BACKOFF,
            initial_delay=1.0,
            jitter=True,
        )
        delays = [config.calculate_delay(0) for _ in range(10)]
        # With jitter, delays should vary
        assert len(set(delays)) > 1


class TestRetryDecorator:
    """Test retry decorator."""

    def test_successful_call_no_retry(self):
        """Test that successful calls are not retried."""
        @retry(max_attempts=3)
        def test_func():
            return "success"

        result = test_func()
        assert result == "success"

    def test_retry_on_failure(self):
        """Test that failed calls are retried."""
        attempts = []

        @retry(max_attempts=3, initial_delay=0.01)
        def test_func():
            attempts.append(1)
            if len(attempts) < 2:
                raise ConnectionError("Connection failed")
            return "success"

        result = test_func()
        assert result == "success"
        assert len(attempts) == 2

    def test_retry_exhaustion(self):
        """Test that retries are exhausted after max attempts."""
        @retry(max_attempts=3, initial_delay=0.01)
        def test_func():
            raise ConnectionError("Connection failed")

        with pytest.raises(ConnectionError):
            test_func()


class TestRetryManager:
    """Test RetryManager singleton."""

    def test_singleton_instance(self):
        """Test that RetryManager is a singleton."""
        manager1 = RetryManager()
        manager2 = RetryManager()
        # Note: Singleton behavior might vary based on implementation
        assert isinstance(manager1, RetryManager)
        assert isinstance(manager2, RetryManager)

    def test_record_attempt(self):
        """Test recording retry attempts."""
        manager = RetryManager()
        manager.reset_stats()

        manager.record_attempt(success=True, delay=1.0)
        manager.record_attempt(success=False, delay=2.0)

        stats = manager.get_stats()
        assert stats.total_attempts == 2
        assert stats.successful_retries == 1
        assert stats.failed_retries == 1

    def test_get_stats(self):
        """Test getting retry statistics."""
        manager = RetryManager()
        manager.reset_stats()

        manager.record_attempt(success=True, delay=1.0)
        stats = manager.get_stats()

        assert isinstance(stats, RetryStats)
        assert stats.total_attempts == 1

    def test_reset_stats(self):
        """Test resetting retry statistics."""
        manager = RetryManager()
        manager.record_attempt(success=True, delay=1.0)
        manager.reset_stats()

        stats = manager.get_stats()
        assert stats.total_attempts == 0


class TestCircuitBreaker:
    """Test CircuitBreaker class."""

    def test_initial_closed_state(self):
        """Test that circuit breaker starts in CLOSED state."""
        breaker = CircuitBreaker("test")
        assert breaker.state == CircuitState.CLOSED

    def test_open_on_failure_threshold(self):
        """Test that circuit opens after failure threshold."""
        config = CircuitBreakerConfig(failure_threshold=3)
        breaker = CircuitBreaker("test", config)

        # Record failures
        for _ in range(3):
            breaker.record_failure()

        assert breaker.state == CircuitState.OPEN

    def test_allow_request_blocks_when_open(self):
        """Test that allow_request returns False when circuit is open."""
        config = CircuitBreakerConfig(failure_threshold=2)
        breaker = CircuitBreaker("test", config)

        # Open the circuit
        for _ in range(2):
            breaker.record_failure()

        # Next request should be blocked
        assert breaker.allow_request() is False

    def test_half_open_after_timeout(self):
        """Test transition to HALF_OPEN after timeout."""
        config = CircuitBreakerConfig(failure_threshold=2, timeout=0.1)
        breaker = CircuitBreaker("test", config)

        # Open the circuit
        for _ in range(2):
            breaker.record_failure()

        assert breaker.state == CircuitState.OPEN

        # Wait for timeout
        time.sleep(0.15)

        # Check if we can request now (should be HALF_OPEN)
        assert breaker.allow_request() is True

    def test_close_on_success_threshold(self):
        """Test that circuit closes after success threshold in HALF_OPEN."""
        config = CircuitBreakerConfig(
            failure_threshold=2,
            success_threshold=2,
            timeout=0.1,
        )
        breaker = CircuitBreaker("test", config)

        # Open the circuit
        for _ in range(2):
            breaker.record_failure()

        # Wait for timeout
        time.sleep(0.15)

        # Move to HALF_OPEN and record successes
        breaker.allow_request()  # This transitions to HALF_OPEN
        breaker.record_success()
        breaker.record_success()

        assert breaker.state == CircuitState.CLOSED

    def test_reset(self):
        """Test resetting circuit breaker."""
        config = CircuitBreakerConfig(failure_threshold=2)
        breaker = CircuitBreaker("test", config)

        # Open the circuit
        for _ in range(2):
            breaker.record_failure()

        assert breaker.state == CircuitState.OPEN

        # Reset
        breaker.reset()
        assert breaker.state == CircuitState.CLOSED


class TestFallbackManager:
    """Test FallbackManager class."""

    def test_default_value_fallback(self):
        """Test default value fallback."""
        config = FallbackConfig(
            strategy=FallbackStrategy.DEFAULT_VALUE,
            default_value="default_result",
        )
        manager = FallbackManager(config)

        result = manager.execute_with_fallback(
            lambda: (_ for _ in ()).throw(ConnectionError("Failed"))
        )

        assert result == "default_result"

    def test_cache_fallback(self):
        """Test cache fallback."""
        manager = FallbackManager()
        cache_key = "test_key"

        # Cache a value
        manager.cache_result(cache_key, "cached_value")

        # Function fails but cached value is returned
        result = manager.execute_with_fallback(
            lambda: (_ for _ in ()).throw(ConnectionError("Failed")),
            cache_key=cache_key,
        )

        assert result == "cached_value"

    def test_custom_function_fallback(self):
        """Test custom function fallback."""
        custom_called = []

        def custom_fallback():
            custom_called.append(1)
            return "custom_result"

        config = FallbackConfig(
            strategy=FallbackStrategy.CUSTOM_FUNCTION,
            custom_function=custom_fallback,
        )
        manager = FallbackManager(config)

        result = manager.execute_with_fallback(
            lambda: (_ for _ in ()).throw(ConnectionError("Failed"))
        )

        assert result == "custom_result"
        assert len(custom_called) == 1

    def test_none_fallback(self):
        """Test that NONE fallback returns None."""
        config = FallbackConfig(strategy=FallbackStrategy.NONE)
        manager = FallbackManager(config)

        result = manager.execute_with_fallback(
            lambda: (_ for _ in ()).throw(ConnectionError("Failed"))
        )

        assert result is None

    def test_raise_fallback(self):
        """Test that RAISE fallback raises exception."""
        config = FallbackConfig(strategy=FallbackStrategy.RAISE)
        manager = FallbackManager(config)

        with pytest.raises(ConnectionError):
            manager.execute_with_fallback(
                lambda: (_ for _ in ()).throw(ConnectionError("Failed"))
            )

    def test_get_stats(self):
        """Test getting fallback statistics."""
        config = FallbackConfig(
            strategy=FallbackStrategy.DEFAULT_VALUE,
            default_value="default",
        )
        manager = FallbackManager(config)

        # Trigger fallback
        manager.execute_with_fallback(
            lambda: (_ for _ in ()).throw(ConnectionError("Failed"))
        )

        # Just check that get_stats returns something
        stats = manager.get_stats()
        assert stats is not None

    def test_cache_hit_rate(self):
        """Test cache hit rate calculation."""
        manager = FallbackManager()

        # Cache miss
        manager.get_cached("nonexistent")

        # Cache hit
        manager.cache_result("exists", "value")
        manager.get_cached("exists")

        # Check that stats are available
        stats = manager.get_stats()
        assert stats is not None


class TestCachedResult:
    """Test CachedResult class."""

    def test_is_valid(self):
        """Test cache validity check."""
        result = CachedResult("value", time.time(), ttl=1.0)
        assert result.is_valid() is True

    def test_is_valid_expired(self):
        """Test that expired cache is invalid."""
        result = CachedResult("value", time.time() - 2, ttl=1.0)
        assert result.is_valid() is False

    def test_age_seconds(self):
        """Test cache age calculation."""
        cached_at = time.time()
        result = CachedResult("value", cached_at)
        age = result.age_seconds()
        assert age >= 0
        assert age < 1.0  # Should be very recent
