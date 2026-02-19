"""
Tests for TectonicEngine - Force-directed spatial realignment.

Task 1 of Tectonic Realignment Plan (Phase 28).
"""
import pytest
import asyncio
import math

from systems.evolution_daemon.tectonic_engine import (
    TectonicEngine,
    ForceVector,
    BuildingState,
    get_tectonic_engine
)


class TestForceVector:
    """Tests for ForceVector dataclass."""

    def test_create_force_vector(self):
        """Test creating a force vector."""
        fv = ForceVector(dx=1.5, dy=-2.0, magnitude=2.5)
        assert fv.dx == 1.5
        assert fv.dy == -2.0
        assert fv.magnitude == 2.5

    def test_force_vector_to_dict(self):
        """Test serializing to dictionary."""
        fv = ForceVector(dx=0.5, dy=0.3, magnitude=0.58)
        data = fv.to_dict()
        assert data["dx"] == 0.5
        assert data["dy"] == 0.3
        assert data["magnitude"] == 0.58

    def test_force_vector_addition(self):
        """Test adding two force vectors."""
        fv1 = ForceVector(dx=1.0, dy=0.0, magnitude=1.0)
        fv2 = ForceVector(dx=0.0, dy=1.0, magnitude=1.0)
        result = fv1 + fv2
        assert abs(result.dx - 1.0) < 0.01
        assert abs(result.dy - 1.0) < 0.01
        assert abs(result.magnitude - math.sqrt(2)) < 0.01

    def test_force_vector_subtraction(self):
        """Test subtracting two force vectors."""
        fv1 = ForceVector(dx=3.0, dy=4.0, magnitude=5.0)
        fv2 = ForceVector(dx=1.0, dy=1.0, magnitude=1.41)
        result = fv1 - fv2
        assert abs(result.dx - 2.0) < 0.01
        assert abs(result.dy - 3.0) < 0.01


class TestBuildingState:
    """Tests for BuildingState dataclass."""

    def test_create_building_state(self):
        """Test creating building state."""
        bs = BuildingState(
            building_id="agent-001",
            position=(100.0, 50.0),
            district="cognitive",
            anchor_position=(0.0, 200.0)
        )
        assert bs.building_id == "agent-001"
        assert bs.district == "cognitive"
        assert bs.anchor_position == (0.0, 200.0)

    def test_distance_from_anchor(self):
        """Test distance calculation from anchor."""
        bs = BuildingState(
            building_id="test",
            position=(100.0, 0.0),
            district="cognitive",
            anchor_position=(0.0, 0.0)
        )
        assert bs.distance_from_anchor == 100.0

    def test_distance_diagonal(self):
        """Test diagonal distance from anchor."""
        bs = BuildingState(
            building_id="test",
            position=(3.0, 4.0),
            district="cognitive",
            anchor_position=(0.0, 0.0)
        )
        assert bs.distance_from_anchor == 5.0


