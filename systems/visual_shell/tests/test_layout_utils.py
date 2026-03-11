"""
Tests for Layout Utilities - Snap-to-grid, resize, and alignment helpers.

These tests verify the usability improvements for the Native Glyph Shell:
- Snap-to-grid functionality
- Resize handle detection
- Resize calculations
- Panel alignment and distribution

Run with: pytest systems/visual_shell/tests/test_layout_utils.py -v
"""

import sys
from pathlib import Path

import pytest

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.visual_shell.api.layout_utils import (
    LayoutGrid,
    ResizeHandle,
    ResizeHandleType,
    SnapConfig,
    align_panels,
    calculate_resize,
    distribute_panels,
    get_resize_handle_at,
    get_resize_handles,
    snap_position,
    snap_size,
)


class TestSnapConfig:
    """Tests for SnapConfig dataclass."""

    def test_default_config(self):
        """Test default snap configuration."""
        config = SnapConfig()
        assert config.enabled is True
        assert config.grid_size == 20
        assert config.snap_threshold == 10
        assert config.snap_edges is True
        assert config.min_panel_width == 100
        assert config.min_panel_height == 80

    def test_custom_config(self):
        """Test custom snap configuration."""
        config = SnapConfig(
            enabled=False,
            grid_size=50,
            snap_threshold=25,
            min_panel_width=200,
            min_panel_height=150
        )
        assert config.enabled is False
        assert config.grid_size == 50
        assert config.snap_threshold == 25
        assert config.min_panel_width == 200
        assert config.min_panel_height == 150


class TestSnapPosition:
    """Tests for snap_position function."""

    def test_snap_disabled(self):
        """Test that snapping is disabled when config.enabled is False."""
        config = SnapConfig(enabled=False)
        x, y = snap_position(123, 456, config)
        assert x == 123
        assert y == 456

    def test_snap_to_grid(self):
        """Test snapping to nearest grid point."""
        config = SnapConfig(grid_size=20, snap_threshold=10)

        # Near grid points
        x, y = snap_position(21, 41, config)  # Close to (20, 40)
        assert x == 20
        assert y == 40

    def test_snap_outside_threshold(self):
        """Test that positions outside threshold don't snap."""
        config = SnapConfig(grid_size=20, snap_threshold=5)

        # 15 is halfway between 0 and 20, but 5 away from both
        # With threshold 5, 15-0=15 > 5, and 20-15=5 <= 5, so it snaps to 20
        # Let's use 12 which is 8 away from 0 and 8 away from 20
        x, y = snap_position(12, 12, config)
        assert x == 12  # Should not snap (8 > 5 threshold)
        assert y == 12

    def test_snap_with_bounds(self):
        """Test snapping with boundary constraints."""
        config = SnapConfig(grid_size=20)
        x, y = snap_position(-10, 1010, config, bounds=(1000, 1000))
        assert x == 0
        assert y == 1000

    def test_snap_to_zero(self):
        """Test snapping to origin."""
        config = SnapConfig(grid_size=20, snap_threshold=10)
        x, y = snap_position(5, 5, config)
        assert x == 0
        assert y == 0


class TestSnapSize:
    """Tests for snap_size function."""

    def test_snap_dimensions_to_grid(self):
        """Test snapping dimensions to grid increments."""
        config = SnapConfig(grid_size=20)
        w, h = snap_size(105, 85, config)
        assert w == 100  # Snapped to 5 * 20
        assert h == 80   # Snapped to 4 * 20

    def test_snap_respects_minimums(self):
        """Test that minimum sizes are respected."""
        config = SnapConfig(grid_size=20, min_panel_width=100, min_panel_height=80)
        w, h = snap_size(50, 30, config)
        assert w == 100  # Minimum width
        assert h == 80   # Minimum height

    def test_snap_disabled(self):
        """Test that size snapping can be disabled."""
        config = SnapConfig(enabled=False)
        w, h = snap_size(123, 456, config)
        assert w == 123
        assert h == 456


