"""
Tests for Circuit Breakers (Phase 43)

Tests circuit breakers, rate limiters, and graceful degradation.
"""

import time
from unittest.mock import Mock

import pytest

from systems.visual_shell.circuit_breaker import (
    CircuitBreaker,
    CircuitBreakerRegistry,
    CircuitConfig,
    CircuitOpenError,
    CircuitState,
    CircuitStats,
    FallbackStrategies,
    RateLimitConfig,
    RateLimiter,
    RateLimitStats,
    RateLimitStrategy,
    create_circuit_breaker,
    create_rate_limiter,
)


class TestCircuitState:
    """Tests for CircuitState enum."""

    def test_circuit_states(self):
        assert CircuitState.CLOSED.value == "closed"
        assert CircuitState.OPEN.value == "open"
        assert CircuitState.HALF_OPEN.value == "half_open"


class TestRateLimitStrategy:
    """Tests for RateLimitStrategy enum."""

    def test_strategies(self):
        assert RateLimitStrategy.TOKEN_BUCKET.value == "token_bucket"
        assert RateLimitStrategy.SLIDING_WINDOW.value == "sliding_window"
        assert RateLimitStrategy.FIXED_WINDOW.value == "fixed_window"


class TestCircuitConfig:
    """Tests for CircuitConfig dataclass."""

    def test_defaults(self):
        config = CircuitConfig()
        assert config.failure_threshold == 5
        assert config.success_threshold == 3
        assert config.timeout == 30.0


class TestCircuitStats:
    """Tests for CircuitStats dataclass."""

    def test_defaults(self):
        stats = CircuitStats()
        assert stats.total_calls == 0
        assert stats.successful_calls == 0


class TestRateLimitConfig:
    """Tests for RateLimitConfig dataclass."""

    def test_defaults(self):
        config = RateLimitConfig()
        assert config.max_requests == 100
        assert config.window_seconds == 1.0


class TestRateLimitStats:
    """Tests for RateLimitStats dataclass."""

    def test_defaults(self):
        stats = RateLimitStats()
        assert stats.total_requests == 0
        assert stats.allowed_requests == 0


class TestCircuitBreaker:
    """Tests for CircuitBreaker."""

    @pytest.fixture
    def circuit(self):
        return CircuitBreaker(
            name="test",
            config=CircuitConfig(
                failure_threshold=3,
                success_threshold=2,
                timeout=1.0,
            ),
        )

    def test_initial_state(self, circuit):
        assert circuit.state == CircuitState.CLOSED

    def test_can_execute_closed(self, circuit):
        assert circuit.can_execute() is True

    def test_record_success(self, circuit):
        circuit.record_success()
        assert circuit._stats.successful_calls == 1
        assert circuit._consecutive_successes == 1

    def test_record_failure(self, circuit):
        circuit.record_failure()
        assert circuit._stats.failed_calls == 1
        assert circuit._consecutive_failures == 1

    def test_opens_after_threshold(self, circuit):
        for _ in range(3):
            circuit.record_failure()

        assert circuit.state == CircuitState.OPEN
        assert circuit.can_execute() is False

    def test_rejects_when_open(self, circuit):
        # Force open
        for _ in range(3):
            circuit.record_failure()

        assert circuit.can_execute() is False
        circuit.record_rejection()
        assert circuit._stats.rejected_calls == 1

    def test_transitions_to_half_open(self, circuit):
        # Open the circuit
        for _ in range(3):
            circuit.record_failure()

        assert circuit.state == CircuitState.OPEN

        # Wait for timeout
        time.sleep(1.1)

        assert circuit.state == CircuitState.HALF_OPEN

    def test_half_open_to_closed(self, circuit):
        circuit._state = CircuitState.HALF_OPEN

        for _ in range(2):
            circuit.record_success()

        assert circuit.state == CircuitState.CLOSED

    def test_half_open_to_open(self, circuit):
        circuit._state = CircuitState.HALF_OPEN

        circuit.record_failure()

        assert circuit.state == CircuitState.OPEN

    @pytest.mark.asyncio
    async def test_fallback_on_open(self, circuit):
        fallback = Mock(return_value="fallback_value")
        circuit.fallback = fallback

        # Open circuit
        for _ in range(3):
            circuit.record_failure()

        result = await circuit.call(lambda: "normal")
        assert result == "fallback_value"

    @pytest.mark.asyncio
    async def test_async_call(self, circuit):
        async def async_func():
            return "async_result"

        result = await circuit.call(async_func)
        assert result == "async_result"

    @pytest.mark.asyncio
    async def test_call_raises_when_open(self, circuit):
        # Open circuit
        for _ in range(3):
            circuit.record_failure()

        with pytest.raises(CircuitOpenError):
            await circuit.call(lambda: "result")

    def test_state_listeners(self, circuit):
        changes = []

        def listener(old, new):
            changes.append((old, new))

        circuit.add_listener(listener)

        # Trigger state change
        for _ in range(3):
            circuit.record_failure()

        assert len(changes) == 1
        assert changes[0] == (CircuitState.CLOSED, CircuitState.OPEN)

    def test_remove_listener(self, circuit):
        changes = []

        def listener(old, new):
            changes.append((old, new))

        circuit.add_listener(listener)
        circuit.remove_listener(listener)

        for _ in range(3):
            circuit.record_failure()

        assert len(changes) == 0

    def test_reset(self, circuit):
        for _ in range(3):
            circuit.record_failure()

        circuit.reset()
        assert circuit.state == CircuitState.CLOSED
        assert circuit._stats.total_calls == 0

    def test_force_open(self, circuit):
        circuit.force_open()
        assert circuit.state == CircuitState.OPEN

    def test_force_close(self, circuit):
        circuit.force_open()
        circuit.force_close()
        assert circuit.state == CircuitState.CLOSED

    def test_get_stats(self, circuit):
        circuit.record_success()
        circuit.record_failure()

        stats = circuit.get_stats()
        assert stats.successful_calls == 1
        assert stats.failed_calls == 1