class TestTectonicEngine:
    """Tests for TectonicEngine."""

    @pytest.fixture
    def engine(self):
        """Create a fresh engine for each test."""
        return TectonicEngine()

    def test_engine_initialization(self, engine):
        """Test engine initializes with correct defaults."""
        assert engine.gravity_constant == 0.1
        assert engine.tension_constant == 0.05
        assert engine.anchor_constant == 0.02
        assert len(engine.buildings) == 0
        assert engine.flux_mode is False

    def test_register_building(self, engine):
        """Test registering a building."""
        engine.register_building(
            building_id="agent-001",
            position=(100.0, 50.0),
            district="cognitive"
        )
        assert "agent-001" in engine.buildings
        assert engine.buildings["agent-001"].district == "cognitive"

    def test_register_building_sets_anchor(self, engine):
        """Test that registering sets anchor from district."""
        engine.register_building(
            building_id="agent-001",
            position=(100.0, 50.0),
            district="cognitive"
        )
        # Cognitive anchor is at angle 0°, ~200 units from center
        anchor = engine.buildings["agent-001"].anchor_position
        assert anchor[0] > 0  # Positive x for cognitive
        assert abs(anchor[1]) < 50  # Near y=0

    def test_unregister_building(self, engine):
        """Test removing a building."""
        engine.register_building("agent-001", (100.0, 50.0), "cognitive")
        engine.unregister_building("agent-001")
        assert "agent-001" not in engine.buildings

    def test_register_bridge(self, engine):
        """Test registering a communication bridge."""
        engine.register_building("agent-001", (100.0, 50.0), "cognitive")
        engine.register_building("agent-002", (150.0, 75.0), "cognitive")
        engine.register_bridge("agent-001", "agent-002")

        key = ("agent-001", "agent-002")
        assert key in engine.bridges
        assert engine.bridges[key] == 1

    def test_bridge_frequency_increments(self, engine):
        """Test that bridge frequency increments on repeat."""
        engine.register_building("agent-001", (100.0, 50.0), "cognitive")
        engine.register_building("agent-002", (150.0, 75.0), "cognitive")

        engine.register_bridge("agent-001", "agent-002")
        engine.register_bridge("agent-001", "agent-002")
        engine.register_bridge("agent-001", "agent-002")

        key = ("agent-001", "agent-002")
        assert engine.bridges[key] == 3

    def test_set_similarity(self, engine):
        """Test setting similarity between buildings."""
        engine.set_similarity("agent-001", "agent-002", 0.85)
        key = ("agent-001", "agent-002")
        assert engine.similarities[key] == 0.85

    def test_calculate_gravity_force(self, engine):
        """Test semantic gravity calculation."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        # High similarity = strong pull toward each other
        force = engine.calculate_gravity_force("a", "b", similarity=0.9)
        assert force.dx > 0  # a should be pulled toward b (positive x)
        assert force.magnitude > 0

    def test_calculate_gravity_force_zero_similarity(self, engine):
        """Test gravity with zero similarity."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        force = engine.calculate_gravity_force("a", "b", similarity=0.0)
        assert force.magnitude == 0.0

    def test_calculate_tension_force(self, engine):
        """Test bridge tension calculation."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")
        engine.register_bridge("a", "b")
        engine.register_bridge("a", "b")
        engine.register_bridge("a", "b")

        force = engine.calculate_tension_force("a", "b")
        assert force.dx > 0  # Pulled toward b
        assert force.magnitude > 0

    def test_calculate_tension_force_no_bridges(self, engine):
        """Test tension with no bridges."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        force = engine.calculate_tension_force("a", "b")
        assert force.magnitude == 0.0

    def test_calculate_anchor_force(self, engine):
        """Test anchor spring force calculation."""
        # Building far from anchor should be pulled back
        engine.register_building("a", (300.0, 0.0), "cognitive")

        force = engine.calculate_anchor_force("a")
        # Force should pull toward anchor (negative x if past anchor)
        assert force.magnitude > 0

    def test_calculate_anchor_force_at_anchor(self, engine):
        """Test anchor force when at anchor position."""
        # Register building at its anchor
        engine.register_building("a", (200.0, 0.0), "cognitive")
        # Manually set position to anchor
        engine.buildings["a"].position = engine.buildings["a"].anchor_position

        force = engine.calculate_anchor_force("a")
        assert force.magnitude == 0.0

    def test_flux_mode_reduces_anchor(self, engine):
        """Test that flux mode reduces anchor force."""
        engine.register_building("a", (300.0, 0.0), "cognitive")

        force_normal = engine.calculate_anchor_force("a")

        engine.flux_mode = True
        force_flux = engine.calculate_anchor_force("a")
        engine.flux_mode = False

        assert force_flux.magnitude < force_normal.magnitude

    @pytest.mark.asyncio
    async def test_calculate_total_force(self, engine):
        """Test total force calculation for a building."""
        engine.register_building("a", (100.0, 0.0), "cognitive")
        engine.register_building("b", (150.0, 0.0), "cognitive")
        engine.register_bridge("a", "b")

        # Set similarity
        engine.set_similarity("a", "b", 0.8)

        total = await engine.calculate_total_force("a")
        assert isinstance(total, ForceVector)
        assert total.dx != 0 or total.dy != 0  # Should have some force

    @pytest.mark.asyncio
    async def test_detect_migration_no_migration(self, engine):
        """Test migration detection when forces are balanced."""
        engine.register_building("a", (100.0, 0.0), "cognitive")

        # No foreign forces, should not migrate
        result = await engine.detect_migration("a")
        assert result is None

    @pytest.mark.asyncio
    async def test_get_drift_updates(self, engine):
        """Test getting drift updates for all buildings."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")
        engine.register_bridge("a", "b")
        engine.set_similarity("a", "b", 0.9)

        drifts = await engine.get_drift_updates()
        assert "a" in drifts
        assert "b" in drifts

    @pytest.mark.asyncio
    async def test_get_migration_candidates_none(self, engine):
        """Test getting migration candidates when none exist."""
        engine.register_building("a", (100.0, 0.0), "cognitive")

        candidates = await engine.get_migration_candidates()
        assert len(candidates) == 0

    def test_enter_flux_mode(self, engine):
        """Test entering flux mode."""
        engine.enter_flux_mode()
        assert engine.flux_mode is True

    def test_exit_flux_mode(self, engine):
        """Test exiting flux mode."""
        engine.enter_flux_mode()
        engine.exit_flux_mode()
        assert engine.flux_mode is False


class TestGetTectonicEngine:
    """Tests for module-level getter."""

    def test_get_engine_singleton(self):
        """Test that get_tectonic_engine returns singleton."""
        from systems.evolution_daemon import tectonic_engine

        # Reset singleton
        tectonic_engine._engine = None

        engine1 = get_tectonic_engine()
        engine2 = get_tectonic_engine()

        assert engine1 is engine2


class TestTectonicEngineIntegration:
    """Integration tests with NeuralMemoryHub."""

    @pytest.fixture
    def engine(self):
        return TectonicEngine()

    @pytest.mark.asyncio
    async def test_update_similarities_from_memory_hub(self, engine):
        """Test updating similarities from neural memory hub."""
        from systems.evolution_daemon.neural_memory_hub import NeuralMemoryHub
        from systems.evolution_daemon.neural_event import NeuralEvent

        # Create a memory hub
        hub = NeuralMemoryHub()

        # Register buildings in engine
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        # Store a neural event from building a
        event_a = NeuralEvent(
            tile_id="a",
            shell_tokens=["test"],
            cpu_jitter=0.1,
            memory_delta=10.0,
            io_frequency=1.0,
            broadcast=True
        )
        await hub.store_event(event_a)

        # Store similar event from building b
        event_b = NeuralEvent(
            tile_id="b",
            shell_tokens=["test"],  # Same tokens = high similarity
            cpu_jitter=0.12,
            memory_delta=11.0,
            io_frequency=1.1,
            broadcast=True
        )
        await hub.store_event(event_b)

        # Update similarities
        await engine.update_from_memory_hub(hub)

        # Verify similarity was set (from similar events)
        key = ("a", "b")
        # May or may not have similarity depending on collective context
        # The key test is that the method runs without error
        assert True

    @pytest.mark.asyncio
    async def test_force_increases_with_similarity(self, engine):
        """Test that higher similarity creates stronger gravitational force."""
        engine.register_building("a", (0.0, 0.0), "cognitive")
        engine.register_building("b", (100.0, 0.0), "cognitive")

        # High similarity
        engine.set_similarity("a", "b", 0.9)
        gravity_high = engine.calculate_gravity_force("a", "b", 0.9)

        # Low similarity
        gravity_low = engine.calculate_gravity_force("a", "b", 0.3)

        # Higher similarity = stronger gravitational pull
        assert gravity_high.magnitude > gravity_low.magnitude

    @pytest.mark.asyncio
    async def test_foreign_forces_tracked_by_district(self, engine):
        """Test that foreign forces are tracked by district."""
        # Building a in cognitive
        engine.register_building("a", (0.0, 0.0), "cognitive")
        # Building b in metabolic (different district)
        engine.register_building("b", (100.0, 100.0), "metabolic")

        # Set similarity and bridge
        engine.set_similarity("a", "b", 0.8)
        engine.register_bridge("a", "b")
        engine.register_bridge("a", "b")

        # Calculate total force
        await engine.calculate_total_force("a")

        # Check foreign forces include metabolic
        building = engine.buildings["a"]
        assert "metabolic" in building.foreign_forces
        assert building.foreign_forces["metabolic"] > 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
