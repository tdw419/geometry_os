# Neural Heatmap Overlay - Quick Start Guide

## Overview

The Neural Heatmap Overlay provides real-time visualization of neural substrate activity on Pixel LLM tiles. See the AI's "brain" light up as it thinks!

## Quick Start

### 1. Test the Implementation

Open the test suite in your browser:
```bash
cd systems/visual_shell/web
python3 -m http.server 8000
# Then visit: http://localhost:8000/test_neural_heatmap.html
```

### 2. Use in the Infinite Map

1. Start the visual shell server:
   ```bash
   cd systems/visual_shell/web
   ./start.sh
   # or: python3 mock_server.py 8000 8765
   ```

2. Open in browser: `http://localhost:8000/index.html`

3. Navigate to an LLM tile (e.g., coordinates 50, 50 for Qwen Coder)

4. Press **H** to toggle the heatmap overlay

5. Press **M** to cycle through visualization modes

## Visualization Modes

| Mode | Description | Use Case |
|------|-------------|----------|
| **Thermal** 🔥 | Blue (low) → Red (high) entropy | See neural complexity |
| **Plasma** ⚡ | Purple → Yellow gradient | Artistic visualization |
| **Holographic** 📺 | Cyan with scanlines | Sci-fi effect |
| **Contour** 📊 | Isoline-based | Analytical view |

## Keyboard Controls

| Key | Action |
|-----|--------|
| **H** | Toggle heatmap on/off |
| **M** | Cycle visualization modes |

## API Usage

```javascript
// Initialize the overlay
const overlay = new NeuralHeatmapOverlay(infiniteMap, {
    gridSize: 100,
    mode: 'thermal',
    decayRate: 0.98,
    visible: false
});

// Record activity (automatic during inference)
overlay.activityTracker.recordActivity(x, y, intensity);

// Or record layer access
overlay.activityTracker.recordLayerAccess('layer_name', bounds, intensity);

// Control the overlay
overlay.toggle();              // Show/hide
overlay.setMode('plasma');     // Change mode
overlay.setOpacity(0.8);       // Adjust opacity
overlay.setDecayRate(0.95);     // Change decay speed
```

## Files

| File | Description |
|------|-------------|
| `shaders/heatmap.wgsl` | GPU shader for entropy calculation |
| `activity_tracker.js` | Tracks neural activity with decay |
| `layer_mapper.js` | Parses metadata, maps layers |
| `neural_heatmap_overlay.js` | Main overlay class |
| `infinite_map.js` | Integration (updated) |
| `test_neural_heatmap.html` | Test suite |

## Integration Checklist

To integrate into your own page:

1. **Include the scripts** (in order):
   ```html
   <script src="lib/pixi.min.js"></script>
   <script src="hilbert_lut.js"></script>
   <script src="activity_tracker.js"></script>
   <script src="layer_mapper.js"></script>
   <script src="neural_heatmap_overlay.js"></script>
   ```

2. **Initialize after PixiJS**:
   ```javascript
   const overlay = new NeuralHeatmapOverlay(yourPixiContainer, {
       mode: 'thermal',
       visible: true
   });
   overlay.start();
   ```

3. **Record activity** during inference:
   ```javascript
   overlay.activityTracker.recordActivity(x, y, intensity);
   ```

## Troubleshooting

**Heatmap not visible?**
- Press **H** to toggle it on
- Check browser console for errors
- Verify scripts loaded in correct order

**Poor performance?**
- Reduce grid size in config
- Lower update interval
- Check GPU acceleration is enabled

**Activity not showing?**
- Verify you're calling `recordActivity()`
- Check decay rate isn't too high
- Ensure intensity > 0

## Design Document

For full technical details, see:
`docs/plans/2026-02-07-neural-heatmap-overlay-design.md`

---

**Status**: ✅ Implementation Complete
**Last Updated**: 2026-02-07