class TestResizeHandleDetection:
    """Tests for get_resize_handle_at function."""

    def test_no_handle_inside_panel(self):
        """Test that points inside panel don't trigger handles."""
        handle = get_resize_handle_at(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            mouse_x=200, mouse_y=200,
            handle_size=8
        )
        assert handle == ResizeHandleType.NONE

    def test_bottom_right_corner(self):
        """Test detecting bottom-right corner handle."""
        handle = get_resize_handle_at(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            mouse_x=500, mouse_y=400,  # Bottom-right corner
            handle_size=8
        )
        assert handle == ResizeHandleType.BOTTOM_RIGHT

    def test_top_left_corner(self):
        """Test detecting top-left corner handle."""
        handle = get_resize_handle_at(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            mouse_x=100, mouse_y=100,
            handle_size=8
        )
        assert handle == ResizeHandleType.TOP_LEFT

    def test_right_edge(self):
        """Test detecting right edge handle."""
        handle = get_resize_handle_at(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            mouse_x=500, mouse_y=250,  # Right edge center
            handle_size=8
        )
        assert handle == ResizeHandleType.RIGHT

    def test_bottom_edge(self):
        """Test detecting bottom edge handle."""
        handle = get_resize_handle_at(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            mouse_x=300, mouse_y=400,  # Bottom edge center
            handle_size=8
        )
        assert handle == ResizeHandleType.BOTTOM

    def test_title_bar_excludes_top_resize(self):
        """Test that title bar area doesn't trigger top resize."""
        handle = get_resize_handle_at(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            mouse_x=300, mouse_y=110,  # In title bar area
            handle_size=8,
            title_bar_height=24
        )
        # Should be NONE because we're in title bar
        assert handle == ResizeHandleType.NONE


class TestCalculateResize:
    """Tests for calculate_resize function."""

    def test_resize_right(self):
        """Test resizing from right edge."""
        config = SnapConfig(enabled=False)
        x, y, w, h = calculate_resize(
            original_x=100, original_y=100,
            original_width=400, original_height=300,
            handle_type=ResizeHandleType.RIGHT,
            delta_x=50, delta_y=0,
            config=config
        )
        assert x == 100
        assert y == 100
        assert w == 450
        assert h == 300

    def test_resize_left(self):
        """Test resizing from left edge (moves x)."""
        config = SnapConfig(enabled=False)
        x, y, w, h = calculate_resize(
            original_x=100, original_y=100,
            original_width=400, original_height=300,
            handle_type=ResizeHandleType.LEFT,
            delta_x=50, delta_y=0,  # Drag right
            config=config
        )
        assert x == 150  # Moved right
        assert y == 100
        assert w == 350  # Width decreased
        assert h == 300

    def test_resize_bottom_right(self):
        """Test diagonal resize from bottom-right."""
        config = SnapConfig(enabled=False)
        x, y, w, h = calculate_resize(
            original_x=100, original_y=100,
            original_width=400, original_height=300,
            handle_type=ResizeHandleType.BOTTOM_RIGHT,
            delta_x=50, delta_y=50,
            config=config
        )
        assert x == 100
        assert y == 100
        assert w == 450
        assert h == 350

    def test_resize_respects_minimum(self):
        """Test that resize respects minimum dimensions."""
        config = SnapConfig(enabled=False, min_panel_width=100, min_panel_height=80)
        x, y, w, h = calculate_resize(
            original_x=100, original_y=100,
            original_width=400, original_height=300,
            handle_type=ResizeHandleType.RIGHT,
            delta_x=-350,  # Would make width 50
            delta_y=0,
            config=config
        )
        assert w == 100  # Stopped at minimum

    def test_resize_with_snap(self):
        """Test resize with snap-to-grid enabled."""
        config = SnapConfig(enabled=True, grid_size=20, snap_threshold=10)
        x, y, w, h = calculate_resize(
            original_x=100, original_y=100,
            original_width=400, original_height=300,
            handle_type=ResizeHandleType.RIGHT,
            delta_x=43,  # Would be 443, snap to 440
            delta_y=0,
            config=config
        )
        assert w == 440  # Snapped to grid


