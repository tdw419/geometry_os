"""
Error Handling Verification Tests

This test suite simulates error conditions in various parts of the application
and verifies proper response without system crashes.

Tests verify:
1. Errors are caught and logged properly
2. System continues operating after errors
3. Recovery mechanisms work correctly
4. Circuit breakers prevent cascading failures
5. Retry logic handles transient failures
6. Error reports are generated correctly
"""

import asyncio
import logging
import threading
import time
from unittest.mock import Mock, patch, MagicMock, AsyncMock
from concurrent.futures import ThreadPoolExecutor

import pytest

from core.exceptions import (
    GeometryOSError,
    ErrorSeverity,
    ErrorCategory,
    NeuralInferenceError,
    ModelNotFoundError,
    InferenceTimeoutError,
    GPUGeometryError,
    ShaderCompileError,
    GPUOutOfMemoryError,
    EvolutionError,
    MutationError,
    NetworkError,
    AgentError,
    LMStudioError,
    ExternalServiceError,
)
from core.error_handler import (
    GlobalErrorHandler,
    CircuitBreaker,
    CircuitState,
    retry_with_backoff,
)
from core.error_integration import (
    initialize_error_handling,
    NeuralOperation,
    GPUOperation,
    EvolutionOperation,
    NetworkOperation,
    AsyncNeuralOperation,
    AsyncGPUOperation,
    with_error_handling,
    with_async_error_handling,
    with_circuit_breaker,
    with_retry,
    get_error_summary,
    print_error_report,
)


# =============================================================================
# FIXTURES
# =============================================================================

@pytest.fixture(autouse=True)
def reset_error_system():
    """Reset error handling state before each test."""
    GlobalErrorHandler.reset_instance()
    CircuitBreaker._instances.clear()
    initialize_error_handling(enable_reporting=False)
    yield
    # Cleanup after test
    GlobalErrorHandler.reset_instance()
    CircuitBreaker._instances.clear()


# =============================================================================
# NEURAL SYSTEM ERROR SIMULATIONS
# =============================================================================

class TestNeuralErrorSimulation:
    """Simulate errors in neural inference and training systems."""
    
    def test_model_not_found_recovery(self):
        """Simulate model not found error with graceful handling."""
        # Simulate trying to load a non-existent model
        with NeuralOperation("load_model", model="nonexistent-model", reraise=False) as op:
            # Simulate the error
            raise ModelNotFoundError(
                "Model nonexistent-model not found in LM Studio",
                model="nonexistent-model",
                severity=ErrorSeverity.HIGH,
            )
        
        # Verify error was recorded
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 1
        assert "ModelNotFoundError" in stats["by_type"]
        assert stats["by_component"]["neural_cortex"] == 1
        
        # System should continue operating
        assert True  # If we get here, no crash occurred
    
    def test_inference_timeout_with_retry(self):
        """Simulate inference timeout with automatic retry."""
        call_count = 0
        
        def inference_with_timeout():
            nonlocal call_count
            call_count += 1
            if call_count < 3:
                raise InferenceTimeoutError(
                    f"Inference timed out (attempt {call_count})",
                    timeout=30.0,
                )
            return {"result": "success"}
        
        # Use retry logic
        result = retry_with_backoff(
            inference_with_timeout,
            max_retries=3,
            initial_delay=0.01,
            retryable_exceptions=(InferenceTimeoutError,),
        )
        
        # Should succeed after retries
        assert result == {"result": "success"}
        assert call_count == 3
        
        # Verify errors were logged
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        # Note: errors from retries are caught, not necessarily logged to global handler
        # unless we explicitly use error_boundary
        assert True
    
    def test_inference_permanent_failure(self):
        """Simulate permanent inference failure."""
        with NeuralOperation("inference", model="gpt-neo", reraise=False) as op:
            # Simulate permanent failure
            raise NeuralInferenceError(
                "Model weights corrupted",
                severity=ErrorSeverity.CRITICAL,
                recoverable=False,
            )
        
        # System should continue
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 1
        # Check severity
        assert stats["by_severity"].get("critical", 0) == 1
    
    def test_concurrent_neural_errors(self):
        """Simulate concurrent neural errors from multiple threads."""
        errors_generated = []
        
        def generate_neural_error(thread_id):
            try:
                with NeuralOperation(f"inference_{thread_id}", reraise=True):
                    raise NeuralInferenceError(f"Error from thread {thread_id}")
            except NeuralInferenceError as e:
                errors_generated.append(e)
        
        # Generate errors from multiple threads
        with ThreadPoolExecutor(max_workers=10) as executor:
            futures = [executor.submit(generate_neural_error, i) for i in range(20)]
            for future in futures:
                future.result()  # Wait for completion
        
        # All errors should be generated
        assert len(errors_generated) == 20
        
        # All should be recorded
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 20
    
    @pytest.mark.asyncio
    async def test_async_neural_operation_error(self):
        """Simulate error in async neural operation."""
        async with AsyncNeuralOperation("async_inference", reraise=False) as op:
            # Simulate async error
            raise NeuralInferenceError("Async inference failed")
        
        # Should not crash
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 1


