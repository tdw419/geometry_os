"""
TestClass Module

Provides a base class for unit testing with common test utilities.
Supports test registration, setup/teardown, and result collection.
"""

import logging
import time
from collections.abc import Callable
from dataclasses import dataclass
from typing import Any, TypeVar

try:
    import structlog
    HAS_STRUCTLOG = True
except ImportError:
    HAS_STRUCTLOG = False

T = TypeVar('T')


@dataclass
class TestResult:
    """Result of a single test."""
    name: str
    success: bool
    duration_ms: float
    message: str = ""
    error: Exception | None = None


class TestClass:
    """
    Base class for unit testing with common utilities.

    Usage:
        class MyTests(TestClass):
            def test_something(self):
                self.assert_equal(1 + 1, 2)

            def test_another(self):
                with self.assert_raises(ValueError):
                    int("not a number")

        # Run tests
        tester = MyTests()
        results = tester.run_all()
        print(tester.get_summary())
    """

    def __init__(self):
        """Initialize TestClass."""
        if HAS_STRUCTLOG:
            self.logger = structlog.get_logger()
        else:
            self.logger = logging.getLogger(self.__class__.__name__)

        self._results: list[TestResult] = []
        self._setup_fn: Callable | None = None
        self._teardown_fn: Callable | None = None

    def setup(self, fn: Callable) -> Callable:
        """Decorator to register setup function."""
        self._setup_fn = fn
        return fn

    def teardown(self, fn: Callable) -> Callable:
        """Decorator to register teardown function."""
        self._teardown_fn = fn
        return fn

    def execute(self, test_name: str | None = None, *args, **kwargs) -> TestResult:
        """
        Execute a single test by name, or run all tests if no name provided.

        Args:
            test_name: Name of test method to run (e.g., "test_something")
            *args, **kwargs: Arguments passed to test method

        Returns:
            TestResult for the executed test
        """
        if test_name:
            return self._run_single_test(test_name, *args, **kwargs)
        else:
            # Run all tests and return summary
            results = self.run_all()
            total = len(results)
            passed = sum(1 for r in results if r.success)
            return TestResult(
                name="all_tests",
                success=passed == total,
                duration_ms=sum(r.duration_ms for r in results),
                message=f"{passed}/{total} tests passed"
            )

    def _run_single_test(self, name: str, *args, **kwargs) -> TestResult:
        """Run a single test method."""
        test_method = getattr(self, name, None)
        if test_method is None or not name.startswith('test_'):
            return TestResult(
                name=name,
                success=False,
                duration_ms=0,
                message=f"Test method '{name}' not found",
                error=AttributeError(f"No test method: {name}")
            )

        start = time.time()
        try:
            # Run setup if registered
            if self._setup_fn:
                self._setup_fn()

            # Run the test
            test_method(*args, **kwargs)

            duration = (time.time() - start) * 1000
            result = TestResult(
                name=name,
                success=True,
                duration_ms=duration,
                message="Passed"
            )

        except AssertionError as e:
            duration = (time.time() - start) * 1000
            result = TestResult(
                name=name,
                success=False,
                duration_ms=duration,
                message=str(e),
                error=e
            )

        except Exception as e:
            duration = (time.time() - start) * 1000
            result = TestResult(
                name=name,
                success=False,
                duration_ms=duration,
                message=f"Exception: {e}",
                error=e
            )

        finally:
            # Run teardown if registered
            if self._teardown_fn:
                try:
                    self._teardown_fn()
                except Exception as e:
                    self.logger.warning(f"Teardown failed: {e}")

        self._results.append(result)
        return result

    def run_all(self) -> list[TestResult]:
        """Run all test methods (methods starting with 'test_')."""
        test_methods = [
            name for name in dir(self)
            if name.startswith('test_') and callable(getattr(self, name))
        ]

        results = []
        for name in sorted(test_methods):
            result = self._run_single_test(name)
            results.append(result)

        return results

    # Assertion methods

    def assert_true(self, condition: bool, message: str = "Expected True") -> None:
        """Assert condition is True."""
        if not condition:
            raise AssertionError(message)

    def assert_false(self, condition: bool, message: str = "Expected False") -> None:
        """Assert condition is False."""
        if condition:
            raise AssertionError(message)

    def assert_equal(self, actual: T, expected: T, message: str = "") -> None:
        """Assert actual equals expected."""
        if actual != expected:
            msg = f"Expected {expected!r}, got {actual!r}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_not_equal(self, actual: T, expected: T, message: str = "") -> None:
        """Assert actual does not equal expected."""
        if actual == expected:
            msg = f"Expected value different from {expected!r}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_in(self, item: Any, container: Any, message: str = "") -> None:
        """Assert item is in container."""
        if item not in container:
            msg = f"{item!r} not found in {container!r}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_is_instance(self, obj: Any, cls: type, message: str = "") -> None:
        """Assert object is instance of class."""
        if not isinstance(obj, cls):
            msg = f"Expected {cls.__name__}, got {type(obj).__name__}"
            if message:
                msg = f"{message}: {msg}"
            raise AssertionError(msg)

    def assert_raises(self, exception_type: type):
        """Context manager to assert exception is raised."""
        import contextlib

        @contextlib.contextmanager
        def _assert_raises():
            try:
                yield
                raise AssertionError(f"Expected {exception_type.__name__} was not raised")
            except exception_type:
                pass

        return _assert_raises()

    def get_results(self) -> list[TestResult]:
        """Get all test results."""
        return self._results.copy()

    def get_summary(self) -> str:
        """Get summary of test results."""
        total = len(self._results)
        if total == 0:
            return "No tests run"
        passed = sum(1 for r in self._results if r.success)
        return f"{passed}/{total} tests passed ({passed/total*100:.1f}%)"

    def clear_results(self) -> None:
        """Clear all stored results."""
        self._results.clear()


# Alias for backwards compatibility
testclass = TestClass