class TestResizeHandles:
    """Tests for get_resize_handles function."""

    def test_get_all_handles(self):
        """Test that all handles are returned."""
        handles = get_resize_handles(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            handle_size=8
        )
        # Should have 8 handles: 4 corners + 4 edges
        assert len(handles) == 8

        # Check handle types
        types = {h.handle_type for h in handles}
        assert types == {
            ResizeHandleType.TOP_LEFT,
            ResizeHandleType.TOP_RIGHT,
            ResizeHandleType.BOTTOM_LEFT,
            ResizeHandleType.BOTTOM_RIGHT,
            ResizeHandleType.TOP,
            ResizeHandleType.BOTTOM,
            ResizeHandleType.LEFT,
            ResizeHandleType.RIGHT,
        }

    def test_handle_positions(self):
        """Test that handles are at correct positions."""
        handles = get_resize_handles(
            panel_x=100, panel_y=100,
            panel_width=400, panel_height=300,
            handle_size=8
        )

        # Find bottom-right handle
        br = next(h for h in handles if h.handle_type == ResizeHandleType.BOTTOM_RIGHT)
        assert br.x == 500  # 100 + 400
        assert br.y == 400  # 100 + 300


class TestResizeHandle:
    """Tests for ResizeHandle class."""

    def test_contains_point(self):
        """Test point containment in handle."""
        handle = ResizeHandle(
            handle_type=ResizeHandleType.BOTTOM_RIGHT,
            x=500, y=400,
            size=8
        )

        # Center point
        assert handle.contains_point(500, 400) is True

        # Edge of handle (4 pixels from center)
        assert handle.contains_point(504, 400) is True
        assert handle.contains_point(505, 400) is False

    def test_get_cursor(self):
        """Test cursor style for handles."""
        handle = ResizeHandle(
            handle_type=ResizeHandleType.BOTTOM_RIGHT,
            x=500, y=400
        )
        assert handle.get_cursor() == "nwse-resize"

        handle.handle_type = ResizeHandleType.RIGHT
        assert handle.get_cursor() == "ew-resize"

        handle.handle_type = ResizeHandleType.TOP
        assert handle.get_cursor() == "ns-resize"


class TestLayoutGrid:
    """Tests for LayoutGrid class."""

    def test_get_cell_at(self):
        """Test getting cell coordinates for a point."""
        grid = LayoutGrid(grid_size=20)
        cell_x, cell_y = grid.get_cell_at(45, 85)
        assert cell_x == 2  # 45 // 20
        assert cell_y == 4  # 85 // 20

    def test_get_cell_origin(self):
        """Test getting pixel origin of a cell."""
        grid = LayoutGrid(grid_size=20)
        x, y = grid.get_cell_origin(5, 10)
        assert x == 100  # 5 * 20
        assert y == 200  # 10 * 20


class TestAlignPanels:
    """Tests for align_panels function."""

    def test_align_left(self):
        """Test aligning panels to left edge."""
        panels = [
            (100, 100, 200, 150),
            (150, 300, 200, 150),
            (200, 500, 200, 150),
        ]
        aligned = align_panels(panels, 'left')
        for x, y, w, h in aligned:
            assert x == 100

    def test_align_right(self):
        """Test aligning panels to right edge."""
        panels = [
            (100, 100, 200, 150),  # right edge at 300
            (150, 300, 180, 150),  # right edge at 330
            (200, 500, 220, 150),  # right edge at 420
        ]
        aligned = align_panels(panels, 'right')
        # All right edges should align at max right edge = 420
        for x, y, w, h in aligned:
            assert x + w == 420

    def test_align_top(self):
        """Test aligning panels to top edge."""
        panels = [
            (100, 100, 200, 150),
            (300, 150, 200, 150),
            (500, 200, 200, 150),
        ]
        aligned = align_panels(panels, 'top')
        for x, y, w, h in aligned:
            assert y == 100

    def test_align_center_h(self):
        """Test centering panels horizontally."""
        panels = [
            (100, 100, 200, 150),  # center: 200
            (300, 200, 300, 150),  # center: 450
            (500, 300, 200, 150),  # center: 600
        ]
        aligned = align_panels(panels, 'center_h')
        # Average center: (200 + 450 + 600) / 3 = 416.67
        centers = [x + w/2 for x, y, w, h in aligned]
        assert all(abs(c - centers[0]) < 0.01 for c in centers)


