"""
Tests for Mesh Dashboard (Phase 32)

Tests dashboard panels, metrics display, and mesh integration.
"""

import asyncio
from unittest.mock import Mock

import pytest

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
    PeerStatus,
)
from systems.visual_shell.mesh_dashboard import (
    DashboardConfig,
    DashboardPanel,
    MeshDashboard,
    MeshSummary,
    MetricsDisplay,
    PanelState,
    PeerSummary,
    create_mesh_dashboard,
)


class TestPanelState:
    """Tests for PanelState enum."""

    def test_panel_states(self):
        assert PanelState.COLLAPSED.value == "collapsed"
        assert PanelState.EXPANDED.value == "expanded"
        assert PanelState.HIDDEN.value == "hidden"


class TestDashboardConfig:
    """Tests for DashboardConfig dataclass."""

    def test_config_defaults(self):
        config = DashboardConfig()
        assert config.refresh_interval == 1.0
        assert config.auto_expand is True
        assert config.show_offline_peers is True
        assert config.alert_threshold_cpu == 80.0
        assert config.alert_threshold_memory == 85.0

    def test_config_custom(self):
        config = DashboardConfig(
            refresh_interval=2.0,
            auto_expand=False,
            alert_threshold_cpu=70.0,
        )
        assert config.refresh_interval == 2.0
        assert config.auto_expand is False
        assert config.alert_threshold_cpu == 70.0


class TestMeshSummary:
    """Tests for MeshSummary dataclass."""

    def test_summary_creation(self):
        summary = MeshSummary(
            total_peers=5,
            online_peers=4,
            overloaded_peers=1,
            offline_peers=1,
            total_containers=20,
            active_migrations=2,
            cluster_cpu_avg=45.5,
            cluster_memory_avg=60.0,
            alerts=["peer-1: CPU 85%"],
        )
        assert summary.total_peers == 5
        assert summary.online_peers == 4
        assert summary.alerts == ["peer-1: CPU 85%"]

    def test_summary_no_alerts(self):
        summary = MeshSummary(
            total_peers=3,
            online_peers=3,
            overloaded_peers=0,
            offline_peers=0,
            total_containers=10,
            active_migrations=0,
            cluster_cpu_avg=30.0,
            cluster_memory_avg=40.0,
            alerts=[],
        )
        assert len(summary.alerts) == 0


class TestPeerSummary:
    """Tests for PeerSummary dataclass."""

    def test_peer_summary_creation(self):
        summary = PeerSummary(
            peer_id="peer-1",
            hostname="peer1.local",
            status=PeerStatus.ONLINE,
            cpu_percent=50.0,
            memory_percent=60.0,
            container_count=5,
            uptime_seconds=3600.0,
        )
        assert summary.peer_id == "peer-1"
        assert summary.status == PeerStatus.ONLINE
        assert summary.is_alert is False

    def test_peer_summary_alert(self):
        summary = PeerSummary(
            peer_id="peer-1",
            hostname="peer1.local",
            status=PeerStatus.OVERLOADED,
            cpu_percent=85.0,
            memory_percent=70.0,
            container_count=10,
            uptime_seconds=1800.0,
            is_alert=True,
        )
        assert summary.is_alert is True


