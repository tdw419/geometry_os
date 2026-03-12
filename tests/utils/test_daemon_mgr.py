import os
import pytest
from pathlib import Path
from geos.utils.daemon_mgr import DaemonManager, DaemonInfo, DaemonStatus


def test_daemon_manager_discover():
    """Test daemon discovery."""
    mgr = DaemonManager()
    daemons = mgr.discover()
    assert isinstance(daemons, list)
    # Should find at least sisyphus and swarm
    names = [d.name for d in daemons]
    assert "sisyphus" in names or "swarm" in names


def test_daemon_info_dataclass():
    """Test DaemonInfo dataclass."""
    info = DaemonInfo(
        name="test",
        path="/path/to/daemon.py",
        pid_file="/tmp/test.pid",
    )
    assert info.name == "test"
    assert info.status == DaemonStatus.UNKNOWN


def test_daemon_status_from_pid_file(tmp_path):
    """Test reading status from PID file."""
    mgr = DaemonManager(pid_dir=tmp_path)

    # Create a PID file with current process
    pid_file = tmp_path / "test.pid"
    pid_file.write_text(str(os.getpid()))

    status = mgr._check_status(pid_file)
    assert status == DaemonStatus.RUNNING


def test_daemon_status_stale_pid(tmp_path):
    """Test detecting stale PID file."""
    mgr = DaemonManager(pid_dir=tmp_path)

    # Create a PID file with non-existent PID
    pid_file = tmp_path / "test.pid"
    pid_file.write_text("99999999")

    status = mgr._check_status(pid_file)
    assert status == DaemonStatus.STOPPED