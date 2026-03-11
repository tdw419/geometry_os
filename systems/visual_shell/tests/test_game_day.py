"""
Tests for Game Day (Phase 48)

Tests resilience verification scenarios.
"""

import asyncio
from unittest.mock import Mock

import pytest

from systems.visual_shell.game_day import (
    Assertion,
    GameDay,
    GameDayReport,
    GameDayScenario,
    ScenarioLibrary,
    ScenarioResult,
    ScenarioRunner,
    ScenarioSeverity,
    ScenarioStatus,
    ScenarioStep,
    StepStatus,
    create_game_day,
    create_scenario,
)


class TestScenarioStatus:
    """Tests for ScenarioStatus enum."""

    def test_statuses(self):
        assert ScenarioStatus.PENDING.value == "pending"
        assert ScenarioStatus.RUNNING.value == "running"
        assert ScenarioStatus.PASSED.value == "passed"
        assert ScenarioStatus.FAILED.value == "failed"
        assert ScenarioStatus.SKIPPED.value == "skipped"
        assert ScenarioStatus.ABORTED.value == "aborted"


class TestScenarioSeverity:
    """Tests for ScenarioSeverity enum."""

    def test_severities(self):
        assert ScenarioSeverity.SMOKE.value == "smoke"
        assert ScenarioSeverity.STANDARD.value == "standard"
        assert ScenarioSeverity.CRITICAL.value == "critical"
        assert ScenarioSeverity.DISASTER.value == "disaster"


class TestStepStatus:
    """Tests for StepStatus enum."""

    def test_step_statuses(self):
        assert StepStatus.PENDING.value == "pending"
        assert StepStatus.RUNNING.value == "running"
        assert StepStatus.PASSED.value == "passed"
        assert StepStatus.FAILED.value == "failed"


class TestScenarioStep:
    """Tests for ScenarioStep dataclass."""

    def test_step_creation(self):
        step = ScenarioStep(
            step_id="step-1",
            name="Test Step",
            description="Test description",
        )
        assert step.step_id == "step-1"
        assert step.status == StepStatus.PENDING
        assert step.timeout == 60.0


class TestAssertion:
    """Tests for Assertion dataclass."""

    def test_assertion_creation(self):
        assertion = Assertion(
            assertion_id="assert-1",
            name="Test Assertion",
        )
        assert assertion.assertion_id == "assert-1"
        assert assertion.expected is True
        assert assertion.actual is None

    def test_assertion_with_check(self):
        assertion = Assertion(
            assertion_id="assert-1",
            name="Test",
            check=lambda: True,
            expected=True,
        )
        assert assertion.check() is True


class TestScenarioResult:
    """Tests for ScenarioResult dataclass."""

    def test_result_defaults(self):
        result = ScenarioResult(
            scenario_id="scenario-1",
            status=ScenarioStatus.PENDING,
        )
        assert result.steps_passed == 0
        assert result.duration == 0.0


class TestGameDayScenario:
    """Tests for GameDayScenario dataclass."""

    def test_scenario_creation(self):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test Scenario",
        )
        assert scenario.scenario_id == "scenario-1"
        assert scenario.severity == ScenarioSeverity.STANDARD
        assert len(scenario.steps) == 0

    def test_scenario_with_tags(self):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            tags={"network", "resilience"},
        )
        assert "network" in scenario.tags


class TestGameDayReport:
    """Tests for GameDayReport dataclass."""

    def test_report_creation(self):
        report = GameDayReport(
            report_id="report-1",
            name="Test Report",
        )
        assert report.scenarios_run == 0
        assert report.pass_rate == 0.0

    def test_pass_rate(self):
        report = GameDayReport(
            report_id="report-1",
            name="Test",
            scenarios_run=10,
            scenarios_passed=8,
        )
        assert report.pass_rate == 80.0