class TestDistributePanels:
    """Tests for distribute_panels function."""

    def test_distribute_horizontal(self):
        """Test horizontal distribution with gap."""
        panels = [
            (100, 100, 100, 150),
            (300, 100, 100, 150),
            (500, 100, 100, 150),
        ]
        distributed = distribute_panels(panels, 'horizontal', gap=20)

        # Check spacing
        assert distributed[0][0] == 100
        assert distributed[1][0] == 220  # 100 + 100 + 20
        assert distributed[2][0] == 340  # 220 + 100 + 20

    def test_distribute_vertical(self):
        """Test vertical distribution with gap."""
        panels = [
            (100, 100, 200, 100),
            (100, 300, 200, 100),
            (100, 500, 200, 100),
        ]
        distributed = distribute_panels(panels, 'vertical', gap=20)

        # Check spacing
        assert distributed[0][1] == 100
        assert distributed[1][1] == 220  # 100 + 100 + 20
        assert distributed[2][1] == 340  # 220 + 100 + 20


class TestNativePanelResize:
    """Tests for NativePanel resize functionality."""

    @pytest.fixture
    def panel(self):
        """Create a test panel."""
        from systems.visual_shell.api.native_panel import NativePanel
        return NativePanel(
            id="test_panel",
            title="Test Panel",
            x=100, y=100,
            width=400, height=300,
            snap_enabled=True,
            snap_grid_size=20
        )

    def test_get_resize_handle_at_corner(self, panel):
        """Test detecting resize handle at corner."""
        handle = panel.get_resize_handle_at(500, 400)  # Bottom-right
        assert handle == "bottom_right"

    def test_get_resize_handle_at_edge(self, panel):
        """Test detecting resize handle at edge."""
        handle = panel.get_resize_handle_at(500, 250)  # Right edge
        assert handle == "right"

    def test_start_resize(self, panel):
        """Test starting a resize operation."""
        panel.start_resize(500, 400, "bottom_right")
        assert panel.resizing is True
        assert panel._resize_state is not None
        assert panel._resize_state.handle_type == "bottom_right"

    def test_update_resize(self, panel):
        """Test updating during resize."""
        # Disable snap for this test to get exact values
        panel.snap_enabled = False
        panel.start_resize(500, 400, "bottom_right")
        panel.update_resize(550, 460)  # +50, +60

        assert panel.width == 450  # 400 + 50
        assert panel.height == 360  # 300 + 60

    def test_end_resize(self, panel):
        """Test ending a resize operation."""
        panel.start_resize(500, 400, "bottom_right")
        panel.end_resize()

        assert panel.resizing is False
        assert panel._resize_state is None

    def test_resize_respects_minimum(self, panel):
        """Test that resize respects minimum dimensions."""
        panel.start_resize(500, 400, "right")
        panel.update_resize(150, 400)  # Would make width 50

        assert panel.width >= 100  # Minimum width

    def test_get_cursor_during_resize(self, panel):
        """Test cursor style during resize."""
        panel.start_resize(500, 400, "bottom_right")
        assert panel.get_cursor() == "nwse-resize"

    def test_get_cursor_during_drag(self, panel):
        """Test cursor style during drag."""
        panel.start_drag(200, 150)
        assert panel.get_cursor() == "move"

    def test_snap_during_drag(self, panel):
        """Test snap-to-grid during drag."""
        panel.start_drag(200, 150)
        panel.move_drag(215, 165)  # Should snap to (120, 120)

        assert panel.x == 120
        assert panel.y == 120

    def test_get_resize_handles(self, panel):
        """Test getting all resize handles."""
        handles = panel.get_resize_handles()
        assert len(handles) == 8  # 4 corners + 4 edges

    def test_to_render_state_includes_resize_info(self, panel):
        """Test that render state includes resize information."""
        state = panel.to_render_state()

        assert "resize_handles" in state
        assert state["metadata"]["snap_enabled"] is True
        assert state["metadata"]["cursor"] == "default"


