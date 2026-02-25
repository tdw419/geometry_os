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

## Future Shaders (Planned)

- **NVG Shader:** Night vision green phosphor effect for low-visibility diagnostics
- **CRT Shader:** Retro scan-line effect for nostalgic system monitoring
- **Sonar Shader:** Pulsing radar effect for process discovery
