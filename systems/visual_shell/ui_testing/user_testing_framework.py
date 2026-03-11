#!/usr/bin/env python3
"""
User Testing Framework for Enhanced Glyph Shell

Provides tools for:
- Automated usability testing
- Task completion tracking
- Time-on-task measurement
- User feedback collection
- A/B testing support

Usage:
    # Run automated tests
    python user_testing_framework.py --auto-test

    # Start feedback collection server
    python user_testing_framework.py --server

    # Generate test report
    python user_testing_framework.py --report
"""

import json
import time
import statistics
from pathlib import Path
from dataclasses import dataclass, field, asdict
from typing import Any, Callable
from datetime import datetime
from enum import Enum
import argparse


class TaskStatus(Enum):
    """Status of a test task."""
    NOT_STARTED = "not_started"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    FAILED = "failed"
    SKIPPED = "skipped"


class Difficulty(Enum):
    """Task difficulty levels."""
    TRIVIAL = "trivial"      # Should complete in < 5 seconds
    EASY = "easy"            # Should complete in < 15 seconds
    MEDIUM = "medium"        # Should complete in < 30 seconds
    HARD = "hard"            # Should complete in < 60 seconds
    EXPERT = "expert"        # No time expectation


@dataclass
class TestTask:
    """A user testing task."""
    id: str
    name: str
    description: str
    instructions: str
    difficulty: Difficulty
    expected_time_seconds: float
    success_criteria: list[str]
    hints: list[str] = field(default_factory=list)
    category: str = "general"
    prerequisites: list[str] = field(default_factory=list)


@dataclass
class TaskResult:
    """Result of a completed task."""
    task_id: str
    status: TaskStatus
    start_time: float
    end_time: float | None = None
    time_on_task: float | None = None
    hints_used: int = 0
    errors: list[str] = field(default_factory=list)
    success_criteria_met: list[str] = field(default_factory=list)
    user_notes: str = ""


@dataclass
class UserFeedback:
    """User feedback submission."""
    timestamp: float
    task_id: str | None
    category: str  # bug, suggestion, praise, confusion
    severity: str  # low, medium, high, critical
    message: str
    context: dict[str, Any] = field(default_factory=dict)
    user_id: str = "anonymous"


@dataclass
class TestSession:
    """A complete testing session."""
    session_id: str
    user_id: str
    start_time: float
    end_time: float | None = None
    task_results: list[TaskResult] = field(default_factory=list)
    feedback: list[UserFeedback] = field(default_factory=list)
    system_info: dict[str, Any] = field(default_factory=dict)
    overall_satisfaction: int | None = None  # 1-5


