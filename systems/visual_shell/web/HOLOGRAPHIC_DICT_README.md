# Holographic Dictionary Manager

## VRAM-Native Content-Addressable Execution

The Holographic Dictionary Manager is the browser-side implementation of the Geometric Codebook system. It enables **semantic pixel expansion**—where a single pixel can represent entire code blocks through token-based compression.

## Architecture Overview

```
┌─────────────────────────────────────────────────────────────────────────┐
│                 HOLOGRAPHIC DICTIONARY ARCHITECTURE                     │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  Python (semantic_color_mapper.py)                                     │
│    ↓ Creates codebook.json                                             │
│                                                                         │
│  Browser (GeometricDictionary)                                         │
│    ↓ Loads codebook                                                    │
│                                                                         │
│  Pixel (RGBA)                                                           │
│    ↓ Token ID lookup (R<<16 | G<<8 | B)                                │
│                                                                         │
│  SemanticToken                                                          │
│    ↓ Expands to N RISC-V instructions                                   │
│                                                                         │
│  SimplePixelCPU                                                         │
│    ↓ Executes expanded instructions                                    │
│                                                                         │
│  Result                                                                 │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

## Key Concepts

### Semantic vs Literal Modes

| Mode | Pixel → Instructions | Compression | Use Case |
|------|---------------------|-------------|----------|
| **Literal** | 1 pixel = 1 instruction (4 bytes) | 1.00x | Raw binary data, legacy .rts.png |
| **Semantic** | 1 pixel = N instructions (via token) | 2.00x - 100x+ | Compressed code blocks, patterns |
| **Hybrid** | Mixed semantic + literal | Variable | Optimal flexibility |

### Token Encoding

```
RGBA Pixel → Token ID:
  R (bits 16-23): Token ID high byte
  G (bits 8-15):  Token ID mid byte
  B (bits 0-7):   Token ID low byte
  A:             Unused (set to 255)

Example: Bright red (255, 0, 0) → Token ID 0xFF0000
```

### Codebook Format

```json
{
  "version": "1.0",
  "created_at": "2024-01-30T00:00:00Z",
  "tokens": [
    {
      "token_id": 16711680,  // 0xFF0000
      "name": "INIT_BLOCK",
      "category": 0,
      "complexity": 0.8,
      "stability": 0.9,
      "code_bytes": "0500079300500813000000b7",
      "frequency": 100
    }
  ],
  "categories": {
    "0": { "name": "Foundation", "color": "#FF0000" }
  }
}
```

## Usage

### Basic Setup

```javascript
// Create dictionary
const dictionary = new GeometricDictionary({
    cacheVRAM: true  // Prepare for GPU execution
});

// Load from manifest
await dictionary.loadFromManifest('geometric_codebook.json');

// Create executor with semantic mode
const executor = new PixelExecutor({
    dictionary: dictionary,
    semanticMode: true,
    hybridMode: true
});

// Execute from texture
const result = await executor.executeFromTexture('program.rts.png');
```

### Creating a Codebook

```javascript
// Create tokens manually
const token = new SemanticToken({
    token_id: 0xFF0000,
    name: 'INIT_BLOCK',
    category: 0,
    complexity: 0.8,
    stability: 0.9,
    code_bytes: '0500079300500813000000b7'  // Hex instructions
});

// Add to dictionary
dictionary._addToken(token);

// Or load from JSON
await dictionary.loadFromManifest('codebook.json');
```

### Semantic Expansion

```javascript
// Check if pixel is semantic
const isSemantic = dictionary.isSemanticPixel(255, 0, 0);  // true

// Get instructions from pixel
const instructions = dictionary.getInstructionsFromPixel(255, 0, 0, 255);
// Returns Uint32Array of RISC-V instructions

// Get token metadata
const token = dictionary.getToken(0xFF0000);
console.log(token.name);           // "INIT_BLOCK"
console.log(token.instructionCount); // e.g., 3
console.log(token.getCompressionRatio()); // e.g., 3.0
```

### VRAM Preparation

```javascript
// Create GPU-optimized dictionary
const dictionary = GeometricDictionaryFactory.createGPUOptimized();

