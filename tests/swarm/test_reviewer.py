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

    def test_handle_code_review_returns_issues(self, reviewer):
        """Test that _handle_code_review returns review structure."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Review this code",
            payload={"code": "x = 1\ny = 2"}
        )

        result = reviewer._handle_code_review(task)

        assert "issues" in result
        assert "severity" in result
        assert "lines_reviewed" in result
        assert "reviewed_by" in result
        assert "recommendations" in result

    def test_handle_code_review_detects_todo(self, reviewer):
        """Test that code review detects TODO comments."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Review",
            payload={"code": "# TODO: fix this\nx = 1"}
        )

        result = reviewer._handle_code_review(task)

        todo_issues = [i for i in result["issues"] if i["type"] == "todo"]
        assert len(todo_issues) == 1

    def test_handle_security_scan_returns_vulnerabilities(self, reviewer):
        """Test that _handle_security_scan returns scan structure."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SECURITY_SCAN,
            description="Scan for vulnerabilities",
            payload={"code": "x = 1"}
        )

        result = reviewer._handle_security_scan(task)

        assert "vulnerabilities" in result
        assert "risk_level" in result
        assert "scanned_by" in result
        assert "recommendations" in result

    def test_handle_security_scan_detects_eval(self, reviewer):
        """Test that security scan detects eval()."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SECURITY_SCAN,
            description="Scan",
            payload={"code": "result = eval(user_input)"}
        )

        result = reviewer._handle_security_scan(task)

        eval_vulns = [v for v in result["vulnerabilities"] if v["type"] == "code_injection"]
        assert len(eval_vulns) == 1
        assert result["risk_level"] == "high"

    def test_handle_security_scan_detects_hardcoded_password(self, reviewer):
        """Test that security scan detects hardcoded passwords."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SECURITY_SCAN,
            description="Scan",
            payload={"code": 'password = "secret123"'}
        )

        result = reviewer._handle_security_scan(task)

        secret_vulns = [v for v in result["vulnerabilities"] if v["type"] == "hardcoded_secret"]
        assert len(secret_vulns) == 1

    def test_summarize_issues_result(self, reviewer):
        """Test _summarize with issues result."""
        result = {"issues": [{"type": "todo"}], "severity": "medium"}
        summary = reviewer._summarize(result)
        assert "1 issues" in summary
        assert "medium" in summary

    def test_summarize_vulnerabilities_result(self, reviewer):
        """Test _summarize with vulnerabilities result."""
        result = {"vulnerabilities": [{"type": "xss"}, {"type": "sql"}], "risk_level": "high"}
        summary = reviewer._summarize(result)
        assert "2 vulnerabilities" in summary
        assert "high" in summary

    def test_complete_task_publishes_event(self, reviewer, task_board, event_bus):
        """Test that complete_task publishes event to NEB via work cycle."""
        # Post task to board
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Test",
            payload={"code": "x = 1"}
        )
        task_board.post(task)

        # Run work cycle which will claim, execute, and complete
        completed = reviewer.work_cycle()

        assert completed is not None
        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert "guild.reviewer" in signals[0].topic


class TestReviewerAgentWorkCycle:
    """Tests for ReviewerAgent work cycle."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    def test_work_cycle_claims_and_completes_code_review(self, task_board):
        """Test full work cycle for CODE_REVIEW task."""
        reviewer = ReviewerAgent("reviewer-001", task_board)

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
        assert "issues" in stored_task.result

    def test_work_cycle_claims_and_completes_security_scan(self, task_board):
        """Test full work cycle for SECURITY_SCAN task."""
        reviewer = ReviewerAgent("reviewer-001", task_board)

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
