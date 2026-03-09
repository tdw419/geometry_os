"""
Tests for Tectonic integration in Sisyphus Daemon.
"""

import pytest
from systems.sisyphus.daemon import SisyphusDaemon


class TestDaemonTectonic:
    """Tests for daemon tectonic integration."""

    def test_daemon_has_tectonic_updater_when_enabled(self):
        """Test daemon includes TectonicUpdater when tectonic enabled."""
        daemon = SisyphusDaemon(enable_tectonic=True)

        assert daemon.tectonic_updater is not None

    def test_daemon_no_tectonic_when_disabled(self):
        """Test daemon has no TectonicUpdater when disabled."""
        daemon = SisyphusDaemon(enable_tectonic=False)

        assert daemon.tectonic_updater is None

    def test_daemon_tectonic_uses_gravity_engine(self):
        """Test daemon's tectonic uses the gravity engine."""
        daemon = SisyphusDaemon(enable_tectonic=True)

        assert daemon.tectonic_updater.gravity_engine == daemon.gravity_engine


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