// Load codebook
await dictionary.loadFromManifest('codebook.json');

// Export for WebGPU
const gpuData = dictionary.exportForGPU();
// {
//   texture: { width, height, data: Uint8Array },
//   tokenCount: 100,
//   lookupTable: [...]
// }
```

## API Reference

### GeometricDictionary

Main dictionary manager class.

#### Constructor

```javascript
new GeometricDictionary(options);
```

**Options:**
- `cacheVRAM` (boolean): Prepare VRAM texture for GPU (default: false)
- `maxCacheSize` (number): Maximum tokens to cache (default: 4096)

#### Methods

| Method | Returns | Description |
|--------|---------|-------------|
| `loadFromManifest(url)` | Promise<Object> | Load codebook from JSON |
| `getInstructionsFromPixel(r, g, b, a)` | Uint32Array | Extract instructions from pixel |
| `getToken(tokenId)` | SemanticToken\|null | Get token by ID |
| `getTokensByCategory(categoryId)` | Array<SemanticToken> | Get all tokens in category |
| `getCategory(categoryId)` | Object\|null | Get category metadata |
| `isSemanticPixel(r, g, b)` | boolean | Check if pixel matches token |
| `getStats()` | Object | Get dictionary statistics |
| `createManifest()` | Object | Export as JSON manifest |
| `exportForGPU()` | Object | Export for WebGPU use |

### SemanticToken

Represents a single semantic token.

#### Properties

| Property | Type | Description |
|----------|------|-------------|
| `tokenId` | number | Unique token identifier |
| `name` | string | Token name |
| `category` | number | Semantic category |
| `complexity` | number | Complexity score (0-1) |
| `stability` | number | Stability score (0-1) |
| `instructions` | Uint32Array | Decoded RISC-V instructions |
| `instructionCount` | number | Number of instructions |

#### Methods

| Method | Returns | Description |
|--------|---------|-------------|
| `getCompressionRatio()` | number | Instructions per pixel |
| `toColor()` | Object | RGBA color representation |
| `toPixelData()` | Uint8Array | RGBA pixel data (4 bytes) |

### GeometricDictionaryFactory

Factory for creating pre-configured dictionaries.

```javascript
const defaultDict = GeometricDictionaryFactory.createDefault();
const lightDict = GeometricDictionaryFactory.createLightweight();
const gpuDict = GeometricDictionaryFactory.createGPUOptimized();
```

## PixelExecutor Integration

### Enabling Semantic Mode

```javascript
const executor = new PixelExecutor();

// Option 1: Set dictionary and enable semantic mode
executor.setDictionary(dictionary);
executor.setSemanticMode(true);

// Option 2: Load dictionary and auto-enable
await executor.loadDictionary('geometric_codebook.json');

// Option 3: Pass to constructor
const executor = new PixelExecutor({
    dictionary: dictionary,
    semanticMode: true
});
```

### Semantic Expansion Callbacks

```javascript
executor.onSemanticExpansion = (info) => {
    console.log(`Expanded pixel at [${info.x}, ${info.y}]`);
    console.log(`Token ID: 0x${info.tokenId.toString(16)}`);
    console.log(`Instructions: ${info.instructionCount}`);
};

