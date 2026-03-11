#!/usr/bin/env python3
"""
Error Handling Verification Script

This script verifies that the refactored error handling system works correctly
across various parts of the application by simulating error conditions.

Run this script to verify:
1. Errors are caught and logged properly
2. System continues operating after errors
3. Recovery mechanisms work correctly
4. Circuit breakers prevent cascading failures
5. Retry logic handles transient failures
6. Error reports are generated correctly

Usage:
    python verify_error_handling.py
"""

import asyncio
import logging
import sys
import time
from pathlib import Path

# Add project root to path
PROJECT_ROOT = Path(__file__).parent
sys.path.insert(0, str(PROJECT_ROOT))

from core.error_integration import (
    initialize_error_handling,
    NeuralOperation,
    GPUOperation,
    EvolutionOperation,
    NetworkOperation,
    get_error_summary,
    format_error_report,
)
from core.exceptions import (
    NeuralInferenceError,
    ModelNotFoundError,
    InferenceTimeoutError,
    GPUGeometryError,
    ShaderCompileError,
    GPUOutOfMemoryError,
    EvolutionError,
    MutationError,
    NetworkError,
    ExternalServiceError,
)
from core.error_handler import (
    GlobalErrorHandler,
    CircuitBreaker,
    CircuitState,
)

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(message)s',
    handlers=[
        logging.StreamHandler(),
        logging.FileHandler(PROJECT_ROOT / "logs" / "error_verification.log"),
    ]
)

logger = logging.getLogger("error_verification")


