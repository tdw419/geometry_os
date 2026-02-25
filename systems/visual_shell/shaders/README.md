# Geometry OS Diagnostic Shaders

WGSL compute shaders for system observability and visualization.

## Thermal Shader (`thermal.wgsl`)

### Purpose
Visualizes "hot" memory regions and CPU-intensive processes via heat-map gradients. Part of the WorldView Morphological Layer's diagnostic shader suite.

### How It Works
1. Reads luminance values from source texture (representing heat scores from memory access patterns)
2. Maps luminance to thermal color gradient
3. Outputs heat-map visualization

### Input
- **Input Texture:** Luminance channel represents heat score (0.0 = cold, 1.0 = hot)
- **Uniforms:**
  - `time`: Animation time for pulsing effects
  - `intensity`: Multiplier for heat intensity (default: 1.0)
  - `threshold_low`: Lower bound for cold regions (default: 0.0)
  - `threshold_high`: Upper bound for hot regions (default: 1.0)

### Output
Heat-map gradient color:
| Value Range | Color | Meaning |
|-------------|-------|---------|
| 0.0 - 0.2 | Black to Blue | Cold / Idle |
| 0.2 - 0.4 | Blue to Cyan | Low activity |
| 0.4 - 0.6 | Cyan to Green | Normal activity |
| 0.6 - 0.8 | Green to Yellow | High activity |
| 0.8 - 1.0 | Yellow to Red/White | Critical / Hot |

### Use Cases
- **Memory Leak Detection:** Identify regions with persistent high heat
- **CPU Bottleneck Analysis:** Visualize process CPU intensity
- **Runaway Process Identification:** Spot anomalous hot spots
- **Load Balancing:** See thermal distribution across the virtual substrate

### Integration
```javascript
// Example: Apply thermal shader to memory heatmap
const thermalShader = await loadShader('thermal.wgsl');
const pipeline = device.createComputePipeline({
    layout: pipelineLayout,
    compute: {
        module: thermalShader,
        entryPoint: 'main',
    },
});
```

### Technical Notes
- Workgroup size: 8x8 for optimal GPU occupancy
- Uses standard luminance weights (ITU-R BT.601)
- Compute shader for parallel processing on GPU

---

## NVG Shader (`nvg.wgsl`)

### Purpose
Night Vision Goggle effect for revealing hidden or encrypted data fragments. Part of the WorldView Morphological Layer's diagnostic shader suite for detecting `.rts.png` encrypted containers and obfuscated data.

### How It Works
1. Reads color/alpha values from source texture
2. Applies gain amplification for "night vision" brightness boost
3. Detects low-alpha (hidden) regions and highlights them
4. Adds noise grain for authentic NVG aesthetic
5. Outputs monochrome green phosphor display

### Input
- **Input Texture:** RGBA texture where alpha channel indicates visibility (low alpha = hidden data)
- **Uniforms:**
  - `time`: Animation time for noise animation
  - `gain`: Amplification multiplier (default: 2.0)
  - `noise_intensity`: Grain effect strength (default: 0.1)
  - `hidden_threshold`: Alpha threshold for hidden data detection (default: 0.3)

### Output
Monochrome green display with noise grain:
| Pixel Type | Appearance | Meaning |
|------------|------------|---------|
| Normal | Dim green (80% alpha) | Standard visible data |
| Hidden | Bright green (100% alpha) | Encrypted/obfuscated data detected |

### Use Cases
- **Encrypted Container Detection:** Reveal `.rts.png` files with hidden payloads
- **Obfuscation Discovery:** Find intentionally hidden data fragments
- **Low-Visibility Diagnostics:** Examine dark/dim regions of memory map
- **Security Auditing:** Visual scan for suspicious data patterns

