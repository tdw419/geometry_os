"""
Tests for Native Window Manager
Validates the migration from PixiJS to native GeoASM rendering.
"""

import pytest
import sys
import os

# Add parent directory to path
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from systems.visual_shell.api.native_window_manager import (
    NativeWindowManager,
    NativeWindow,
    WindowState,
    WindowButtonType,
    DragState
)


class TestNativeWindowManager:
    """Tests for NativeWindowManager class."""

    @pytest.fixture
    def manager(self):
        """Create a fresh manager for each test."""
        return NativeWindowManager((800, 600))

    def test_create_window(self, manager):
        """Test window creation."""
        window = manager.create_window(
            "test1",
            "Test Window",
            100, 100,
            300, 200
        )

        assert window.id == "test1"
        assert window.title == "Test Window"
        assert window.x == 100
        assert window.y == 100
        assert window.width == 300
        assert window.height == 200
        assert window.state == WindowState.NORMAL
        assert "test1" in manager.windows
        assert "test1" in manager.z_order

    def test_destroy_window(self, manager):
        """Test window destruction."""
        manager.create_window("test1", "Test", 0, 0, 100, 100)

        result = manager.destroy_window("test1")
        assert result is True
        assert "test1" not in manager.windows
        assert "test1" not in manager.z_order

    def test_destroy_nonexistent_window(self, manager):
        """Test destroying a window that doesn't exist."""
        result = manager.destroy_window("nonexistent")
        assert result is False

    def test_bring_to_front(self, manager):
        """Test z-order management."""
        manager.create_window("w1", "Window 1", 0, 0, 100, 100)
        manager.create_window("w2", "Window 2", 50, 50, 100, 100)
        manager.create_window("w3", "Window 3", 100, 100, 100, 100)

        # w3 should be on top
        assert manager.z_order[-1] == "w3"

        # Bring w1 to front
        manager.bring_to_front("w1")
        assert manager.z_order[-1] == "w1"
        assert manager.focused_window == "w1"

    def test_send_to_back(self, manager):
        """Test sending window to back."""
        manager.create_window("w1", "W1", 0, 0, 100, 100)
        manager.create_window("w2", "W2", 0, 0, 100, 100)

        manager.send_to_back("w2")
        assert manager.z_order[0] == "w2"

    def test_minimize_window(self, manager):
        """Test window minimization."""
        window = manager.create_window("test", "Test", 0, 0, 100, 200)

        manager.minimize_window("test")
        assert window.state == WindowState.MINIMIZED
        assert window.original_height == 200

    def test_maximize_window(self, manager):
        """Test window maximization."""
        window = manager.create_window("test", "Test", 100, 100, 200, 200)

        manager.maximize_window("test")
        assert window.state == WindowState.MAXIMIZED
        assert window.x == 0
        assert window.y == 0
        assert window.width == 800  # Manager resolution
        assert window.height == 600

    def test_restore_window(self, manager):
        """Test window restoration."""
        window = manager.create_window("test", "Test", 100, 100, 200, 200)
        manager.minimize_window("test")
        manager.restore_window("test")
        assert window.state == WindowState.NORMAL

    def test_pointer_down_hit_window(self, manager):
        """Test pointer down on window."""
        manager.create_window("test", "Test", 100, 100, 200, 200)

        # Click in window
        hit = manager.handle_pointer_down(150, 150)
        assert hit == "test"
        assert manager.focused_window == "test"

    def test_pointer_down_miss_window(self, manager):
        """Test pointer down outside windows."""
        manager.create_window("test", "Test", 100, 100, 200, 200)

        # Click outside
        hit = manager.handle_pointer_down(50, 50)
        assert hit is None

    def test_pointer_down_close_button(self, manager):
        """Test clicking close button."""
        window = manager.create_window("test", "Test", 100, 100, 200, 200)

        # Click close button (right side of title bar)
        close_x = 100 + 200 - 14 - 4  # window.x + width - button_size - spacing
        close_y = 100 + 8

        manager.handle_pointer_down(close_x, close_y)
        assert "test" not in manager.windows

    def test_pointer_drag(self, manager):
        """Test window dragging."""
        manager.create_window("test", "Test", 100, 100, 200, 200)

        # Start drag
        manager.handle_pointer_down(150, 110)  # In title bar
        assert manager.drag_state.active is True

        # Move
        manager.handle_pointer_move(200, 120)
        window = manager.get_window("test")
        assert window.x == 150  # 200 - 50 offset
        assert window.y == 110  # 120 - 10 offset

        # End drag
        manager.handle_pointer_up(200, 120)
        assert manager.drag_state.active is False

    def test_notification_creation(self, manager):
        """Test notification system."""
        notification_id = manager.create_notification(
            "Test notification",
            (100, 150, 200, 230),
            duration=1000
        )

        assert notification_id.startswith("notification_")
        assert notification_id in manager.windows

        window = manager.get_window(notification_id)
        assert window.title == ""
        assert window.content_data is not None

    def test_glyph_commands_generation(self, manager):
        """Test glyph command generation."""
        manager.create_window("test", "Test Window", 100, 100, 200, 150)

        commands = manager.get_all_glyph_commands()

        # Should have multiple commands for background, border, title bar, buttons
        assert len(commands) > 0

        # First command should be fill rect for background
        assert commands[0]["opcode"] == "FILL_RECT"

        # Should have text command for title
        title_commands = [c for c in commands if c.get("opcode") == "DRAW_TEXT"]
        assert len(title_commands) > 0

    def test_render_state_export(self, manager):
        """Test render state export."""
        manager.create_window("w1", "Window 1", 0, 0, 100, 100)
        manager.create_window("w2", "Window 2", 100, 100, 100, 100)

        state = manager.get_render_state()

        assert "windows" in state
        assert len(state["windows"]) == 2
        assert "w1" in state["windows"]
        assert "w2" in state["windows"]
        assert "z_order" in state
        assert len(state["z_order"]) == 2