class TestScenarioRunner:
    """Tests for ScenarioRunner."""

    @pytest.fixture
    def runner(self):
        return ScenarioRunner()

    def test_runner_creation(self, runner):
        assert len(runner._current_scenarios) == 0

    @pytest.mark.asyncio
    async def test_run_scenario_pass(self, runner):
        step = ScenarioStep(
            step_id="step-1",
            name="Test Step",
            action=lambda ctx: None,
        )

        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            steps=[step],
        )

        result = await runner.run_scenario(scenario)
        assert result.status == ScenarioStatus.PASSED
        assert result.steps_passed == 1

    @pytest.mark.asyncio
    async def test_run_scenario_fail(self, runner):
        def failing_action(ctx):
            raise ValueError("Test error")

        step = ScenarioStep(
            step_id="step-1",
            name="Failing Step",
            action=failing_action,
        )

        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            steps=[step],
        )

        result = await runner.run_scenario(scenario)
        assert result.status == ScenarioStatus.FAILED
        assert result.steps_failed == 1

    @pytest.mark.asyncio
    async def test_run_scenario_with_assertions(self, runner):
        assertion = Assertion(
            assertion_id="assert-1",
            name="Test Assertion",
            check=lambda: True,
            expected=True,
        )

        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            assertions=[assertion],
        )

        result = await runner.run_scenario(scenario)
        assert result.assertions_passed == 1

    @pytest.mark.asyncio
    async def test_run_scenario_with_setup(self, runner):
        setup_called = []

        async def setup(ctx):
            setup_called.append("setup")

        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            setup_hooks=[setup],
        )

        await runner.run_scenario(scenario)
        assert len(setup_called) == 1

    @pytest.mark.asyncio
    async def test_run_scenario_with_teardown(self, runner):
        teardown_called = []

        def teardown(ctx):
            teardown_called.append("teardown")

        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            teardown_hooks=[teardown],
        )

        await runner.run_scenario(scenario)
        assert len(teardown_called) == 1

    def test_add_progress_handler(self, runner):
        handler = Mock()
        runner.add_progress_handler(handler)
        assert handler in runner._progress_handlers

    def test_remove_progress_handler(self, runner):
        handler = Mock()
        runner.add_progress_handler(handler)
        runner.remove_progress_handler(handler)
        assert handler not in runner._progress_handlers

    @pytest.mark.asyncio
    async def test_step_timeout(self, runner):
        async def slow_action(ctx):
            await asyncio.sleep(2.0)

        step = ScenarioStep(
            step_id="step-1",
            name="Slow Step",
            action=slow_action,
            timeout=0.1,
        )

        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            steps=[step],
        )

        result = await runner.run_scenario(scenario)
        assert result.status == ScenarioStatus.FAILED
        assert "Timeout" in step.error_message

    def test_get_result(self, runner):
        result = runner.get_result("nonexistent")
        assert result is None

    def test_get_current_scenarios(self, runner):
        current = runner.get_current_scenarios()
        assert isinstance(current, list)


class TestScenarioLibrary:
    """Tests for ScenarioLibrary."""

    @pytest.fixture
    def library(self):
        return ScenarioLibrary()

    def test_library_creation(self, library):
        assert len(library.get_all()) == 0

    def test_register(self, library):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
        )
        library.register(scenario)
        assert library.get("scenario-1") is not None

    def test_unregister(self, library):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
        )
        library.register(scenario)
        library.unregister("scenario-1")
        assert library.get("scenario-1") is None

    def test_get_by_tag(self, library):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            tags={"network"},
        )
        library.register(scenario)

        found = library.get_by_tag("network")
        assert len(found) == 1

    def test_get_by_severity(self, library):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
            severity=ScenarioSeverity.CRITICAL,
        )
        library.register(scenario)

        found = library.get_by_severity(ScenarioSeverity.CRITICAL)
        assert len(found) == 1

    def test_get_all(self, library):
        for i in range(3):
            scenario = GameDayScenario(
                scenario_id=f"scenario-{i}",
                name=f"Test {i}",
            )
            library.register(scenario)

        all_scenarios = library.get_all()
        assert len(all_scenarios) == 3

    def test_create_smoke_suite(self, library):
        smoke = GameDayScenario(
            scenario_id="smoke-1",
            name="Smoke Test",
            severity=ScenarioSeverity.SMOKE,
        )
        library.register(smoke)

        suite = library.create_smoke_suite()
        assert len(suite) == 1

    def test_create_critical_suite(self, library):
        critical = GameDayScenario(
            scenario_id="critical-1",
            name="Critical Test",
            severity=ScenarioSeverity.CRITICAL,
        )
        library.register(critical)

        suite = library.create_critical_suite()
        assert len(suite) == 1


