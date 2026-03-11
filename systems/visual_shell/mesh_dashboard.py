"""
Mesh Dashboard - Phase 32

Integrates the cluster visualizer into the main visual shell.

Provides the UI panel for mesh status, controls, and real-time metrics.
Connects the ClusterVisualizer to the load balancing system for live data.

Usage:
    from systems.visual_shell.mesh_dashboard import (
        MeshDashboard,
        DashboardPanel,
        MetricsDisplay,
    )

    # Create dashboard
    dashboard = MeshDashboard(visualizer, load_balancer)
    await dashboard.start()

    # Dashboard automatically syncs with mesh events
    status = dashboard.get_status()
"""

import asyncio
import logging
import time
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.network_boot.load_balancing import (
    LoadBalancer,
    PeerMetrics,
)
from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
    MigrationStatus,
    PeerStatus,
)

logger = logging.getLogger("MeshDashboard")


class PanelState(Enum):
    """State of dashboard panel."""
    COLLAPSED = "collapsed"
    EXPANDED = "expanded"
    HIDDEN = "hidden"


@dataclass
class DashboardConfig:
    """Configuration for mesh dashboard."""
    refresh_interval: float = 1.0  # seconds
    auto_expand: bool = True  # expand on alerts
    show_offline_peers: bool = True
    max_displayed_migrations: int = 10
    alert_threshold_cpu: float = 80.0
    alert_threshold_memory: float = 85.0


@dataclass
class MeshSummary:
    """Summary of mesh state for dashboard display."""
    total_peers: int
    online_peers: int
    overloaded_peers: int
    offline_peers: int
    total_containers: int
    active_migrations: int
    cluster_cpu_avg: float
    cluster_memory_avg: float
    alerts: list[str]
    timestamp: float = field(default_factory=time.time)


@dataclass
class PeerSummary:
    """Summary of a single peer for display."""
    peer_id: str
    hostname: str
    status: PeerStatus
    cpu_percent: float
    memory_percent: float
    container_count: int
    uptime_seconds: float
    is_alert: bool = False


class MetricsDisplay:
    """
    Displays real-time metrics for the mesh.

    Formats metrics for the dashboard UI.
    """

    def __init__(self, config: DashboardConfig | None = None):
        self.config = config or DashboardConfig()
        self._history: list[MeshSummary] = []
        self._max_history: int = 100

    def format_peer_metrics(self, peer: PeerMetrics) -> str:
        """Format peer metrics for display."""
        status_icon = {
            PeerStatus.ONLINE: "🟢",
            PeerStatus.OVERLOADED: "🔴",
            PeerStatus.OFFLINE: "⚫",
            PeerStatus.DRAINING: "🟡",
        }.get(peer.status, "⚪")

        return (
            f"{status_icon} {peer.hostname}\n"
            f"   CPU: {peer.cpu_percent:.1f}% | "
            f"MEM: {peer.memory_percent:.1f}% | "
            f"Containers: {peer.container_count}"
        )

    def format_cluster_summary(self, summary: MeshSummary) -> str:
        """Format cluster summary for display."""
        lines = [
            "=== Mesh Status ===",
            f"Peers: {summary.online_peers}/{summary.total_peers} online",
            f"Containers: {summary.total_containers}",
            f"Migrations: {summary.active_migrations} active",
            f"Cluster CPU: {summary.cluster_cpu_avg:.1f}%",
            f"Cluster MEM: {summary.cluster_memory_avg:.1f}%",
        ]

        if summary.alerts:
            lines.append("")
            lines.append("⚠️ Alerts:")
            for alert in summary.alerts[:5]:
                lines.append(f"  - {alert}")

        return "\n".join(lines)

    def add_to_history(self, summary: MeshSummary):
        """Add summary to history."""
        self._history.append(summary)
        if len(self._history) > self._max_history:
            self._history = self._history[-self._max_history:]

    def get_history(self, limit: int = 10) -> list[MeshSummary]:
        """Get recent history."""
        return self._history[-limit:]

    def get_trend(self) -> dict[str, Any]:
        """Calculate trends from history."""
        if len(self._history) < 2:
            return {"trend": "insufficient_data"}

        recent = self._history[-5:]
        if len(recent) < 2:
            return {"trend": "insufficient_data"}

        first = recent[0]
        last = recent[-1]

        cpu_trend = last.cluster_cpu_avg - first.cluster_cpu_avg
        mem_trend = last.cluster_memory_avg - first.cluster_memory_avg

        return {
            "cpu_trend": cpu_trend,
            "mem_trend": mem_trend,
            "direction": "increasing" if cpu_trend > 0 else "decreasing",
        }