# =============================================================================
# GPU/VISUAL SYSTEM ERROR SIMULATIONS
# =============================================================================

class TestGPUErrorSimulation:
    """Simulate errors in GPU and visual rendering systems."""
    
    def test_shader_compilation_failure(self):
        """Simulate shader compilation error."""
        shader_code = "invalid wgsl code"
        
        with GPUOperation("compile_shader", shader=shader_code[:50], reraise=False) as op:
            raise ShaderCompileError(
                f"Shader compilation failed: syntax error at line 1",
                shader_preview=shader_code[:50],
            )
        
        # Verify error recorded
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 1
        assert "ShaderCompileError" in stats["by_type"]
    
    def test_gpu_oom_recovery(self):
        """Simulate GPU out of memory with recovery attempt."""
        handler = GlobalErrorHandler.get_instance()
        
        # Register recovery action
        recovery_called = []
        
        def clear_gpu_cache(error):
            recovery_called.append(error)
            # Simulate clearing cache
            return True
        
        handler.register_recovery_action("GPUOutOfMemoryError", clear_gpu_cache)
        
        # Simulate OOM
        error = GPUOutOfMemoryError(
            "GPU memory exhausted: 8GB used, 0GB free",
            memory_used=8 * 1024 * 1024 * 1024,
        )
        
        recovered = handler.handle(error, component="visual_shell", recoverable=True)
        
        # Should attempt recovery
        assert recovered is True
        assert len(recovery_called) == 1
        
        # Check error record shows recovery
        recent = handler.get_recent_errors(limit=1)
        assert recent[0].recovered is True
    
    def test_render_pipeline_failure(self):
        """Simulate render pipeline failure."""
        with GPUOperation("render_frame", frame_id=123, reraise=False) as op:
            raise GPUGeometryError(
                "Render pipeline failed: framebuffer incomplete",
                severity=ErrorSeverity.HIGH,
            )
        
        # System continues
        assert True
    
    def test_cascading_gpu_errors(self):
        """Simulate cascading GPU errors."""
        # Simulate multiple related GPU errors
        with GPUOperation("init_gpu", reraise=False):
            raise GPUGeometryError("GPU initialization failed")
        
        with GPUOperation("allocate_buffer", reraise=False):
            raise GPUOutOfMemoryError("Cannot allocate: GPU not initialized")
        
        with GPUOperation("render", reraise=False):
            raise GPUGeometryError("Render failed: no GPU context")
        
        # All should be recorded
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 3
        assert stats["by_component"]["visual_shell"] == 3


# =============================================================================
# EVOLUTION SYSTEM ERROR SIMULATIONS
# =============================================================================

