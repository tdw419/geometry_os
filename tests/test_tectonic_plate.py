"""
Tests for TectonicPlate data structure.

Phase 49: Neural District Coalescence
"""

import numpy as np

from systems.tectonic.plate import (
    DISTRICT_COLORS,
    DistrictState,
    TectonicPlate,
)


class TestDistrictState:
    """Tests for DistrictState enum values."""

    def test_high_cohesion_state_exists(self):
        """HIGH_COHESION state should exist."""
        assert DistrictState.HIGH_COHESION.value == "high_cohesion"

    def test_low_cohesion_state_exists(self):
        """LOW_COHESION state should exist."""
        assert DistrictState.LOW_COHESION.value == "low_cohesion"

    def test_active_state_exists(self):
        """ACTIVE state should exist."""
        assert DistrictState.ACTIVE.value == "active"

    def test_dormant_state_exists(self):
        """DORMANT state should exist."""
        assert DistrictState.DORMANT.value == "dormant"

    def test_conflict_state_exists(self):
        """CONFLICT state should exist."""
        assert DistrictState.CONFLICT.value == "conflict"


class TestDistrictColors:
    """Tests for DISTRICT_COLORS mapping."""

    def test_high_cohesion_color(self):
        """HIGH_COHESION should be #00F0FF."""
        assert DISTRICT_COLORS[DistrictState.HIGH_COHESION] == (0, 240, 255, 255)

    def test_low_cohesion_color(self):
        """LOW_COHESION should be #4A4A4A."""
        assert DISTRICT_COLORS[DistrictState.LOW_COHESION] == (74, 74, 74, 255)

    def test_active_color(self):
        """ACTIVE should be #FF4500."""
        assert DISTRICT_COLORS[DistrictState.ACTIVE] == (255, 69, 0, 255)

    def test_dormant_color(self):
        """DORMANT should be #1A1A1A."""
        assert DISTRICT_COLORS[DistrictState.DORMANT] == (26, 26, 26, 255)

    def test_conflict_color(self):
        """CONFLICT should be #FF3333."""
        assert DISTRICT_COLORS[DistrictState.CONFLICT] == (255, 51, 51, 255)


class TestTectonicPlateCreation:
    """Tests for plate creation."""

    def test_plate_creation_basic(self):
        """Create a basic plate with required fields."""
        centroid = np.zeros(64, dtype=np.float32)
        plate = TectonicPlate(
            plate_id="plate-001",
            agents=["agent-a", "agent-b"],
            centroid=centroid,
        )
        assert plate.plate_id == "plate-001"
        assert len(plate.agents) == 2
        assert np.array_equal(plate.centroid, centroid)

    def test_plate_default_cohesion(self):
        """Default cohesion should be 0.0."""
        plate = TectonicPlate(
            plate_id="plate-002",
            agents=[],
            centroid=np.zeros(64),
        )
        assert plate.cohesion == 0.0

    def test_plate_default_state_from_low_cohesion(self):
        """State should derive to LOW_COHESION for cohesion < 0.4."""
        plate = TectonicPlate(
            plate_id="plate-003",
            agents=[],
            centroid=np.zeros(64),
            cohesion=0.2,
        )
        assert plate.state == DistrictState.LOW_COHESION

    def test_plate_state_from_high_cohesion(self):
        """State should derive to HIGH_COHESION for cohesion >= 0.7."""
        plate = TectonicPlate(
            plate_id="plate-004",
            agents=[],
            centroid=np.zeros(64),
            cohesion=0.8,
        )
        assert plate.state == DistrictState.HIGH_COHESION

    def test_plate_state_from_mid_cohesion(self):
        """State should derive to DORMANT for 0.4 <= cohesion < 0.7."""
        plate = TectonicPlate(
            plate_id="plate-005",
            agents=[],
            centroid=np.zeros(64),
            cohesion=0.5,
        )
        assert plate.state == DistrictState.DORMANT


class TestTectonicPlateStateDerivation:
    """Tests for state derivation logic."""

    def test_conflict_overrides_all(self):
        """CONFLICT should take priority over other states."""
        plate = TectonicPlate(
            plate_id="plate-006",
            agents=[],
            centroid=np.zeros(64),
            cohesion=0.9,
            is_active=True,
            conflict_count=1,
        )
        assert plate.state == DistrictState.CONFLICT

    def test_active_overrides_cohesion(self):
        """ACTIVE should take priority over cohesion-based states."""
        plate = TectonicPlate(
            plate_id="plate-007",
            agents=[],
            centroid=np.zeros(64),
            cohesion=0.9,
            is_active=True,
        )
        assert plate.state == DistrictState.ACTIVE


class TestTectonicPlateBudget:
    """Tests for budget calculations."""

    def test_total_budget_empty(self):
        """Total budget should be 0 for empty agent_budgets."""
        plate = TectonicPlate(
            plate_id="plate-008",
            agents=[],
            centroid=np.zeros(64),
        )
        assert plate.total_budget == 0.0

    def test_total_budget_calculation(self):
        """Total budget should sum all agent budgets."""
        plate = TectonicPlate(
            plate_id="plate-009",
            agents=["a", "b", "c"],
            centroid=np.zeros(64),
            agent_budgets={"a": 10.0, "b": 20.0, "c": 30.0},
        )
        assert plate.total_budget == 60.0