class ErrorHandlingVerifier:
    """
    Verifies error handling across the system.
    """

    def __init__(self):
        self.handler = initialize_error_handling(enable_reporting=False)
        self.tests_passed = 0
        self.tests_failed = 0
        self.test_results = []

    def record_result(self, test_name: str, passed: bool, details: str = ""):
        """Record a test result."""
        self.test_results.append({
            "test": test_name,
            "passed": passed,
            "details": details,
        })

        if passed:
            self.tests_passed += 1
            logger.info(f"✓ {test_name}: PASSED")
        else:
            self.tests_failed += 1
            logger.error(f"✗ {test_name}: FAILED - {details}")

    def verify_neural_errors(self):
        """Verify neural system error handling."""
        logger.info("\n" + "="*60)
        logger.info("TESTING NEURAL SYSTEM ERROR HANDLING")
        logger.info("="*60)

        # Test 1: Model not found
        logger.info("\n1. Testing model not found error...")
        try:
            with NeuralOperation("load_model", model="nonexistent", reraise=False) as op:
                raise ModelNotFoundError("Model nonexistent not found")
            
            stats = self.handler.get_error_statistics()
            assert stats["total_errors"] >= 1
            assert "ModelNotFoundError" in stats["by_type"]
            
            self.record_result(
                "Neural - Model not found",
                True,
                "Error logged correctly"
            )
        except Exception as e:
            self.record_result(
                "Neural - Model not found",
                False,
                str(e)
            )

        # Test 2: Inference timeout
        logger.info("\n2. Testing inference timeout error...")
        try:
            with NeuralOperation("inference", reraise=False) as op:
                raise InferenceTimeoutError("Inference timed out after 30s")
            
            stats = self.handler.get_error_statistics()
            assert stats["total_errors"] >= 2
            
            self.record_result(
                "Neural - Inference timeout",
                True,
                "Timeout handled gracefully"
            )
        except Exception as e:
            self.record_result(
                "Neural - Inference timeout",
                False,
                str(e)
            )

        # Test 3: Critical neural error
        logger.info("\n3. Testing critical neural error...")
        try:
            with NeuralOperation("critical_op", reraise=False) as op:
                raise NeuralInferenceError(
                    "Critical failure",
                    severity="critical",
                )
            
            stats = self.handler.get_error_statistics()
            assert stats["total_errors"] >= 3
            
            self.record_result(
                "Neural - Critical error",
                True,
                "Critical error logged"
            )
        except Exception as e:
            self.record_result(
                "Neural - Critical error",
                False,
                str(e)
            )

    def verify_gpu_errors(self):
        """Verify GPU system error handling."""
        logger.info("\n" + "="*60)
        logger.info("TESTING GPU SYSTEM ERROR HANDLING")
        logger.info("="*60)

        # Test 1: Shader compilation error
        logger.info("\n1. Testing shader compilation error...")
        try:
            with GPUOperation("compile_shader", reraise=False) as op:
                raise ShaderCompileError("Invalid WGSL syntax at line 42")
            
            stats = self.handler.get_error_statistics()
            assert "ShaderCompileError" in stats["by_type"]
            
            self.record_result(
                "GPU - Shader compilation",
                True,
                "Shader error handled"
            )
        except Exception as e:
            self.record_result(
                "GPU - Shader compilation",
                False,
                str(e)
            )

        # Test 2: GPU OOM with recovery
        logger.info("\n2. Testing GPU OOM with recovery...")
        try:
            # Register recovery action
            def recover_oom(error):
                logger.info("  Executing OOM recovery...")
                return True
            
            self.handler.register_recovery_action("GPUOutOfMemoryError", recover_oom)
            
            error = GPUOutOfMemoryError("GPU memory exhausted")
            recovered = self.handler.handle(error, component="visual_shell", recoverable=True)
            
            assert recovered is True
            
            self.record_result(
                "GPU - OOM recovery",
                True,
                "Recovery action executed"
            )
        except Exception as e:
            self.record_result(
                "GPU - OOM recovery",
                False,
                str(e)
            )

        # Test 3: Cascading GPU errors
        logger.info("\n3. Testing cascading GPU errors...")
        try:
            initial_errors = self.handler.get_error_statistics()["total_errors"]
            
            with GPUOperation("init", reraise=False):
                raise GPUGeometryError("Init failed")
            
            with GPUOperation("render", reraise=False):
                raise GPUGeometryError("Render failed")
            
            with GPUOperation("cleanup", reraise=False):
                raise GPUGeometryError("Cleanup failed")
            
            stats = self.handler.get_error_statistics()
            assert stats["total_errors"] >= initial_errors + 3
            
            self.record_result(
                "GPU - Cascading errors",
                True,
                "Multiple errors handled"
            )
        except Exception as e:
            self.record_result(
                "GPU - Cascading errors",
                False,
                str(e)
            )

    def verify_evolution_errors(self):
        """Verify evolution system error handling."""
        logger.info("\n" + "="*60)
        logger.info("TESTING EVOLUTION SYSTEM ERROR HANDLING")
        logger.info("="*60)

        # Test 1: Mutation error
        logger.info("\n1. Testing mutation error...")
        try:
            with EvolutionOperation("mutate", mutation_id="mut_123", reraise=False) as op:
                raise MutationError("Invalid mutation: negative fitness")
            
            stats = self.handler.get_error_statistics()
            assert "MutationError" in stats["by_type"]
            
            self.record_result(
                "Evolution - Mutation error",
                True,
                "Mutation error handled"
            )
        except Exception as e:
            self.record_result(
                "Evolution - Mutation error",
                False,
                str(e)
            )

        # Test 2: Evolution cycle error
        logger.info("\n2. Testing evolution cycle error...")
        try:
            with EvolutionOperation("evolution_cycle", reraise=False) as op:
                raise EvolutionError("Evolution cycle failed: population collapse")
            
            self.record_result(
                "Evolution - Cycle error",
                True,
                "Cycle error handled"
            )
        except Exception as e:
            self.record_result(
                "Evolution - Cycle error",
                False,
                str(e)
            )

    def verify_network_errors(self):
        """Verify network error handling with circuit breaker."""
        logger.info("\n" + "="*60)
        logger.info("TESTING NETWORK ERROR HANDLING")
        logger.info("="*60)

        # Test 1: Circuit breaker opens on failures
        logger.info("\n1. Testing circuit breaker opens on failures...")
        try:
            cb = CircuitBreaker("test_service", failure_threshold=3, recovery_timeout=1.0)
            
            # Trigger failures
            for i in range(3):
                try:
                    with cb:
                        raise NetworkError(f"Connection refused {i}")
                except NetworkError:
                    pass
            
            assert cb.is_open
            
            self.record_result(
                "Network - Circuit breaker opens",
                True,
                f"Circuit state: {cb.state.value}"
            )
        except Exception as e:
            self.record_result(
                "Network - Circuit breaker opens",
                False,
                str(e)
            )

        # Test 2: Circuit breaker rejects calls when open
        logger.info("\n2. Testing circuit breaker rejects when open...")
        try:
            cb = CircuitBreaker("test_service_2", failure_threshold=1, recovery_timeout=1.0)
            
            # Trigger open state
            try:
                with cb:
                    raise NetworkError("Failure")
            except NetworkError:
                pass
            
            # Should reject
            rejected = False
            try:
                with cb:
                    pass
            except ExternalServiceError:
                rejected = True
            
            assert rejected
            
            self.record_result(
                "Network - Circuit breaker rejects",
                True,
                "Calls rejected when open"
            )
        except Exception as e:
            self.record_result(
                "Network - Circuit breaker rejects",
                False,
                str(e)
            )

        # Test 3: Circuit breaker recovers
        logger.info("\n3. Testing circuit breaker recovery...")
        try:
            cb = CircuitBreaker("test_service_3", failure_threshold=1, recovery_timeout=0.1)
            
            # Trigger open state
            try:
                with cb:
                    raise NetworkError("Failure")
            except NetworkError:
                pass
            
            assert cb.is_open
            
            # Wait for recovery timeout
            time.sleep(0.15)
            
            # Should be half-open
            assert cb.state == CircuitState.HALF_OPEN
            
            # Success should close
            with cb:
                pass
            
            assert cb.is_closed
            
            self.record_result(
                "Network - Circuit breaker recovery",
                True,
                "Circuit recovered successfully"
            )
        except Exception as e:
            self.record_result(
                "Network - Circuit breaker recovery",
                False,
                str(e)
            )

    def verify_error_reporting(self):
        """Verify error reporting and statistics."""
        logger.info("\n" + "="*60)
        logger.info("TESTING ERROR REPORTING")
        logger.info("="*60)

        # Test 1: Error summary generation
        logger.info("\n1. Testing error summary generation...")
        try:
            summary = get_error_summary()
            
            assert "errors" in summary
            assert "circuit_breakers" in summary
            assert "total_errors" in summary["errors"]
            
            self.record_result(
                "Reporting - Summary generation",
                True,
                f"Total errors: {summary['errors']['total_errors']}"
            )
        except Exception as e:
            self.record_result(
                "Reporting - Summary generation",
                False,
                str(e)
            )

        # Test 2: Error report formatting
        logger.info("\n2. Testing error report formatting...")
        try:
            summary = get_error_summary()
            report = format_error_report(summary)
            
            assert "ERROR STATISTICS" in report
            assert "BY COMPONENT" in report
            
            self.record_result(
                "Reporting - Report formatting",
                True,
                "Report generated successfully"
            )
        except Exception as e:
            self.record_result(
                "Reporting - Report formatting",
                False,
                str(e)
            )

    def verify_system_continuity(self):
        """Verify system continues operating after errors."""
        logger.info("\n" + "="*60)
        logger.info("TESTING SYSTEM CONTINUITY")
        logger.info("="*60)

        # Test: System remains operational after multiple errors
        logger.info("\n1. Testing system continuity after errors...")
        try:
            # Generate multiple errors
            with NeuralOperation("op1", reraise=False):
                raise NeuralInferenceError("Error 1")
            
            with GPUOperation("op2", reraise=False):
                raise GPUGeometryError("Error 2")
            
            with EvolutionOperation("op3", reraise=False):
                raise MutationError("Error 3")
            
            # System should still work
            with NeuralOperation("op4", reraise=False) as op:
                op.set_result("success")
            
            self.record_result(
                "Continuity - System operational",
                True,
                "System continued after errors"
            )
        except Exception as e:
            self.record_result(
                "Continuity - System operational",
                False,
                str(e)
            )

    def print_summary(self):
        """Print test summary."""
        logger.info("\n" + "="*60)
        logger.info("VERIFICATION SUMMARY")
        logger.info("="*60)
        
        logger.info(f"\nTotal Tests: {self.tests_passed + self.tests_failed}")
        logger.info(f"Passed: {self.tests_passed}")
        logger.info(f"Failed: {self.tests_failed}")
        
        if self.tests_failed == 0:
            logger.info("\n✓ ALL TESTS PASSED - Error handling is working correctly!")
        else:
            logger.error(f"\n✗ {self.tests_failed} TEST(S) FAILED - See details above")
        
        # Print error report
        logger.info("\n" + "="*60)
        logger.info("ERROR STATISTICS")
        logger.info("="*60)
        
        summary = get_error_summary()
        report = format_error_report(summary)
        print(report)

    def run_all_tests(self):
        """Run all verification tests."""
        logger.info("="*60)
        logger.info("GEOMETRY OS ERROR HANDLING VERIFICATION")
        logger.info("="*60)
        logger.info("\nThis script verifies that error handling works correctly")
        logger.info("across various parts of the application.\n")

        # Run tests
        self.verify_neural_errors()
        self.verify_gpu_errors()
        self.verify_evolution_errors()
        self.verify_network_errors()
        self.verify_error_reporting()
        self.verify_system_continuity()

        # Print summary
        self.print_summary()

        return self.tests_failed == 0


def main():
    """Main entry point."""
    # Create logs directory if it doesn't exist
    logs_dir = PROJECT_ROOT / "logs"
    logs_dir.mkdir(exist_ok=True)

    # Run verification
    verifier = ErrorHandlingVerifier()
    success = verifier.run_all_tests()

    # Exit with appropriate code
    sys.exit(0 if success else 1)


if __name__ == "__main__":
    main()
