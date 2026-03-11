"""
Cluster Visualizer - Phase 31

Visualizes the mesh cluster in the PixiJS visual shell.

Shows peers, containers, and migrations in real-time on the
infinite desktop. Part of v3.0 Visual Mesh milestone.

Usage:
    from systems.visual_shell.cluster_visualizer import (
        ClusterVisualizer,
        PeerSprite,
        ContainerSprite,
        MigrationTrail,
    )

    # Create visualizer
    visualizer = ClusterVisualizer(app)
    await visualizer.start()

    # Update from mesh events
    visualizer.update_peer("peer-1", cpu=50.0, memory=60.0)
    visualizer.show_migration("peer-1", "peer-2", "container-1")
"""

import asyncio
import logging
import math
import time
from dataclasses import dataclass, field
from enum import Enum
from typing import Any

logger = logging.getLogger("ClusterVisualizer")

# Try to import PixiJS - handle gracefully if not available
try:
    import pixie
    from pixie import Container, Graphics, Sprite, Text
    PIXI_AVAILABLE = True
except ImportError:
    PIXI_AVAILABLE = False
    Sprite = object
    Graphics = object
    Text = object
    Container = object


class PeerStatus(Enum):
    """Visual status of a peer."""
    ONLINE = "online"
    OVERLOADED = "overloaded"
    OFFLINE = "offline"
    DRAINING = "draining"


class MigrationStatus(Enum):
    """Status of a migration visualization."""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    FAILED = "failed"


@dataclass
class PeerVisualState:
    """Visual state of a peer node."""
    peer_id: str
    hostname: str
    x: float
    y: float
    cpu_percent: float = 0.0
    memory_percent: float = 0.0
    container_count: int = 0
    status: PeerStatus = PeerStatus.ONLINE
    last_updated: float = field(default_factory=time.time)

    # Visual elements
    sprite: Any | None = None
    label: Any | None = None
    cpu_bar: Any | None = None
    memory_bar: Any | None = None


@dataclass
class ContainerVisualState:
    """Visual state of a container."""
    container_id: str
    container_name: str
    peer_id: str
    workload_type: str = "generic"
    memory_mb: int = 512
    x: float = 0.0
    y: float = 0.0
    sprite: Any | None = None
    label: Any | None = None


@dataclass
class MigrationVisual:
    """Visual representation of a migration."""
    migration_id: str
    source_peer_id: str
    target_peer_id: str
    container_name: str
    status: MigrationStatus = MigrationStatus.PENDING
    progress: float = 0.0
    start_time: float = field(default_factory=time.time)
    trail: Any | None = None