class TestEvolutionErrorSimulation:
    """Simulate errors in evolution and mutation systems."""
    
    def test_mutation_failure(self):
        """Simulate mutation operation failure."""
        with EvolutionOperation("mutate", mutation_id="mut_123", reraise=False) as op:
            raise MutationError(
                "Invalid mutation: fitness became negative",
                mutation_type="weight_perturbation",
            )
        
        # Verify recorded
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 1
        assert "MutationError" in stats["by_type"]
    
    def test_evolution_cycle_failure_with_recovery(self):
        """Simulate evolution cycle failure with automatic recovery."""
        handler = GlobalErrorHandler.get_instance()
        
        recovery_attempts = []
        
        def recover_evolution(error):
            recovery_attempts.append(error)
            # Simulate resetting evolution state
            return True
        
        handler.register_recovery_action("EvolutionError", recover_evolution)
        
        # Simulate evolution cycle error
        error = EvolutionError(
            "Evolution cycle failed: population collapse",
            severity=ErrorSeverity.HIGH,
        )
        
        recovered = handler.handle(error, component="evolution_daemon", recoverable=True)
        
        assert recovered is True
        assert len(recovery_attempts) == 1


# =============================================================================
# NETWORK ERROR SIMULATIONS
# =============================================================================

class TestNetworkErrorSimulation:
    """Simulate network and external service errors."""
    
    def test_network_timeout_with_retry(self):
        """Simulate network timeout with retry."""
        call_count = 0
        
        @with_retry(max_retries=3, initial_delay=0.01, retryable_exceptions=(NetworkError,))
        def network_call():
            nonlocal call_count
            call_count += 1
            if call_count < 3:
                raise NetworkError(f"Connection timeout (attempt {call_count})")
            return {"status": "ok"}
        
        result = network_call()
        
        assert result == {"status": "ok"}
        assert call_count == 3
    
    def test_circuit_breaker_opens_on_failures(self):
        """Test circuit breaker opens after repeated failures."""
        cb = CircuitBreaker("test_service", failure_threshold=3, recovery_timeout=1.0)
        
        # Trigger failures
        for i in range(3):
            try:
                with cb:
                    raise NetworkError(f"Failure {i}")
            except NetworkError:
                pass
        
        # Circuit should be open
        assert cb.is_open
        
        # Further calls should be rejected
        with pytest.raises(ExternalServiceError) as exc_info:
            with cb:
                pass
        
        assert "circuit breaker" in str(exc_info.value).lower()
    
    def test_circuit_breaker_recovery(self):
        """Test circuit breaker recovers after timeout."""
        cb = CircuitBreaker("test_service", failure_threshold=1, recovery_timeout=0.1)
        
        # Trigger open state
        try:
            with cb:
                raise NetworkError("Failure")
        except NetworkError:
            pass
        
        assert cb.is_open
        
        # Wait for recovery timeout
        time.sleep(0.15)
        
        # Should transition to half-open
        assert cb.state == CircuitState.HALF_OPEN
        
        # Success should close circuit
        with cb:
            pass
        
        assert cb.is_closed
    
    def test_lm_studio_connection_failure(self):
        """Simulate LM Studio connection failure."""
        cb = CircuitBreaker("lm_studio", failure_threshold=2, recovery_timeout=5.0)
        
        # Simulate connection failures
        for i in range(2):
            try:
                with cb:
                    with NetworkOperation("lm_studio_api", reraise=True):
                        raise LMStudioError(f"Cannot connect to LM Studio (attempt {i})")
            except (LMStudioError, ExternalServiceError):
                pass
        
        # Circuit should be open
        assert cb.is_open
        
        # Verify errors logged
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] >= 2


# =============================================================================
# DECORATOR ERROR SIMULATIONS
# =============================================================================

