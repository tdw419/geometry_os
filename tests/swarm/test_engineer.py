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

    def test_handle_code_testing_returns_result(self, engineer):
        """Test that _handle_code_testing returns test result structure."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_TESTING,
            description="Write tests",
            payload={"code": "def hello(): pass"}
        )

        result = engineer._handle_code_testing(task)

        # Without executor, should return error
        assert "passed" in result
        assert result["passed"] is False
        assert "error" in result

    def test_summarize_code_result(self, engineer):
        """Test _summarize with code result."""
        result = {"code": "line1\nline2\nline3", "language": "python", "success": True}
        summary = engineer._summarize(result)
        assert "3 lines" in summary
        assert "python" in summary

    def test_summarize_passed_tests(self, engineer):
        """Test _summarize with passed tests result."""
        result = {"passed": True, "success": True}
        summary = engineer._summarize(result)
        assert "passed" in summary.lower()

    def test_summarize_failed_tests(self, engineer):
        """Test _summarize with failed tests result."""
        result = {"passed": False, "success": True}
        summary = engineer._summarize(result)
        assert "failed" in summary.lower()

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
        assert "passed" in stored_task.result


class TestEngineerAgentWithIntegrations:
    """Test EngineerAgent with real integrations."""

    @pytest.fixture
    def mock_provider(self):
        """Create mock LLM provider."""
        from systems.swarm.guilds.providers.mock import MockProvider
        return MockProvider(response="def add(a, b): return a + b")

    @pytest.fixture
    def executor(self):
        """Create sandbox executor."""
        from systems.swarm.guilds.executor import SandboxExecutor
        return SandboxExecutor(timeout_seconds=5)

    @pytest.fixture
    def engineer_with_integrations(self, tmp_path, mock_provider, executor):
        """Create EngineerAgent with integrations."""
        from systems.swarm.guilds.engineer import EngineerAgent
        from systems.swarm.task_board import TaskBoard
        from systems.swarm.neb_bus import NEBBus

        task_board = TaskBoard(str(tmp_path / "tasks"))
        event_bus = NEBBus(node_id="test")

        return EngineerAgent(
            agent_id="test-engineer",
            task_board=task_board,
            event_bus=event_bus,
            llm_provider=mock_provider,
            executor=executor
        )

    @pytest.mark.asyncio
    async def test_write_code_uses_llm_provider(self, engineer_with_integrations, tmp_path):
        """write_code should use injected LLM provider."""
        from systems.swarm.task import Task, TaskType
        from systems.swarm.task_board import TaskBoard

        task_board = TaskBoard(str(tmp_path / "tasks"))
        task = Task(
            task_id="test-1",
            task_type=TaskType.CODE_GENERATION,
            description="Add two numbers",
            payload={"spec": "Add two numbers", "language": "python"}
        )
        task_board.post(task)
        task_board.claim(task.task_id, "test-engineer")

        result = await engineer_with_integrations.write_code(task)

        assert result["success"] is True
        assert "def add" in result["code"]

    def test_test_code_uses_executor(self, engineer_with_integrations):
        """test_code should use injected executor."""
        from systems.swarm.task import Task, TaskType

        task = Task(
            task_id="test-2",
            task_type=TaskType.CODE_TESTING,
            description="Test add function",
            payload={
                "code": "def add(a, b): return a + b",
                "tests": "assert add(1, 2) == 3"
            }
        )

        result = engineer_with_integrations.test_code(task)

        assert result["passed"] is True