### Integration
```javascript
// Example: Apply NVG shader to detect hidden data
const nvgShader = await loadShader('nvg.wgsl');
const pipeline = device.createComputePipeline({
    layout: pipelineLayout,
    compute: {
        module: nvgShader,
        entryPoint: 'main',
    },
});

// Configure for hidden data detection
const uniforms = new Float32Array([
    performance.now() / 1000,  // time
    2.5,                        // gain
    0.08,                       // noise_intensity
    0.3,                        // hidden_threshold
]);
```

### Technical Notes
- Workgroup size: 8x8 for optimal GPU occupancy
- Uses standard luminance weights (ITU-R BT.601)
- Pseudo-random noise uses sine-based hash function
- `select()` built-in used for branchless conditional (GPU optimization)

---

## CRT Shader (`crt.wgsl`)

### Purpose
Visualizes Phase Alignment Stability (PAS) - the synchronization status between the Rust kernel and the 3D viewport. Part of the WorldView Morphological Layer's diagnostic shader suite for detecting kernel-viewport desynchronization.

### How It Works
1. Reads source texture representing stable viewport frame
2. Applies CRT-style visual effects proportional to PAS drift
3. Lower PAS score = more distortion, scanlines, chromatic aberration
4. Outputs nostalgic CRT monitor effect with stability feedback

### Input
- **Input Texture:** RGBA texture from viewport render
- **Uniforms:**
  - `time`: Animation time for jitter effects
  - `pas_score`: Phase Alignment Stability (0.0 = completely unstable, 1.0 = stable)
  - `scanline_intensity`: Base scanline effect strength (default: 0.3)
  - `distortion_amount`: Maximum barrel distortion at PAS=0 (default: 0.2)
  - `resolution`: Output resolution (x, y) for coordinate normalization

### Output
CRT-style visualization with stability indicators:
| PAS Score | Visual Effect | Meaning |
|-----------|---------------|---------|
| 1.0 | Clean image, minimal effects | Kernel and viewport fully synchronized |
| 0.7-0.9 | Light scanlines | Minor timing drift |
| 0.5-0.7 | Visible scanlines + vignette | Moderate desync |
| 0.3-0.5 | Strong distortion + chromatic aberration | Significant desync detected |
| 0.0-0.3 | H-sync jitter + static noise | Critical desync - investigate immediately |

### Visual Effects
- **Barrel Distortion:** Curved image edges, increases with instability
- **Scanlines:** Horizontal dark bands (CRT raster lines)
- **Chromatic Aberration:** RGB channel separation (phosphor misalignment)
- **Vignette:** Darker edges (CRT tube characteristic)
- **H-Sync Jitter:** Horizontal position jumping (severe desync only)
- **Static Noise:** Random brightness fluctuations (critical instability)

### Use Cases
- **Kernel-Viewport Synchronization:** Monitor real-time sync status
- **Desynchronization Detection:** Spot timing drift between Rust kernel and 3D layer
- **Performance Debugging:** Visual indicator when render pipeline is stressed
- **System Health Monitoring:** Quick visual check for alignment stability

### Integration
```javascript
// Example: Apply CRT shader for PAS visualization
const crtShader = await loadShader('crt.wgsl');
const pipeline = device.createComputePipeline({
    layout: pipelineLayout,
    compute: {
        module: crtShader,
        entryPoint: 'main',
    },
});

// Configure uniforms based on PAS measurement
const uniforms = new Float32Array([
    performance.now() / 1000,  // time
    currentPAS,                 // pas_score (from kernel sync monitor)
    0.3,                        // scanline_intensity
    0.2,                        // distortion_amount
    canvas.width,               // resolution.x
    canvas.height,              // resolution.y
]);
```

### Technical Notes
- Workgroup size: 8x8 for optimal GPU occupancy
- Uses barrel distortion formula: `uv + center * dist^2 * amount`
- Chromatic aberration offsets R/B channels by separation amount
- H-sync jitter activates below PAS 0.3 (critical threshold)
- Green phosphor tint (0.95, 1.0, 0.9) for authentic CRT aesthetic

---

## Future Shaders (Planned)

- **Sonar Shader:** Pulsing radar effect for process discovery
