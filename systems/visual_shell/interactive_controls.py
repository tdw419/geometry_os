"""
Interactive Controls - Phase 34

Click-to-inspect, drag-to-migrate, and user controls.

Usage:
    from systems.visual_shell.interactive_controls import (
        InteractionManager,
        InteractionMode,
        InteractionConfig,
        PeerInspector,
        ContainerInspector,
        MigrationInspector,
        AlertPanel,
        create_interaction_manager,
    )

    # Create the manager
    manager = InteractionManager(
        visualizer=visualizer,
        load_balancer=load_balancer,
    )
    await manager.start()

    # Click to inspect a peer
    await manager.inspect_peer("peer-1")

    inspector = manager.get_inspector("peer-1")
    assert inspector.peer_id == "peer-1"

    # Get status
    status = manager.get_status()
"""

import asyncio
import logging
import time
from collections import defaultdict
from collections.abc import Callable
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
)

logger = logging.getLogger("InteractiveControls")


class InteractionMode(Enum):
    """Mode of interactive controls."""
    VIEW = "view"
    EDIT = "edit"
    DRAG_MIGRATE = "drag_migrate"
    INSPECT = "inspect"


@dataclass
class InteractionConfig:
    """Configuration for interaction manager."""
    default_mode: InteractionMode = InteractionMode.VIEW
    enable_drag_migrate: bool = True
    enable_keyboard_shortcuts: bool = True
    auto_expand_alerts: bool = True


@dataclass
class PeerInspector:
    """Inspector for peer details."""
    peer_id: str
    config: InteractionConfig | None = None
    is_active: bool = False
    created_at: float = field(default_factory=time.time)
    _data: dict[str, Any] = field(default_factory=dict)

    def update(self, data: dict[str, Any]):
        """Update inspector data."""
        self._data.update(data)

    def get_data(self) -> dict[str, Any]:
        """Get inspector data."""
        return self._data.copy()

    def activate(self):
        """Activate inspector."""
        self.is_active = True

    def deactivate(self):
        """Deactivate inspector."""
        self.is_active = False


@dataclass
class ContainerInspector:
    """Inspector for container details."""
    container_id: str
    config: InteractionConfig | None = None
    is_active: bool = False
    created_at: float = field(default_factory=time.time)
    _data: dict[str, Any] = field(default_factory=dict)

    def update(self, data: dict[str, Any]):
        """Update inspector data."""
        self._data.update(data)

    def get_data(self) -> dict[str, Any]:
        """Get inspector data."""
        return self._data.copy()

    def activate(self):
        """Activate inspector."""
        self.is_active = True

    def deactivate(self):
        """Deactivate inspector."""
        self.is_active = False


@dataclass
class MigrationInspector:
    """Inspector for migration details."""
    migration_id: str
    config: InteractionConfig | None = None
    is_active: bool = False
    created_at: float = field(default_factory=time.time)
    _data: dict[str, Any] = field(default_factory=dict)

    def update(self, data: dict[str, Any]):
        """Update inspector data."""
        self._data.update(data)

    def get_data(self) -> dict[str, Any]:
        """Get inspector data."""
        return self._data.copy()

    def activate(self):
        """Activate inspector."""
        self.is_active = True

    def deactivate(self):
        """Deactivate inspector."""
        self.is_active = False


@dataclass
class AlertPanel:
    """Panel for displaying alerts."""
    alert_type: str
    peer_id: str
    config: InteractionConfig | None = None
    is_visible: bool = False
    created_at: float = field(default_factory=time.time)
    message: str = ""
    _data: dict[str, Any] = field(default_factory=dict)

    def show(self):
        """Show the alert panel."""
        self.is_visible = True

    def hide(self):
        """Hide the alert panel."""
        self.is_visible = False

    def update(self, message: str, data: dict[str, Any] = None):
        """Update alert content."""
        self.message = message
        if data:
            self._data.update(data)


