"""
Game Day - Phase 48

Resilience verification scenarios for testing system recovery.
"""

import asyncio
import time
import uuid
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any


class ScenarioStatus(Enum):
    """Status of a game day scenario."""
    PENDING = "pending"
    RUNNING = "running"
    PASSED = "passed"
    FAILED = "failed"
    SKIPPED = "skipped"
    ABORTED = "aborted"


class ScenarioSeverity(Enum):
    """Severity/importance of scenarios."""
    SMOKE = "smoke"
    STANDARD = "standard"
    CRITICAL = "critical"
    DISASTER = "disaster"


class StepStatus(Enum):
    """Status of a scenario step."""
    PENDING = "pending"
    RUNNING = "running"
    PASSED = "passed"
    FAILED = "failed"


@dataclass
class ScenarioStep:
    """A single step in a game day scenario."""
    step_id: str
    name: str
    description: str = ""
    action: Callable | None = None
    timeout: float = 60.0
    status: StepStatus = StepStatus.PENDING
    started_at: float | None = None
    completed_at: float | None = None
    error_message: str | None = None
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class Assertion:
    """An assertion to verify during scenario."""
    assertion_id: str
    name: str
    check: Callable[[], bool] | None = None
    expected: bool = True
    actual: bool | None = None
    passed: bool | None = None
    error_message: str | None = None


@dataclass
class ScenarioResult:
    """Result of running a scenario."""
    scenario_id: str
    status: ScenarioStatus
    steps_passed: int = 0
    steps_failed: int = 0
    assertions_passed: int = 0
    assertions_failed: int = 0
    duration: float = 0.0
    started_at: float | None = None
    completed_at: float | None = None
    error_message: str | None = None
    artifacts: dict[str, Any] = field(default_factory=dict)


@dataclass
class GameDayScenario:
    """A complete game day scenario definition."""
    scenario_id: str
    name: str
    description: str = ""
    severity: ScenarioSeverity = ScenarioSeverity.STANDARD
    tags: set[str] = field(default_factory=set)
    steps: list[ScenarioStep] = field(default_factory=list)
    assertions: list[Assertion] = field(default_factory=list)
    setup_hooks: list[Callable] = field(default_factory=list)
    teardown_hooks: list[Callable] = field(default_factory=list)
    prerequisites: set[str] = field(default_factory=set)
    metadata: dict[str, Any] = field(default_factory=dict)


@dataclass
class GameDayReport:
    """Report from a game day exercise."""
    report_id: str
    name: str
    scenarios_run: int = 0
    scenarios_passed: int = 0
    scenarios_failed: int = 0
    scenarios_skipped: int = 0
    total_duration: float = 0.0
    started_at: float = field(default_factory=time.time)
    completed_at: float | None = None
    results: list[ScenarioResult] = field(default_factory=list)
    summary: dict[str, Any] = field(default_factory=dict)

    @property
    def pass_rate(self) -> float:
        if self.scenarios_run == 0:
            return 0.0
        return self.scenarios_passed / self.scenarios_run * 100


