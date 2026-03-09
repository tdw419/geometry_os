"""
Tests for TectonicUpdater - Connects FileWatcher to GravityEngine.

End-to-end integration: file event → mass delta → gravity update.
"""

import pytest
import tempfile
import time
from pathlib import Path
from systems.infinite_map.tectonic_updater import TectonicUpdater
from systems.infinite_map.gravity_engine import GravityEngine


class TestTectonicUpdater:
    """Tests for TectonicUpdater integration."""

    def test_tectonic_updater_creation(self):
        """Test TectonicUpdater initializes with components."""
        engine = GravityEngine()
        updater = TectonicUpdater(engine, watch_path="/tmp")

        assert updater.gravity_engine == engine
        assert updater.watch_path == "/tmp"

    def test_file_modification_increases_mass(self):
        """Test file modification increases orb mass."""
        with tempfile.TemporaryDirectory() as tmpdir:
            engine = GravityEngine()

            # Add orb to track
            test_file = Path(tmpdir) / "test.py"
            test_file.write_text("initial")
            engine.add_orb(str(test_file), 100, 100, 1024)

            initial_mass = engine.get_mass(str(test_file))

            # Start updater
            updater = TectonicUpdater(engine, watch_path=tmpdir)
            updater.start()
            time.sleep(0.2)

            # Modify file
            test_file.write_text("modified")
            time.sleep(0.5)

            updater.stop()

            # Mass should have increased
            final_mass = engine.get_mass(str(test_file))
            assert final_mass > initial_mass

    def test_tectonic_updater_context_manager(self):
        """Test TectonicUpdater works as context manager."""
        engine = GravityEngine()

        with TectonicUpdater(engine, watch_path="/tmp") as updater:
            assert updater.is_running()

        assert not updater.is_running()

    def test_decay_applied_periodically(self):
        """Test decay is applied periodically to masses."""
        with tempfile.TemporaryDirectory() as tmpdir:
            engine = GravityEngine()
            updater = TectonicUpdater(
                engine,
                watch_path=tmpdir,
                decay_interval=0.5
            )

            # Add orb with mass
            test_file = Path(tmpdir) / "test.py"
            test_file.write_text("content")
            engine.add_orb(str(test_file), 100, 100, 1024)

            updater.start()

            # Trigger a file event so MassIntegrator tracks this file
            test_file.write_text("modified")
            time.sleep(0.2)  # Let the event be processed

            initial_mass = engine.get_mass(str(test_file))

            time.sleep(0.7)  # Wait for decay cycle
            updater.stop()

            # Mass should have decayed
            final_mass = engine.get_mass(str(test_file))
            assert final_mass < initial_mass


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
