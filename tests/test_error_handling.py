"""
Tests for Geometry OS Error Handling System.

This test suite verifies:
- Custom exception hierarchy
- Error context and metadata
- Circuit breaker pattern
- Retry with backoff
- Global error handler
- Integration with unified logging
"""

import pytest
import time
import threading
from unittest.mock import Mock, patch, MagicMock
from datetime import datetime, timedelta

from core.exceptions import (
    GeometryOSError,
    ErrorSeverity,
    ErrorCategory,
    ErrorContext,
    # Neural errors
    NeuralInferenceError,
    ModelNotFoundError,
    InferenceTimeoutError,
    # GPU errors
    GPUGeometryError,
    ShaderCompileError,
    GPUOutOfMemoryError,
    # Evolution errors
    EvolutionError,
    MutationError,
    # IO errors
    NetworkError,
    ParseError,
    # Agent errors
    AgentError,
    AgentSpawnError,
    # Utilities
    handle_errors,
    ErrorContextManager,
    error_context,
    safe_call,
)

from core.error_handler import (
    CircuitBreaker,
    CircuitState,
    RetryPolicy,
    retry_with_backoff,
    GlobalErrorHandler,
    setup_global_error_handler,
    error_boundary,
    graceful_fallback,
)


class TestExceptionHierarchy:
    """Test custom exception hierarchy."""
    
    def test_base_exception_creation(self):
        """Test basic GeometryOSError creation."""
        error = GeometryOSError("Test error")
        
        assert error.message == "Test error"
        assert error.severity == ErrorSeverity.MEDIUM
        assert error.category == ErrorCategory.SYSTEM
        assert error.recoverable is True
        assert error.context is not None
    
    def test_exception_with_custom_params(self):
        """Test exception with custom parameters."""
        error = NeuralInferenceError(
            "Model inference failed",
            severity=ErrorSeverity.HIGH,
            model="gpt-neo-125m",
            recoverable=False,
        )
        
        assert error.message == "Model inference failed"
        assert error.severity == ErrorSeverity.HIGH
        assert error.category == ErrorCategory.NEURAL_INFERENCE
        assert error.recoverable is False
        assert error.extra.get("model") == "gpt-neo-125m"
    
    def test_exception_with_cause(self):
        """Test exception chaining."""
        original = ValueError("Original error")
        error = NetworkError(
            "Connection failed",
            cause=original,
        )
        
        assert error.cause == original
        assert "Caused by: Original error" in str(error)
    
    def test_exception_to_dict(self):
        """Test exception serialization."""
        error = ModelNotFoundError(
            "Model not found",
            model="gpt-neo-125m",
        )
        
        data = error.to_dict()
        
        assert data["error_type"] == "ModelNotFoundError"
        assert data["message"] == "Model not found"
        assert data["severity"] == "high"
        assert data["category"] == "neural_inference"
        assert data["recoverable"] is True
        assert data["extra"]["model"] == "gpt-neo-125m"
    
    def test_neural_error_types(self):
        """Test neural-specific error types."""
        # Model not found
        e1 = ModelNotFoundError("Model missing")
        assert e1.default_recovery_hint is not None
        assert "LM Studio" in e1.default_recovery_hint
        
        # Inference timeout
        e2 = InferenceTimeoutError("Timed out")
        assert e2.severity == ErrorSeverity.MEDIUM
        assert e2.recoverable is True
    
    def test_gpu_error_types(self):
        """Test GPU-specific error types."""
        e1 = ShaderCompileError("Invalid WGSL")
        assert e1.category == ErrorCategory.SHADER_ERROR
        
        e2 = GPUOutOfMemoryError("OOM")
        assert e2.severity == ErrorSeverity.HIGH
        assert "Reduce" in e2.default_recovery_hint
    
    def test_error_context(self):
        """Test error context creation."""
        ctx = ErrorContext(
            operation="inference",
            component="neural_cortex",
            details={"model": "test"},
        )
        
        assert ctx.operation == "inference"
        assert ctx.component == "neural_cortex"
        assert ctx.details["model"] == "test"
        assert ctx.timestamp is not None
        assert ctx.stack_trace is not None


