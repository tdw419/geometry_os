"""
Tests for IntegrationTestClass class.
"""

import pytest


class TestIntegrationTestClass:
    """Test suite for IntegrationTestClass."""

    def test_initialization(self):
        """Test IntegrationTestClass initialization."""
        from systems.integrationtestclass.integrationtestclass import IntegrationTestClass
        obj = IntegrationTestClass()
        assert obj is not None

    def test_execute_runs_tests(self):
        """Test execute method runs registered tests."""
        from systems.integrationtestclass.integrationtestclass import IntegrationTestClass
        obj = IntegrationTestClass()

        # Define a simple test
        def test_example():
            return {"status": "ok"}

        # Override run_tests to provide test
        def run_tests_override():
            obj.run_test("example_test", test_example)

        obj.run_tests = run_tests_override
        obj.execute()

        # Verify results
        assert len(obj.get_results()) == 1

    def test_assert_true_passes(self):
        """Test assert_true passes for True condition."""
        from systems.integrationtestclass.integrationtestclass import IntegrationTestClass
        obj = IntegrationTestClass()
        obj.assert_true(True, "Should pass")

    def test_assert_true_fails(self):
        """Test assert_true raises for False condition."""
        from systems.integrationtestclass.integrationtestclass import IntegrationTestClass
        obj = IntegrationTestClass()
        with pytest.raises(AssertionError):
            obj.assert_true(False, "Should fail")

    def test_assert_equal(self):
        """Test assert_equal."""
        from systems.integrationtestclass.integrationtestclass import IntegrationTestClass
        obj = IntegrationTestClass()
        obj.assert_equal(1 + 1, 2)

    def test_assert_in(self):
        """Test assert_in."""
        from systems.integrationtestclass.integrationtestclass import IntegrationTestClass
        obj = IntegrationTestClass()
        obj.assert_in("a", ["a", "b", "c"])

    def test_get_summary(self):
        """Test get_summary returns results string."""
        from systems.integrationtestclass.integrationtestclass import IntegrationTestClass
        obj = IntegrationTestClass()
        summary = obj.get_summary()
        # With no tests run, should say "No tests run"
        assert "No tests run" in summary or "tests passed" in summary
