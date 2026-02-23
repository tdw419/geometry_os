"""
Unit tests for EngineerAgent.
"""

import pytest
import tempfile
import uuid

from systems.swarm.guilds.engineer import EngineerAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.neb_bus import NEBBus


class TestEngineerAgent:
    """Tests for EngineerAgent functionality."""

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
    def engineer(self, task_board, event_bus):
        """Create an EngineerAgent."""
        return EngineerAgent("engineer-001", task_board, event_bus=event_bus)

    def test_role_is_engineer(self, engineer):
        """Test that role is set to 'engineer'."""
        assert engineer.role == "engineer"

    def test_capabilities_include_code_generation(self, engineer):
        """Test that CODE_GENERATION is in capabilities."""
        assert TaskType.CODE_GENERATION.value in engineer.capabilities

    def test_capabilities_include_code_testing(self, engineer):
        """Test that CODE_TESTING is in capabilities."""
        assert TaskType.CODE_TESTING.value in engineer.capabilities

    def test_handle_code_generation_returns_code(self, engineer):
        """Test that _handle_code_generation returns code structure."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Generate a hello world function",
            payload={"language": "python"}
        )

        result = engineer._handle_code_generation(task)

        assert "code" in result
        assert "language" in result
        assert result["language"] == "python"
        assert "generated_by" in result

    def test_handle_code_generation_default_language(self, engineer):
        """Test that _handle_code_generation defaults to python."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Generate code",
            payload={}
        )

        result = engineer._handle_code_generation(task)

        assert result["language"] == "python"

    def test_handle_code_testing_returns_tests(self, engineer):
        """Test that _handle_code_testing returns test structure."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_TESTING,
            description="Write tests",
            payload={"code": "def hello(): pass"}
        )

        result = engineer._handle_code_testing(task)

        assert "tests" in result
        assert isinstance(result["tests"], list)
        assert len(result["tests"]) > 0
        assert "name" in result["tests"][0]
        assert "code" in result["tests"][0]

    def test_summarize_code_result(self, engineer):
        """Test _summarize with code result."""
        result = {"code": "line1\nline2\nline3", "language": "python"}
        summary = engineer._summarize(result)
        assert "3 lines" in summary
        assert "python" in summary

    def test_summarize_tests_result(self, engineer):
        """Test _summarize with tests result."""
        result = {"tests": [{"name": "test1"}, {"name": "test2"}]}
        summary = engineer._summarize(result)
        assert "2 test" in summary

    def test_summarize_error_result(self, engineer):
        """Test _summarize with error result."""
        result = {"error": "Something went wrong"}
        summary = engineer._summarize(result)
        assert "Error" in summary
        assert "Something went wrong" in summary

    def test_complete_task_publishes_event(self, engineer, task_board, event_bus):
        """Test that complete_task publishes event to NEB via work cycle."""
        # Post task to board
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Test"
        )
        task_board.post(task)

        # Run work cycle which will claim, execute, and complete
        completed = engineer.work_cycle()

        assert completed is not None
        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert "guild.engineer" in signals[0].topic


class TestEngineerAgentWorkCycle:
    """Tests for EngineerAgent work cycle."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    def test_work_cycle_claims_and_completes_code_generation(self, task_board):
        """Test full work cycle for CODE_GENERATION task."""
        engineer = EngineerAgent("engineer-001", task_board)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Generate hello world"
        )
        task_board.post(task)

        completed = engineer.work_cycle()

        assert completed is not None
        assert completed.task_id == task.task_id

        # Verify task is completed
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "code" in stored_task.result

    def test_work_cycle_claims_and_completes_code_testing(self, task_board):
        """Test full work cycle for CODE_TESTING task."""
        engineer = EngineerAgent("engineer-001", task_board)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_TESTING,
            description="Write tests",
            payload={"code": "def foo(): pass"}
        )
        task_board.post(task)

        completed = engineer.work_cycle()

        assert completed is not None
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "tests" in stored_task.result
