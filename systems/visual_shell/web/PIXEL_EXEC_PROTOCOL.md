# Pixel-Exec Protocol: "The Screen is the Hard Drive"

## Overview

The Pixel-Exec Protocol is the missing link between the Visual Shell (PixiJS) and the RTS FUSE system. It enables **direct execution of RISC-V instructions from texture pixels** using Hilbert curve spatial mapping.

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    PIXEL-EXEC PROTOCOL ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  .rts.png Texture ──► Hilbert LUT ──► Pixel Data ──► RISC-V Instrs     │
│                      (Spatial          (RGBA         (32-bit            │
│                       Mapping)         Extraction)    Decoding)          │
│                                                                         │
│                           ┌─────────────────┐                            │
│                           │  PixelExecutor  │                            │
│                           └────────┬────────┘                            │
│                                    ↓                                     │
│                           ┌─────────────────┐                            │
│                           │ SimplePixelCPU  │                            │
│                           └────────┬────────┘                            │
│                                    ↓                                     │
│                           Execution Results                               │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

## Architecture

### Components

| Component | File | Description |
|-----------|------|-------------|
| **HilbertLUT** | `hilbert_lut.js` | Hilbert curve lookup table for spatial mapping |
| **HilbertLUTBuilder** | `hilbert_lut.js` | Utility for mapping bytes ↔ pixels |
| **PixelExecutor** | `pixel_executor.js` | Main executor that reads from textures |
| **PixelExecDemo** | `pixel_exec_demo.js` | Demo/test suite |

### Data Flow

1. **Encoding** (Python side, RTS FUSE):
   - RISC-V instructions → Hilbert-mapped pixels → .rts.png texture

2. **Decoding** (JavaScript side, Pixel-Exec):
   - .rts.png texture → RGBA pixels → Hilbert extraction → RISC-V instructions

3. **Execution** (SimplePixelCPU):
   - RISC-V instructions → CPU execution → Results

## Usage

### Basic Usage

```javascript
// Create executor
const executor = new PixelExecutor({
    littleEndian: true
});

// Execute from texture
const result = await executor.executeFromTexture('program.rts.png', {
    maxCycles: 10000,
    entryPoint: 0,
    reset: true
});

console.log('Execution result:', result);
```

### Using with PixiJS Sprites

```javascript
// Assume you have a PixiJS sprite on the infinite map
const sprite = new PIXI.Sprite.from('program.rts.png');

// Execute directly from the sprite
const result = await executor.executeFromTexture(sprite);
```

### Using with HTML Canvas

```javascript
// Create a canvas with embedded instructions
const canvas = document.createElement('canvas');
// ... draw instructions to canvas ...

// Execute from canvas
const result = await executor.executeFromTexture(canvas);
```

### Advanced Usage: Factory Methods

```javascript
// Fast executor (no tracing)
const fastExecutor = PixelExecutorFactory.createFast();

// Debug executor (with instruction tracing)
const debugExecutor = PixelExecutorFactory.createDebug();

// Executor with progress callback
const progressExecutor = PixelExecutorFactory.withProgress((progress, cycles, max) => {
    console.log(`Progress: ${progress.toFixed(1)}%`);
});
```

## API Reference

### HilbertLUT

Static methods for Hilbert curve operations.

```javascript
// Convert distance to coordinates
const [x, y] = HilbertLUT.d2xy(16, 42);

// Convert coordinates to distance
const d = HilbertLUT.xy2d(16, 5, 7);

// Generate or get cached LUT
const lut = HilbertLUT.getLUT(4); // Order 4 = 16x16 grid
```

### HilbertLUTBuilder

Utility for mapping data to/from pixels.

```javascript
const builder = new HilbertLUTBuilder();
builder.setOrder(4); // 16x16 grid

// Map bytes to pixel coordinates
const pixels = builder.mapBytesToPixels(byteArray, 4); // 4 bytes per pixel

// Extract bytes from pixels
const bytes = builder.extractBytesFromPixels(imageData.data, width, height);

// Extract RISC-V instructions
const instructions = builder.extractInstructions(imageData.data, width, height);
```

### PixelExecutor

Main executor class.

