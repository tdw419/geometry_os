"""Tests for MetabolismMonitor triggering TectonicStage."""
import pytest


def test_metabolism_monitor_tracks_ipc():
    """Test that MetabolismMonitor tracks substrate IPC."""
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor()
    assert hasattr(monitor, 'substrate_ipc_history')
    monitor.record_ipc(0.45)
    monitor.record_ipc(0.42)
    assert len(monitor.substrate_ipc_history) == 2


def test_metabolism_monitor_detects_ipc_degradation():
    """Test detection of substrate performance degradation."""
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor(baseline_ipc=0.50, degradation_threshold=0.10)

    # 20% degradation should trigger
    assert monitor.is_ipc_degraded(0.40) is True

    # 5% degradation should not trigger
    assert monitor.is_ipc_degraded(0.47) is False


def test_metabolism_monitor_ipc_history_limited():
    """Test that IPC history is limited to 100 entries."""
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor()

    # Add more than 100 entries
    for i in range(150):
        monitor.record_ipc(0.45)

    # Should be capped at 100
    assert len(monitor.substrate_ipc_history) == 100


def test_metabolism_monitor_zero_baseline_no_degradation():
    """Test that zero baseline doesn't cause false positives."""
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    monitor = MetabolismMonitor(baseline_ipc=0.0)

    # Should not trigger degradation when baseline is 0
    assert monitor.is_ipc_degraded(0.40) is False


def test_metabolism_monitor_degradation_calculation():
    """Test exact degradation threshold calculation."""
    from systems.evolution_daemon.safety.metabolism_monitor import MetabolismMonitor

    # 10% threshold means 0.05 degradation should not trigger
    monitor = MetabolismMonitor(baseline_ipc=0.50, degradation_threshold=0.10)

    # Exactly at threshold should not trigger (strictly greater than)
    assert monitor.is_ipc_degraded(0.45) is False

    # Just above threshold should trigger
    assert monitor.is_ipc_degraded(0.449) is True