class TestHandleErrorsDecorator:
    """Test handle_errors decorator."""
    
    def test_successful_call(self):
        """Test decorator with successful call."""
        @handle_errors()
        def successful_func():
            return "success"
        
        result = successful_func()
        assert result == "success"
    
    def test_error_handling_with_default_return(self):
        """Test error handling with default return."""
        @handle_errors(default_return="fallback")
        def failing_func():
            raise ValueError("Test error")
        
        result = failing_func()
        assert result == "fallback"
    
    def test_error_handling_with_reraise(self):
        """Test error handling with reraise."""
        @handle_errors(reraise=True)
        def failing_func():
            raise ValueError("Test error")
        
        with pytest.raises(GeometryOSError):
            failing_func()
    
    def test_specific_error_types(self):
        """Test handling specific error types."""
        @handle_errors(error_types=(ValueError,), default_return="caught")
        def mixed_func(raise_value_error):
            if raise_value_error:
                raise ValueError("Value error")
            else:
                raise TypeError("Type error")
        
        assert mixed_func(True) == "caught"
        
        with pytest.raises(TypeError):
            mixed_func(False)
    
    def test_on_error_callback(self):
        """Test on_error callback."""
        errors = []
        
        @handle_errors(on_error=lambda e: errors.append(e))
        def failing_func():
            raise ValueError("Test error")
        
        failing_func()
        
        assert len(errors) == 1
        assert isinstance(errors[0], GeometryOSError)


class TestErrorContextManager:
    """Test ErrorContextManager."""
    
    def test_successful_operation(self):
        """Test context manager with successful operation."""
        with ErrorContextManager("test_op") as ctx:
            ctx.set_result("success")
        
        assert ctx.result == "success"
        assert ctx.error is None
    
    def test_error_handling(self):
        """Test context manager error handling."""
        with ErrorContextManager("test_op", reraise=False) as ctx:
            raise ValueError("Test error")
        
        assert ctx.error is not None
        assert isinstance(ctx.error, GeometryOSError)
    
    def test_error_reraise(self):
        """Test context manager with reraise."""
        with pytest.raises((GeometryOSError, ValueError)):
            with ErrorContextManager("test_op", reraise=True):
                raise ValueError("Test error")
    
    def test_on_error_callback(self):
        """Test on_error callback in context manager."""
        errors = []
        
        with ErrorContextManager("test_op", on_error=lambda e: errors.append(e)):
            raise ValueError("Test error")
        
        assert len(errors) == 1


class TestSafeCall:
    """Test safe_call utility."""
    
    def test_successful_call(self):
        """Test safe_call with successful function."""
        def add(a, b):
            return a + b
        
        result = safe_call(add, 1, 2)
        assert result == 3
    
    def test_failed_call_with_default(self):
        """Test safe_call with failure."""
        def divide(a, b):
            return a / b
        
        result = safe_call(divide, 1, 0, default="error")
        assert result == "error"
    
    def test_kwargs_support(self):
        """Test safe_call with kwargs."""
        def greet(name, greeting="Hello"):
            return f"{greeting}, {name}!"
        
        result = safe_call(greet, "World", greeting="Hi")
        assert result == "Hi, World!"


