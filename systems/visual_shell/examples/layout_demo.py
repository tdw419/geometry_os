#!/usr/bin/env python3
"""
Layout Utilities Demo - Showcase of Native Glyph Shell Usability Improvements

This demo illustrates the new usability features:
1. Panel resize with corner/edge handles
2. Snap-to-grid for cleaner layouts
3. Visual cursor feedback
4. Panel alignment and distribution

Run with: python3 systems/visual_shell/examples/layout_demo.py
"""

import sys
from pathlib import Path

# Add project root to path (works when run from any directory)
project_root = Path(__file__).parent.parent.parent.parent
if str(project_root) not in sys.path:
    sys.path.insert(0, str(project_root))

# Also try relative import fallback
try:
    from systems.visual_shell.api import (
        NativePanel,
        ResizeHandleType,
        SnapConfig,
        align_panels,
        distribute_panels,
        get_resize_handle_at,
        snap_position,
        snap_size,
    )
except ImportError:
    # Add parent of examples directory
    sys.path.insert(0, str(Path(__file__).parent.parent))
    from api import (
        NativePanel,
        SnapConfig,
        align_panels,
        distribute_panels,
        get_resize_handle_at,
        snap_position,
    )


def demo_snap_to_grid():
    """Demonstrate snap-to-grid functionality."""
    print("\n" + "=" * 60)
    print("SNAP-TO-GRID DEMO")
    print("=" * 60)

    config = SnapConfig(grid_size=20, snap_threshold=10)

    positions = [
        (123, 456),
        (115, 225),
        (200, 310),
        (7, 13),
    ]

    print("\nSnap Configuration:")
    print(f"  Grid size: {config.grid_size}px")
    print(f"  Threshold: {config.snap_threshold}px")

    print("\nPosition snapping:")
    for x, y in positions:
        snapped_x, snapped_y = snap_position(x, y, config)
        status = "✓ SNAPPED" if (x != snapped_x or y != snapped_y) else "○ unchanged"
        print(f"  ({x:4}, {y:4}) → ({snapped_x:4}, {snapped_y:4}) {status}")


def demo_resize_handles():
    """Demonstrate resize handle detection."""
    print("\n" + "=" * 60)
    print("RESIZE HANDLE DETECTION DEMO")
    print("=" * 60)

    # Panel at (100, 100) with size 400x300
    panel_x, panel_y = 100, 100
    panel_w, panel_h = 400, 300

    test_points = [
        (500, 400, "bottom-right corner"),
        (100, 100, "top-left corner"),
        (500, 250, "right edge"),
        (300, 400, "bottom edge"),
        (250, 250, "center (no handle)"),
    ]

    print(f"\nPanel bounds: ({panel_x}, {panel_y}) to ({panel_x + panel_w}, {panel_y + panel_h})")

    print("\nHandle detection at various points:")
    for x, y, desc in test_points:
        handle = get_resize_handle_at(panel_x, panel_y, panel_w, panel_h, x, y)
        print(f"  ({x:4}, {y:4}) → {handle.value:13} ({desc})")


def demo_panel_resize():
    """Demonstrate panel resize functionality."""
    print("\n" + "=" * 60)
    print("PANEL RESIZE DEMO")
    print("=" * 60)

    panel = NativePanel(
        id="demo_panel",
        title="Demo Panel",
        x=100, y=100,
        width=400, height=300,
        snap_enabled=True,
        snap_grid_size=20
    )

    print("\nInitial panel state:")
    print(f"  Position: ({panel.x}, {panel.y})")
    print(f"  Size: {panel.width}x{panel.height}")

    # Simulate resize from bottom-right corner
    print("\nSimulating resize from bottom-right corner...")
    print("  1. User hovers over corner → handle detected")
    handle = panel.get_resize_handle_at(500, 400)
    print(f"     Handle: {handle}")

    print("  2. User starts resize")
    panel.start_resize(500, 400, handle)

    print("  3. User drags (+100px, +100px)")
    panel.update_resize(600, 500)

    print("\nFinal panel state:")
    print(f"  Position: ({panel.x}, {panel.y})")
    print(f"  Size: {panel.width}x{panel.height}")
    print(f"  Cursor: {panel.get_cursor()}")

    panel.end_resize()
    print("  Resize ended")


