"""
Tests for Interactive Controls (Phase 34)

Tests click-to-inspect, drag-to-migrate, and user controls.
"""

import pytest

from systems.visual_shell.cluster_visualizer import (
    ClusterVisualizer,
)
from systems.visual_shell.interactive_controls import (
    AlertPanel,
    ContainerInspector,
    InteractionConfig,
    InteractionManager,
    InteractionMode,
    InteractionPanel,
    MigrationInspector,
    PeerInspector,
    create_interaction_manager,
)


class TestInteractionMode:
    """Tests for InteractionMode enum."""

    def test_modes(self):
        assert InteractionMode.VIEW.value == "view"
        assert InteractionMode.EDIT.value == "edit"
        assert InteractionMode.DRAG_MIGRATE.value == "drag_migrate"
        assert InteractionMode.INSPECT.value == "inspect"


class TestInteractionConfig:
    """Tests for InteractionConfig dataclass."""

    def test_default_config(self):
        config = InteractionConfig()
        assert config.default_mode == InteractionMode.VIEW
        assert config.enable_drag_migrate is True
        assert config.enable_keyboard_shortcuts is True
        assert config.auto_expand_alerts is True

    def test_custom_config(self):
        config = InteractionConfig(
            default_mode=InteractionMode.EDIT,
            enable_drag_migrate=False,
        )
        assert config.default_mode == InteractionMode.EDIT
        assert config.enable_drag_migrate is False


class TestPeerInspector:
    """Tests for PeerInspector."""

    def test_inspector_creation(self):
        inspector = PeerInspector("peer-1")
        assert inspector.peer_id == "peer-1"
        assert inspector.is_active is False
        assert inspector._data == {}

    def test_inspector_activate(self):
        inspector = PeerInspector("peer-1")
        inspector.activate()
        assert inspector.is_active is True

    def test_inspector_deactivate(self):
        inspector = PeerInspector("peer-1")
        inspector.activate()
        inspector.deactivate()
        assert inspector.is_active is False

    def test_inspector_update(self):
        inspector = PeerInspector("peer-1")
        inspector.update({"cpu_percent": 50.0})
        assert inspector._data == {"cpu_percent": 50.0}

    def test_inspector_get_data(self):
        inspector = PeerInspector("peer-1")
        inspector.update({"cpu_percent": 50.0})
        data = inspector.get_data()
        assert data == {"cpu_percent": 50.0}


class TestContainerInspector:
    """Tests for ContainerInspector."""

    def test_inspector_creation(self):
        inspector = ContainerInspector("container-1")
        assert inspector.container_id == "container-1"
        assert inspector.is_active is False

    def test_inspector_update(self):
        inspector = ContainerInspector("container-1")
        inspector.update({"memory_mb": 512})
        assert inspector.get_data() == {"memory_mb": 512}


class TestMigrationInspector:
    """Tests for MigrationInspector."""

    def test_inspector_creation(self):
        inspector = MigrationInspector("migr-1")
        assert inspector.migration_id == "migr-1"
        assert inspector.is_active is False

    def test_inspector_update(self):
        inspector = MigrationInspector("migr-1")
        inspector.update({"progress": 0.5})
        assert inspector.get_data() == {"progress": 0.5}


class TestAlertPanel:
    """Tests for AlertPanel."""

    def test_panel_creation(self):
        panel = AlertPanel("overload", "peer-1")
        assert panel.alert_type == "overload"
        assert panel.peer_id == "peer-1"
        assert panel.is_visible is False

    def test_panel_show(self):
        panel = AlertPanel("overload", "peer-1")
        panel.show()
        assert panel.is_visible is True

    def test_panel_hide(self):
        panel = AlertPanel("overload", "peer-1")
        panel.show()
        panel.hide()
        assert panel.is_visible is False

    def test_panel_update(self):
        panel = AlertPanel("overload", "peer-1")
        panel.update("CPU at 95%", {"cpu_percent": 95})
        assert panel.message == "CPU at 95%"
        assert panel._data == {"cpu_percent": 95}


class TestInteractionPanel:
    """Tests for InteractionPanel."""

    def test_panel_creation(self):
        panel = InteractionPanel("Test Panel")
        assert panel.title == "Test Panel"
        assert panel.is_active is False
        assert panel.is_expanded is False

    def test_panel_show(self):
        panel = InteractionPanel("Test Panel")
        panel.show()
        assert panel.is_active is True

    def test_panel_expand(self):
        panel = InteractionPanel("Test Panel")
        panel.expand()
        assert panel.is_expanded is True

    def test_panel_collapse(self):
        panel = InteractionPanel("Test Panel")
        panel.expand()
        panel.collapse()
        assert panel.is_expanded is False

    def test_panel_update_content(self):
        panel = InteractionPanel("Test Panel")
        panel.update_content(["Line 1", "Line 2"])
        assert panel.get_content() == ["Line 1", "Line 2"]