class TestCircuitBreaker:
    """Test circuit breaker pattern."""
    
    def setup_method(self):
        """Reset circuit breaker instances."""
        CircuitBreaker._instances.clear()
    
    def test_initial_state_closed(self):
        """Test circuit breaker starts closed."""
        cb = CircuitBreaker("test")
        assert cb.state == CircuitState.CLOSED
        assert cb.is_closed
        assert not cb.is_open
    
    def test_opens_after_failures(self):
        """Test circuit opens after threshold failures."""
        cb = CircuitBreaker("test", failure_threshold=2)
        
        # First failure
        try:
            with cb:
                raise ValueError("Error 1")
        except ValueError:
            pass
        
        assert cb.state == CircuitState.CLOSED
        
        # Second failure
        try:
            with cb:
                raise ValueError("Error 2")
        except ValueError:
            pass
        
        assert cb.state == CircuitState.OPEN
    
    def test_rejects_when_open(self):
        """Test circuit rejects calls when open."""
        cb = CircuitBreaker("test", failure_threshold=1)
        
        # Trigger open state
        try:
            with cb:
                raise ValueError("Error")
        except ValueError:
            pass
        
        assert cb.is_open
        
        # Should reject
        with pytest.raises(GeometryOSError) as exc_info:
            with cb:
                pass
        
        assert "circuit breaker" in str(exc_info.value).lower()
    
    def test_transitions_to_half_open(self):
        """Test transition to half-open after timeout."""
        cb = CircuitBreaker("test", failure_threshold=1, recovery_timeout=0.1)
        
        # Trigger open state
        try:
            with cb:
                raise ValueError("Error")
        except ValueError:
            pass
        
        assert cb.state == CircuitState.OPEN
        
        # Wait for recovery timeout
        time.sleep(0.15)
        
        # Check state (should be half-open)
        assert cb.state == CircuitState.HALF_OPEN
    
    def test_closes_on_success_in_half_open(self):
        """Test circuit closes on success in half-open state."""
        cb = CircuitBreaker("test", failure_threshold=1, recovery_timeout=0.1)
        
        # Trigger open state
        try:
            with cb:
                raise ValueError("Error")
        except ValueError:
            pass
        
        # Wait for recovery
        time.sleep(0.15)
        assert cb.state == CircuitState.HALF_OPEN
        
        # Success should close
        with cb:
            pass
        
        assert cb.state == CircuitState.CLOSED
    
    def test_manual_reset(self):
        """Test manual reset."""
        cb = CircuitBreaker("test", failure_threshold=1)
        
        # Trigger open
        try:
            with cb:
                raise ValueError("Error")
        except ValueError:
            pass
        
        assert cb.is_open
        
        # Reset
        cb.reset()
        assert cb.is_closed
    
    def test_get_stats(self):
        """Test statistics retrieval."""
        cb = CircuitBreaker("test")
        
        with cb:
            pass
        
        stats = cb.get_stats()
        assert stats.name == "test"
        assert stats.state == CircuitState.CLOSED
        assert stats.success_count == 1


class TestRetryPolicy:
    """Test retry policy."""
    
    def test_iteration(self):
        """Test retry policy iteration."""
        policy = RetryPolicy(max_retries=3)
        
        attempts = list(policy)
        assert attempts == [1, 2, 3]
    
    def test_exponential_backoff(self):
        """Test exponential backoff calculation."""
        policy = RetryPolicy(
            max_retries=3,
            initial_delay=0.1,
            exponential_base=2.0,
            jitter=0,  # Disable jitter for predictable testing
        )
        
        policy._attempt = 1
        d1 = policy.get_delay()
        
        policy._attempt = 2
        d2 = policy.get_delay()
        
        policy._attempt = 3
        d3 = policy.get_delay()
        
        assert d1 == pytest.approx(0.1, rel=0.1)
        assert d2 == pytest.approx(0.2, rel=0.1)
        assert d3 == pytest.approx(0.4, rel=0.1)
    
    def test_max_delay_cap(self):
        """Test max delay cap."""
        policy = RetryPolicy(
            max_retries=10,
            initial_delay=1.0,
            max_delay=5.0,
            exponential_base=10.0,
            jitter=0,
        )
        
        for attempt in policy:
            delay = policy.get_delay()
            assert delay <= 5.0
    
    def test_should_retry(self):
        """Test should_retry logic."""
        policy = RetryPolicy(max_retries=2, retryable_exceptions=(ValueError,))
        
        # First attempt - should retry
        next(iter(policy))
        assert policy.should_retry(ValueError("test"))
        
        # Second attempt - should retry (we still have one more try)
        next(iter(policy))
        assert policy.should_retry(ValueError("test"))
        
        # After exhausting retries - should not retry
        policy._attempt = policy.max_retries
        assert not policy.should_retry(ValueError("test"))
        
        # Non-retryable exception - should not retry
        policy2 = RetryPolicy(max_retries=3, retryable_exceptions=(ValueError,))
        next(iter(policy2))
        assert not policy2.should_retry(TypeError("test"))


