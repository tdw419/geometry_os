"""
Unit tests for ReviewerAgent.
"""

import pytest
import tempfile
import uuid

from systems.swarm.guilds.reviewer import ReviewerAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.neb_bus import NEBBus


class TestReviewerAgent:
    """Tests for ReviewerAgent functionality."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    @pytest.fixture
    def event_bus(self):
        """Create an event bus."""
        return NEBBus(node_id="test-node")

    @pytest.fixture
    def reviewer(self, task_board, event_bus):
        """Create a ReviewerAgent."""
        return ReviewerAgent("reviewer-001", task_board, event_bus=event_bus)

    def test_role_is_reviewer(self, reviewer):
        """Test that role is set to 'reviewer'."""
        assert reviewer.role == "reviewer"

    def test_capabilities_include_code_review(self, reviewer):
        """Test that CODE_REVIEW is in capabilities."""
        assert TaskType.CODE_REVIEW.value in reviewer.capabilities

    def test_capabilities_include_security_scan(self, reviewer):
        """Test that SECURITY_SCAN is in capabilities."""
        assert TaskType.SECURITY_SCAN.value in reviewer.capabilities

    def test_review_code_without_integrations(self, reviewer):
        """Test that review_code works without scanner/checker."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Review this code",
            payload={"code": "x = 1\ny = 2"}
        )

        result = reviewer.review_code(task)

        assert "score" in result
        assert "style_violations" in result
        assert "security_findings" in result
        assert "passed" in result
        # Without integrations, should pass with 100
        assert result["score"] == 100

    def test_security_scan_without_scanner(self, reviewer):
        """Test that security_scan works without scanner."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SECURITY_SCAN,
            description="Scan for vulnerabilities",
            payload={"code": "x = 1"}
        )

        result = reviewer.security_scan(task)

        assert "vulnerabilities" in result
        assert "severity" in result
        assert "secure" in result
        assert result["secure"] is True

    def test_summarize_score_result(self, reviewer):
        """Test _summarize with score result."""
        result = {"score": 85, "passed": True}
        summary = reviewer._summarize(result)
        assert "85" in summary
        assert "100" in summary

    def test_summarize_security_result(self, reviewer):
        """Test _summarize with security result."""
        result = {"severity": "high", "secure": False}
        summary = reviewer._summarize(result)
        assert "high" in summary

    def test_work_cycle_claims_and_completes_code_review(self, task_board):
        """Test full work cycle for CODE_REVIEW task."""
        reviewer = ReviewerAgent("reviewer-001", task_board, None)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Review code",
            payload={"code": "x = 1"}
        )
        task_board.post(task)

        completed = reviewer.work_cycle()

        assert completed is not None
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "score" in stored_task.result

    def test_work_cycle_claims_and_completes_security_scan(self, task_board):
        """Test full work cycle for SECURITY_SCAN task."""
        reviewer = ReviewerAgent("reviewer-001", task_board, None)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SECURITY_SCAN,
            description="Scan for vulnerabilities",
            payload={"code": "eval(x)"}
        )
        task_board.post(task)

        completed = reviewer.work_cycle()

        assert completed is not None
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "vulnerabilities" in stored_task.result


class TestReviewerAgentWithIntegrations:
    """Test ReviewerAgent with real integrations."""

    @pytest.fixture
    def reviewer_with_integrations(self, tmp_path):
        """Create ReviewerAgent with integrations."""
        from systems.swarm.guilds.reviewer import ReviewerAgent
        from systems.swarm.guilds.scanners.bandit import BanditScanner
        from systems.swarm.guilds.linters.ruff import RuffChecker
        from systems.swarm.task_board import TaskBoard
        from systems.swarm.neb_bus import NEBBus

        task_board = TaskBoard(str(tmp_path / "tasks"))
        event_bus = NEBBus(node_id="test")
        scanner = BanditScanner()
        checker = RuffChecker()

        return ReviewerAgent(
            agent_id="test-reviewer",
            task_board=task_board,
            event_bus=event_bus,
            scanner=scanner,
            checker=checker
        )

    def test_review_code_uses_scanner(self, reviewer_with_integrations):
        """review_code should use injected scanner."""
        from systems.swarm.task import Task, TaskType

        task = Task(
            task_id="test-review-1",
            task_type=TaskType.CODE_REVIEW,
            description="Review code for security issues",
            payload={"code": "eval('1+1')"}
        )

        result = reviewer_with_integrations.review_code(task)

        assert result["score"] < 100
        assert len(result["security_findings"]) > 0

    def test_review_code_uses_checker(self, reviewer_with_integrations):
        """review_code should use injected style checker."""
        from systems.swarm.task import Task, TaskType

        task = Task(
            task_id="test-review-2",
            task_type=TaskType.CODE_REVIEW,
            description="Review code for style issues",
            payload={"code": "import os\nimport sys\nx=1"}
        )

        result = reviewer_with_integrations.review_code(task)

        assert len(result["style_violations"]) > 0