class TestNativeWindow:
    """Tests for NativeWindow class."""

    def test_window_creation(self):
        """Test basic window creation."""
        window = NativeWindow(
            id="test",
            title="Test",
            x=100,
            y=100,
            width=200,
            height=150
        )

        assert window.id == "test"
        assert window.title == "Test"
        assert window.state == WindowState.NORMAL
        assert window.z_index == 0

    def test_contains_point(self):
        """Test point containment check."""
        window = NativeWindow(
            id="test",
            title="Test",
            x=100,
            y=100,
            width=200,
            height=150
        )

        assert window.contains_point(150, 150) is True
        assert window.contains_point(50, 50) is False
        assert window.contains_point(350, 100) is False

    def test_is_in_title_bar(self):
        """Test title bar detection."""
        window = NativeWindow(
            id="test",
            title="Test",
            x=100,
            y=100,
            width=200,
            height=150
        )

        # In title bar
        assert window.is_in_title_bar(150, 110) is True
        # Below title bar
        assert window.is_in_title_bar(150, 150) is False

    def test_get_button_at(self):
        """Test button detection."""
        window = NativeWindow(
            id="test",
            title="Test",
            x=100,
            y=100,
            width=200,
            height=150
        )

        # Calculate button positions
        button_y = 100 + 8
        button_size = 14
        spacing = 4

        close_x = 100 + 200 - button_size - spacing

        # Close button
        button = window.get_button_at(close_x, button_y)
        assert button == WindowButtonType.CLOSE

        # No button
        button = window.get_button_at(150, 110)
        assert button is None

    def test_pack_color(self):
        """Test color packing."""
        window = NativeWindow(
            id="test",
            title="Test",
            x=0,
            y=0,
            width=100,
            height=100
        )

        packed = window._pack_color((255, 128, 64, 200))
        # 255 << 24 | 128 << 16 | 64 << 8 | 200
        assert packed == 0xFF8040C8

    def test_to_glyph_commands(self):
        """Test glyph command generation."""
        window = NativeWindow(
            id="test",
            title="Test Window",
            x=100,
            y=100,
            width=200,
            height=150
        )

        commands = window.to_glyph_commands()

        # Should generate multiple commands
        assert len(commands) > 0

        # Check command structure
        for cmd in commands:
            assert "opcode" in cmd


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