class UsabilityTestSuite:
    """
    Predefined test tasks for Glyph Shell usability testing.
    """

    @staticmethod
    def get_tasks() -> list[TestTask]:
        """Get all predefined test tasks."""
        return [
            # Command Discovery Tasks
            TestTask(
                id="discover-spawn",
                name="Discover Spawn Command",
                description="Find the command to spawn a new terminal tile",
                instructions="You need to create a new terminal tile. Find and execute the command to do this.",
                difficulty=Difficulty.EASY,
                expected_time_seconds=15.0,
                success_criteria=["User opened command palette or help", "User executed 'g spawn'"],
                hints=["Try pressing Ctrl+P to see available commands", "The command palette shows all available commands"],
                category="command_discovery"
            ),
            TestTask(
                id="discover-map",
                name="Discover Map Navigation",
                description="Find how to pan the Infinite Map",
                instructions="You want to move the map view to coordinates (100, 200). Find and execute the command.",
                difficulty=Difficulty.EASY,
                expected_time_seconds=15.0,
                success_criteria=["User executed 'g map 100 200' or similar"],
                hints=["The command palette can help you find commands", "Commands starting with 'g' are Geometry OS specific"],
                category="command_discovery"
            ),

            # Keyboard Shortcut Tasks
            TestTask(
                id="use-shortcuts",
                name="Use Keyboard Shortcuts",
                description="Demonstrate keyboard shortcut usage",
                instructions="Clear the screen using a keyboard shortcut, then open the help overlay.",
                difficulty=Difficulty.TRIVIAL,
                expected_time_seconds=5.0,
                success_criteria=["User pressed Ctrl+L or equivalent", "User pressed ? or opened help"],
                hints=["Press ? to see all keyboard shortcuts", "Ctrl+L clears the screen"],
                category="keyboard_shortcuts"
            ),

            # Navigation Tasks
            TestTask(
                id="navigate-palette",
                name="Navigate Command Palette",
                description="Use the command palette to find and execute a command",
                instructions="Open the command palette, search for 'status', and execute it.",
                difficulty=Difficulty.EASY,
                expected_time_seconds=10.0,
                success_criteria=["User opened palette with Ctrl+P", "User searched for 'status'", "User executed status command"],
                hints=["Use arrow keys to navigate", "Press Enter to select"],
                category="navigation"
            ),

            # File Operations
            TestTask(
                id="spatial-ls",
                name="Spatial File Listing",
                description="Use spatial file listing command",
                instructions="List files in the current directory with spatial metadata using the appropriate command.",
                difficulty=Difficulty.MEDIUM,
                expected_time_seconds=20.0,
                success_criteria=["User executed 'g gls' or similar"],
                hints=["Geometry OS has a special version of 'ls'", "Try searching 'list' in the command palette"],
                category="file_operations"
            ),

            # AI Integration
            TestTask(
                id="ai-analysis",
                name="Request AI Analysis",
                description="Request AI analysis of current context",
                instructions="Use the AI command to analyze the current terminal state.",
                difficulty=Difficulty.MEDIUM,
                expected_time_seconds=20.0,
                success_criteria=["User executed 'g ai' with prompt"],
                hints=["The AI command is under Geometry OS commands", "Try 'g ai analyze' or similar"],
                category="ai_integration"
            ),

            # History Tasks
            TestTask(
                id="use-history",
                name="Use Command History",
                description="Access and reuse a previous command",
                instructions="Open the history panel and re-execute a previous command.",
                difficulty=Difficulty.EASY,
                expected_time_seconds=10.0,
                success_criteria=["User opened history with Ctrl+H", "User selected and executed a command"],
                hints=["Ctrl+H opens the history panel", "You can search through history"],
                category="navigation"
            ),

            # Error Recovery
            TestTask(
                id="error-recovery",
                name="Recover from Error",
                description="Handle an error gracefully",
                instructions="Execute 'g invalidcommand' and then find help to see correct commands.",
                difficulty=Difficulty.MEDIUM,
                expected_time_seconds=25.0,
                success_criteria=["User executed invalid command", "User opened help or palette to find correct command"],
                hints=["Error messages should guide you", "The help overlay shows available commands"],
                category="error_handling"
            ),

            # Complex Workflow
            TestTask(
                id="multi-step",
                name="Multi-Step Workflow",
                description="Complete a multi-step operation",
                instructions="Spawn a terminal, pan the map to (50, 50), then check the system status.",
                difficulty=Difficulty.HARD,
                expected_time_seconds=45.0,
                success_criteria=[
                    "User spawned terminal with 'g spawn'",
                    "User panned map with 'g map 50 50'",
                    "User checked status"
                ],
                hints=["Break it down into steps", "Use the command palette for each step"],
                category="workflow"
            ),
        ]


