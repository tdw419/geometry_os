"""
Tests for MassIntegrator - Converts file events to semantic mass deltas.

Mass increases with access frequency, creating "hot spots" in the gravity map.
"""

import pytest

from systems.infinite_map.file_watcher import FileEvent
from systems.infinite_map.mass_integrator import MassDelta, MassIntegrator


class TestMassDelta:
    """Tests for MassDelta dataclass."""

    def test_mass_delta_creation(self):
        """Test MassDelta stores all required fields."""
        delta = MassDelta(
            file_path="src/core.py",
            delta_mass=0.5,
            event_type="modified"
        )
        assert delta.file_path == "src/core.py"
        assert delta.delta_mass == 0.5
        assert delta.event_type == "modified"


class TestMassIntegrator:
    """Tests for MassIntegrator event processing."""

    def test_mass_integrator_creation(self):
        """Test MassIntegrator initializes with default settings."""
        integrator = MassIntegrator()
        assert integrator.access_weight > 0
        assert integrator.modify_weight > 0

    def test_modified_event_increases_mass(self):
        """Test file modification increases semantic mass."""
        integrator = MassIntegrator(modify_weight=0.5)
        event = FileEvent(file_path="test.py", event_type="modified")

        delta = integrator.process_event(event)

        assert delta.file_path == "test.py"
        assert delta.delta_mass == 0.5
        assert delta.event_type == "modified"

    def test_created_event_increases_mass(self):
        """Test file creation increases semantic mass."""
        integrator = MassIntegrator(create_weight=1.0)
        event = FileEvent(file_path="new.py", event_type="created")

        delta = integrator.process_event(event)

        assert delta.delta_mass == 1.0

    def test_deleted_event_decreases_mass(self):
        """Test file deletion decreases semantic mass."""
        integrator = MassIntegrator(delete_weight=-0.5)
        event = FileEvent(file_path="old.py", event_type="deleted")

        delta = integrator.process_event(event)

        assert delta.delta_mass == -0.5

    def test_repeated_accesses_accumulate(self):
        """Test repeated file accesses accumulate mass."""
        integrator = MassIntegrator(modify_weight=0.1)

        total_mass = 0.0
        for _ in range(10):
            event = FileEvent(file_path="frequent.py", event_type="modified")
            delta = integrator.process_event(event)
            total_mass += delta.delta_mass

        assert total_mass == pytest.approx(1.0)  # 10 * 0.1

    def test_get_file_mass_returns_accumulated(self):
        """Test get_file_mass returns total accumulated mass for a file."""
        integrator = MassIntegrator(modify_weight=0.25)

        # Process 4 events for the same file
        for _ in range(4):
            event = FileEvent(file_path="tracked.py", event_type="modified")
            integrator.process_event(event)

        assert integrator.get_file_mass("tracked.py") == 1.0

    def test_decay_reduces_old_mass(self):
        """Test decay reduces mass over time for inactive files."""
        integrator = MassIntegrator(modify_weight=1.0, decay_factor=0.9)

        # Create mass
        event = FileEvent(file_path="aging.py", event_type="modified")
        integrator.process_event(event)
        assert integrator.get_file_mass("aging.py") == 1.0

        # Apply decay
        integrator.apply_decay()
        assert integrator.get_file_mass("aging.py") == 0.9

        # Apply decay again
        integrator.apply_decay()
        assert integrator.get_file_mass("aging.py") == 0.81


class TestMassIntegratorWeights:
    """Tests for configurable event weights."""

    def test_custom_weights(self):
        """Test MassIntegrator accepts custom weights."""
        integrator = MassIntegrator(
            access_weight=0.1,
            modify_weight=0.3,
            create_weight=0.5,
            delete_weight=-0.2
        )

        assert integrator.access_weight == 0.1
        assert integrator.modify_weight == 0.3
        assert integrator.create_weight == 0.5
        assert integrator.delete_weight == -0.2


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
