"""
Tests for real-time mass updates in GravityEngine.

Verifies that files drift when their semantic mass changes.
"""

import pytest

from systems.infinite_map.gravity_engine import GravityEngine


class TestGravityEngineRealtimeMass:
    """Tests for real-time mass updates."""

    def test_update_mass_increases_mass(self):
        """Test update_mass increases an orb's mass."""
        engine = GravityEngine()
        engine.add_orb("test.py", 100, 100, 1024)

        initial_mass = engine.orbs["test.py"]["mass"]
        engine.update_mass("test.py", delta=0.5)

        assert engine.orbs["test.py"]["mass"] == initial_mass + 0.5

    def test_update_mass_nonexistent_orb_ignored(self):
        """Test update_mass silently ignores non-existent orbs."""
        engine = GravityEngine()

        # Should not raise
        engine.update_mass("nonexistent.py", delta=1.0)

        assert len(engine.orbs) == 0

    def test_higher_mass_attracts_other_orbs(self):
        """Test orbs with higher mass attract others when linked."""
        engine = GravityEngine(bounds=(500, 500))

        # Add two orbs far apart
        engine.add_orb("heavy.py", 100, 250, 1024)
        engine.add_orb("light.py", 400, 250, 512)

        # Increase mass of heavy orb
        engine.update_mass("heavy.py", delta=10.0)

        # Link them to create attraction
        engine.link_orbs("light.py", "heavy.py")

        # Record initial positions
        initial_light_x = engine.orbs["light.py"]["pos"][0]

        # Simulate for many steps
        for _ in range(100):
            engine.update()

        # Light orb should have moved toward heavy orb (x decreased) due to spring
        final_light_x = engine.orbs["light.py"]["pos"][0]
        assert final_light_x < initial_light_x


class TestGravityEngineSetMass:
    """Tests for set_mass functionality."""

    def test_set_mass_overrides_mass(self):
        """Test set_mass directly sets an orb's mass."""
        engine = GravityEngine()
        engine.add_orb("test.py", 100, 100, 1024)

        engine.set_mass("test.py", mass=5.0)

        assert engine.orbs["test.py"]["mass"] == 5.0

    def test_set_mass_nonexistent_ignored(self):
        """Test set_mass silently ignores non-existent orbs."""
        engine = GravityEngine()

        # Should not raise
        engine.set_mass("nonexistent.py", mass=10.0)


class TestGravityEngineMassClamping:
    """Tests for minimum mass clamping."""

    def test_update_mass_clamps_to_minimum(self):
        """Test update_mass clamps mass to 0.1 minimum."""
        engine = GravityEngine()
        engine.add_orb("test.py", 100, 100, 1024)
        engine.update_mass("test.py", delta=-100.0)
        assert engine.get_mass("test.py") == 0.1

    def test_set_mass_clamps_to_minimum(self):
        """Test set_mass clamps mass to 0.1 minimum."""
        engine = GravityEngine()
        engine.add_orb("test.py", 100, 100, 1024)
        engine.set_mass("test.py", mass=-5.0)
        assert engine.get_mass("test.py") == 0.1


class TestGravityEngineGetMass:
    """Tests for get_mass functionality."""

    def test_get_mass_returns_zero_for_nonexistent(self):
        """Test get_mass returns 0.0 for non-existent orbs."""
        engine = GravityEngine()
        assert engine.get_mass("nonexistent.py") == 0.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