class UserTestingFramework:
    """
    Main framework for conducting user tests.
    """

    def __init__(self, data_dir: Path | None = None):
        self.data_dir = data_dir or Path(".geometry/user_testing")
        self.data_dir.mkdir(parents=True, exist_ok=True)

        self.tasks = UsabilityTestSuite.get_tasks()
        self.current_session: TestSession | None = None
        self.current_task: TestTask | None = None
        self.current_result: TaskResult | None = None

        # Event callbacks
        self.on_task_start: Callable | None = None
        self.on_task_complete: Callable | None = None
        self.on_feedback: Callable | None = None

    def start_session(self, user_id: str = "anonymous") -> TestSession:
        """Start a new testing session."""
        session_id = f"session_{int(time.time())}_{user_id}"

        self.current_session = TestSession(
            session_id=session_id,
            user_id=user_id,
            start_time=time.time(),
            system_info=self._get_system_info()
        )

        self._save_session()
        return self.current_session

    def end_session(self, satisfaction: int | None = None) -> TestSession:
        """End the current session."""
        if self.current_session:
            self.current_session.end_time = time.time()
            if satisfaction:
                self.current_session.overall_satisfaction = satisfaction
            self._save_session()
        return self.current_session

    def start_task(self, task_id: str) -> TaskResult:
        """Start a task by ID."""
        task = next((t for t in self.tasks if t.id == task_id), None)
        if not task:
            raise ValueError(f"Task not found: {task_id}")

        self.current_task = task
        self.current_result = TaskResult(
            task_id=task_id,
            status=TaskStatus.IN_PROGRESS,
            start_time=time.time()
        )

        if self.on_task_start:
            self.on_task_start(task, self.current_result)

        return self.current_result

    def complete_task(self, success: bool = True, notes: str = "") -> TaskResult:
        """Mark current task as complete."""
        if not self.current_result:
            raise RuntimeError("No task in progress")

        self.current_result.end_time = time.time()
        self.current_result.time_on_task = self.current_result.end_time - self.current_result.start_time
        self.current_result.status = TaskStatus.COMPLETED if success else TaskStatus.FAILED
        self.current_result.user_notes = notes

        if self.current_session:
            self.current_session.task_results.append(self.current_result)
            self._save_session()

        if self.on_task_complete:
            self.on_task_complete(self.current_task, self.current_result)

        return self.current_result

    def use_hint(self) -> str | None:
        """Get the next hint for the current task."""
        if not self.current_task or not self.current_result:
            return None

        hints = self.current_task.hints
        if self.current_result.hints_used < len(hints):
            hint = hints[self.current_result.hints_used]
            self.current_result.hints_used += 1
            return hint
        return None

    def record_error(self, error: str):
        """Record an error during task execution."""
        if self.current_result:
            self.current_result.errors.append(error)

    def record_criteria_met(self, criteria: str):
        """Record that a success criterion was met."""
        if self.current_result:
            if criteria not in self.current_result.success_criteria_met:
                self.current_result.success_criteria_met.append(criteria)

    def submit_feedback(self, category: str, severity: str, message: str,
                       task_id: str | None = None) -> UserFeedback:
        """Submit user feedback."""
        feedback = UserFeedback(
            timestamp=time.time(),
            task_id=task_id,
            category=category,
            severity=severity,
            message=message,
            user_id=self.current_session.user_id if self.current_session else "anonymous"
        )

        if self.current_session:
            self.current_session.feedback.append(feedback)
            self._save_session()

        if self.on_feedback:
            self.on_feedback(feedback)

        return feedback

    def get_task_by_id(self, task_id: str) -> TestTask | None:
        """Get a task by ID."""
        return next((t for t in self.tasks if t.id == task_id), None)

    def get_tasks_by_category(self, category: str) -> list[TestTask]:
        """Get all tasks in a category."""
        return [t for t in self.tasks if t.category == category]

    def _get_system_info(self) -> dict[str, Any]:
        """Get system information for the session."""
        import platform
        return {
            "platform": platform.platform(),
            "python_version": platform.python_version(),
            "timestamp": datetime.now().isoformat()
        }

    def _save_session(self):
        """Save the current session to disk."""
        if not self.current_session:
            return

        session_file = self.data_dir / f"{self.current_session.session_id}.json"
        with open(session_file, "w") as f:
            json.dump(asdict(self.current_session), f, indent=2, default=str)

    def load_session(self, session_id: str) -> TestSession:
        """Load a session by ID."""
        session_file = self.data_dir / f"{session_id}.json"
        with open(session_file) as f:
            data = json.load(f)
            # Reconstruct the session object
            return TestSession(**data)


