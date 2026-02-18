# Visual Consistency Contract (VCC)

**Real-time health monitoring for the Geometry OS Infinite Map**

The Visual Consistency Contract enforces PAS (Perceptual Alignment Stability) scores across all tiles in the PixiJS shell, bridging Tectonic Canary's spectral analysis with reactive visual feedback.

> *"The screen is the hard drive, and the canary is the eye."*

## Overview

The VCC provides:
- **Real-time health analysis** of visible tiles via WebSocket
- **Visual feedback overlays** (borders, scanlines, chromatic aberration)
- **Auto-retranspile triggers** when V-PAS drops below threshold
- **Circuit breaker** protection for corrupted tiles
- **Policy enforcement** for viewport-wide health standards

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     TECTONIC CANARY (Python)                     │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────────┐ │
│  │ V-PAS Scorer│  │FFT Analysis │  │ Fracture Detection      │ │
│  └──────┬──────┘  └──────┬──────┘  └───────────┬─────────────┘ │
└─────────┼────────────────┼─────────────────────┼───────────────┘
          │                │                     │
          └────────────────┴─────────────────────┘
                           │
                    WebSocket :8766/vcc
                           │
┌──────────────────────────┼─────────────────────────────────────┐
│                     VISUAL SHELL (PixiJS)                      │
│  ┌───────────────────────┼─────────────────────────────────┐  │
│  │              VCC INTEGRATION LAYER                       │  │
│  │  ┌─────────────┐  ┌──────────┐  ┌────────────────────┐  │  │
│  │  │ Consistency │  │  Visual  │  │   Health Overlay   │  │  │
│  │  │   Oracle    │  │  Policy  │  │     Renderer       │  │  │
│  │  └──────┬──────┘  └────┬─────┘  └─────────┬──────────┘  │  │
│  │         │              │                  │             │  │
│  │         └──────────────┴──────────────────┘             │  │
│  │                        │                                │  │
│  │                   Infinite Map                         │  │
│  │              (PixiJS Tile Container)                   │  │
│  └────────────────────────┼────────────────────────────────┘  │
│                           │                                    │
│              Border Glows │ Scanlines │ Chromatic Aberration   │
└───────────────────────────┴────────────────────────────────────┘
```

## Components

### 1. ConsistencyOracle (`visual_consistency_contract.js`)
Central registry for tile health scores:
- Content-addressable lookup by tile coordinates
- Health status cache with TTL
- Statistics aggregation
- Event subscription for status changes

```javascript
const oracle = new ConsistencyOracle({
    maxCacheSize: 10000,
    ttlMs: 300000
});

oracle.updateHealth('10,20,1', {
    v_pas_score: 0.95,
    status: 'OPTIMAL'
});
```

### 2. HealthOverlayRenderer (`health_overlay_renderer.js`)
PixiJS-based visual feedback system:
- Color-coded border glows by health status
- Fracture markers on detected artifacts
- Chromatic aberration for low V-PAS scores
- Scanline degradation effects
- Entropy noise visualization

### 3. VisualContractPolicy (`visual_contract_policy.js`)
Policy engine for automated responses:
- Auto-retranspile at V-PAS < 0.85
- Circuit breaker for corrupted tiles
- Quarantine propagation to neighbors
- Viewport-wide health evaluation

### 4. CanaryWebSocketBridge (`canary_websocket_bridge.js`)
Real-time connection to Tectonic Canary:
- Health report streaming
- Analysis request batching
- Automatic reconnection
- Bidirectional feedback

### 5. VCCIntegration (`vcc_integration.js`)
Orchestration layer that wires everything together.

## V-PAS Score Thresholds

| Status    | Threshold | Visual Effect                                |
|-----------|-----------|----------------------------------------------|
| OPTIMAL   | ≥ 0.95    | Green border glow                            |
| STABLE    | ≥ 0.90    | Blue border glow                             |
| WARNING   | ≥ 0.85    | Orange border + light scanlines              |
| CRITICAL  | ≥ 0.70    | Red border + heavy scanlines + aberration    |
| CORRUPTED | < 0.70    | Red glow + fracture markers + full effects   |

## Usage

### 1. Start the Tectonic Canary Server

```bash
cd systems/health
python canary_websocket_server.py --port 8766
```

### 2. Load VCC in the Visual Shell

Add to `index.html`:

```html
<!-- After PixiJS and application.js -->
<script src="vcc/vcc_loader.js"></script>
```

The VCC will auto-initialize when the infinite map is ready.

### 3. Keyboard Shortcuts

| Shortcut         | Action                          |
|------------------|---------------------------------|
| Ctrl+Shift+H     | Toggle health overlays          |
| Ctrl+Shift+V     | Show viewport health summary    |

### 4. JavaScript API

```javascript
// Get health for specific tile
const health = window.VCC.getHealth('10,20,1');