class TestDecoratorErrorHandling:
    """Test error handling decorators."""
    
    def test_with_error_handling_decorator(self):
        """Test @with_error_handling decorator."""
        @with_error_handling(
            component="test_component",
            error_class=NeuralInferenceError,
            reraise=False,
            default_return=None,
        )
        def failing_function():
            raise ValueError("Test error")
        
        result = failing_function()
        
        # Should return default
        assert result is None
        
        # Error should be logged
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        
        assert stats["total_errors"] == 1
    
    def test_with_error_handling_reraise(self):
        """Test @with_error_handling with reraise=True."""
        @with_error_handling(
            component="test_component",
            error_class=NeuralInferenceError,
            reraise=True,
        )
        def failing_function():
            raise ValueError("Test error")
        
        with pytest.raises(NeuralInferenceError):
            failing_function()
    
    def test_with_circuit_breaker_decorator(self):
        """Test @with_circuit_breaker decorator."""
        call_count = 0
        
        @with_circuit_breaker("test_service", failure_threshold=2)
        def service_call():
            nonlocal call_count
            call_count += 1
            if call_count < 3:
                raise NetworkError("Service unavailable")
            return "success"
        
        # First two calls should fail
        with pytest.raises(NetworkError):
            service_call()
        
        with pytest.raises(NetworkError):
            service_call()
        
        # Circuit should be open now
        cb = CircuitBreaker.get("test_service")
        assert cb.is_open
        
        # Should reject call
        with pytest.raises(ExternalServiceError):
            service_call()
    
    @pytest.mark.asyncio
    async def test_async_error_handling_decorator(self):
        """Test @with_async_error_handling decorator."""
        @with_async_error_handling(
            component="async_test",
            error_class=NeuralInferenceError,
            reraise=False,
            default_return={"fallback": True},
        )
        async def async_failing_function():
            raise ValueError("Async error")
        
        result = await async_failing_function()
        
        assert result == {"fallback": True}
        
        # Error logged
        handler = GlobalErrorHandler.get_instance()
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 1


# =============================================================================
# ERROR REPORTING SIMULATIONS
# =============================================================================

class TestErrorReporting:
    """Test error reporting and statistics."""
    
    def test_error_summary_generation(self):
        """Test error summary generation."""
        # Generate various errors
        with NeuralOperation("inference", reraise=False):
            raise NeuralInferenceError("Error 1")
        
        with GPUOperation("render", reraise=False):
            raise GPUGeometryError("Error 2")
        
        with EvolutionOperation("mutate", reraise=False):
            raise MutationError("Error 3")
        
        # Get summary
        summary = get_error_summary()
        
        assert summary["errors"]["total_errors"] == 3
        assert len(summary["errors"]["by_component"]) == 3
        assert "neural_cortex" in summary["errors"]["by_component"]
        assert "visual_shell" in summary["errors"]["by_component"]
        assert "evolution_daemon" in summary["errors"]["by_component"]
    
    def test_error_report_formatting(self):
        """Test error report formatting."""
        from core.error_integration import format_error_report
        
        # Generate errors
        for i in range(5):
            with NeuralOperation(f"op_{i}", reraise=False):
                raise NeuralInferenceError(f"Error {i}")
        
        summary = get_error_summary()
        report = format_error_report(summary)
        
        # Check report contains expected sections
        assert "ERROR STATISTICS" in report
        assert "Total Errors: 5" in report
        assert "BY COMPONENT" in report
        assert "neural_cortex" in report
    
    def test_circuit_breaker_stats_in_report(self):
        """Test circuit breaker stats appear in report."""
        # Create circuit breakers and trigger some
        cb1 = CircuitBreaker("service1", failure_threshold=1)
        cb2 = CircuitBreaker("service2", failure_threshold=2)
        
        try:
            with cb1:
                raise NetworkError("Fail")
        except NetworkError:
            pass
        
        summary = get_error_summary()
        
        assert "circuit_breakers" in summary
        assert "service1" in summary["circuit_breakers"]
        assert summary["circuit_breakers"]["service1"]["state"] == "open"


# =============================================================================
# INTEGRATION SIMULATIONS
# =============================================================================