class TestInteractionManager:
    """Tests for InteractionManager."""

    @pytest.fixture
    def visualizer(self):
        return ClusterVisualizer()

    @pytest.fixture
    def manager(self, visualizer):
        return InteractionManager(visualizer=visualizer)

    def test_manager_creation(self, manager):
        assert manager._running is False
        assert manager.mode == InteractionMode.VIEW
        assert len(manager._peer_inspectors) == 0

    @pytest.mark.asyncio
    async def test_manager_start_stop(self, manager):
        await manager.start()
        assert manager._running is True
        await manager.stop()
        assert manager._running is False

    def test_set_mode(self, manager):
        manager.set_mode(InteractionMode.EDIT)
        assert manager.mode == InteractionMode.EDIT

    @pytest.mark.asyncio
    async def test_inspect_peer(self, manager, visualizer):
        await manager.start()
        # Add peer to visualizer
        visualizer.update_peer("peer-1", "peer1.local")

        inspector = await manager.inspect_peer("peer-1")
        assert inspector is not None
        assert inspector.peer_id == "peer-1"
        assert inspector.is_active is True

        await manager.stop()

    @pytest.mark.asyncio
    async def test_inspect_nonexistent_peer(self, manager):
        await manager.start()
        inspector = await manager.inspect_peer("nonexistent")
        assert inspector is None
        await manager.stop()

    @pytest.mark.asyncio
    async def test_inspect_container(self, manager, visualizer):
        await manager.start()
        # Add container to visualizer
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.add_container("container-1", "web", "peer-1")

        inspector = await manager.inspect_container("container-1")
        assert inspector is not None
        assert inspector.container_id == "container-1"

        await manager.stop()

    @pytest.mark.asyncio
    async def test_inspect_migration(self, manager, visualizer):
        await manager.start()
        # Setup migration
        visualizer.update_peer("peer-1", "peer1.local")
        visualizer.update_peer("peer-2", "peer2.local")
        visualizer.show_migration("migr-1", "peer-1", "peer-2", "web")

        inspector = await manager.inspect_migration("migr-1")
        assert inspector is not None
        assert inspector.migration_id == "migr-1"

        await manager.stop()

    def test_get_inspector(self, manager, visualizer):
        # Add inspector directly
        inspector = PeerInspector("peer-1")
        manager._peer_inspectors["peer-1"] = inspector

        result = manager.get_inspector("peer-1")
        assert result == inspector

    def test_get_all_inspectors(self, manager):
        # Add various inspectors
        manager._peer_inspectors["peer-1"] = PeerInspector("peer-1")
        manager._container_inspectors["container-1"] = ContainerInspector("container-1")

        all_inspectors = manager.get_all_inspectors()
        assert len(all_inspectors) == 2

    def test_clear_inspectors(self, manager):
        manager._peer_inspectors["peer-1"] = PeerInspector("peer-1")
        manager.clear_inspectors()
        assert len(manager._peer_inspectors) == 0

    def test_create_panel(self, manager):
        panel = manager.create_panel("Info Panel")
        assert panel.title == "Info Panel"
        assert len(manager._panels) == 1

    def test_get_panels(self, manager):
        manager.create_panel("Panel 1")
        manager.create_panel("Panel 2")
        panels = manager.get_panels()
        assert len(panels) == 2

    def test_show_alert(self, manager):
        manager.show_alert("overload", "peer-1", "CPU at 95%")
        panels = manager.get_alert_panels()
        assert len(panels) == 1
        assert panels[0].message == "CPU at 95%"

    def test_hide_alert(self, manager):
        manager.show_alert("overload", "peer-1", "CPU at 95%")
        manager.hide_alert("overload", "peer-1")
        panels = manager.get_alert_panels()
        assert len(panels) == 0

    def test_get_history(self, manager):
        manager._history.append({"action": "test1"})
        manager._history.append({"action": "test2"})
        history = manager.get_history()
        assert len(history) == 2

    def test_clear_history(self, manager):
        manager._history.append({"action": "test"})
        manager.clear_history()
        assert len(manager._history) == 0

    def test_get_status(self, manager):
        status = manager.get_status()
        assert status["running"] is False
        assert status["mode"] == "view"
        assert status["peer_inspector_count"] == 0

    @pytest.mark.asyncio
    async def test_callbacks(self, manager):
        events_received = []

        async def callback(data):
            events_received.append(data)

        manager.on("test_event", callback)
        await manager._emit("test_event", {"value": 42})

        assert len(events_received) == 1
        assert events_received[0] == {"value": 42}

    def test_off_callback(self, manager):
        def callback(data):
            pass

        manager.on("test_event", callback)
        manager.off("test_event", callback)
        assert len(manager._callbacks["test_event"]) == 0


class TestCreateInteractionManager:
    """Tests for create_interaction_manager function."""

    def test_create_manager(self):
        manager = create_interaction_manager()
        assert isinstance(manager, InteractionManager)
        assert manager.visualizer is not None

    def test_create_manager_with_visualizer(self):
        visualizer = ClusterVisualizer()
        manager = create_interaction_manager(visualizer=visualizer)
        assert manager.visualizer == visualizer

    def test_create_manager_with_config(self):
        config = InteractionConfig(default_mode=InteractionMode.EDIT)
        manager = create_interaction_manager(config=config)
        assert manager.config.default_mode == InteractionMode.EDIT


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