class TestReporter:
    """
    Generates reports from test sessions.
    """

    def __init__(self, framework: UserTestingFramework):
        self.framework = framework

    def generate_report(self, sessions: list[TestSession] | None = None) -> dict[str, Any]:
        """Generate a comprehensive test report."""
        if sessions is None:
            sessions = self._load_all_sessions()

        if not sessions:
            return {"error": "No sessions found"}

        # Aggregate metrics
        total_tasks = 0
        completed_tasks = 0
        failed_tasks = 0
        total_time = 0.0
        times_by_task: dict[str, list[float]] = {}
        errors_by_type: dict[str, int] = {}
        feedback_by_category: dict[str, int] = {}
        satisfaction_scores: list[int] = []

        for session in sessions:
            for result in session.task_results:
                total_tasks += 1

                # Handle both dataclass and dict results
                if hasattr(result, 'status'):
                    status = result.status
                    time_on_task = result.time_on_task
                    task_id = result.task_id
                    errors = result.errors or []
                else:
                    status = result.get("status")
                    time_on_task = result.get("time_on_task")
                    task_id = result.get("task_id")
                    errors = result.get("errors", [])

                if status == "completed" or status == TaskStatus.COMPLETED:
                    completed_tasks += 1
                    if time_on_task:
                        total_time += time_on_task
                        if task_id not in times_by_task:
                            times_by_task[task_id] = []
                        times_by_task[task_id].append(time_on_task)
                elif status == "failed" or status == TaskStatus.FAILED:
                    failed_tasks += 1

                for error in errors:
                    errors_by_type[error] = errors_by_type.get(error, 0) + 1

            for feedback in session.feedback:
                # Handle both dataclass and dict feedback
                if hasattr(feedback, 'category'):
                    cat = feedback.category
                else:
                    cat = feedback.get("category")
                feedback_by_category[cat] = feedback_by_category.get(cat, 0) + 1

            if session.overall_satisfaction:
                satisfaction_scores.append(session.overall_satisfaction)

        # Calculate task-specific metrics
        task_metrics = {}
        for task in self.framework.tasks:
            times = times_by_task.get(task.id, [])
            if times:
                # Count total attempts for this task
                total_attempts = sum(
                    1 for s in sessions for r in s.task_results
                    if (r.task_id if hasattr(r, 'task_id') else r.get("task_id")) == task.id
                )
                task_metrics[task.id] = {
                    "name": task.name,
                    "expected_time": task.expected_time_seconds,
                    "avg_time": statistics.mean(times),
                    "median_time": statistics.median(times),
                    "min_time": min(times),
                    "max_time": max(times),
                    "completion_count": len(times),
                    "within_expected": sum(1 for t in times if t <= task.expected_time_seconds),
                    "success_rate": len(times) / max(1, total_attempts)
                }

        report = {
            "summary": {
                "total_sessions": len(sessions),
                "total_tasks": total_tasks,
                "completed_tasks": completed_tasks,
                "failed_tasks": failed_tasks,
                "success_rate": completed_tasks / max(1, total_tasks),
                "average_session_time": total_time / max(1, len(sessions)),
                "average_satisfaction": statistics.mean(satisfaction_scores) if satisfaction_scores else None
            },
            "task_metrics": task_metrics,
            "errors": errors_by_type,
            "feedback_summary": feedback_by_category,
            "recommendations": self._generate_recommendations(task_metrics, errors_by_type),
            "generated_at": datetime.now().isoformat()
        }

        return report

    def _load_all_sessions(self) -> list[TestSession]:
        """Load all sessions from disk."""
        sessions = []
        for session_file in self.framework.data_dir.glob("session_*.json"):
            try:
                with open(session_file) as f:
                    data = json.load(f)
                    sessions.append(TestSession(**data))
            except Exception as e:
                print(f"Warning: Failed to load {session_file}: {e}")
        return sessions

    def _generate_recommendations(self, task_metrics: dict, errors: dict) -> list[str]:
        """Generate improvement recommendations."""
        recommendations = []

        for task_id, metrics in task_metrics.items():
            if metrics["avg_time"] > metrics["expected_time"] * 1.5:
                recommendations.append(
                    f"Task '{metrics['name']}' takes {metrics['avg_time']:.1f}s on average, "
                    f"which is {metrics['avg_time']/metrics['expected_time']:.1f}x the expected time. "
                    f"Consider improving discoverability or adding more hints."
                )

            if metrics["success_rate"] < 0.8:
                recommendations.append(
                    f"Task '{metrics['name']}' has a low success rate ({metrics['success_rate']*100:.0f}%). "
                    f"Review task instructions and consider simplifying."
                )

        for error, count in sorted(errors.items(), key=lambda x: -x[1])[:5]:
            recommendations.append(
                f"Common error: '{error}' occurred {count} times. "
                f"Consider improving error handling or user guidance."
            )

        return recommendations

    def format_report(self, report: dict[str, Any]) -> str:
        """Format report as human-readable text."""
        lines = []

        lines.append("=" * 60)
        lines.append("         USER TESTING REPORT - Enhanced Glyph Shell")
        lines.append("=" * 60)
        lines.append("")

        # Summary
        summary = report["summary"]
        lines.append("SUMMARY")
        lines.append("-" * 40)
        lines.append(f"  Sessions:           {summary['total_sessions']}")
        lines.append(f"  Total Tasks:        {summary['total_tasks']}")
        lines.append(f"  Completed:          {summary['completed_tasks']}")
        lines.append(f"  Failed:             {summary['failed_tasks']}")
        lines.append(f"  Success Rate:       {summary['success_rate']*100:.1f}%")
        lines.append(f"  Avg Session Time:   {summary['average_session_time']:.1f}s")
        if summary['average_satisfaction']:
            lines.append(f"  Satisfaction:       {summary['average_satisfaction']:.1f}/5")
        lines.append("")

        # Task Metrics
        lines.append("TASK METRICS")
        lines.append("-" * 40)
        for task_id, metrics in report["task_metrics"].items():
            lines.append(f"\n  {metrics['name']}")
            lines.append(f"    Expected: {metrics['expected_time']:.0f}s")
            lines.append(f"    Average:  {metrics['avg_time']:.1f}s")
            lines.append(f"    Success:  {metrics['success_rate']*100:.0f}%")
            within = metrics['within_expected']
            total = metrics['completion_count']
            lines.append(f"    Within Expected: {within}/{total} ({within/max(1,total)*100:.0f}%)")
        lines.append("")

        # Recommendations
        if report["recommendations"]:
            lines.append("RECOMMENDATIONS")
            lines.append("-" * 40)
            for i, rec in enumerate(report["recommendations"], 1):
                lines.append(f"  {i}. {rec}")
            lines.append("")

        lines.append(f"Generated: {report['generated_at']}")
        lines.append("=" * 60)

        return "\n".join(lines)