def demo_panel_drag():
    """Demonstrate panel drag with snap-to-grid."""
    print("\n" + "=" * 60)
    print("PANEL DRAG DEMO")
    print("=" * 60)

    panel = NativePanel(
        id="drag_demo",
        title="Drag Demo",
        x=100, y=100,
        width=400, height=300,
        snap_enabled=True,
        snap_grid_size=20
    )

    print(f"\nInitial position: ({panel.x}, {panel.y})")

    # Simulate drag
    print("\nSimulating drag...")
    print("  1. User clicks title bar and starts drag")
    panel.start_drag(150, 112)  # Click in title bar

    print("  2. User drags to (175, 187)")
    panel.move_drag(175, 187)

    print(f"\nFinal position: ({panel.x}, {panel.y})")
    print(f"  (Snapped from theoretical {100 + 25}, {100 + 75} to grid)")

    panel.end_drag()


def demo_panel_alignment():
    """Demonstrate panel alignment features."""
    print("\n" + "=" * 60)
    print("PANEL ALIGNMENT DEMO")
    print("=" * 60)

    panels = [
        (100, 100, 200, 150),
        (150, 300, 200, 150),
        (200, 500, 200, 150),
    ]

    print("\nOriginal panel positions:")
    for i, (x, y, w, h) in enumerate(panels):
        print(f"  Panel {i + 1}: ({x}, {y}) size {w}x{h}")

    # Align left
    aligned = align_panels(panels, 'left')
    print("\nAfter left alignment:")
    for i, (x, y, w, h) in enumerate(aligned):
        print(f"  Panel {i + 1}: ({x}, {y})")

    # Distribute vertically
    distributed = distribute_panels(panels, 'vertical', gap=20)
    print("\nAfter vertical distribution (20px gap):")
    for i, (x, y, w, h) in enumerate(distributed):
        print(f"  Panel {i + 1}: ({x}, {y})")


def demo_cursor_feedback():
    """Demonstrate cursor feedback for different interactions."""
    print("\n" + "=" * 60)
    print("CURSOR FEEDBACK DEMO")
    print("=" * 60)

    panel = NativePanel(
        id="cursor_demo",
        title="Cursor Demo",
        x=100, y=100,
        width=400, height=300,
    )

    print("\nCursor styles for different states:")

    # Default
    print(f"  Default:              {panel.get_cursor()}")

    # Hover over right edge
    panel.set_hovered_handle("right")
    print(f"  Hover right edge:     {panel.get_cursor()}")

    # Hover over bottom-right corner
    panel.set_hovered_handle("bottom_right")
    print(f"  Hover bottom-right:   {panel.get_cursor()}")

    # During drag
    panel.set_hovered_handle("none")
    panel.start_drag(200, 112)
    print(f"  During drag:          {panel.get_cursor()}")


def main():
    """Run all demos."""
    print("=" * 60)
    print("NATIVE GLYPH SHELL - USABILITY IMPROVEMENTS DEMO")
    print("=" * 60)

    demo_snap_to_grid()
    demo_resize_handles()
    demo_panel_resize()
    demo_panel_drag()
    demo_panel_alignment()
    demo_cursor_feedback()

    print("\n" + "=" * 60)
    print("DEMO COMPLETE")
    print("=" * 60)
    print("\nKey Features Demonstrated:")
    print("  ✓ Snap-to-grid for precise panel positioning")
    print("  ✓ Resize handles on all edges and corners")
    print("  ✓ Cursor feedback indicating available actions")
    print("  ✓ Panel alignment for organized layouts")
    print("  ✓ Panel distribution with even spacing")
    print()


if __name__ == "__main__":
    main()
