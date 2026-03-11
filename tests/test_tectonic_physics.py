"""
Tests for Tectonic File Physics - Real-time ripples and forces.
"""


import pytest

from systems.infinite_map.file_watcher import FileEvent
from systems.infinite_map.gravity_engine import GravityEngine
from systems.infinite_map.tectonic_updater import TectonicUpdater


class MockVisualBridge:
    def __init__(self):
        self.ripples = []
    def emit_tectonic_ripple(self, x, y, z, force, radius):
        self.ripples.append({
            "x": x, "y": y, "z": z, "force": force, "radius": radius
        })

class TestTectonicPhysics:
    def test_expansion_wave_on_modify(self):
        """Test that modifying a file creates an expansion wave (repulsive force)."""
        engine = GravityEngine(bounds=(1000, 1000, 256))
        bridge = MockVisualBridge()

        # Add two orbs close to each other
        engine.add_orb("file1.py", 500, 500, 128, 1000)
        engine.add_orb("file2.py", 550, 500, 128, 1000)

        updater = TectonicUpdater(engine, ".", visual_bridge=bridge)

        # Simulate modification of file1.py
        event = FileEvent(file_path="file1.py", event_type="modified")
        updater._on_file_event(event)

        # Check that a ripple was emitted
        assert len(bridge.ripples) == 1
        assert bridge.ripples[0]["force"] > 0 # Repulsive
        assert bridge.ripples[0]["x"] == 500

        # Run update and check if file2 was pushed away
        initial_x2 = engine.orbs["file2.py"]["pos"][0]
        engine.update()
        new_x2 = engine.orbs["file2.py"]["pos"][0]

        assert new_x2 > initial_x2 # Pushed away along X axis

    def test_void_collapse_on_delete(self):
        """Test that deleting a file creates a void collapse (attractive force)."""
        engine = GravityEngine(bounds=(1000, 1000, 256))
        bridge = MockVisualBridge()

        # Add two orbs
        engine.add_orb("file1.py", 500, 500, 128, 1000)
        engine.add_orb("file2.py", 600, 500, 128, 1000)

        updater = TectonicUpdater(engine, ".", visual_bridge=bridge)

        # Simulate deletion of file1.py
        event = FileEvent(file_path="file1.py", event_type="deleted")
        updater._on_file_event(event)

        # Check ripple
        assert len(bridge.ripples) == 1
        assert bridge.ripples[0]["force"] < 0 # Attractive

        # Run update and check if file2 was pulled in
        initial_x2 = engine.orbs["file2.py"]["pos"][0]
        engine.update()
        new_x2 = engine.orbs["file2.py"]["pos"][0]

        assert new_x2 < initial_x2 # Pulled towards center (500)

if __name__ == "__main__":
    pytest.main([__file__, "-v"])