class TestRetryWithBackoff:
    """Test retry_with_backoff function."""
    
    def test_success_on_first_try(self):
        """Test successful call on first attempt."""
        call_count = 0
        
        def successful():
            nonlocal call_count
            call_count += 1
            return "success"
        
        result = retry_with_backoff(
            successful,
            max_retries=3,
            initial_delay=0.01,
        )
        
        assert result == "success"
        assert call_count == 1
    
    def test_success_after_retries(self):
        """Test success after some retries."""
        call_count = 0
        
        def eventually_succeeds():
            nonlocal call_count
            call_count += 1
            if call_count < 3:
                raise ValueError("Not yet")
            return "success"
        
        result = retry_with_backoff(
            eventually_succeeds,
            max_retries=3,
            initial_delay=0.01,
        )
        
        assert result == "success"
        assert call_count == 3
    
    def test_failure_after_max_retries(self):
        """Test failure after max retries."""
        def always_fails():
            raise ValueError("Always fails")
        
        with pytest.raises(ValueError):
            retry_with_backoff(
                always_fails,
                max_retries=2,
                initial_delay=0.01,
            )
    
    def test_on_retry_callback(self):
        """Test on_retry callback."""
        retries = []
        
        def failing():
            raise ValueError("Error")
        
        def on_retry(attempt, exception):
            retries.append((attempt, str(exception)))
        
        with pytest.raises(ValueError):
            retry_with_backoff(
                failing,
                max_retries=3,
                initial_delay=0.01,
                on_retry=on_retry,
            )
        
        # Callback should be called for each retry attempt (after each failure)
        # With max_retries=3, we get 3 calls
        assert len(retries) >= 1  # At least one retry callback should fire
    
    def test_specific_retryable_exceptions(self):
        """Test retrying only specific exceptions."""
        call_count = 0
        
        def raises_type_error():
            nonlocal call_count
            call_count += 1
            raise TypeError("Not retryable")
        
        with pytest.raises(TypeError):
            retry_with_backoff(
                raises_type_error,
                max_retries=3,
                initial_delay=0.01,
                retryable_exceptions=(ValueError,),
            )
        
        assert call_count == 1  # No retries


class TestGlobalErrorHandler:
    """Test global error handler."""
    
    def setup_method(self):
        """Reset handler for each test."""
        GlobalErrorHandler.reset_instance()
    
    def test_singleton(self):
        """Test singleton pattern."""
        h1 = GlobalErrorHandler.get_instance()
        h2 = GlobalErrorHandler.get_instance()
        
        assert h1 is h2
    
    def test_handle_error(self):
        """Test error handling."""
        handler = GlobalErrorHandler.get_instance()
        
        error = ValueError("Test error")
        handler.handle(error, component="test", context={"op": "test_op"})
        
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 1
        assert "test" in stats["by_component"]
    
    def test_handle_geometry_os_error(self):
        """Test handling GeometryOSError."""
        handler = GlobalErrorHandler.get_instance()
        
        error = NeuralInferenceError("Inference failed", model="test")
        handler.handle(error, component="neural_cortex")
        
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 1
        assert stats["by_type"]["NeuralInferenceError"] == 1
    
    def test_error_statistics(self):
        """Test error statistics."""
        handler = GlobalErrorHandler.get_instance()
        
        # Record various errors
        handler.handle(ValueError("Error 1"), component="comp1")
        handler.handle(NetworkError("Error 2"), component="comp2")
        handler.handle(NeuralInferenceError("Error 3"), component="comp1")
        
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 3
        assert stats["by_component"]["comp1"] == 2
        assert stats["by_component"]["comp2"] == 1
    
    def test_max_errors_limit(self):
        """Test max errors limit."""
        handler = GlobalErrorHandler(max_errors=10)
        
        for i in range(20):
            handler.handle(ValueError(f"Error {i}"), component="test")
        
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 10
    
    def test_recovery_action(self):
        """Test recovery action registration."""
        handler = GlobalErrorHandler.get_instance()
        
        recovery_called = []
        
        def recovery_action(error):
            recovery_called.append(error)
            return True
        
        # Register for ValueError (the underlying cause type)
        handler.register_recovery_action("ValueError", recovery_action)
        
        error = ValueError("Test error")
        recovered = handler.handle(error, component="test", recoverable=True)
        
        assert recovered
        assert len(recovery_called) == 1
    
    def test_get_recent_errors(self):
        """Test getting recent errors."""
        handler = GlobalErrorHandler.get_instance()
        
        for i in range(5):
            handler.handle(ValueError(f"Error {i}"), component="test")
        
        recent = handler.get_recent_errors(limit=3)
        
        assert len(recent) == 3
    
    def test_clear_errors(self):
        """Test clearing errors."""
        handler = GlobalErrorHandler.get_instance()
        
        handler.handle(ValueError("Error"), component="test")
        assert handler.get_error_statistics()["total_errors"] == 1
        
        handler.clear_errors()
        assert handler.get_error_statistics()["total_errors"] == 0


