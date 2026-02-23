"""
Unit tests for ArchitectAgent.
"""

import pytest
import tempfile
import uuid

from systems.swarm.guilds.architect import ArchitectAgent
from systems.swarm.task import Task, TaskType
from systems.swarm.task_board import TaskBoard
from systems.swarm.neb_bus import NEBBus


class TestArchitectAgent:
    """Tests for ArchitectAgent functionality."""

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
    def architect(self, task_board, event_bus):
        """Create an ArchitectAgent."""
        return ArchitectAgent("architect-001", task_board, event_bus=event_bus)

    def test_role_is_architect(self, architect):
        """Test that role is set to 'architect'."""
        assert architect.role == "architect"

    def test_capabilities_include_architecture_design(self, architect):
        """Test that ARCHITECTURE_DESIGN is in capabilities."""
        assert TaskType.ARCHITECTURE_DESIGN.value in architect.capabilities

    def test_capabilities_include_system_planning(self, architect):
        """Test that SYSTEM_PLANNING is in capabilities."""
        assert TaskType.SYSTEM_PLANNING.value in architect.capabilities

    def test_handle_architecture_design_returns_components(self, architect):
        """Test that _handle_architecture_design returns component structure."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.ARCHITECTURE_DESIGN,
            description="Design a system",
            payload={"requirements": ["api", "database"]}
        )

        result = architect._handle_architecture_design(task)

        assert "components" in result
        assert "architecture_style" in result
        assert "designed_by" in result
        assert "recommendations" in result

    def test_handle_architecture_design_detects_api(self, architect):
        """Test that architecture design creates APIGateway for api keyword."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.ARCHITECTURE_DESIGN,
            description="Design an API service",
            payload={}
        )

        result = architect._handle_architecture_design(task)

        api_components = [c for c in result["components"] if c["name"] == "APIGateway"]
        assert len(api_components) == 1

    def test_handle_architecture_design_detects_auth(self, architect):
        """Test that architecture design creates AuthService for auth keyword."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.ARCHITECTURE_DESIGN,
            description="Design user authentication system",
            payload={}
        )

        result = architect._handle_architecture_design(task)

        auth_components = [c for c in result["components"] if c["name"] == "AuthService"]
        assert len(auth_components) == 1

    def test_handle_architecture_design_default_component(self, architect):
        """Test that architecture design creates default component if no keywords."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.ARCHITECTURE_DESIGN,
            description="Design something",
            payload={}
        )

        result = architect._handle_architecture_design(task)

        assert len(result["components"]) == 1
        assert result["components"][0]["name"] == "CoreModule"

    def test_handle_system_planning_returns_phases(self, architect):
        """Test that _handle_system_planning returns plan structure."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SYSTEM_PLANNING,
            description="Create implementation plan",
            payload={"timeline_weeks": 8}
        )

        result = architect._handle_system_planning(task)

        assert "phases" in result
        assert "total_duration_weeks" in result
        assert "team_size_recommendation" in result
        assert "milestones" in result
        assert "planned_by" in result

    def test_handle_system_planning_respects_timeline(self, architect):
        """Test that system planning respects timeline parameter."""
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SYSTEM_PLANNING,
            description="Plan",
            payload={"timeline_weeks": 12}
        )

        result = architect._handle_system_planning(task)

        assert result["total_duration_weeks"] == 12
        # Sum of phase durations should be close to timeline
        total_phase_weeks = sum(p["duration_weeks"] for p in result["phases"])
        assert total_phase_weeks <= 12

    def test_summarize_components_result(self, architect):
        """Test _summarize with components result."""
        result = {"components": [{"name": "A"}, {"name": "B"}, {"name": "C"}]}
        summary = architect._summarize(result)
        assert "3 components" in summary

    def test_summarize_phases_result(self, architect):
        """Test _summarize with phases result."""
        result = {"phases": [{"name": "Phase 1"}, {"name": "Phase 2"}]}
        summary = architect._summarize(result)
        assert "2-phase" in summary

    def test_complete_task_publishes_event(self, architect, task_board, event_bus):
        """Test that complete_task publishes event to NEB via work cycle."""
        # Post task to board
        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.ARCHITECTURE_DESIGN,
            description="Test"
        )
        task_board.post(task)

        # Run work cycle which will claim, execute, and complete
        completed = architect.work_cycle()

        assert completed is not None
        signals = event_bus.get_recent_signals()
        assert len(signals) == 1
        assert "guild.architect" in signals[0].topic


class TestArchitectAgentWorkCycle:
    """Tests for ArchitectAgent work cycle."""

    @pytest.fixture
    def task_board(self):
        """Create a temporary task board."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield TaskBoard(storage_path=tmpdir)

    def test_work_cycle_claims_and_completes_architecture_design(self, task_board):
        """Test full work cycle for ARCHITECTURE_DESIGN task."""
        architect = ArchitectAgent("architect-001", task_board)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.ARCHITECTURE_DESIGN,
            description="Design API system",
            payload={"requirements": ["api"]}
        )
        task_board.post(task)

        completed = architect.work_cycle()

        assert completed is not None
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "components" in stored_task.result

    def test_work_cycle_claims_and_completes_system_planning(self, task_board):
        """Test full work cycle for SYSTEM_PLANNING task."""
        architect = ArchitectAgent("architect-001", task_board)

        task = Task(
            task_id=str(uuid.uuid4()),
            task_type=TaskType.SYSTEM_PLANNING,
            description="Create plan",
            payload={"timeline_weeks": 6}
        )
        task_board.post(task)

        completed = architect.work_cycle()

        assert completed is not None
        stored_task = task_board.get(task.task_id)
        assert stored_task.status.value == "COMPLETED"
        assert "phases" in stored_task.result