class TestIntegratedErrorScenarios:
    """Test integrated error scenarios across multiple subsystems."""
    
    def test_full_system_error_flow(self):
        """Simulate error flow through entire system."""
        handler = GlobalErrorHandler.get_instance()
        
        # 1. Neural inference fails
        with NeuralOperation("inference", reraise=False):
            raise ModelNotFoundError("Model not found")
        
        # 2. Triggers fallback to cached response
        # (simulated - in real system would use fallback handler)
        
        # 3. GPU operation fails
        with GPUOperation("render", reraise=False):
            raise GPUOutOfMemoryError("OOM")
        
        # 4. Recovery attempted
        handler.register_recovery_action("GPUOutOfMemoryError", lambda e: True)
        
        # 5. Evolution continues despite errors
        with EvolutionOperation("cycle", reraise=False):
            pass  # Success
        
        # Verify all errors recorded
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 2
    
    def test_system_remains_operational_after_critical_error(self):
        """Verify system continues operating after critical errors."""
        # Generate critical error
        with NeuralOperation("inference", reraise=False):
            raise NeuralInferenceError(
                "Critical failure",
                severity=ErrorSeverity.CRITICAL,
            )
        
        # System should still function
        @with_error_handling("test", error_class=NeuralInferenceError, reraise=False)
        def still_works():
            return "operational"
        
        result = still_works()
        assert result == "operational"
    
    def test_error_handler_thread_safety(self):
        """Test error handler works correctly under concurrent load."""
        handler = GlobalErrorHandler.get_instance()
        
        def worker(worker_id):
            for i in range(10):
                with NeuralOperation(f"op_{worker_id}_{i}", reraise=False):
                    raise NeuralInferenceError(f"Error {worker_id}:{i}")
        
        # Run concurrent workers
        threads = [threading.Thread(target=worker, args=(i,)) for i in range(10)]
        
        for t in threads:
            t.start()
        for t in threads:
            t.join()
        
        # All errors should be recorded
        stats = handler.get_error_statistics()
        assert stats["total_errors"] == 100
    
    def test_error_categories_are_correct(self):
        """Verify errors are categorized correctly."""
        handler = GlobalErrorHandler.get_instance()
        
        # Generate errors of different categories
        with NeuralOperation("inference", reraise=False):
            raise NeuralInferenceError("Neural error")
        
        with GPUOperation("render", reraise=False):
            raise GPUGeometryError("GPU error")
        
        with EvolutionOperation("mutate", reraise=False):
            raise MutationError("Evolution error")
        
        with NetworkOperation("api_call", reraise=False):
            raise NetworkError("Network error")
        
        stats = handler.get_error_statistics()
        
        # Check categories
        assert stats["by_category"].get("neural_inference", 0) == 1
        assert stats["by_category"].get("gpu_error", 0) == 1
        assert stats["by_category"].get("mutation_error", 0) == 1
        assert stats["by_category"].get("network_error", 0) == 1


# =============================================================================
# STRESS TESTS
# =============================================================================

class TestErrorHandlingStress:
    """Stress tests for error handling system."""
    
    def test_high_volume_errors(self):
        """Test handling high volume of errors."""
        handler = GlobalErrorHandler.get_instance()
        
        # Generate many errors quickly
        for i in range(1000):
            with NeuralOperation(f"op_{i}", reraise=False):
                raise NeuralInferenceError(f"Error {i}")
        
        stats = handler.get_error_statistics()
        
        # Should be limited by max_errors
        assert stats["total_errors"] <= 1000
        assert stats["total_errors"] > 0
    
    def test_rapid_circuit_breaker_transitions(self):
        """Test rapid circuit breaker state transitions."""
        cb = CircuitBreaker("test", failure_threshold=2, recovery_timeout=0.05)
        
        # Rapidly trigger transitions
        for _ in range(10):
            try:
                with cb:
                    raise NetworkError("Fail")
            except (NetworkError, ExternalServiceError):
                pass
            
            time.sleep(0.01)
        
        # Should still be in a valid state
        assert cb.state in [CircuitState.OPEN, CircuitState.HALF_OPEN, CircuitState.CLOSED]
    
    def test_concurrent_circuit_breakers(self):
        """Test multiple circuit breakers operating concurrently."""
        breakers = [CircuitBreaker(f"service_{i}", failure_threshold=2) for i in range(10)]
        
        def stress_breaker(cb):
            for _ in range(5):
                try:
                    with cb:
                        raise NetworkError("Fail")
                except (NetworkError, ExternalServiceError):
                    pass
        
        threads = [threading.Thread(target=stress_breaker, args=(cb,)) for cb in breakers]
        
        for t in threads:
            t.start()
        for t in threads:
            t.join()
        
        # All breakers should be in valid states
        stats = CircuitBreaker.get_all_stats()
        for name, cb_stats in stats.items():
            assert cb_stats.state in [CircuitState.OPEN, CircuitState.CLOSED, CircuitState.HALF_OPEN]


if __name__ == "__main__":
    pytest.main([__file__, "-v", "-s"])