class ScenarioRunner:
    """Runs individual game day scenarios."""

    def __init__(self):
        self._current_scenarios: dict[str, GameDayScenario] = {}
        self._results: dict[str, ScenarioResult] = {}
        self._progress_handlers: list[Callable[[str, str, Any], None]] = []

    def add_progress_handler(self, handler: Callable) -> None:
        """Add a progress handler."""
        self._progress_handlers.append(handler)

    def remove_progress_handler(self, handler: Callable) -> None:
        """Remove a progress handler."""
        if handler in self._progress_handlers:
            self._progress_handlers.remove(handler)

    def _notify_progress(self, scenario_id: str, event: str, data: Any = None) -> None:
        """Notify handlers of progress."""
        for handler in self._progress_handlers:
            try:
                handler(scenario_id, event, data)
            except Exception:
                pass

    async def run_scenario(
        self,
        scenario: GameDayScenario,
        context: dict[str, Any] | None = None,
    ) -> ScenarioResult:
        """Run a game day scenario."""
        context = context or {}
        result = ScenarioResult(
            scenario_id=scenario.scenario_id,
            status=ScenarioStatus.RUNNING,
            started_at=time.time(),
        )

        self._current_scenarios[scenario.scenario_id] = scenario
        self._notify_progress(scenario.scenario_id, "started", scenario.name)

        try:
            # Run setup hooks
            for hook in scenario.setup_hooks:
                try:
                    if asyncio.iscoroutinefunction(hook):
                        await hook(context)
                    else:
                        hook(context)
                except Exception as e:
                    result.status = ScenarioStatus.FAILED
                    result.error_message = f"Setup failed: {e}"
                    return result

            # Run steps
            for step in scenario.steps:
                step.status = StepStatus.RUNNING
                step.started_at = time.time()
                self._notify_progress(scenario.scenario_id, "step_started", step.name)

                try:
                    if step.action:
                        if asyncio.iscoroutinefunction(step.action):
                            await asyncio.wait_for(
                                step.action(context),
                                timeout=step.timeout,
                            )
                        else:
                            step.action(context)

                    step.status = StepStatus.PASSED
                    result.steps_passed += 1
                    self._notify_progress(scenario.scenario_id, "step_passed", step.name)

                except TimeoutError:
                    step.status = StepStatus.FAILED
                    step.error_message = f"Timeout after {step.timeout}s"
                    result.steps_failed += 1
                    self._notify_progress(scenario.scenario_id, "step_failed", step.name)

                except Exception as e:
                    step.status = StepStatus.FAILED
                    step.error_message = str(e)
                    result.steps_failed += 1
                    self._notify_progress(scenario.scenario_id, "step_failed", step.name)

                finally:
                    step.completed_at = time.time()

            # Run assertions
            for assertion in scenario.assertions:
                try:
                    if assertion.check:
                        assertion.actual = assertion.check()
                        assertion.passed = assertion.actual == assertion.expected

                        if assertion.passed:
                            result.assertions_passed += 1
                        else:
                            result.assertions_failed += 1
                            assertion.error_message = f"Expected {assertion.expected}, got {assertion.actual}"

                except Exception as e:
                    assertion.passed = False
                    assertion.error_message = str(e)
                    result.assertions_failed += 1

            # Determine final status
            if result.steps_failed > 0 or result.assertions_failed > 0:
                result.status = ScenarioStatus.FAILED
            else:
                result.status = ScenarioStatus.PASSED

        except Exception as e:
            result.status = ScenarioStatus.FAILED
            result.error_message = str(e)

        finally:
            # Run teardown hooks
            for hook in scenario.teardown_hooks:
                try:
                    if asyncio.iscoroutinefunction(hook):
                        await hook(context)
                    else:
                        hook(context)
                except Exception:
                    pass

            result.completed_at = time.time()
            result.duration = result.completed_at - result.started_at

            self._results[scenario.scenario_id] = result
            self._current_scenarios.pop(scenario.scenario_id, None)
            self._notify_progress(scenario.scenario_id, "completed", result.status.value)

        return result

    def get_result(self, scenario_id: str) -> ScenarioResult | None:
        """Get result for a scenario."""
        return self._results.get(scenario_id)

    def get_current_scenarios(self) -> list[str]:
        """Get IDs of currently running scenarios."""
        return list(self._current_scenarios.keys())


class ScenarioLibrary:
    """Library of pre-defined game day scenarios."""

    def __init__(self):
        self._scenarios: dict[str, GameDayScenario] = {}
        self._by_tag: dict[str, set[str]] = {}
        self._by_severity: dict[ScenarioSeverity, set[str]] = {}

    def register(self, scenario: GameDayScenario) -> None:
        """Register a scenario."""
        self._scenarios[scenario.scenario_id] = scenario

        # Index by tag
        for tag in scenario.tags:
            if tag not in self._by_tag:
                self._by_tag[tag] = set()
            self._by_tag[tag].add(scenario.scenario_id)

        # Index by severity
        if scenario.severity not in self._by_severity:
            self._by_severity[scenario.severity] = set()
        self._by_severity[scenario.severity].add(scenario.scenario_id)

    def unregister(self, scenario_id: str) -> None:
        """Unregister a scenario."""
        scenario = self._scenarios.pop(scenario_id, None)
        if scenario:
            for tag in scenario.tags:
                if tag in self._by_tag:
                    self._by_tag[tag].discard(scenario_id)
            if scenario.severity in self._by_severity:
                self._by_severity[scenario.severity].discard(scenario_id)

    def get(self, scenario_id: str) -> GameDayScenario | None:
        """Get a scenario by ID."""
        return self._scenarios.get(scenario_id)

    def get_by_tag(self, tag: str) -> list[GameDayScenario]:
        """Get scenarios by tag."""
        ids = self._by_tag.get(tag, set())
        return [self._scenarios[i] for i in ids if i in self._scenarios]

    def get_by_severity(self, severity: ScenarioSeverity) -> list[GameDayScenario]:
        """Get scenarios by severity."""
        ids = self._by_severity.get(severity, set())
        return [self._scenarios[i] for i in ids if i in self._scenarios]

    def get_all(self) -> list[GameDayScenario]:
        """Get all scenarios."""
        return list(self._scenarios.values())

    def create_smoke_suite(self) -> list[GameDayScenario]:
        """Create a smoke test suite."""
        return self.get_by_severity(ScenarioSeverity.SMOKE)

    def create_critical_suite(self) -> list[GameDayScenario]:
        """Create a critical test suite."""
        return self.get_by_severity(ScenarioSeverity.CRITICAL)