// Get viewport-wide summary
const summary = window.VCC.getViewportHealth();

// Manually trigger analysis
window.VCC.analyze([
    { tileKey: '10,20,1', texturePath: '/path/to/tile.rts.png' }
]);

// Toggle overlays
window.VCC.toggleOverlays();

// Get system stats
const stats = window.VCC.getStats();
```

## Configuration

```javascript
const vcc = new VCCIntegration(infiniteMap, {
    // WebSocket
    canaryUrl: 'ws://localhost:8766/vcc',
    
    // Oracle
    maxCachedTiles: 10000,
    healthTTL: 300000,
    
    // Visual
    enableOverlays: true,
    enableChromaticAberration: true,
    
    // Policy
    autoRetranspile: true,
    retranspileThreshold: 0.85,
    circuitBreakerEnabled: true,
    
    // Debug
    debug: false,
    logLevel: 'warn'
});
```

## Protocol

### WebSocket Messages (Server → Client)

```json
{
    "type": "HEALTH_REPORT",
    "report": {
        "tileKey": "10,20,1",
        "textureHash": "abc123...",
        "vPasScore": 0.95,
        "status": "OPTIMAL",
        "semanticCoherence": 0.94,
        "spectralStability": 0.98,
        "textureEntropy": 0.45,
        "artifacts": [[0.5, 0.3], [0.2, 0.8]],
        "timestamp": "2026-01-30T15:41:55Z"
    }
}
```

### WebSocket Messages (Client → Server)

```json
{
    "type": "REQUEST_ANALYSIS",
    "tiles": [
        { "tileKey": "10,20,1", "texturePath": "/tiles/10_20.rts.png" }
    ],
    "timestamp": 1706629315000
}
```

## Integration with Agents

The VCC integrates with the agent ecosystem:

| Agent                    | VCC Response                                  |
|--------------------------|-----------------------------------------------|
| GraphicsRenderingAgent   | Apply chromatic aberration when V-PAS < 0.85  |
| SystemServicesAgent      | Auto-retranspile at V-PAS < 0.85             |
| NeuralCognitiveAgent     | Use spectral stability as trust metric        |
| VisualShellAgent         | Display health overlay on infinite map tiles  |

## Testing

Run the test suite:

```bash
# Python server tests
python -m pytest systems/health/tests/

# JavaScript tests (in browser console)
window.VCC.getStats()
window.VCC.getViewportHealth()
```

## Performance

- **Target latency**: <100ms from texture load to health overlay
- **Cache hit rate**: >80% for repeated tile views
- **Memory limit**: 10,000 cached health entries (~50MB)
- **WebSocket reconnect**: Automatic with exponential backoff

## Future Enhancements

1. **Holographic Dictionary Manager**: VRAM-native content-addressable cache
2. **Vibe Coding AI Agents**: Train models on perceptual anomaly detection
3. **Predictive Health**: Anticipate degradation before V-PAS drops
4. **Swarm Consensus**: Cross-validate health across multiple Canary instances

## License

Part of the Geometry OS project.