class TestTectonicPlateColor:
    """Tests for color retrieval."""

    def test_get_color_high_cohesion(self):
        """get_color should return correct RGBA for HIGH_COHESION."""
        plate = TectonicPlate(
            plate_id="plate-010",
            agents=[],
            centroid=np.zeros(64),
            cohesion=0.8,
        )
        assert plate.get_color() == (0, 240, 255, 255)

    def test_get_color_conflict(self):
        """get_color should return correct RGBA for CONFLICT."""
        plate = TectonicPlate(
            plate_id="plate-011",
            agents=[],
            centroid=np.zeros(64),
            conflict_count=1,
        )
        assert plate.get_color() == (255, 51, 51, 255)


class TestTectonicPlateForce:
    """Tests for force calculation."""

    def test_calculate_force(self):
        """Force should be total_budget * cohesion."""
        plate = TectonicPlate(
            plate_id="plate-012",
            agents=["a", "b"],
            centroid=np.zeros(64),
            cohesion=0.5,
            agent_budgets={"a": 20.0, "b": 30.0},
        )
        # 50 * 0.5 = 25.0
        assert plate.calculate_force() == 25.0

    def test_calculate_force_zero_cohesion(self):
        """Force should be 0 when cohesion is 0."""
        plate = TectonicPlate(
            plate_id="plate-013",
            agents=["a"],
            centroid=np.zeros(64),
            cohesion=0.0,
            agent_budgets={"a": 100.0},
        )
        assert plate.calculate_force() == 0.0


class TestTectonicPlateSerialization:
    """Tests for serialization/deserialization."""

    def test_to_dict(self):
        """to_dict should serialize plate correctly."""
        centroid = np.arange(64, dtype=np.float32)
        plate = TectonicPlate(
            plate_id="plate-014",
            agents=["agent-x"],
            centroid=centroid,
            cohesion=0.75,
            name="Test Plate",
            purpose="Testing serialization",
            agent_budgets={"agent-x": 50.0},
            tiles=[(1, 2), (3, 4)],
        )
        data = plate.to_dict()

        assert data["plate_id"] == "plate-014"
        assert data["agents"] == ["agent-x"]
        assert data["centroid"] == centroid.tolist()
        assert data["cohesion"] == 0.75
        assert data["name"] == "Test Plate"
        assert data["purpose"] == "Testing serialization"
        assert data["agent_budgets"] == {"agent-x": 50.0}
        assert data["tiles"] == [(1, 2), (3, 4)]
        assert data["state"] == "high_cohesion"
        assert data["is_active"] is False
        assert data["conflict_count"] == 0

    def test_from_dict(self):
        """from_dict should deserialize plate correctly."""
        data = {
            "plate_id": "plate-015",
            "agents": ["agent-y", "agent-z"],
            "centroid": list(np.ones(64, dtype=np.float32)),
            "cohesion": 0.3,
            "name": "Loaded Plate",
            "purpose": "Testing deserialization",
            "agent_budgets": {"agent-y": 10.0, "agent-z": 20.0},
            "tiles": [[5, 6], [7, 8]],
            "state": "low_cohesion",
            "is_active": False,
            "conflict_count": 0,
        }
        plate = TectonicPlate.from_dict(data)

        assert plate.plate_id == "plate-015"
        assert plate.agents == ["agent-y", "agent-z"]
        assert np.allclose(plate.centroid, np.ones(64, dtype=np.float32))
        assert plate.cohesion == 0.3
        assert plate.name == "Loaded Plate"
        assert plate.purpose == "Testing deserialization"
        assert plate.agent_budgets == {"agent-y": 10.0, "agent-z": 20.0}
        assert plate.tiles == [(5, 6), (7, 8)]
        assert plate.state == DistrictState.LOW_COHESION

    def test_round_trip_serialization(self):
        """Plate should survive to_dict -> from_dict round trip."""
        original = TectonicPlate(
            plate_id="plate-016",
            agents=["a", "b", "c"],
            centroid=np.random.randn(64).astype(np.float32),
            cohesion=0.6,
            name="Round Trip Test",
            purpose="Verify serialization integrity",
            agent_budgets={"a": 1.0, "b": 2.0, "c": 3.0},
            tiles=[(0, 0), (1, 1)],
        )
        data = original.to_dict()
        restored = TectonicPlate.from_dict(data)

        assert restored.plate_id == original.plate_id
        assert restored.agents == original.agents
        assert np.allclose(restored.centroid, original.centroid)
        assert restored.cohesion == original.cohesion
        assert restored.name == original.name
        assert restored.purpose == original.purpose
        assert restored.agent_budgets == original.agent_budgets
        assert restored.tiles == original.tiles
        assert restored.state == original.state


class TestTectonicPlateRepr:
    """Tests for string representation."""

    def test_repr_format(self):
        """__repr__ should return readable format."""
        plate = TectonicPlate(
            plate_id="test-plate",
            agents=["a", "b"],
            centroid=np.zeros(64),
            cohesion=0.5,
            agent_budgets={"a": 10.0},
        )
        repr_str = repr(plate)
        assert "test-plate" in repr_str
        assert "agents=2" in repr_str
        assert "cohesion=0.50" in repr_str
        assert "budget=10.0" in repr_str