class InteractionPanel:
    """Generic interaction panel."""

    def __init__(
        self,
        title: str,
        config: InteractionConfig | None = None,
    ):
        self.title = title
        self.config = config
        self.is_active = False
        self.is_expanded = False
        self._content: list[str] = []
        self._last_update: float = 0

    def show(self):
        """Show the panel."""
        self.is_active = True

    def hide(self):
        """Hide the panel."""
        self.is_active = False

    def expand(self):
        """Expand the panel."""
        self.is_expanded = True

    def collapse(self):
        """Collapse the panel."""
        self.is_expanded = False

    def update_content(self, content: list[str]):
        """Update panel content."""
        self._content = content
        self._last_update = time.time()

    def get_content(self) -> list[str]:
        """Get panel content."""
        return self._content.copy()


class InteractionManager:
    """
    Manages interactive controls for the visual shell.

    Combines the visualizer, load balancer, and allows
    direct user interaction with the mesh through:
    click-to-inspect, drag-to-migrate, and keyboard shortcuts.
    """

    def __init__(
        self,
        visualizer: ClusterVisualizer | None = None,
        load_balancer=None,
        config: InteractionConfig | None = None,
    ):
        self.visualizer = visualizer or ClusterVisualizer()
        self.load_balancer = load_balancer
        self.config = config or InteractionConfig()

        self._running = False
        self._mode = self.config.default_mode

        # Inspectors
        self._peer_inspectors: dict[str, PeerInspector] = {}
        self._container_inspectors: dict[str, ContainerInspector] = {}
        self._migration_inspectors: dict[str, MigrationInspector] = {}

        # Panels
        self._panels: list[InteractionPanel] = []
        self._alert_panels: dict[str, AlertPanel] = {}

        # Active state
        self._active_inspector: Any | None = None

        # History
        self._history: list[dict[str, Any]] = []

        # Callbacks
        self._callbacks: dict[str, list[Callable]] = defaultdict(list)

    async def start(self):
        """Start the interaction manager."""
        if self._running:
            return

        self._running = True
        logger.info("Interactive controls manager started")

    async def stop(self):
        """Stop the interaction manager."""
        self._running = False
        # Clear inspectors
        self._peer_inspectors.clear()
        self._container_inspectors.clear()
        self._migration_inspectors.clear()
        logger.info("Interactive controls manager stopped")

    @property
    def mode(self) -> InteractionMode:
        """Get current mode."""
        return self._mode

    def set_mode(self, mode: InteractionMode):
        """Set interaction mode."""
        self._mode = mode
        logger.info(f"Interaction mode set to: {mode.value}")

    # Inspector management

    async def inspect_peer(self, peer_id: str) -> PeerInspector | None:
        """Inspect a peer by ID."""
        if peer_id not in self.visualizer._peers:
            return None

        if peer_id not in self._peer_inspectors:
            inspector = PeerInspector(peer_id, self.config)
            self._peer_inspectors[peer_id] = inspector

        inspector = self._peer_inspectors[peer_id]
        inspector.activate()
        self._active_inspector = inspector

        # Add to history
        self._history.append({
            "action": "inspect_peer",
            "peer_id": peer_id,
            "timestamp": time.time(),
        })

        return inspector

    async def inspect_container(self, container_id: str) -> ContainerInspector | None:
        """Inspect a container by ID."""
        if container_id not in self.visualizer._containers:
            return None

        if container_id not in self._container_inspectors:
            inspector = ContainerInspector(container_id, self.config)
            self._container_inspectors[container_id] = inspector

        inspector = self._container_inspectors[container_id]
        inspector.activate()
        self._active_inspector = inspector

        self._history.append({
            "action": "inspect_container",
            "container_id": container_id,
            "timestamp": time.time(),
        })

        return inspector

    async def inspect_migration(self, migration_id: str) -> MigrationInspector | None:
        """Inspect a migration by ID."""
        if migration_id not in self.visualizer._migrations:
            return None

        if migration_id not in self._migration_inspectors:
            inspector = MigrationInspector(migration_id, self.config)
            self._migration_inspectors[migration_id] = inspector

        inspector = self._migration_inspectors[migration_id]
        inspector.activate()
        self._active_inspector = inspector

        self._history.append({
            "action": "inspect_migration",
            "migration_id": migration_id,
            "timestamp": time.time(),
        })

        return inspector

    def get_inspector(self, peer_id: str) -> PeerInspector | None:
        """Get inspector for a peer by ID."""
        return self._peer_inspectors.get(peer_id)

    def get_container_inspector(self, container_id: str) -> ContainerInspector | None:
        """Get inspector for a container by ID."""
        return self._container_inspectors.get(container_id)

    def get_migration_inspector(self, migration_id: str) -> MigrationInspector | None:
        """Get migration inspector by ID."""
        return self._migration_inspectors.get(migration_id)

    def get_all_inspectors(self) -> list[Any]:
        """Get all inspector objects."""
        inspectors = []
        inspectors.extend(self._peer_inspectors.values())
        inspectors.extend(self._container_inspectors.values())
        inspectors.extend(self._migration_inspectors.values())
        return inspectors

    def get_active_inspector(self) -> Any | None:
        """Get active inspector."""
        return self._active_inspector

    def clear_inspectors(self):
        """Clear all inspectors."""
        self._peer_inspectors.clear()
        self._container_inspectors.clear()
        self._migration_inspectors.clear()
        self._active_inspector = None

    # Panel management

    def create_panel(self, title: str) -> InteractionPanel:
        """Create a new panel."""
        panel = InteractionPanel(title, self.config)
        self._panels.append(panel)
        return panel

    def get_panels(self) -> list[InteractionPanel]:
        """Get all panels."""
        return self._panels.copy()

    def get_active_panel(self) -> InteractionPanel | None:
        """Get active panel."""
        for panel in self._panels:
            if panel.is_active:
                return panel
        return None

    # Alert management

    def show_alert(self, alert_type: str, peer_id: str, message: str = ""):
        """Show an alert panel."""
        key = f"{alert_type}:{peer_id}"
        if key not in self._alert_panels:
            panel = AlertPanel(alert_type, peer_id, self.config)
            self._alert_panels[key] = panel

        panel = self._alert_panels[key]
        panel.update(message)
        panel.show()

    def hide_alert(self, alert_type: str, peer_id: str):
        """Hide an alert panel."""
        key = f"{alert_type}:{peer_id}"
        if key in self._alert_panels:
            self._alert_panels[key].hide()

    def get_alert_panels(self) -> list[AlertPanel]:
        """Get all visible alert panels."""
        return [p for p in self._alert_panels.values() if p.is_visible]

    # History

    def get_history(self, limit: int = 50) -> list[dict[str, Any]]:
        """Get interaction history."""
        return self._history[-limit:]

    def clear_history(self):
        """Clear interaction history."""
        self._history.clear()

    # Status

    def get_status(self) -> dict[str, Any]:
        """Get interaction manager status."""
        return {
            "running": self._running,
            "mode": self._mode.value,
            "peer_inspector_count": len(self._peer_inspectors),
            "container_inspector_count": len(self._container_inspectors),
            "migration_inspector_count": len(self._migration_inspectors),
            "panel_count": len(self._panels),
            "alert_count": len(self.get_alert_panels()),
            "history_size": len(self._history),
        }

    # Callbacks

    def on(self, event: str, callback: Callable):
        """Register callback for event."""
        self._callbacks[event].append(callback)

    def off(self, event: str, callback: Callable):
        """Unregister callback for event."""
        if callback in self._callbacks[event]:
            self._callbacks[event].remove(callback)

    async def _emit(self, event: str, data: Any = None):
        """Emit event to callbacks."""
        for callback in self._callbacks[event]:
            try:
                result = callback(data)
                if asyncio.iscoroutine(result):
                    await result
            except Exception as e:
                logger.error(f"Callback error for {event}: {e}")


# Convenience function
def create_interaction_manager(
    visualizer: ClusterVisualizer | None = None,
    load_balancer=None,
    config: InteractionConfig | None = None,
) -> InteractionManager:
    """Create an interaction manager."""
    return InteractionManager(
        visualizer=visualizer,
        load_balancer=load_balancer,
        config=config,
    )
