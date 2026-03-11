"""
Tests for Cluster Visualizer (Phase 31)

Tests peer sprites, container sprites, migration trails, and visualizer.
"""

import asyncio
from unittest.mock import Mock

import pytest

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
    ContainerSprite,
    ContainerVisualState,
    MigrationStatus,
    MigrationTrail,
    MigrationVisual,
    PeerSprite,
    PeerStatus,
    PeerVisualState,
    create_cluster_visualizer,
)


class TestPeerStatus:
    """Tests for PeerStatus enum."""

    def test_peer_statuses(self):
        assert PeerStatus.ONLINE.value == "online"
        assert PeerStatus.OVERLOADED.value == "overloaded"
        assert PeerStatus.OFFLINE.value == "offline"
        assert PeerStatus.DRAINING.value == "draining"


class TestMigrationStatus:
    """Tests for MigrationStatus enum."""

    def test_migration_statuses(self):
        assert MigrationStatus.PENDING.value == "pending"
        assert MigrationStatus.IN_PROGRESS.value == "in_progress"
        assert MigrationStatus.COMPLETED.value == "completed"
        assert MigrationStatus.FAILED.value == "failed"


class TestPeerVisualState:
    """Tests for PeerVisualState dataclass."""

    def test_state_creation(self):
        state = PeerVisualState(
            peer_id="peer-1",
            hostname="peer1.local",
            x=100.0,
            y=200.0,
        )
        assert state.peer_id == "peer-1"
        assert state.hostname == "peer1.local"
        assert state.x == 100.0
        assert state.y == 200.0
        assert state.cpu_percent == 0.0
        assert state.memory_percent == 0.0
        assert state.status == PeerStatus.ONLINE

    def test_state_with_metrics(self):
        state = PeerVisualState(
            peer_id="peer-1",
            hostname="peer1.local",
            x=100.0,
            y=200.0,
            cpu_percent=75.5,
            memory_percent=60.0,
            container_count=5,
            status=PeerStatus.OVERLOADED,
        )
        assert state.cpu_percent == 75.5
        assert state.memory_percent == 60.0
        assert state.container_count == 5
        assert state.status == PeerStatus.OVERLOADED


class TestContainerVisualState:
    """Tests for ContainerVisualState dataclass."""

    def test_state_creation(self):
        state = ContainerVisualState(
            container_id="container-1",
            container_name="web-server",
            peer_id="peer-1",
        )
        assert state.container_id == "container-1"
        assert state.container_name == "web-server"
        assert state.peer_id == "peer-1"
        assert state.workload_type == "generic"
        assert state.memory_mb == 512


class TestMigrationVisual:
    """Tests for MigrationVisual dataclass."""

    def test_visual_creation(self):
        visual = MigrationVisual(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="web-server",
        )
        assert visual.migration_id == "migr-1"
        assert visual.source_peer_id == "peer-1"
        assert visual.target_peer_id == "peer-2"
        assert visual.container_name == "web-server"
        assert visual.status == MigrationStatus.PENDING
        assert visual.progress == 0.0


class TestPeerSprite:
    """Tests for PeerSprite."""

    def test_sprite_creation(self):
        sprite = PeerSprite("peer-1", 100.0, 200.0, radius=60)
        assert sprite.peer_id == "peer-1"
        assert sprite.x == 100.0
        assert sprite.y == 200.0
        assert sprite.radius == 60

    def test_sprite_custom_radius(self):
        sprite = PeerSprite("peer-1", 100.0, 200.0, radius=80)
        assert sprite.radius == 80

    def test_get_display_object_without_pixi(self):
        sprite = PeerSprite("peer-1", 100.0, 200.0)
        obj = sprite.get_display_object()
        # Returns None when PixiJS not available
        assert obj is None


class TestContainerSprite:
    """Tests for ContainerSprite."""

    def test_sprite_creation(self):
        sprite = ContainerSprite(
            "container-1",
            "web-server",
            100.0,
            200.0,
        )
        assert sprite.container_id == "container-1"
        assert sprite.container_name == "web-server"
        assert sprite.x == 100.0
        assert sprite.y == 200.0

    def test_sprite_custom_size(self):
        sprite = ContainerSprite(
            "container-1",
            "web-server",
            100.0,
            200.0,
            width=50,
            height=40,
        )
        assert sprite.width == 50
        assert sprite.height == 40

    def test_sprite_custom_color(self):
        sprite = ContainerSprite(
            "container-1",
            "web-server",
            100.0,
            200.0,
            color=0x44aa44,
        )
        # Color is stored internally
        assert sprite.container_id == "container-1"

    def test_get_display_object_without_pixi(self):
        sprite = ContainerSprite("container-1", "web-server", 100.0, 200.0)
        obj = sprite.get_display_object()
        # Returns None when PixiJS not available
        assert obj is None


