"""
Test Native Panel Management
TDD tests for porting DesktopWindow.js to Native Shell
"""

import sys
from pathlib import Path

# Add api directory to path
sys.path.insert(0, str(Path(__file__).parent))
from native_api import NativeVisualShellAPI


class TestNativePanel:
    """Tests for native panel/window management"""

    def test_create_panel_with_title_and_position(self):
        """A panel can be created with title, position, and dimensions"""
        api = NativeVisualShellAPI()

        panel = api.create_panel(
            id="test_panel",
            title="Test Window",
            x=100,
            y=100,
            width=400,
            height=300
        )

        assert panel is not None
        assert panel.id == "test_panel"
        assert panel.title == "Test Window"
        assert panel.x == 100
        assert panel.y == 100
        assert panel.width == 400
        assert panel.height == 300
        assert panel.minimized is False

    def test_panel_has_title_bar_height(self):
        """Panel includes title bar height in its dimensions"""
        api = NativeVisualShellAPI()

        panel = api.create_panel(
            id="panel_with_titlebar",
            title="Window",
            x=0, y=0,
            width=200, height=100
        )

        # Title bar is 24 pixels
        assert panel.title_bar_height == 24
        # Content area is height minus title bar
        assert panel.content_height == 76

    def test_minimize_panel(self):
        """Panel can be minimized to title bar only"""
        api = NativeVisualShellAPI()

        panel = api.create_panel(
            id="minimize_test",
            title="Minimizable",
            x=50, y=50,
            width=300, height=200
        )

        original_height = panel.height

        # Minimize
        panel.minimize()
        assert panel.minimized is True
        assert panel.height == panel.title_bar_height
        assert panel.content_visible is False

        # Restore
        panel.restore()
        assert panel.minimized is False
        assert panel.height == original_height
        assert panel.content_visible is True

    def test_close_panel(self):
        """Panel can be closed and removed from API"""
        api = NativeVisualShellAPI()

        panel = api.create_panel(
            id="closeable_panel",
            title="Closeable",
            x=0, y=0,
            width=100, height=100
        )

        assert "closeable_panel" in api.entities

        panel.close()

        assert "closeable_panel" not in api.entities

    def test_panel_z_index(self):
        """Panels have z-index for layering"""
        api = NativeVisualShellAPI()

        panel1 = api.create_panel("p1", "Panel 1", 0, 0, 100, 100)
        panel2 = api.create_panel("p2", "Panel 2", 50, 50, 100, 100)

        # New panel should have higher z-index
        assert panel2.z > panel1.z

        # Bring panel1 to front
        api.bring_to_front("p1")
        assert panel1.z > panel2.z

    def test_panel_drag_state(self):
        """Panel tracks drag state for interaction"""
        api = NativeVisualShellAPI()

        panel = api.create_panel("draggable", "Drag Me", 100, 100, 200, 150)

        # Initial state
        assert panel.dragging is False

        # Start drag
        panel.start_drag(150, 150)  # Click at (150, 150) relative to panel origin
        assert panel.dragging is True
        assert panel.drag_offset == (50, 50)  # Offset from top-left

        # Move drag
        panel.move_drag(200, 200)
        assert panel.x == 150  # 200 - 50
        assert panel.y == 150  # 200 - 50

        # End drag
        panel.end_drag()
        assert panel.dragging is False

    def test_panel_buttons(self):
        """Panel has minimize, maximize, close buttons"""
        api = NativeVisualShellAPI()

        panel = api.create_panel("buttoned", "Buttons", 0, 0, 200, 100)

        assert panel.has_button("minimize") is True
        assert panel.has_button("maximize") is True
        assert panel.has_button("close") is True

    def test_panel_to_render_state(self):
        """Panel can export its state for rendering"""
        api = NativeVisualShellAPI()

        panel = api.create_panel("renderable", "Render", 10, 20, 300, 200)

        state = panel.to_render_state()

        assert state["type"] == "panel"
        assert state["x"] == 10
        assert state["y"] == 20
        assert state["width"] == 300
        assert state["height"] == 200
        assert "color" in state
        assert "metadata" in state
        assert state["metadata"]["title"] == "Render"


class TestPanelManager:
    """Tests for managing multiple panels"""

    def test_create_multiple_panels(self):
        """API can manage multiple panels"""
        api = NativeVisualShellAPI()

        api.create_panel("p1", "Panel 1", 0, 0, 100, 100)
        api.create_panel("p2", "Panel 2", 100, 100, 100, 100)
        api.create_panel("p3", "Panel 3", 200, 200, 100, 100)

        panels = api.get_panels()
        assert len(panels) == 3

    def test_get_top_panel_at_point(self):
        """Can find topmost panel at a point"""
        api = NativeVisualShellAPI()

        api.create_panel("bottom", "Bottom", 0, 0, 100, 100)
        api.create_panel("top", "Top", 50, 50, 100, 100)  # Overlaps

        # Point (75, 75) is in both panels, should return top
        panel = api.get_panel_at(75, 75)
        assert panel.id == "top"

        # Point (25, 25) is only in bottom
        panel = api.get_panel_at(25, 25)
        assert panel.id == "bottom"

    def test_panel_focus_tracking(self):
        """API tracks which panel has focus"""
        api = NativeVisualShellAPI()

        p1 = api.create_panel("p1", "Panel 1", 0, 0, 100, 100)
        p2 = api.create_panel("p2", "Panel 2", 100, 0, 100, 100)

        # Most recently created has focus
        assert api.focused_panel == "p2"

        # Click on p1 to focus
        api.focus_panel("p1")
        assert api.focused_panel == "p1"
        assert p1.focused is True
        assert p2.focused is False