class PeerSprite:
    """
    Visual sprite for a peer node.

    Shows as a circle with CPU/memory bars.
    """

    def __init__(
        self,
        peer_id: str,
        x: float,
        y: float,
        radius: float = 60,
    ):
        if not PIXI_AVAILABLE:
            self.peer_id = peer_id
            self.x = x
            self.y = y
            self.radius = radius
            self._graphics = None
            return

        self.peer_id = peer_id
        self.x = x
        self.y = y
        self.radius = radius

        # Create container
        self._container = Container()
        self._container.x = x
        self._container.y = y

        # Main circle
        self._circle = Graphics()
        self._circle.begin_fill(0x2d5a88, 0.8)  # Dark blue
        self._circle.draw_circle(0, 0, radius)
        self._circle.end_fill()
        self._container.add_child(self._circle)

        # CPU bar (top)
        self._cpu_bar_bg = Graphics()
        self._cpu_bar_bg.begin_fill(0x333333, 0.5)
        self._cpu_bar_bg.draw_rect(-radius + 10, -radius/2, radius * 2 - 20, 8)
        self._cpu_bar_bg.end_fill()
        self._container.add_child(self._cpu_bar_bg)

        self._cpu_bar = Graphics()
        self._cpu_bar.begin_fill(0x00ff00, 0.8)
        self._cpu_bar.draw_rect(-radius + 10, -radius/2, 0, 8)  # Start at 0
        self._cpu_bar.end_fill()
        self._container.add_child(self._cpu_bar)

        # Memory bar (bottom)
        self._mem_bar_bg = Graphics()
        self._mem_bar_bg.begin_fill(0x333333, 0.5)
        self._mem_bar_bg.draw_rect(-radius + 10, -radius/2 + 12, radius * 2 - 20, 8)
        self._mem_bar_bg.end_fill()
        self._container.add_child(self._mem_bar_bg)

        self._mem_bar = Graphics()
        self._mem_bar.begin_fill(0x0088ff, 0.8)
        self._mem_bar.draw_rect(-radius + 10, -radius/2 + 12, 0, 8)
        self._mem_bar.end_fill()
        self._container.add_child(self._mem_bar)

        # Label
        self._label = Text(peer_id, font_family="monospace", font_size=10)
        self._label.y = radius + 15
        self._container.add_child(self._label)

    def update_metrics(self, cpu_percent: float, memory_percent: float):
        """Update CPU and memory bars."""
        if not PIXI_AVAILABLE:
            return

        bar_width = self.radius * 2 - 20

        # Update CPU bar
        cpu_width = bar_width * (cpu_percent / 100)
        self._cpu_bar.clear()
        self._cpu_bar.begin_fill(self._get_cpu_color(cpu_percent), 0.8)
        self._cpu_bar.draw_rect(-self.radius + 10, -self.radius/2, cpu_width, 8)
        self._cpu_bar.end_fill()

        # Update memory bar
        mem_width = bar_width * (memory_percent / 100)
        self._mem_bar.clear()
        self._mem_bar.begin_fill(self._get_mem_color(memory_percent), 0.8)
        self._mem_bar.draw_rect(-self.radius + 10, -self.radius/2 + 12, mem_width, 8)
        self._mem_bar.end_fill()

    def _get_cpu_color(self, percent: float) -> int:
        """Get color based on CPU percentage."""
        if percent < 50:
            return 0x00ff00  # Green
        elif percent < 80:
            return 0xffff00  # Yellow
        else:
            return 0xff0000  # Red

    def _get_mem_color(self, percent: float) -> int:
        """Get color based on memory percentage."""
        if percent < 50:
            return 0x0088ff  # Blue
        elif percent < 80:
            return 0xff8800  # Orange
        else:
            return 0xff0000  # Red

    def set_status(self, status: PeerStatus):
        """Update visual status."""
        if not PIXI_AVAILABLE:
            return

        colors = {
            PeerStatus.ONLINE: 0x2d5a88,
            PeerStatus.OVERLOADED: 0xff4444,
            PeerStatus.OFFLINE: 0x666666,
            PeerStatus.DRAINING: 0xffaa00,
        }

        self._circle.clear()
        self._circle.begin_fill(colors.get(status, 0x2d5a88), 0.8)
        self._circle.draw_circle(0, 0, self.radius)
        self._circle.end_fill()

    def get_display_object(self):
        """Get the PixiJS display object."""
        if PIXI_AVAILABLE:
            return self._container
        return None


class ContainerSprite:
    """
    Visual sprite for a container.

    Shows as a small rectangle on the peer.
    """

    def __init__(
        self,
        container_id: str,
        container_name: str,
        x: float,
        y: float,
        width: float = 40,
        height: float = 30,
        color: int = 0x44aa44,
    ):
        if not PIXI_AVAILABLE:
            self.container_id = container_id
            self.container_name = container_name
            self.x = x
            self.y = y
            self.width = width
            self.height = height
            self._graphics = None
            return

        self.container_id = container_id
        self.container_name = container_name
        self.x = x
        self.y = y
        self.width = width
        self.height = height

        self._graphics = Graphics()
        self._graphics.x = x
        self._graphics.y = y
        self._graphics.begin_fill(color, 0.7)
        self._graphics.line_style(1, 0xffffff, 0.3)
        self._graphics.draw_rect(0, 0, width, height)
        self._graphics.end_fill()

    def get_display_object(self):
        """Get the PixiJS display object."""
        if PIXI_AVAILABLE:
            return self._graphics
        return None


class MigrationTrail:
    """
    Visual trail showing a migration in progress.

    Animated line from source to target peer.
    """

    def __init__(
        self,
        source_x: float,
        source_y: float,
        target_x: float,
        target_y: float,
        color: int = 0x00ffff,
    ):
        if not PIXI_AVAILABLE:
            self.source_x = source_x
            self.source_y = source_y
            self.target_x = target_x
            self.target_y = target_y
            return

        self.source_x = source_x
        self.source_y = source_y
        self.target_x = target_x
        self.target_y = target_y

        self._graphics = Graphics()
        self._progress = 0.0
        self._color = color
        self._update_line()

    def _update_line(self):
        """Update the line based on current progress."""
        if not PIXI_AVAILABLE:
            return

        self._graphics.clear()

        # Calculate current endpoint based on progress
        current_x = self.source_x + (self.target_x - self.source_x) * self._progress
        current_y = self.source_y + (self.target_y - self.source_y) * self._progress

        # Draw dashed line
        self._graphics.line_style(2, self._color, 0.8)
        self._graphics.move_to(self.source_x, self.source_y)
        self._graphics.line_to(current_x, current_y)

        # Draw arrowhead at current position
        angle = math.atan2(self.target_y - self.source_y, self.target_x - self.source_x)
        arrow_size = 10

        self._graphics.begin_fill(self._color, 0.8)
        self._graphics.move_to(current_x, current_y)
        self._graphics.line_to(
            current_x - arrow_size * math.cos(angle - math.pi/6),
            current_y - arrow_size * math.sin(angle - math.pi/6)
        )
        self._graphics.line_to(
            current_x - arrow_size * math.cos(angle + math.pi/6),
            current_y - arrow_size * math.sin(angle + math.pi/6)
        )
        self._graphics.end_fill()

    def set_progress(self, progress: float):
        """Update migration progress (0.0 to 1.0)."""
        self._progress = min(1.0, max(0.0, progress))
        self._update_line()

    def complete(self):
        """Mark migration as complete."""
        self._progress = 1.0
        self._update_line()

    def get_display_object(self):
        """Get the PixiJS display object."""
        if PIXI_AVAILABLE:
            return self._graphics
        return None