class GameDay:
    """Main game day orchestrator."""

    def __init__(self, name: str = "Game Day"):
        self.name = name
        self._library = ScenarioLibrary()
        self._runner = ScenarioRunner()
        self._reports: list[GameDayReport] = []
        self._running = False
        self._aborted = False

    def register_scenario(self, scenario: GameDayScenario) -> None:
        """Register a scenario."""
        self._library.register(scenario)

    def unregister_scenario(self, scenario_id: str) -> None:
        """Unregister a scenario."""
        self._library.unregister(scenario_id)

    def get_scenario(self, scenario_id: str) -> GameDayScenario | None:
        """Get a scenario."""
        return self._library.get(scenario_id)

    def get_scenarios_by_tag(self, tag: str) -> list[GameDayScenario]:
        """Get scenarios by tag."""
        return self._library.get_by_tag(tag)

    def add_progress_handler(self, handler: Callable) -> None:
        """Add progress handler."""
        self._runner.add_progress_handler(handler)

    def remove_progress_handler(self, handler: Callable) -> None:
        """Remove progress handler."""
        self._runner.remove_progress_handler(handler)

    async def run_scenario(
        self,
        scenario_id: str,
        context: dict[str, Any] | None = None,
    ) -> ScenarioResult:
        """Run a single scenario."""
        scenario = self._library.get(scenario_id)
        if not scenario:
            return ScenarioResult(
                scenario_id=scenario_id,
                status=ScenarioStatus.SKIPPED,
                error_message="Scenario not found",
            )

        return await self._runner.run_scenario(scenario, context)

    async def run_suite(
        self,
        scenarios: list[GameDayScenario] | None = None,
        tags: set[str] | None = None,
        severity: ScenarioSeverity | None = None,
        context: dict[str, Any] | None = None,
    ) -> GameDayReport:
        """Run a suite of scenarios."""
        report = GameDayReport(
            report_id=str(uuid.uuid4()),
            name=self.name,
        )

        # Determine scenarios to run
        if scenarios:
            to_run = scenarios
        elif tags:
            to_run = []
            for tag in tags:
                to_run.extend(self._library.get_by_tag(tag))
        elif severity:
            to_run = self._library.get_by_severity(severity)
        else:
            to_run = self._library.get_all()

        self._running = True
        self._aborted = False

        # Sort by severity (smoke first, then disaster last)
        severity_order = {
            ScenarioSeverity.SMOKE: 0,
            ScenarioSeverity.STANDARD: 1,
            ScenarioSeverity.CRITICAL: 2,
            ScenarioSeverity.DISASTER: 3,
        }
        to_run.sort(key=lambda s: severity_order.get(s.severity, 1))

        for scenario in to_run:
            if self._aborted:
                result = ScenarioResult(
                    scenario_id=scenario.scenario_id,
                    status=ScenarioStatus.ABORTED,
                )
                report.scenarios_skipped += 1
            else:
                result = await self._runner.run_scenario(scenario, context)
                report.scenarios_run += 1

                if result.status == ScenarioStatus.PASSED:
                    report.scenarios_passed += 1
                elif result.status == ScenarioStatus.FAILED:
                    report.scenarios_failed += 1

            report.results.append(result)

        report.completed_at = time.time()
        report.total_duration = report.completed_at - report.started_at

        # Generate summary
        report.summary = {
            "pass_rate": report.pass_rate,
            "total_scenarios": report.scenarios_run,
            "passed": report.scenarios_passed,
            "failed": report.scenarios_failed,
            "duration_seconds": report.total_duration,
        }

        self._reports.append(report)
        self._running = False

        return report

    def abort(self) -> None:
        """Abort the current game day."""
        self._aborted = True

    def is_running(self) -> bool:
        """Check if game day is running."""
        return self._running

    def get_reports(self, limit: int = 10) -> list[GameDayReport]:
        """Get recent reports."""
        return self._reports[-limit:]

    def get_latest_report(self) -> GameDayReport | None:
        """Get the most recent report."""
        if self._reports:
            return self._reports[-1]
        return None

    def get_library(self) -> ScenarioLibrary:
        """Get scenario library."""
        return self._library

    def get_runner(self) -> ScenarioRunner:
        """Get scenario runner."""
        return self._runner


def create_game_day(name: str = "Game Day") -> GameDay:
    """Factory function to create a game day."""
    return GameDay(name=name)


def create_scenario(
    name: str,
    description: str = "",
    severity: ScenarioSeverity = ScenarioSeverity.STANDARD,
    tags: set[str] | None = None,
    steps: list[ScenarioStep] | None = None,
    assertions: list[Assertion] | None = None,
) -> GameDayScenario:
    """Factory function to create a scenario."""
    return GameDayScenario(
        scenario_id=str(uuid.uuid4()),
        name=name,
        description=description,
        severity=severity,
        tags=tags or set(),
        steps=steps or [],
        assertions=assertions or [],
    )