class TestGameDay:
    """Tests for GameDay orchestrator."""

    @pytest.fixture
    def game_day(self):
        return GameDay(name="Test Game Day")

    def test_game_day_creation(self, game_day):
        assert game_day.name == "Test Game Day"
        assert game_day.is_running() is False

    def test_register_scenario(self, game_day):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
        )
        game_day.register_scenario(scenario)
        assert game_day.get_scenario("scenario-1") is not None

    def test_unregister_scenario(self, game_day):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
        )
        game_day.register_scenario(scenario)
        game_day.unregister_scenario("scenario-1")
        assert game_day.get_scenario("scenario-1") is None

    @pytest.mark.asyncio
    async def test_run_scenario(self, game_day):
        scenario = GameDayScenario(
            scenario_id="scenario-1",
            name="Test",
        )
        game_day.register_scenario(scenario)

        result = await game_day.run_scenario("scenario-1")
        assert result.status == ScenarioStatus.PASSED

    @pytest.mark.asyncio
    async def test_run_scenario_not_found(self, game_day):
        result = await game_day.run_scenario("nonexistent")
        assert result.status == ScenarioStatus.SKIPPED

    @pytest.mark.asyncio
    async def test_run_suite(self, game_day):
        for i in range(3):
            scenario = GameDayScenario(
                scenario_id=f"scenario-{i}",
                name=f"Test {i}",
            )
            game_day.register_scenario(scenario)

        report = await game_day.run_suite()
        assert report.scenarios_run == 3

    @pytest.mark.asyncio
    async def test_run_suite_by_tag(self, game_day):
        tagged = GameDayScenario(
            scenario_id="tagged-1",
            name="Tagged",
            tags={"network"},
        )
        untagged = GameDayScenario(
            scenario_id="untagged-1",
            name="Untagged",
        )
        game_day.register_scenario(tagged)
        game_day.register_scenario(untagged)

        report = await game_day.run_suite(tags={"network"})
        assert report.scenarios_run == 1

    @pytest.mark.asyncio
    async def test_run_suite_by_severity(self, game_day):
        critical = GameDayScenario(
            scenario_id="critical-1",
            name="Critical",
            severity=ScenarioSeverity.CRITICAL,
        )
        standard = GameDayScenario(
            scenario_id="standard-1",
            name="Standard",
        )
        game_day.register_scenario(critical)
        game_day.register_scenario(standard)

        report = await game_day.run_suite(severity=ScenarioSeverity.CRITICAL)
        assert report.scenarios_run == 1

    @pytest.mark.asyncio
    async def test_abort(self, game_day):
        for i in range(10):
            scenario = GameDayScenario(
                scenario_id=f"scenario-{i}",
                name=f"Test {i}",
            )
            game_day.register_scenario(scenario)

        # Start running and abort
        asyncio.create_task(game_day.run_suite())
        await asyncio.sleep(0.01)
        game_day.abort()

        # Next scenario should be aborted
        assert game_day._aborted is True

    def test_add_progress_handler(self, game_day):
        handler = Mock()
        game_day.add_progress_handler(handler)
        assert handler in game_day._runner._progress_handlers

    def test_get_reports(self, game_day):
        reports = game_day.get_reports()
        assert isinstance(reports, list)

    def test_get_latest_report(self, game_day):
        report = game_day.get_latest_report()
        assert report is None  # No reports yet

    def test_get_library(self, game_day):
        library = game_day.get_library()
        assert isinstance(library, ScenarioLibrary)

    def test_get_runner(self, game_day):
        runner = game_day.get_runner()
        assert isinstance(runner, ScenarioRunner)


class TestFactoryFunctions:
    """Tests for factory functions."""

    def test_create_game_day(self):
        game_day = create_game_day("Custom Name")
        assert isinstance(game_day, GameDay)
        assert game_day.name == "Custom Name"

    def test_create_scenario(self):
        scenario = create_scenario(
            name="Test Scenario",
            description="Test description",
            severity=ScenarioSeverity.CRITICAL,
            tags={"test"},
        )
        assert isinstance(scenario, GameDayScenario)
        assert scenario.name == "Test Scenario"
        assert scenario.severity == ScenarioSeverity.CRITICAL


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