class TestMetricsDisplay:
    """Tests for MetricsDisplay."""

    @pytest.fixture
    def display(self):
        return MetricsDisplay()

    def test_display_creation(self, display):
        assert len(display._history) == 0

    def test_format_peer_metrics_online(self, display):
        from systems.network_boot.load_balancing import PeerMetrics
        peer = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
            container_count=5,
            status=PeerStatus.ONLINE,
        )
        result = display.format_peer_metrics(peer)

        assert "peer1.local" in result
        assert "50.0%" in result
        assert "60.0%" in result

    def test_format_peer_metrics_overloaded(self, display):
        from systems.network_boot.load_balancing import PeerMetrics
        peer = PeerMetrics(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=90.0,
            memory_percent=85.0,
            container_count=15,
            status=PeerStatus.OVERLOADED,
        )
        result = display.format_peer_metrics(peer)

        assert "peer1.local" in result
        assert "90.0%" in result

    def test_format_cluster_summary(self, display):
        summary = MeshSummary(
            total_peers=5,
            online_peers=4,
            overloaded_peers=1,
            offline_peers=1,
            total_containers=20,
            active_migrations=2,
            cluster_cpu_avg=45.5,
            cluster_memory_avg=60.0,
            alerts=["peer-1: CPU 85%"],
        )
        result = display.format_cluster_summary(summary)

        assert "Mesh Status" in result
        assert "4/5" in result
        assert "45.5%" in result
        assert "Alerts" in result

    def test_add_to_history(self, display):
        summary = MeshSummary(
            total_peers=1,
            online_peers=1,
            overloaded_peers=0,
            offline_peers=0,
            total_containers=5,
            active_migrations=0,
            cluster_cpu_avg=30.0,
            cluster_memory_avg=40.0,
            alerts=[],
        )

        display.add_to_history(summary)
        assert len(display._history) == 1

    def test_get_history(self, display):
        for i in range(5):
            display.add_to_history(MeshSummary(
                total_peers=i + 1,
                online_peers=i + 1,
                overloaded_peers=0,
                offline_peers=0,
                total_containers=0,
                active_migrations=0,
                cluster_cpu_avg=0,
                cluster_memory_avg=0,
                alerts=[],
            ))

        history = display.get_history(limit=3)
        assert len(history) == 3

    def test_get_trend_insufficient_data(self, display):
        trend = display.get_trend()
        assert trend["trend"] == "insufficient_data"

    def test_get_trend_with_data(self, display):
        for i in range(5):
            display.add_to_history(MeshSummary(
                total_peers=1,
                online_peers=1,
                overloaded_peers=0,
                offline_peers=0,
                total_containers=0,
                active_migrations=0,
                cluster_cpu_avg=30.0 + i * 5,
                cluster_memory_avg=40.0,
                alerts=[],
            ))

        trend = display.get_trend()
        assert "cpu_trend" in trend
        assert "mem_trend" in trend


class TestDashboardPanel:
    """Tests for DashboardPanel."""

    @pytest.fixture
    def panel(self):
        return DashboardPanel("Test Panel")

    def test_panel_creation(self, panel):
        assert panel.title == "Test Panel"
        assert panel.state == PanelState.COLLAPSED

    def test_expand(self, panel):
        panel.expand()
        assert panel.state == PanelState.EXPANDED

    def test_collapse(self, panel):
        panel.expand()
        panel.collapse()
        assert panel.state == PanelState.COLLAPSED

    def test_toggle(self, panel):
        panel.toggle()
        assert panel.state == PanelState.EXPANDED
        panel.toggle()
        assert panel.state == PanelState.COLLAPSED

    def test_hide_show(self, panel):
        panel.hide()
        assert panel.state == PanelState.HIDDEN
        panel.show()
        assert panel.state == PanelState.COLLAPSED

    def test_update_content(self, panel):
        panel.update_content(["Line 1", "Line 2"])
        assert panel.get_content() == ["Line 1", "Line 2"]

    def test_get_summary(self, panel):
        panel.update_content(["Status: OK"])
        summary = panel.get_summary()
        assert "Test Panel" in summary
        assert "Status: OK" in summary

    def test_get_summary_empty(self, panel):
        summary = panel.get_summary()
        assert "No data" in summary