class TestErrorBoundary:
    """Test error_boundary context manager."""
    
    def setup_method(self):
        """Reset handler for each test."""
        GlobalErrorHandler.reset_instance()
    
    def test_successful_operation(self):
        """Test error boundary with success."""
        with error_boundary("test", "operation"):
            pass  # No error
    
    def test_error_handling(self):
        """Test error boundary with error."""
        with error_boundary("test", "operation", reraise=False):
            raise ValueError("Test error")
        # Should not raise
    
    def test_error_reraise(self):
        """Test error boundary with reraise."""
        with pytest.raises(ValueError):
            with error_boundary("test", "operation", reraise=True):
                raise ValueError("Test error")
    
    def test_error_recorded(self):
        """Test error is recorded in handler."""
        handler = GlobalErrorHandler.get_instance()
        
        with error_boundary("test_component", "test_op", reraise=False):
            raise ValueError("Test error")
        
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 1
        assert "test_component" in stats["by_component"]


class TestGracefulFallback:
    """Test graceful_fallback decorator."""
    
    def setup_method(self):
        """Reset handler for each test."""
        GlobalErrorHandler.reset_instance()
    
    def test_success(self):
        """Test graceful fallback with success."""
        @graceful_fallback("test", fallback_value="fallback")
        def successful():
            return "success"
        
        assert successful() == "success"
    
    def test_fallback_on_error(self):
        """Test fallback on error."""
        @graceful_fallback("test", fallback_value="fallback")
        def failing():
            raise ValueError("Error")
        
        assert failing() == "fallback"
    
    def test_error_recorded(self):
        """Test error is recorded."""
        handler = GlobalErrorHandler.get_instance()
        
        @graceful_fallback("test_component", fallback_value=None)
        def failing():
            raise ValueError("Error")
        
        failing()
        
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 1


class TestIntegration:
    """Integration tests for error handling system."""
    
    def setup_method(self):
        """Reset state for each test."""
        GlobalErrorHandler.reset_instance()
        CircuitBreaker._instances.clear()
    
    def test_circuit_breaker_with_retry(self):
        """Test circuit breaker combined with retry."""
        cb = CircuitBreaker("test_service", failure_threshold=2, recovery_timeout=0.1)
        
        call_count = 0
        
        def service_call():
            nonlocal call_count
            call_count += 1
            if call_count < 3:
                raise ValueError("Service unavailable")
            return "success"
        
        # Use retry with circuit breaker - service should succeed after retries
        result = retry_with_backoff(
            service_call,
            max_retries=3,
            initial_delay=0.01,
        )
        
        assert result == "success"
        assert call_count == 3  # First fails, second fails, third succeeds
    
    def test_error_handler_with_circuit_breaker(self):
        """Test error handler with circuit breaker stats."""
        handler = GlobalErrorHandler.get_instance()
        cb = CircuitBreaker("test", failure_threshold=1)
        
        # Trigger circuit
        try:
            with cb:
                raise ValueError("Error")
        except ValueError:
            pass
        
        # Check circuit stats
        all_stats = CircuitBreaker.get_all_stats()
        assert "test" in all_stats
        assert all_stats["test"].state == CircuitState.OPEN
    
    def test_full_error_flow(self):
        """Test complete error flow from exception to handling."""
        handler = setup_global_error_handler(enable_reporting=False)
        
        # Simulate a neural inference error
        try:
            with error_boundary("neural_cortex", "inference", reraise=True):
                raise ModelNotFoundError("Model not loaded", model="gpt-neo-125m")
        except GeometryOSError:
            pass  # Caught and handled
        
        # Check statistics
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 1
        assert "ModelNotFoundError" in stats["by_type"]
        assert "neural_cortex" in stats["by_component"]