def run_automated_test():
    """Run an automated test simulation."""
    print("Running automated usability test simulation...")
    print()

    framework = UserTestingFramework()

    # Simulate multiple user sessions
    for user_num in range(3):
        user_id = f"test_user_{user_num + 1}"
        print(f"Simulating session for {user_id}...")

        session = framework.start_session(user_id)

        for task in framework.tasks[:5]:  # Test first 5 tasks
            print(f"  Task: {task.name}")
            result = framework.start_task(task.id)

            # Simulate task completion with varying success
            import random
            time_spent = task.expected_time_seconds * random.uniform(0.5, 1.8)
            time.sleep(0.1)  # Simulate brief delay

            success = random.random() > 0.2  # 80% success rate

            # Record some criteria
            for criteria in task.success_criteria[:random.randint(1, len(task.success_criteria))]:
                result.success_criteria_met.append(criteria)

            result = framework.complete_task(success)
            print(f"    {'✓' if success else '✗'} {result.time_on_task:.1f}s")

        # Add some feedback
        framework.submit_feedback(
            category="suggestion",
            severity="low",
            message="The command palette is very helpful!",
            task_id="navigate-palette"
        )

        framework.end_session(satisfaction=random.randint(3, 5))
        print()

    # Generate report
    reporter = TestReporter(framework)
    report = reporter.generate_report()
    print(reporter.format_report(report))

    # Save report
    report_file = framework.data_dir / f"report_{int(time.time())}.json"
    with open(report_file, "w") as f:
        json.dump(report, f, indent=2)
    print(f"\nReport saved to: {report_file}")


def main():
    """Main entry point."""
    parser = argparse.ArgumentParser(description="User Testing Framework")
    parser.add_argument("--auto-test", action="store_true", help="Run automated test simulation")
    parser.add_argument("--report", action="store_true", help="Generate report from existing sessions")
    parser.add_argument("--list-tasks", action="store_true", help="List all test tasks")

    args = parser.parse_args()

    if args.list_tasks:
        print("Available Test Tasks:")
        print("=" * 60)
        for task in UsabilityTestSuite.get_tasks():
            print(f"\n{task.id}: {task.name}")
            print(f"  Difficulty: {task.difficulty.value}")
            print(f"  Expected Time: {task.expected_time_seconds}s")
            print(f"  Category: {task.category}")
            print(f"  Description: {task.description}")
        return

    if args.auto_test:
        run_automated_test()
        return

    if args.report:
        framework = UserTestingFramework()
        reporter = TestReporter(framework)
        report = reporter.generate_report()
        print(reporter.format_report(report))
        return

    # Default: print usage
    parser.print_help()


if __name__ == "__main__":
    main()