class TestMigrationTrail:
    """Tests for MigrationTrail."""

    def test_trail_creation(self):
        trail = MigrationTrail(100.0, 200.0, 300.0, 400.0)
        assert trail.source_x == 100.0
        assert trail.source_y == 200.0
        assert trail.target_x == 300.0
        assert trail.target_y == 400.0

    def test_trail_custom_color(self):
        trail = MigrationTrail(100.0, 200.0, 300.0, 400.0, color=0xff00ff)
        # Color is stored internally
        assert trail.source_x == 100.0

    def test_set_progress(self):
        trail = MigrationTrail(0.0, 0.0, 100.0, 0.0)
        trail.set_progress(0.5)
        assert trail._progress == 0.5

    def test_set_progress_clamped(self):
        trail = MigrationTrail(0.0, 0.0, 100.0, 0.0)
        trail.set_progress(1.5)
        assert trail._progress == 1.0

        trail.set_progress(-0.5)
        assert trail._progress == 0.0

    def test_complete(self):
        trail = MigrationTrail(0.0, 0.0, 100.0, 0.0)
        trail.complete()
        assert trail._progress == 1.0

    def test_get_display_object_without_pixi(self):
        trail = MigrationTrail(100.0, 200.0, 300.0, 400.0)
        obj = trail.get_display_object()
        # Returns None when PixiJS not available
        assert obj is None