class TestUserFeedbackSimulation:
    """
    Simulated user testing scenarios to verify usability improvements.
    These tests represent common user workflows.
    """

    @pytest.fixture
    def panel(self):
        """Create a test panel with snap enabled."""
        from systems.visual_shell.api.native_panel import NativePanel
        return NativePanel(
            id="user_test_panel",
            title="User Test Panel",
            x=100, y=100,
            width=400, height=300,
            snap_enabled=True,
            snap_grid_size=20
        )

    def test_scenario_create_and_position_panel(self, panel):
        """
        User Story: As a user, I want to position my panel precisely
        so that my workspace stays organized.

        Scenario:
        1. Create a panel at (100, 100)
        2. Drag it to a new position
        3. Verify it snaps to grid
        """
        # Initial position
        assert panel.x == 100
        assert panel.y == 100

        # User drags the panel
        panel.start_drag(150, 150)  # Click in center of title bar area
        panel.move_drag(175, 175)    # Drag 25 pixels

        # Panel should snap to grid (20px)
        # 100 + 25 = 125, should snap to 120
        assert panel.x == 120
        assert panel.y == 120

    def test_scenario_resize_panel_to_fit_content(self, panel):
        """
        User Story: As a user, I want to resize my panel to fit
        its content so that I can see everything clearly.

        Scenario:
        1. Start with a 400x300 panel
        2. Resize from bottom-right corner
        3. Verify new dimensions and snap
        """
        # User hovers over bottom-right corner
        handle = panel.get_resize_handle_at(500, 400)
        assert handle == "bottom_right"

        # User starts resize
        panel.start_resize(500, 400, "bottom_right")

        # User drags to expand (+100, +100 for easy snap)
        panel.update_resize(600, 500)

        # Verify new size (snapped to 20px grid: 400+100=500, 300+100=400)
        assert panel.width == 500
        assert panel.height == 400

        # User ends resize
        panel.end_resize()
        assert panel.resizing is False

    def test_scenario_multiple_panels_aligned(self):
        """
        User Story: As a user, I want to align multiple panels
        so that my desktop looks organized.

        Scenario:
        1. Create multiple panels at different positions
        2. Align them to left edge
        3. Verify alignment
        """
        panels = [
            (50, 100, 200, 150),
            (100, 300, 200, 150),
            (75, 500, 200, 150),
        ]

        aligned = align_panels(panels, 'left')

        # All should have same x position
        for x, y, w, h in aligned:
            assert x == 50

    def test_scenario_cursor_feedback(self, panel):
        """
        User Story: As a user, I want visual cursor feedback
        so I know what action will happen.

        Scenario:
        1. Hover over different areas
        2. Verify cursor changes appropriately
        """
        # Clear any previous state
        panel._hovered_handle = "none"

        # Default cursor
        assert panel.get_cursor() == "default"

        # Hover over right edge
        panel.set_hovered_handle("right")
        assert panel.get_cursor() == "ew-resize"

        # Hover over bottom-right corner
        panel.set_hovered_handle("bottom_right")
        assert panel.get_cursor() == "nwse-resize"

        # Clear hover before drag
        panel.set_hovered_handle("none")
        panel.start_drag(200, 150)
        assert panel.get_cursor() == "move"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