class TestMeshDashboard:
    """Tests for MeshDashboard."""

    @pytest.fixture
    def dashboard(self):
        return MeshDashboard()

    def test_dashboard_creation(self, dashboard):
        assert dashboard._running is False
        assert dashboard.visualizer is not None
        assert dashboard.metrics_display is not None
        assert dashboard.summary_panel is not None
        assert dashboard.peers_panel is not None
        assert dashboard.migrations_panel is not None

    def test_dashboard_with_custom_config(self):
        config = DashboardConfig(refresh_interval=0.5, auto_expand=False)
        dashboard = MeshDashboard(config=config)

        assert dashboard.config.refresh_interval == 0.5
        assert dashboard.config.auto_expand is False

    @pytest.mark.asyncio
    async def test_start_stop(self, dashboard):
        await dashboard.start()
        assert dashboard._running is True

        await asyncio.sleep(0.1)

        await dashboard.stop()
        assert dashboard._running is False

    @pytest.mark.asyncio
    async def test_refresh_updates_panels(self, dashboard):
        await dashboard.start()

        # Add a peer to visualizer
        dashboard.visualizer.update_peer("peer-1", "peer1.local", cpu_percent=50.0)

        # Wait for refresh
        await asyncio.sleep(0.2)

        # Check panels have content
        assert len(dashboard.summary_panel.get_content()) > 0

        await dashboard.stop()

    def test_compute_summary_empty(self, dashboard):
        summary = dashboard._compute_summary()

        assert summary.total_peers == 0
        assert summary.online_peers == 0
        assert len(summary.alerts) == 0

    def test_compute_summary_with_peers(self, dashboard):
        dashboard.visualizer.update_peer("peer-1", "peer1.local", cpu_percent=50.0)
        dashboard.visualizer.update_peer("peer-2", "peer2.local", cpu_percent=90.0)

        summary = dashboard._compute_summary()

        assert summary.total_peers == 2
        assert summary.cluster_cpu_avg == 70.0  # (50 + 90) / 2

    def test_compute_summary_alerts(self, dashboard):
        config = DashboardConfig(alert_threshold_cpu=80.0)
        dashboard_with_config = MeshDashboard(config=config)

        dashboard_with_config.visualizer.update_peer(
            "peer-1", "peer1.local", cpu_percent=85.0
        )

        summary = dashboard_with_config._compute_summary()

        assert len(summary.alerts) > 0
        assert "CPU" in summary.alerts[0]

    def test_format_progress_bar(self, dashboard):
        bar = dashboard._format_progress_bar(0.5, width=10)
        assert "█" in bar
        assert "░" in bar

        bar_complete = dashboard._format_progress_bar(1.0, width=5)
        assert bar_complete == "[█████]"

        bar_empty = dashboard._format_progress_bar(0.0, width=5)
        assert bar_empty == "[░░░░░]"

    def test_on_update_callback(self, dashboard):
        callback_results = []

        def callback(summary):
            callback_results.append(summary)

        dashboard.on_update(callback)

        # Trigger update
        dashboard._compute_summary()
        # Callback is called in _refresh, let's call it manually
        dashboard._update_panels(dashboard._compute_summary())

        # Callback should be registered
        assert callback in dashboard._callbacks

    def test_get_status(self, dashboard):
        status = dashboard.get_status()

        assert "running" in status
        assert "panels" in status
        assert "config" in status

    def test_get_peer_summaries(self, dashboard):
        dashboard.visualizer.update_peer(
            "peer-1", "peer1.local", cpu_percent=50.0, memory_percent=60.0
        )

        summaries = dashboard.get_peer_summaries()

        assert len(summaries) == 1
        assert summaries[0].peer_id == "peer-1"
        assert summaries[0].cpu_percent == 50.0

    def test_get_peer_summaries_with_alert(self, dashboard):
        config = DashboardConfig(alert_threshold_cpu=80.0)
        dashboard_with_config = MeshDashboard(config=config)

        dashboard_with_config.visualizer.update_peer(
            "peer-1", "peer1.local", cpu_percent=90.0
        )

        summaries = dashboard_with_config.get_peer_summaries()

        assert summaries[0].is_alert is True

    def test_expand_all(self, dashboard):
        dashboard.expand_all()

        assert dashboard.summary_panel.state == PanelState.EXPANDED
        assert dashboard.peers_panel.state == PanelState.EXPANDED
        assert dashboard.migrations_panel.state == PanelState.EXPANDED

    def test_collapse_all(self, dashboard):
        dashboard.expand_all()
        dashboard.collapse_all()

        assert dashboard.summary_panel.state == PanelState.COLLAPSED
        assert dashboard.peers_panel.state == PanelState.COLLAPSED
        assert dashboard.migrations_panel.state == PanelState.COLLAPSED

    def test_sync_visualizer_with_load_balancer(self, dashboard):
        # Create mock load balancer with resource monitor
        from systems.network_boot.load_balancing import PeerMetrics

        mock_monitor = Mock()
        mock_monitor._peers = {
            "peer-1": PeerMetrics(
                peer_id="peer-1",
                hostname="peer1.local",
                cpu_percent=45.0,
                memory_percent=55.0,
                container_count=3,
                status=PeerStatus.ONLINE,
            )
        }

        mock_lb = Mock()
        mock_lb.resource_monitor = mock_monitor

        dashboard.load_balancer = mock_lb
        dashboard._sync_visualizer()

        # Check visualizer was updated
        assert "peer-1" in dashboard.visualizer._peers
        assert dashboard.visualizer._peers["peer-1"].cpu_percent == 45.0


class TestCreateMeshDashboard:
    """Tests for create_mesh_dashboard function."""

    def test_create_defaults(self):
        dashboard = create_mesh_dashboard()

        assert dashboard.visualizer is not None
        assert dashboard.load_balancer is None

    def test_create_with_visualizer(self):
        visualizer = ClusterVisualizer()
        dashboard = create_mesh_dashboard(visualizer=visualizer)

        assert dashboard.visualizer is visualizer

    def test_create_with_config(self):
        config = DashboardConfig(refresh_interval=5.0)
        dashboard = create_mesh_dashboard(config=config)

        assert dashboard.config.refresh_interval == 5.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
