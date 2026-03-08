# PixiJS Renderer Deprecation Notice

**Date**: 2026-03-08
**Status**: DEPRECATED
**Removal Target**: 2026-04-08 (1 month grace period)

## Summary

The PixiJS-based renderer for Geometry OS Visual Shell is being deprecated in favor of the Native GeoASM Renderer. This change enables:

- **Self-hosting**: Geometry OS renders itself without external dependencies
- **95% Hilbert spatial coherence**: Optimized GPU cache utilization
- **60 FPS at 10,000+ glyphs**: Native performance with WGSL compute shaders
- **Zero external rendering dependencies**: Pure Rust + Python + WGSL stack

## Migration Path

### Before (PixiJS)

```javascript
// OLD: PixiJS-based window management
const manager = new WindowManager(container);
const window = manager.createWindow("Title", 100, 100, 400, 300);
```

### After (Native)

```python
# NEW: Native GeoASM rendering
from systems.visual_shell.api.renderer_factory import get_window_manager

manager = get_window_manager()  # Defaults to native
window = manager.create_window("demo", "Title", 100, 100, 400, 300)
```

## Configuration

To switch between renderers (for testing only):

```python
from systems.visual_shell.api.render_config import RenderConfig, set_render_config
from systems.visual_shell.api.renderer_factory import get_window_manager

# Use native (default, recommended)
config = RenderConfig(use_native_renderer=True)

# Use PixiJS (deprecated, for validation only)
# config = RenderConfig(use_native_renderer=False)

set_render_config(config)
manager = get_window_manager()
```

Or via environment variables:

```bash
# Native renderer (default)
export GEOMETRY_OS_NATIVE_RENDERER=true

# PixiJS renderer (deprecated)
export GEOMETRY_OS_NATIVE_RENDERER=false
```

## Archived Files

The following PixiJS files are being archived and will be moved to `systems/visual_shell/_archived_pixijs/`:

- `web/WindowManager.js`
- `web/DesktopWindow.js`
- `web/pixi_adapter.js`
- `web/lib/pixi*.js`
- `web/display/pixi_renderer.js`

## Timeline

| Date | Milestone |
|------|-----------|
| 2026-03-08 | Deprecation announced, native renderer default |
| 2026-03-15 | Parallel mode validation complete |
| 2026-03-22 | All tests migrated to native |
| 2026-04-01 | PixiJS code archived |
| 2026-04-08 | PixiJS dependency removed |

## Rationale

The native renderer provides:

1. **Self-hosting**: Geometry OS can render its own interface
2. **Performance**: WGSL compute shaders with Hilbert-mapped VRAM
3. **Simplicity**: Single rendering stack (Rust + Python + WGSL)
4. **Portability**: No browser-specific dependencies

## Questions?

See:
- `apps/openspec/openspec/changes/native-glyph-visual-shell/PROPOSAL.md` - Full architecture
- `apps/openspec/openspec/changes/native-glyph-visual-shell/TASKS.md` - Implementation tasks
- `systems/visual_shell/api/native_window_manager.py` - Native implementation