class TestRateLimiter:
    """Tests for RateLimiter."""

    @pytest.fixture
    def limiter(self):
        return RateLimiter(
            name="test",
            config=RateLimitConfig(
                max_requests=5,
                window_seconds=1.0,
                strategy=RateLimitStrategy.SLIDING_WINDOW,
            ),
        )

    def test_initial_state(self, limiter):
        assert limiter.can_proceed() is True

    def test_sliding_window_limit(self, limiter):
        for _ in range(5):
            assert limiter.consume() is True

        assert limiter.consume() is False

    def test_sliding_window_expiry(self, limiter):
        for _ in range(5):
            limiter.consume()

        assert limiter.consume() is False

        # Wait for window to pass
        time.sleep(1.1)

        assert limiter.consume() is True

    def test_token_bucket_strategy(self):
        limiter = RateLimiter(
            name="test",
            config=RateLimitConfig(
                max_requests=5,
                window_seconds=1.0,
                strategy=RateLimitStrategy.TOKEN_BUCKET,
            ),
        )

        for _ in range(5):
            assert limiter.consume() is True

        assert limiter.consume() is False

    def test_fixed_window_strategy(self):
        limiter = RateLimiter(
            name="test",
            config=RateLimitConfig(
                max_requests=5,
                window_seconds=1.0,
                strategy=RateLimitStrategy.FIXED_WINDOW,
            ),
        )

        for _ in range(5):
            assert limiter.consume() is True

        assert limiter.consume() is False

    def test_stats_tracking(self, limiter):
        for _ in range(5):
            limiter.consume()

        limiter.consume()  # Rejected

        stats = limiter.get_stats()
        assert stats.allowed_requests == 5
        assert stats.rejected_requests == 1

    def test_reset(self, limiter):
        for _ in range(5):
            limiter.consume()

        limiter.reset()

        assert limiter.can_proceed() is True
        assert limiter._stats.total_requests == 0


class TestFallbackStrategies:
    """Tests for FallbackStrategies."""

    def test_return_none(self):
        result = FallbackStrategies.return_none()
        assert result is None

    def test_return_default(self):
        fallback = FallbackStrategies.return_default("default_value")
        result = fallback()
        assert result == "default_value"

    def test_return_cached(self):
        cache = {"key1": "cached_value"}
        fallback = FallbackStrategies.return_cached(cache, "key1")
        result = fallback()
        assert result == "cached_value"

    def test_raise_custom(self):
        fallback = FallbackStrategies.raise_custom(ValueError("custom error"))
        with pytest.raises(ValueError, match="custom error"):
            fallback()


class TestCircuitBreakerRegistry:
    """Tests for CircuitBreakerRegistry."""

    @pytest.fixture
    def registry(self):
        return CircuitBreakerRegistry()

    def test_get_or_create_circuit(self, registry):
        circuit = registry.get_or_create_circuit("test-circuit")
        assert isinstance(circuit, CircuitBreaker)
        assert circuit.name == "test-circuit"

    def test_get_existing_circuit(self, registry):
        circuit1 = registry.get_or_create_circuit("test-circuit")
        circuit2 = registry.get_circuit("test-circuit")
        assert circuit1 is circuit2

    def test_get_nonexistent_circuit(self, registry):
        circuit = registry.get_circuit("nonexistent")
        assert circuit is None

    def test_get_or_create_rate_limiter(self, registry):
        limiter = registry.get_or_create_rate_limiter("test-limiter")
        assert isinstance(limiter, RateLimiter)

    def test_get_all_circuits(self, registry):
        registry.get_or_create_circuit("circuit-1")
        registry.get_or_create_circuit("circuit-2")

        circuits = registry.get_all_circuits()
        assert len(circuits) == 2

    def test_get_stats(self, registry):
        circuit = registry.get_or_create_circuit("test-circuit")
        circuit.record_success()

        limiter = registry.get_or_create_rate_limiter("test-limiter")
        limiter.consume()

        stats = registry.get_stats()
        assert "circuits" in stats
        assert "rate_limiters" in stats

    def test_reset_all(self, registry):
        circuit = registry.get_or_create_circuit("test-circuit")
        for _ in range(10):
            circuit.record_failure()

        limiter = registry.get_or_create_rate_limiter("test-limiter")
        for _ in range(10):
            limiter.consume()

        registry.reset_all()

        assert circuit._stats.total_calls == 0
        assert limiter._stats.total_requests == 0


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_circuit_breaker(self):
        circuit = create_circuit_breaker("test", failure_threshold=10, timeout=60.0)
        assert circuit.name == "test"
        assert circuit.config.failure_threshold == 10

    def test_create_rate_limiter(self):
        limiter = create_rate_limiter("test", max_requests=50, window_seconds=2.0)
        assert limiter.name == "test"
        assert limiter.config.max_requests == 50


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