class ClusterVisualizer:
    """
    Main visualizer for the mesh cluster.

    Manages all visual elements and updates them from mesh events.
    """

    def __init__(
        self,
        app=None,
        viewport_width: float = 1200,
        viewport_height: float = 800,
    ):
        self.app = app
        self.viewport_width = viewport_width
        self.viewport_height = viewport_height

        # State
        self._peers: dict[str, PeerVisualState] = {}
        self._containers: dict[str, ContainerVisualState] = {}
        self._migrations: dict[str, MigrationVisual] = {}

        # Visual elements
        self._peer_sprites: dict[str, PeerSprite] = {}
        self._container_sprites: dict[str, ContainerSprite] = {}
        self._migration_trails: dict[str, MigrationTrail] = {}

        # Layout
        self._peer_positions: dict[str, tuple[float, float]] = {}
        self._layout_dirty = True

        # Running state
        self._running = False
        self._update_task: asyncio.Task | None = None

    async def start(self):
        """Start the visualizer."""
        if self._running:
            return

        self._running = True
        self._update_task = asyncio.create_task(self._update_loop())
        logger.info("Cluster visualizer started")

    async def stop(self):
        """Stop the visualizer."""
        self._running = False
        if self._update_task:
            self._update_task.cancel()
            try:
                await self._update_task
            except asyncio.CancelledError:
                pass
        logger.info("Cluster visualizer stopped")

    async def _update_loop(self):
        """Periodic update loop for animations."""
        while self._running:
            try:
                await self._update_animations()
                await asyncio.sleep(0.05)  # 20 FPS
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Animation error: {e}")
                await asyncio.sleep(0.1)

    async def _update_animations(self):
        """Update all animations."""
        # Update migration trails
        for migration_id, migration in self._migrations.items():
            if migration.status == MigrationStatus.IN_PROGRESS:
                trail = self._migration_trails.get(migration_id)
                if trail:
                    trail.set_progress(migration.progress)

    def update_peer(
        self,
        peer_id: str,
        hostname: str = "",
        cpu_percent: float = 0.0,
        memory_percent: float = 0.0,
        container_count: int = 0,
        status: PeerStatus = PeerStatus.ONLINE,
    ):
        """Update or create a peer visualization."""
        # Calculate position if new
        if peer_id not in self._peer_positions:
            self._layout_dirty = True
            self._peer_positions[peer_id] = self._calculate_peer_position(peer_id)

        x, y = self._peer_positions[peer_id]

        # Update state
        state = PeerVisualState(
            peer_id=peer_id,
            hostname=hostname or peer_id,
            x=x,
            y=y,
            cpu_percent=cpu_percent,
            memory_percent=memory_percent,
            container_count=container_count,
            status=status,
        )
        self._peers[peer_id] = state

        # Update or create sprite
        if peer_id in self._peer_sprites:
            sprite = self._peer_sprites[peer_id]
            sprite.update_metrics(cpu_percent, memory_percent)
            sprite.set_status(status)
        else:
            sprite = PeerSprite(peer_id, x, y)
            sprite.update_metrics(cpu_percent, memory_percent)
            sprite.set_status(status)
            self._peer_sprites[peer_id] = sprite

    def _calculate_peer_position(self, peer_id: str) -> tuple[float, float]:
        """Calculate position for a new peer using circular layout."""
        count = len(self._peer_positions)

        # Center of viewport
        cx = self.viewport_width / 2
        cy = self.viewport_height / 2

        # Radius based on count
        radius = min(self.viewport_width, self.viewport_height) / 3

        # Angle for this peer
        angle = (count * 2 * math.pi / max(count + 1, 6)) - math.pi / 2

        x = cx + radius * math.cos(angle)
        y = cy + radius * math.sin(angle)

        return (x, y)

    def remove_peer(self, peer_id: str):
        """Remove a peer visualization."""
        if peer_id in self._peers:
            del self._peers[peer_id]
        if peer_id in self._peer_sprites:
            del self._peer_sprites[peer_id]
        if peer_id in self._peer_positions:
            del self._peer_positions[peer_id]
        self._layout_dirty = True

    def add_container(
        self,
        container_id: str,
        container_name: str,
        peer_id: str,
        workload_type: str = "generic",
        memory_mb: int = 512,
    ):
        """Add a container visualization to a peer."""
        if peer_id not in self._peers:
            logger.warning(f"Peer {peer_id} not found for container {container_id}")
            return

        peer = self._peers[peer_id]

        # Calculate position relative to peer
        container_count = sum(
            1 for c in self._containers.values() if c.peer_id == peer_id
        )
        offset_x = (container_count % 4) * 45 - 67
        offset_y = (container_count // 4) * 35 - 17

        state = ContainerVisualState(
            container_id=container_id,
            container_name=container_name,
            peer_id=peer_id,
            workload_type=workload_type,
            memory_mb=memory_mb,
            x=peer.x + offset_x,
            y=peer.y + offset_y,
        )
        self._containers[container_id] = state

        # Create sprite
        colors = {
            "web": 0x44aa44,
            "database": 0xaa4444,
            "compute": 0x4444aa,
            "gpu": 0xaa44aa,
            "generic": 0x888888,
        }
        sprite = ContainerSprite(
            container_id,
            container_name,
            state.x,
            state.y,
            color=colors.get(workload_type, 0x888888),
        )
        self._container_sprites[container_id] = sprite

    def remove_container(self, container_id: str):
        """Remove a container visualization."""
        if container_id in self._containers:
            del self._containers[container_id]
        if container_id in self._container_sprites:
            del self._container_sprites[container_id]

    def show_migration(
        self,
        migration_id: str,
        source_peer_id: str,
        target_peer_id: str,
        container_name: str,
    ):
        """Start showing a migration animation."""
        if source_peer_id not in self._peers or target_peer_id not in self._peers:
            logger.warning("Source or target peer not found for migration")
            return

        source = self._peers[source_peer_id]
        target = self._peers[target_peer_id]

        migration = MigrationVisual(
            migration_id=migration_id,
            source_peer_id=source_peer_id,
            target_peer_id=target_peer_id,
            container_name=container_name,
            status=MigrationStatus.IN_PROGRESS,
        )
        self._migrations[migration_id] = migration

        # Create trail
        trail = MigrationTrail(source.x, source.y, target.x, target.y)
        self._migration_trails[migration_id] = trail

    def update_migration_progress(self, migration_id: str, progress: float):
        """Update migration progress."""
        if migration_id in self._migrations:
            self._migrations[migration_id].progress = progress

    def complete_migration(self, migration_id: str, success: bool = True):
        """Complete a migration animation."""
        if migration_id in self._migrations:
            self._migrations[migration_id].status = (
                MigrationStatus.COMPLETED if success else MigrationStatus.FAILED
            )
            self._migrations[migration_id].progress = 1.0

            # Schedule fade out (handles no event loop gracefully)
            try:
                loop = asyncio.get_running_loop()
                loop.create_task(self._fade_migration(migration_id))
            except RuntimeError:
                # No running loop - schedule for later or handle synchronously
                # For tests without async context, just mark as done
                pass

    async def _fade_migration(self, migration_id: str):
        """Fade out and remove migration trail."""
        await asyncio.sleep(2.0)

        if migration_id in self._migration_trails:
            del self._migration_trails[migration_id]
        if migration_id in self._migrations:
            del self._migrations[migration_id]

    def get_all_display_objects(self) -> list[Any]:
        """Get all PixiJS display objects for rendering."""
        objects = []

        # Add peer sprites
        for sprite in self._peer_sprites.values():
            obj = sprite.get_display_object()
            if obj:
                objects.append(obj)

        # Add container sprites
        for sprite in self._container_sprites.values():
            obj = sprite.get_display_object()
            if obj:
                objects.append(obj)

        # Add migration trails
        for trail in self._migration_trails.values():
            obj = trail.get_display_object()
            if obj:
                objects.append(obj)

        return objects

    def get_status(self) -> dict[str, Any]:
        """Get visualizer status."""
        return {
            "running": self._running,
            "peer_count": len(self._peers),
            "container_count": len(self._containers),
            "active_migrations": sum(
                1 for m in self._migrations.values()
                if m.status == MigrationStatus.IN_PROGRESS
            ),
            "layout_dirty": self._layout_dirty,
        }


# Convenience function
def create_cluster_visualizer(app=None) -> ClusterVisualizer:
    """Create a cluster visualizer."""
    return ClusterVisualizer(app=app)
