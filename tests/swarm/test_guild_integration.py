"""
Integration tests for guild agents with TaskBoard and NEBBus.

Tests the full workflow: post task -> agent claims -> completes -> NEB event published.
"""

import pytest
import tempfile
import uuid

from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.neb_bus import NEBBus
from systems.swarm.guilds.engineer import EngineerAgent
from systems.swarm.guilds.reviewer import ReviewerAgent
from systems.swarm.guilds.architect import ArchitectAgent
from systems.swarm.guilds.factory import GuildFactory


class TestFullIntegration:
    """Integration tests for full workflow with TaskBoard and NEBBus."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board with event bus."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    @pytest.fixture
    def event_bus(self):
        """Create an event bus."""
        return NEBBus(node_id="test-node")

    def test_engineer_full_workflow(self, task_board, event_bus):
        """Test full workflow: post CODE_GENERATION -> claim -> complete -> NEB event."""
        # Create agent
        engineer = EngineerAgent("engineer-001", task_board, event_bus=event_bus)

        # Post task
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Generate hello world function",
            payload={"language": "python"}
        )
        task_board.post(task)

        # Run work cycle
        completed = engineer.work_cycle()

        # Verify task completed
        assert completed is not None
        assert completed.task_id == task.task_id

        # Check task state
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "code" in stored_task.result
        assert stored_task.result["language"] == "python"

        # Check NEB event was published
        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert signals[0].topic == "guild.engineer.code_generation"
        assert "summary" in signals[0].payload

    def test_reviewer_full_workflow(self, task_board, event_bus):
        """Test full workflow: post CODE_REVIEW -> claim -> complete -> NEB event."""
        # Create agent
        reviewer = ReviewerAgent("reviewer-001", task_board, event_bus=event_bus)

        # Post task
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Review code",
            payload={"code": "x = 1\n# TODO: fix"}
        )
        task_board.post(task)

        # Run work cycle
        completed = reviewer.work_cycle()

        # Verify task completed
        assert completed is not None
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "issues" in stored_task.result

        # Check NEB event was published
        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert signals[0].topic == "guild.reviewer.code_review"

    def test_architect_full_workflow(self, task_board, event_bus):
        """Test full workflow: post ARCHITECTURE_DESIGN -> claim -> complete -> NEB event."""
        # Create agent
        architect = ArchitectAgent("architect-001", task_board, event_bus=event_bus)

        # Post task
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.ARCHITECTURE_DESIGN,
            description="Design API with database",
            payload={"requirements": ["api", "database"]}
        )
        task_board.post(task)

        # Run work cycle
        completed = architect.work_cycle()

        # Verify task completed
        assert completed is not None
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "components" in stored_task.result

        # Check NEB event was published
        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert signals[0].topic == "guild.architect.architecture_design"

    def test_multiple_agents_same_board(self, task_board, event_bus):
        """Test multiple agents working from the same task board."""
        # Create agents
        engineer = EngineerAgent("engineer-001", task_board, event_bus=event_bus)
        reviewer = ReviewerAgent("reviewer-001", task_board, event_bus=event_bus)

        # Post multiple tasks
        code_task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Generate code"
        )
        review_task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Review code",
            payload={"code": "x = 1"}
        )
        task_board.post(code_task)
        task_board.post(review_task)

        # Engineer should claim and complete code task
        completed1 = engineer.work_cycle()
        assert completed1 is not None
        assert completed1.task_type == TaskType.CODE_GENERATION

        # Reviewer should claim and complete review task
        completed2 = reviewer.work_cycle()
        assert completed2 is not None
        assert completed2.task_type == TaskType.CODE_REVIEW

        # Both tasks should be completed
        all_tasks = task_board.list_all()
        completed_tasks = [t for t in all_tasks if t.status.value == "COMPLETED"]
        assert len(completed_tasks) == 2

        # Two NEB events should be published
        signals = event_bus.get_recent_signals()
        assert len(signals) == 2

    def test_agent_only_claims_own_task_types(self, task_board):
        """Test that agents only claim tasks they can handle."""
        # Create engineer (can only handle CODE_GENERATION and CODE_TESTING)
        engineer = EngineerAgent("engineer-001", task_board)

        # Post a task engineer cannot handle
        review_task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_REVIEW,
            description="Review code"
        )
        task_board.post(review_task)

        # Engineer work cycle should return None (no claimable tasks)
        result = engineer.work_cycle()
        assert result is None

        # Task should still be pending
        stored_task = task_board.get(review_task.task_id)
        assert stored_task.status.value == "PENDING"


class TestGuildFactoryIntegration:
    """Integration tests for GuildFactory with TaskBoard and NEBBus."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    @pytest.fixture
    def event_bus(self):
        """Create an event bus."""
        return NEBBus(node_id="test-node")

    def test_factory_creates_working_engineer(self, task_board, event_bus):
        """Test that GuildFactory creates a working EngineerAgent."""
        agent = GuildFactory.create("engineer", "eng-001", task_board, event_bus=event_bus)

        assert agent is not None
        assert agent.role == "engineer"

        # Post task and verify agent works
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Test"
        )
        task_board.post(task)

        completed = agent.work_cycle()
        assert completed is not None
        assert "code" in task_board.get(task.task_id).result

    def test_factory_registers_new_roles(self, task_board):
        """Test that GuildFactory can register new agent roles."""
        from systems.swarm.guilds.base import GuildAgent
        from typing import Dict, Any

        class CustomAgent(GuildAgent):
            def __init__(self, agent_id, task_board, event_bus=None, auto_claim=False):
                super().__init__(agent_id, task_board, "custom", event_bus, auto_claim=auto_claim)

            def _summarize(self, result: Dict[str, Any]) -> str:
                return "Custom result"

        # Register custom agent
        GuildFactory.register_role("custom", CustomAgent)

        # Verify it can be created
        agent = GuildFactory.create("custom", "custom-001", task_board)
        assert agent is not None
        assert agent.role == "custom"
        assert "custom" in GuildFactory.available_roles()

    def test_factory_returns_none_for_unknown_role(self, task_board):
        """Test that GuildFactory returns None for unknown roles."""
        agent = GuildFactory.create("unknown_role", "agent-001", task_board)
        assert agent is None


class TestNEBEventFlow:
    """Tests for NEB event flow in guild operations."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    @pytest.fixture
    def event_bus(self):
        """Create an event bus."""
        return NEBBus(node_id="test-node")

    def test_event_contains_summary(self, task_board, event_bus):
        """Test that published events contain summary information."""
        engineer = EngineerAgent("engineer-001", task_board, event_bus=event_bus)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Test"
        )
        task_board.post(task)
        engineer.work_cycle()

        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert "summary" in signals[0].payload
        assert "lines" in signals[0].payload["summary"]

    def test_event_contains_task_id(self, task_board, event_bus):
        """Test that published events contain task ID."""
        engineer = EngineerAgent("engineer-001", task_board, event_bus=event_bus)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Test"
        )
        task_board.post(task)
        engineer.work_cycle()

        signals = event_bus.get_recent_signals()
        assert signals[0].payload["task_id"] == task.task_id

    def test_event_contains_result(self, task_board, event_bus):
        """Test that published events contain the full result."""
        engineer = EngineerAgent("engineer-001", task_board, event_bus=event_bus)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.CODE_GENERATION,
            description="Test"
        )
        task_board.post(task)
        engineer.work_cycle()

        signals = event_bus.get_recent_signals()
        assert "result" in signals[0].payload
        assert "code" in signals[0].payload["result"]