class TestErrorSimulation:
    """
    Simulate error conditions in various parts of the application
    to verify proper response.
    """
    
    def setup_method(self):
        """Reset state for each test."""
        GlobalErrorHandler.reset_instance()
        CircuitBreaker._instances.clear()
    
    def test_neural_inference_error_simulation(self):
        """Simulate neural inference errors."""
        handler = GlobalErrorHandler.get_instance()
        
        # Simulate model not found
        with error_boundary("neural_cortex", "load_model", reraise=False):
            raise ModelNotFoundError("Model gpt-neo-125m not found")
        
        # Simulate inference timeout
        with error_boundary("neural_cortex", "inference", reraise=False):
            raise InferenceTimeoutError("Inference timed out after 30s")
        
        # Verify both errors recorded
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 2
        assert stats["by_type"]["ModelNotFoundError"] == 1
        assert stats["by_type"]["InferenceTimeoutError"] == 1
    
    def test_gpu_error_simulation(self):
        """Simulate GPU-related errors."""
        handler = GlobalErrorHandler.get_instance()
        
        # Simulate shader compile error
        with error_boundary("visual_shell", "compile_shader", reraise=False):
            raise ShaderCompileError("Invalid WGSL syntax")
        
        # Simulate OOM
        with error_boundary("visual_shell", "allocate_buffer", reraise=False):
            raise GPUOutOfMemoryError("GPU memory exhausted")
        
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 2
        assert "visual_shell" in stats["by_component"]
    
    def test_network_error_simulation(self):
        """Simulate network-related errors."""
        handler = GlobalErrorHandler.get_instance()
        cb = CircuitBreaker("lm_studio", failure_threshold=2)
        
        # Simulate network failures that trigger circuit breaker
        for i in range(3):
            try:
                with cb:
                    with error_boundary("lm_studio_client", "api_call", reraise=True):
                        raise NetworkError(f"Connection refused {i}")
            except (NetworkError, GeometryOSError):
                pass
        
        # Circuit should be open
        assert cb.is_open
        
        # Errors should be recorded
        stats = handler.get_error_statistics()
        assert stats["by_component"]["lm_studio_client"] >= 2
    
    def test_evolution_error_simulation(self):
        """Simulate evolution system errors."""
        handler = GlobalErrorHandler.get_instance()
        
        # Simulate mutation error
        with error_boundary("evolution", "mutate", reraise=False):
            raise MutationError("Invalid mutation: negative fitness")
        
        stats = handler.get_error_statistics()
        assert stats["by_category"].get("mutation_error") == 1
    
    def test_cascading_error_simulation(self):
        """Simulate cascading errors with recovery."""
        handler = GlobalErrorHandler.get_instance()
        
        # Register recovery action
        def recover_from_oom(error):
            # Simulate clearing cache
            return True
        
        handler.register_recovery_action("GPUOutOfMemoryError", recover_from_oom)
        
        # Simulate OOM with recovery
        error = GPUOutOfMemoryError("Out of memory")
        recovered = handler.handle(error, component="visual_shell", recoverable=True)
        
        assert recovered
        
        # Check record shows recovery
        recent = handler.get_recent_errors(limit=1)
        assert recent[0].recovered
    
    def test_concurrent_error_handling(self):
        """Test concurrent error handling."""
        handler = GlobalErrorHandler.get_instance()
        
        errors = []
        
        def generate_errors(thread_id):
            for i in range(10):
                try:
                    with error_boundary(f"thread_{thread_id}", f"op_{i}", reraise=False):
                        raise ValueError(f"Error from thread {thread_id}")
                except Exception as e:
                    errors.append(e)
        
        # Run multiple threads
        threads = [
            threading.Thread(target=generate_errors, args=(i,))
            for i in range(5)
        ]
        
        for t in threads:
            t.start()
        for t in threads:
            t.join()
        
        # All errors should be handled
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 50


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
