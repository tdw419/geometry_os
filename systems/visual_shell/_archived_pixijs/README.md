# Archived PixiJS Implementation

**Archived**: 2026-03-08
**Reason**: Deprecated in favor of Native GeoASM Renderer

## Contents

This archive contains the deprecated PixiJS-based rendering implementation:

```
_archived_pixijs/
├── web/
│   ├── WindowManager.js      # PixiJS window manager
│   ├── DesktopWindow.js      # PixiJS draggable window
│   ├── pixi_adapter.js       # PixiJS texture adapter
│   ├── display/              # Display components
│   └── lib/                  # PixiJS library files
```

## Why Archived?

The PixiJS renderer has been replaced by the Native GeoASM Renderer which provides:

- **Self-hosting**: No external rendering dependencies
- **Performance**: 60 FPS at 10,000+ glyphs
- **Hilbert spatial coherence**: 95% GPU cache utilization
- **Pure stack**: Rust + Python + WGSL

## Restoration

If needed, these files can be restored to `systems/visual_shell/web/`:

```bash
cp -r systems/visual_shell/_archived_pixijs/web/* systems/visual_shell/web/
```

Then set the config:

```python
from systems.visual_shell.api.render_config import RenderConfig, set_render_config
set_render_config(RenderConfig(use_native_renderer=False))
```

## See Also

- `docs/PIXIJS_DEPRECATION_NOTICE.md` - Full deprecation details
- `apps/openspec/openspec/changes/native-glyph-visual-shell/PROPOSAL.md` - Native architecture