class DashboardPanel:
    """
    Dashboard panel component.

    Manages the collapsed/expanded state and content.
    """

    def __init__(
        self,
        title: str,
        config: DashboardConfig | None = None,
    ):
        self.title = title
        self.config = config or DashboardConfig()
        self.state = PanelState.COLLAPSED
        self._content: list[str] = []
        self._last_update: float = 0

    def expand(self):
        """Expand the panel."""
        self.state = PanelState.EXPANDED

    def collapse(self):
        """Collapse the panel."""
        self.state = PanelState.COLLAPSED

    def toggle(self):
        """Toggle panel state."""
        if self.state == PanelState.COLLAPSED:
            self.expand()
        else:
            self.collapse()

    def hide(self):
        """Hide the panel."""
        self.state = PanelState.HIDDEN

    def show(self):
        """Show the panel."""
        self.state = PanelState.COLLAPSED

    def update_content(self, lines: list[str]):
        """Update panel content."""
        self._content = lines
        self._last_update = time.time()

    def get_content(self) -> list[str]:
        """Get panel content."""
        return self._content

    def get_summary(self) -> str:
        """Get one-line summary for collapsed view."""
        if not self._content:
            return f"{self.title}: No data"
        return f"{self.title}: {self._content[0]}"


class MeshDashboard:
    """
    Main mesh dashboard.

    Integrates ClusterVisualizer with LoadBalancer for real-time display.
    """

    def __init__(
        self,
        visualizer: ClusterVisualizer | None = None,
        load_balancer: LoadBalancer | None = None,
        config: DashboardConfig | None = None,
    ):
        self.visualizer = visualizer or ClusterVisualizer()
        self.load_balancer = load_balancer
        self.config = config or DashboardConfig()

        # UI components
        self.metrics_display = MetricsDisplay(self.config)
        self.summary_panel = DashboardPanel("Mesh Summary", self.config)
        self.peers_panel = DashboardPanel("Peers", self.config)
        self.migrations_panel = DashboardPanel("Migrations", self.config)

        # State
        self._running = False
        self._update_task: asyncio.Task | None = None
        self._last_summary: MeshSummary | None = None
        self._callbacks: list[Callable[[MeshSummary], None]] = []

    async def start(self):
        """Start the dashboard."""
        if self._running:
            return

        self._running = True

        # Start visualizer
        await self.visualizer.start()

        # Start update loop
        self._update_task = asyncio.create_task(self._update_loop())

        logger.info("Mesh dashboard started")

    async def stop(self):
        """Stop the dashboard."""
        self._running = False

        if self._update_task:
            self._update_task.cancel()
            try:
                await self._update_task
            except asyncio.CancelledError:
                pass

        await self.visualizer.stop()

        logger.info("Mesh dashboard stopped")

    async def _update_loop(self):
        """Periodic update loop."""
        while self._running:
            try:
                await self._refresh()
                await asyncio.sleep(self.config.refresh_interval)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Dashboard update error: {e}")
                await asyncio.sleep(1.0)

    async def _refresh(self):
        """Refresh dashboard data."""
        # Get summary
        summary = self._compute_summary()
        self._last_summary = summary

        # Add to history
        self.metrics_display.add_to_history(summary)

        # Update panels
        self._update_panels(summary)

        # Sync visualizer with load balancer data
        if self.load_balancer:
            self._sync_visualizer()

        # Notify callbacks
        for callback in self._callbacks:
            try:
                callback(summary)
            except Exception as e:
                logger.error(f"Callback error: {e}")

        # Auto-expand on alerts
        if self.config.auto_expand and summary.alerts:
            self.summary_panel.expand()

    def _compute_summary(self) -> MeshSummary:
        """Compute mesh summary from current state."""
        visualizer_status = self.visualizer.get_status()

        peers = list(self.visualizer._peers.values())

        total_peers = len(peers)
        online_peers = sum(1 for p in peers if p.status == PeerStatus.ONLINE)
        overloaded_peers = sum(1 for p in peers if p.status == PeerStatus.OVERLOADED)
        offline_peers = sum(1 for p in peers if p.status == PeerStatus.OFFLINE)

        total_containers = visualizer_status.get("container_count", 0)
        active_migrations = visualizer_status.get("active_migrations", 0)

        # Calculate averages
        if peers:
            cluster_cpu_avg = sum(p.cpu_percent for p in peers) / len(peers)
            cluster_memory_avg = sum(p.memory_percent for p in peers) / len(peers)
        else:
            cluster_cpu_avg = 0.0
            cluster_memory_avg = 0.0

        # Generate alerts
        alerts = []
        for peer in peers:
            if peer.cpu_percent >= self.config.alert_threshold_cpu:
                alerts.append(f"{peer.hostname}: CPU {peer.cpu_percent:.0f}%")
            if peer.memory_percent >= self.config.alert_threshold_memory:
                alerts.append(f"{peer.hostname}: MEM {peer.memory_percent:.0f}%")
            if peer.status == PeerStatus.OFFLINE:
                alerts.append(f"{peer.hostname}: OFFLINE")

        return MeshSummary(
            total_peers=total_peers,
            online_peers=online_peers,
            overloaded_peers=overloaded_peers,
            offline_peers=offline_peers,
            total_containers=total_containers,
            active_migrations=active_migrations,
            cluster_cpu_avg=cluster_cpu_avg,
            cluster_memory_avg=cluster_memory_avg,
            alerts=alerts,
        )

    def _update_panels(self, summary: MeshSummary):
        """Update all panels with current data."""
        # Summary panel
        self.summary_panel.update_content([
            f"{summary.online_peers}/{summary.total_peers} peers online",
            f"CPU: {summary.cluster_cpu_avg:.1f}% | MEM: {summary.cluster_memory_avg:.1f}%",
            f"{summary.active_migrations} migrations",
        ])

        # Peers panel
        peer_lines = []
        for peer in self.visualizer._peers.values():
            if not self.config.show_offline_peers and peer.status == PeerStatus.OFFLINE:
                continue
            peer_lines.append(self.metrics_display.format_peer_metrics(
                PeerMetrics(
                    peer_id=peer.peer_id,
                    hostname=peer.hostname,
                    cpu_percent=peer.cpu_percent,
                    memory_percent=peer.memory_percent,
                    container_count=peer.container_count,
                    status=peer.status,
                )
            ))
        self.peers_panel.update_content(peer_lines)

        # Migrations panel
        migration_lines = []
        for migration in list(self.visualizer._migrations.values()):
            if len(migration_lines) >= self.config.max_displayed_migrations:
                break

            status_icon = {
                MigrationStatus.PENDING: "⏳",
                MigrationStatus.IN_PROGRESS: "🔄",
                MigrationStatus.COMPLETED: "✅",
                MigrationStatus.FAILED: "❌",
            }.get(migration.status, "❓")

            progress_bar = self._format_progress_bar(migration.progress)
            migration_lines.append(
                f"{status_icon} {migration.container_name}: "
                f"{migration.source_peer_id} → {migration.target_peer_id} "
                f"{progress_bar}"
            )
        self.migrations_panel.update_content(migration_lines)

    def _format_progress_bar(self, progress: float, width: int = 10) -> str:
        """Format a progress bar."""
        filled = int(progress * width)
        empty = width - filled
        return "[" + "█" * filled + "░" * empty + "]"

    def _sync_visualizer(self):
        """Sync visualizer with load balancer data."""
        if not self.load_balancer:
            return

        # Get peer metrics from load balancer
        if hasattr(self.load_balancer, 'resource_monitor'):
            monitor = self.load_balancer.resource_monitor
            for peer_id, peer in monitor._peers.items():
                self.visualizer.update_peer(
                    peer_id=peer.peer_id,
                    hostname=peer.hostname,
                    cpu_percent=peer.cpu_percent,
                    memory_percent=peer.memory_percent,
                    container_count=peer.container_count,
                    status=peer.status,
                )

    def on_update(self, callback: Callable[[MeshSummary], None]):
        """Register callback for updates."""
        self._callbacks.append(callback)

    def get_status(self) -> dict[str, Any]:
        """Get dashboard status."""
        return {
            "running": self._running,
            "config": {
                "refresh_interval": self.config.refresh_interval,
                "auto_expand": self.config.auto_expand,
            },
            "panels": {
                "summary": self.summary_panel.state.value,
                "peers": self.peers_panel.state.value,
                "migrations": self.migrations_panel.state.value,
            },
            "last_summary": {
                "total_peers": self._last_summary.total_peers if self._last_summary else 0,
                "online_peers": self._last_summary.online_peers if self._last_summary else 0,
                "alerts": len(self._last_summary.alerts) if self._last_summary else 0,
            } if self._last_summary else None,
        }

    def get_peer_summaries(self) -> list[PeerSummary]:
        """Get summaries of all peers."""
        summaries = []
        for peer in self.visualizer._peers.values():
            is_alert = (
                peer.cpu_percent >= self.config.alert_threshold_cpu or
                peer.memory_percent >= self.config.alert_threshold_memory
            )
            summaries.append(PeerSummary(
                peer_id=peer.peer_id,
                hostname=peer.hostname,
                status=peer.status,
                cpu_percent=peer.cpu_percent,
                memory_percent=peer.memory_percent,
                container_count=peer.container_count,
                uptime_seconds=time.time() - peer.last_updated,
                is_alert=is_alert,
            ))
        return summaries

    def expand_all(self):
        """Expand all panels."""
        self.summary_panel.expand()
        self.peers_panel.expand()
        self.migrations_panel.expand()

    def collapse_all(self):
        """Collapse all panels."""
        self.summary_panel.collapse()
        self.peers_panel.collapse()
        self.migrations_panel.collapse()


# Convenience function
def create_mesh_dashboard(
    visualizer: ClusterVisualizer | None = None,
    load_balancer: LoadBalancer | None = None,
    config: DashboardConfig | None = None,
) -> MeshDashboard:
    """Create a mesh dashboard."""
    return MeshDashboard(
        visualizer=visualizer,
        load_balancer=load_balancer,
        config=config,
    )