```javascript
const executor = new PixelExecutor({
    cpu: customCpuInstance,  // Optional: custom CPU
    order: 4,                 // Optional: Hilbert order (auto-detected if not set)
    littleEndian: true        // Byte order
});

// Execute from texture
const result = await executor.executeFromTexture(textureSource, {
    maxCycles: 10000,        // Maximum cycles
    entryPoint: 0,           // Entry point PC
    reset: true              // Reset CPU before loading
});

// Event callbacks
executor.onInstruction = (cpu) => { /* ... */ };
executor.onHalt = (cpu) => { /* ... */ };
executor.onError = (error) => { /* ... */ };
executor.onProgress = (progress, cycles, max) => { /* ... */ };

// Control
executor.stop();
executor.reset();

// State
const stats = executor.getStats();
const snapshot = executor.createSnapshot();
executor.restoreSnapshot(snapshot);
```

## Integration with Visual Shell

The Pixel-Exec Protocol integrates seamlessly with the existing Visual Shell:

```javascript
// In your Visual Shell application
class GeometryOSApplication {
    async initialize() {
        // ... existing initialization ...

        // Create pixel executor for tile execution
        this.pixelExecutor = new PixelExecutor();

        // Set up event handlers
        this.pixelExecutor.onHalt = (cpu) => {
            this.onExecutionComplete(cpu);
        };
    }

    async executeTile(tilePath) {
        // Load and execute a tile from the infinite map
        const result = await this.pixelExecutor.executeFromTexture(tilePath);

        // Display results in the UI
        this.showExecutionResults(result);

        return result;
    }

    onExecutionComplete(cpu) {
        console.log('Execution complete!');
        console.log('Registers:', cpu.registers);
        console.log('Cycles:', cpu.cycles);
    }
}
```

## Demo

Run the demo to see the Pixel-Exec Protocol in action:

1. Open `index.html` in a browser
2. Add `?demo=pixel_exec` to the URL
3. Open browser console to see execution trace

Or run manually:

```javascript
const demo = new PixelExecDemo();
await demo.run();
```

Expected output:
```
═══════════════════════════════════════════════════════════
     Pixel-Exec Protocol Demo: "The Screen is the Hard Drive"
═══════════════════════════════════════════════════════════
✓ Dependencies loaded
✓ PixelExecutor initialized

✓ Created test texture (16x16) with embedded RISC-V instructions
  Program:
    addi x1, x0, 5   # x1 = 5
    addi x2, x0, 7   # x2 = 7
    add  x3, x1, x2  # x3 = x1 + x2 = 12
    ebreak           # halt

✓ Extracted 4 instructions in 2.34ms

[████████████████████] 100.0% (6/1000 cycles)

✓ Execution complete

Final Register State:
  x1 (t1):  5 (expected: 5)
  x2 (t2):  7 (expected: 7)
  x3 (t3):  12 (expected: 12)

✓✓✓ SUCCESS! Register values match expected output ✓✓✓
```

## Technical Details

### Hilbert Curve Mapping

The Hilbert curve preserves spatial locality, ensuring that:
- Nearby linear indices → Nearby 2D coordinates
- Cache-friendly memory access patterns
- Visually coherent code structure

### Instruction Encoding

RISC-V instructions are 32-bit values encoded as RGBA pixels:
- **R channel**: Bits 24-31
- **G channel**: Bits 16-23
- **B channel**: Bits 8-15
- **A channel**: Bits 0-7

### Performance

- Extraction: ~2-3ms for 16x16 texture
- Execution: ~1000-10000 instructions/sec (JavaScript CPU)
- Memory: Minimal overhead (LUT caching)

## Future Enhancements

1. **GPU Execution**: WebGPU compute shaders for parallel execution
2. **JIT Compilation**: Transpile to WebAssembly for faster execution
3. **Memory Mapping**: Support for memory-mapped I/O from textures
4. **Debugging**: Step-through debugging with visual highlighting
5. **Profiling**: Performance profiling with heat map visualization

## References

- [Hilbert Curve Wikipedia](https://en.wikipedia.org/wiki/Hilbert_curve)
- [RISC-V Specification](https://riscv.org/technical/specifications/)
- [RTS FUSE System](../../rts_fuse/)
- [SimplePixelCPU](./pixel_cpu.js)

---

> "The screen is the hard drive, and the canary is the eye."
>
> — Geometry OS Manifesto
