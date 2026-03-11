# Native Glyph Shell - Usability Improvements

## Overview

This document describes the usability improvements added to the Native Glyph Shell, focusing on panel manipulation and layout assistance.

## New Features

### 1. Panel Resize with Handles

Panels can now be resized by dragging corner or edge handles:

- **Corner handles**: Diagonal resize (e.g., bottom-right expands both width and height)
- **Edge handles**: Single-direction resize (e.g., right edge only changes width)
- **Handle size**: 8px hit area for easy targeting
- **Minimum sizes**: Enforced minimum width (100px) and height (80px)

```python
from systems.visual_shell.api import NativePanel

panel = NativePanel(id="test", title="Test", x=100, y=100, width=400, height=300)

# Start resize from bottom-right corner
panel.start_resize(500, 400, "bottom_right")

# Update during drag
panel.update_resize(600, 500)  # Expands to 500x400

# End resize
panel.end_resize()
```

### 2. Snap-to-Grid

Panels automatically snap to a configurable grid during drag and resize operations:

- **Default grid**: 20px
- **Snap threshold**: 10px (positions within this distance snap to grid)
- **Configurable**: Can be disabled or customized per panel

```python
from systems.visual_shell.api import NativePanel, snap_position, SnapConfig

# Create panel with snap enabled (default)
panel = NativePanel(
    id="test",
    title="Test",
    x=100, y=100,
    width=400, height=300,
    snap_enabled=True,
    snap_grid_size=20
)

# Snap a position manually
config = SnapConfig(grid_size=20, snap_threshold=10)
snapped_x, snapped_y = snap_position(123, 456, config)
# Result: (120, 460)
```

### 3. Visual Cursor Feedback

The cursor style changes based on the current interaction:

| State | Cursor |
|-------|--------|
| Default | `default` |
| Hover right/left edge | `ew-resize` |
| Hover top/bottom edge | `ns-resize` |
| Hover corner (↘) | `nwse-resize` |
| Hover corner (↗) | `nesw-resize` |
| Dragging panel | `move` |

```python
# Get current cursor style
cursor = panel.get_cursor()
# Returns: "ew-resize", "nwse-resize", "move", etc.
```

### 4. Panel Alignment

Align multiple panels to a common edge or center:

```python
from systems.visual_shell.api import align_panels

panels = [
    (100, 100, 200, 150),
    (150, 300, 200, 150),
    (200, 500, 200, 150),
]

# Align to left edge
aligned = align_panels(panels, 'left')
# All panels now have x = 100

# Other options: 'right', 'top', 'bottom', 'center_h', 'center_v'
```

### 5. Panel Distribution

Distribute panels evenly with equal spacing:

```python
from systems.visual_shell.api import distribute_panels

panels = [
    (100, 100, 200, 150),
    (100, 300, 200, 150),
    (100, 500, 200, 150),
]

# Distribute vertically with 20px gap
distributed = distribute_panels(panels, 'vertical', gap=20)
# Panels are now at y = 100, 270, 440
```

## API Reference

### Layout Utilities Module

Located at: `systems/visual_shell/api/layout_utils.py`

#### Classes

- **SnapConfig**: Configuration for snap-to-grid behavior
- **ResizeHandleType**: Enum for handle types (TOP, BOTTOM, LEFT, RIGHT, corners)
- **ResizeHandle**: Represents a single resize handle
- **LayoutGrid**: Visual grid overlay for layout assistance

#### Functions

- `snap_position(x, y, config, bounds=None)` → `(snapped_x, snapped_y)`
- `snap_size(width, height, config)` → `(snapped_width, snapped_height)`
- `get_resize_handle_at(panel_x, panel_y, w, h, mouse_x, mouse_y)` → `ResizeHandleType`
- `calculate_resize(...)` → `(new_x, new_y, new_w, new_h)`
- `get_resize_handles(panel_x, panel_y, w, h)` → `List[ResizeHandle]`
- `align_panels(panels, alignment)` → `List[Tuple]`
- `distribute_panels(panels, direction, gap)` → `List[Tuple]`

### NativePanel Enhancements

Located at: `systems/visual_shell/api/native_panel.py`

#### New Properties

- `snap_enabled`: bool (default: True)
- `snap_grid_size`: int (default: 20)
- `snap_threshold`: int (default: 10)
- `resize_handle_size`: int (default: 8)
- `resizing`: bool (read-only, True during resize)

#### New Methods

- `get_resize_handle_at(x, y)` → `str`: Get handle type at point
- `start_resize(mouse_x, mouse_y, handle_type=None)`: Begin resize operation
- `update_resize(mouse_x, mouse_y)`: Update during resize
- `end_resize()`: End resize operation
- `set_hovered_handle(handle_type)`: Set which handle is hovered
- `get_cursor()` → `str`: Get cursor style for current state
- `get_resize_handles()` → `list`: Get all handle positions for rendering

#### Enhanced Methods

- `move_drag(mouse_x, mouse_y)`: Now includes snap-to-grid
- `to_render_state()`: Now includes resize handle info and cursor state

## Testing

Comprehensive tests are available at:
`systems/visual_shell/tests/test_layout_utils.py`

Run with:
```bash
python3 -m pytest systems/visual_shell/tests/test_layout_utils.py -v
```

### Test Coverage

- 48 tests covering:
  - Snap-to-grid functionality
  - Resize handle detection
  - Resize calculations
  - Panel alignment
  - Panel distribution
  - NativePanel integration
  - User scenario simulations

## Demo

An interactive demo is available at:
`systems/visual_shell/examples/layout_demo.py`

Run with:
```bash
python3 systems/visual_shell/examples/layout_demo.py
```

## Design Decisions

### Why 20px Default Grid?

- Balances precision with usability
- Common in design tools (Figma, Sketch use similar)
- Large enough for easy alignment, small enough for fine control

### Why 8px Handle Size?

- Follows Fitts's Law for easy targeting
- Matches common UI conventions (scrollbar handles, etc.)
- Large enough to click easily, small enough not to obscure content

### Why Corners Override Title Bar?

- Users expect corners to be draggable regardless of position
- Prevents frustration when trying to resize from top corners
- Title bar only blocks top edge resize, not corner resize

## Future Enhancements

Potential future improvements:

1. **Smart guides**: Show alignment lines when panels align with others
2. **Grid overlay**: Visual grid display during drag/resize
3. **Keyboard resize**: Arrow keys for precise resize
4. **Aspect ratio lock**: Hold Shift to maintain aspect ratio
5. **Undo/redo**: History of layout changes

## Files Modified/Created

### New Files
- `systems/visual_shell/api/layout_utils.py` - Layout utility functions
- `systems/visual_shell/tests/test_layout_utils.py` - Comprehensive tests
- `systems/visual_shell/examples/layout_demo.py` - Demo script

### Modified Files
- `systems/visual_shell/api/native_panel.py` - Added resize functionality
- `systems/visual_shell/api/__init__.py` - Added exports for layout utilities