class TestClusterVisualizer:
    """Tests for ClusterVisualizer."""

    @pytest.fixture
    def visualizer(self):
        return ClusterVisualizer()

    def test_visualizer_creation(self, visualizer):
        assert visualizer._running is False
        assert len(visualizer._peers) == 0
        assert len(visualizer._containers) == 0
        assert len(visualizer._migrations) == 0

    def test_update_peer(self, visualizer):
        visualizer.update_peer(
            peer_id="peer-1",
            hostname="peer1.local",
            cpu_percent=50.0,
            memory_percent=60.0,
            container_count=3,
        )

        assert "peer-1" in visualizer._peers
        peer = visualizer._peers["peer-1"]
        assert peer.hostname == "peer1.local"
        assert peer.cpu_percent == 50.0
        assert peer.memory_percent == 60.0
        assert peer.container_count == 3
        assert peer.status == PeerStatus.ONLINE

    def test_update_peer_with_status(self, visualizer):
        visualizer.update_peer(
            peer_id="peer-1",
            hostname="peer1.local",
            status=PeerStatus.OVERLOADED,
        )

        assert visualizer._peers["peer-1"].status == PeerStatus.OVERLOADED

    def test_update_peer_creates_sprite(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")

        assert "peer-1" in visualizer._peer_sprites
        sprite = visualizer._peer_sprites["peer-1"]
        assert sprite.peer_id == "peer-1"

    def test_update_peer_updates_existing(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local", cpu_percent=30.0)
        visualizer.update_peer("peer-1", "peer1.local", cpu_percent=70.0)

        # Should still only have one peer
        assert len(visualizer._peers) == 1
        assert visualizer._peers["peer-1"].cpu_percent == 70.0

    def test_remove_peer(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.remove_peer("peer-1")

        assert "peer-1" not in visualizer._peers
        assert "peer-1" not in visualizer._peer_sprites
        assert "peer-1" not in visualizer._peer_positions

    def test_add_container(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.add_container(
            container_id="container-1",
            container_name="web-server",
            peer_id="peer-1",
            workload_type="web",
            memory_mb=1024,
        )

        assert "container-1" in visualizer._containers
        container = visualizer._containers["container-1"]
        assert container.container_name == "web-server"
        assert container.peer_id == "peer-1"
        assert container.workload_type == "web"
        assert container.memory_mb == 1024

    def test_add_container_creates_sprite(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.add_container("container-1", "web", "peer-1")

        assert "container-1" in visualizer._container_sprites

    def test_add_container_unknown_peer(self, visualizer):
        # Should not raise, just log warning
        visualizer.add_container("container-1", "web", "unknown-peer")

        assert "container-1" not in visualizer._containers

    def test_add_container_positioning(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")

        # Add multiple containers
        for i in range(5):
            visualizer.add_container(f"container-{i}", f"web-{i}", "peer-1")

        # All should have different positions
        positions = [
            (visualizer._containers[f"container-{i}"].x,
             visualizer._containers[f"container-{i}"].y)
            for i in range(5)
        ]

        # Check positions are relative to peer
        peer = visualizer._peers["peer-1"]
        for x, y in positions:
            # Positions should be near the peer
            assert abs(x - peer.x) < 100
            assert abs(y - peer.y) < 100

    def test_remove_container(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.add_container("container-1", "web", "peer-1")
        visualizer.remove_container("container-1")

        assert "container-1" not in visualizer._containers
        assert "container-1" not in visualizer._container_sprites

    def test_show_migration(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration(
            migration_id="migr-1",
            source_peer_id="peer-1",
            target_peer_id="peer-2",
            container_name="web-server",
        )

        assert "migr-1" in visualizer._migrations
        migration = visualizer._migrations["migr-1"]
        assert migration.source_peer_id == "peer-1"
        assert migration.target_peer_id == "peer-2"
        assert migration.container_name == "web-server"
        assert migration.status == MigrationStatus.IN_PROGRESS

    def test_show_migration_creates_trail(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")

        assert "migr-1" in visualizer._migration_trails

    def test_show_migration_unknown_peers(self, visualizer):
        # Should not raise
        visualizer.show_migration("migr-1", "unknown-1", "unknown-2", "web")

        assert "migr-1" not in visualizer._migrations

    def test_update_migration_progress(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")

        visualizer.update_migration_progress("migr-1", 0.5)
        assert visualizer._migrations["migr-1"].progress == 0.5

    def test_update_migration_progress_unknown(self, visualizer):
        # Should not raise
        visualizer.update_migration_progress("unknown", 0.5)

    def test_complete_migration(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")

        visualizer.complete_migration("migr-1", success=True)
        assert visualizer._migrations["migr-1"].status == MigrationStatus.COMPLETED
        assert visualizer._migrations["migr-1"].progress == 1.0

    def test_complete_migration_failed(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")

        visualizer.complete_migration("migr-1", success=False)
        assert visualizer._migrations["migr-1"].status == MigrationStatus.FAILED

    @pytest.mark.asyncio
    async def test_start_stop(self, visualizer):
        await visualizer.start()
        assert visualizer._running is True

        await asyncio.sleep(0.1)

        await visualizer.stop()
        assert visualizer._running is False

    @pytest.mark.asyncio
    async def test_update_loop_runs(self, visualizer):
        await visualizer.start()

        # Add migration to animate
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")
        visualizer.update_migration_progress("migr-1", 0.3)

        await asyncio.sleep(0.15)  # Let update loop run

        await visualizer.stop()

    def test_get_all_display_objects(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.add_container("container-1", "web", "peer-1")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")

        objects = visualizer.get_all_display_objects()
        # Without PixiJS, all return None
        assert objects == []

    def test_get_status(self, visualizer):
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.add_container("container-1", "web", "peer-1")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")

        status = visualizer.get_status()

        assert status["running"] is False
        assert status["peer_count"] == 2
        assert status["container_count"] == 1
        assert status["active_migrations"] == 1

    def test_calculate_peer_position(self, visualizer):
        # First peer - use update_peer to properly track positions
        visualizer.update_peer("peer-1", "peer1.local")
        pos1 = visualizer._peer_positions["peer-1"]
        assert pos1[0] > 0
        assert pos1[1] > 0

        # Second peer should have different position
        visualizer.update_peer("peer-2", "peer2.local")
        pos2 = visualizer._peer_positions["peer-2"]
        # Positions should be different (circular layout)
        assert pos1 != pos2

        # Third peer
        visualizer.update_peer("peer-3", "peer3.local")
        pos3 = visualizer._peer_positions["peer-3"]
        assert pos3 != pos1
        assert pos3 != pos2


class TestCreateClusterVisualizer:
    """Tests for create_cluster_visualizer function."""

    def test_create_defaults(self):
        visualizer = create_cluster_visualizer()

        assert visualizer.viewport_width == 1200
        assert visualizer.viewport_height == 800

    def test_create_with_app(self):
        app = Mock()
        visualizer = create_cluster_visualizer(app=app)

        assert visualizer.app == app

    def test_create_with_dimensions(self):
        visualizer = ClusterVisualizer(
            viewport_width=1920,
            viewport_height=1080,
        )

        assert visualizer.viewport_width == 1920
        assert visualizer.viewport_height == 1080


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