const result = await executor.executeFromTexture('program.rts.png');
```

### Execution Statistics

```javascript
const stats = executor.getStats();
// {
//   instructionsExecuted: 1000,
//   semanticPixelsExpanded: 10,
//   literalPixelsExtracted: 5,
//   compressionRatio: 3.5
// }
```

## Demo

### Running the Semantic Expansion Demo

1. Open `index.html` with demo parameter:
   ```
   http://localhost:8000/index.html?demo=semantic_expansion
   ```

2. Or run manually:
   ```javascript
   const demo = new SemanticExpansionDemo();
   await demo.run();
   ```

3. Expected output:
   ```
   ═══════════════════════════════════════════════════════════
      Holographic Dictionary: Semantic Expansion Demo
   ═══════════════════════════════════════════════════════════

   ✓ Dependencies loaded

   Step 1: Creating Sample Codebook
     ✓ Added: INIT_BLOCK (0xff0000)
       Instructions: 3
     ✓ Added: ADD_SEQUENCE (0x00ff00)
       Instructions: 3
     ✓ Added: MUL_SEQUENCE (0x0000ff)
       Instructions: 3
     ✓ Added: LOOP_BLOCK (0xffff00)
       Instructions: 5

   ✓ Codebook created: 4 tokens
      Total instructions: 14
      Avg compression: 3.50x

   Step 2: Creating Test Texture
   ✓ Created test texture (16×16)

   Step 3: Literal Mode Extraction
   ✓ Literal extraction complete in 1.23ms
   Total: 5 instructions from 5 pixels
   Ratio: 1.00x (1 pixel = 1 instruction)

   Step 4: Semantic Mode Extraction
   ✓ Semantic extraction complete in 2.45ms
   Total: 15 instructions from 5 pixels
   Expanded: 4 semantic pixels
   Literal: 1 literal pixels
   Compression Ratio: 3.00x (1 pixel = 3.00 instructions avg)

   ✓✓✓ SUCCESS! Semantic expansion verified ✓✓✓
   ```

## Performance

### Benchmarks

| Operation | Time | Notes |
|-----------|------|-------|
| Dictionary load (100 tokens) | ~5ms | One-time initialization |
| Pixel lookup | <0.1ms | Map.get() operation |
| Token expansion | <0.5ms | Including instruction decoding |
| Full texture extraction (256px) | ~2-5ms | Including Hilbert mapping |

### Memory Usage

| Component | Size (100 tokens) |
|-----------|-------------------|
| Dictionary (JS objects) | ~50KB |
| VRAM texture (optional) | ~64KB |
| Per-token overhead | ~500 bytes |

## Future Enhancements

### WebGPU Integration

```javascript
// Upload dictionary to GPU VRAM
const gpuData = dictionary.exportForGPU();
const device = await navigator.gpu.requestAdapter();
const texture = device.createTexture({
    size: [gpuData.texture.width, gpuData.texture.height, 1],
    format: 'rgba8unorm',
    usage: GPUTextureUsage.SAMPLED | GPUTextureUsage.COPY_DST
});

// Write texture data
device.queue.writeTexture(
    { texture },
    gpuData.texture.data,
    { bytesPerRow: gpuData.texture.width * 4 },
    [gpuData.texture.width, gpuData.texture.height, 1]
);

// Use in compute shader for parallel expansion
```

### JIT Compilation

Cache frequently-used tokens as WebAssembly modules:

```javascript
token.compileToWASM().then(module => {
    // Fast execution for hot tokens
});
```

## Integration with Python

### Creating Codebook in Python

```python
from semantic_color_mapper import SemanticColorMapper

# Create mapper
mapper = SemanticColorMapper()

# Compress RISC-V kernel
compressed = mapper.compress('kernel.bin', 'kernel_codebook.json')

# Generate .rts.png with semantic pixels
mapper.paint_logic('kernel.asm', 'kernel_semantic.rts.png')
```

### Loading in Browser

```javascript
const executor = new PixelExecutor();
await executor.loadDictionary('kernel_codebook.json');
const result = await executor.executeFromTexture('kernel_semantic.rts.png');
```

## References

- [Semantic Color Mapping Guide](../../ace/rts/SEMANTIC_COLOR_MAPPING_GUIDE.md)
- [Pixel-Exec Protocol](./PIXEL_EXEC_PROTOCOL.md)
- [Hilbert LUT Module](./hilbert_lut.js)
- [Pixel Executor](./pixel_executor.js)

---

> "The screen is the hard drive, and the dictionary is the genome."
>
> — Geometry OS Manifesto
