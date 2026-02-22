# PatternRecognizer.js

## Overview

The `PatternRecognizer` class identifies recurring execution patterns in Pixel CPU instruction traces. It implements sequence extraction, pattern matching, and provides a pattern visualization UI. The class is optimized for performance with a target of <5ms for 10,000 instructions and integrates seamlessly with the `ExecutionTracer` from Task 1.2.

## Features

### Core Functionality
- **Sequence Extraction**: Extracts instruction sequences from execution traces using a sliding window approach
- **Pattern Identification**: Detects recurring patterns of configurable lengths (2-8 instructions by default)
- **Pattern Matching**: Supports both exact and fuzzy matching with configurable similarity thresholds
- **Pattern Evolution**: Analyzes how patterns change over time

### Performance Optimization
- **<5ms Target**: Optimized to process 10,000 instructions in under 5ms
- **Incremental Updates**: Pattern frequency tracking updates incrementally for real-time performance
- **Circular Buffer Support**: Efficiently handles large trace buffers

### Visualization
- **PIXI.js Integration**: Pattern visualization UI built with PIXI.js
- **Real-time Updates**: Pattern visualization updates at configurable intervals
- **Pattern Bars**: Visual representation of pattern frequencies
- **Statistics Display**: Comprehensive pattern and performance statistics

### Integration
- **ExecutionTracer Link**: Seamless integration with `ExecutionTracer` from Task 1.2
- **Auto-Detection**: Automatic pattern detection on trace updates
- **Export/Import**: Pattern data can be exported and imported as JSON

## Installation

Include the `PatternRecognizer.js` file in your HTML:

```html
<script src="PatternRecognizer.js"></script>
```

Also include the `ExecutionTracer.js` for integration:

```html
<script src="ExecutionTracer.js"></script>
```

## Usage

### Basic Usage

```javascript
// Create a PatternRecognizer instance
const recognizer = new PatternRecognizer({
    minPatternLength: 2,
    maxPatternLength: 8,
    minPatternFrequency: 3,
    maxPatterns: 100
});

// Extract sequences from trace data
const sequences = recognizer.extractSequences(traceData, 5);

// Identify patterns
const patterns = recognizer.identifyPatterns(sequences);

// Get pattern statistics
const stats = recognizer.getPatternStats();
console.log(`Found ${stats.totalPatterns} patterns`);
```

### Integration with ExecutionTracer

```javascript
// Create instances
const tracer = new ExecutionTracer();
const recognizer = new PatternRecognizer();

// Link recognizer to tracer
recognizer.setExecutionTracer(tracer);

// Detect patterns from tracer trace
const patterns = recognizer.detectFromTracer(5);

// Enable auto-detection
recognizer.setAutoDetection(true);
```

### Pattern Matching

```javascript
// Exact matching
const sequence = [{ opcode: 1 }, { opcode: 2 }, { opcode: 3 }];
const exactMatch = recognizer.matchPattern(sequence, false);

// Fuzzy matching
const fuzzyMatch = recognizer.matchPattern(sequence, true);

if (exactMatch) {
    console.log(`Pattern matched with confidence: ${exactMatch.confidence}`);
    console.log(`Match type: ${exactMatch.matchType}`);
}
```

### Visualization

```javascript
// Create visualization UI (requires PIXI.js and InfiniteMap)
recognizer.createVisualizationUI(infiniteMap);

// Update visualization (call in your render loop)
function animate(timestamp) {
    recognizer.updateVisualization(timestamp);
    requestAnimationFrame(animate);
}

// Remove visualization
recognizer.removeVisualizationUI();
```

### Export/Import Patterns

```javascript
// Export patterns
const exported = recognizer.exportPatterns();
console.log(JSON.stringify(exported, null, 2));

// Import patterns
const recognizer2 = new PatternRecognizer();
recognizer2.importPatterns(exported);
```

## Configuration Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `minPatternLength` | number | 2 | Minimum pattern length to detect |
| `maxPatternLength` | number | 8 | Maximum pattern length to detect |
| `minPatternFrequency` | number | 3 | Minimum frequency for pattern reporting |
| `maxPatterns` | number | 100 | Maximum number of patterns to track |
| `enableVisualization` | boolean | true | Enable pattern visualization UI |
| `uiRefreshInterval` | number | 200 | UI refresh interval (ms) |
| `enableAutoDetection` | boolean | true | Automatically detect patterns on trace updates |
| `similarityThreshold` | number | 0.8 | Similarity threshold for fuzzy matching (0-1) |

## API Reference

### Constructor

```javascript
new PatternRecognizer(config)
```

Creates a new PatternRecognizer instance.

### Methods

#### `setExecutionTracer(tracer)`
Links the PatternRecognizer to an ExecutionTracer instance.

#### `extractSequences(trace, length)`
Extracts instruction sequences from trace data.

#### `identifyPatterns(sequences, options)`
Identifies recurring patterns in instruction sequences.

#### `matchPattern(sequence, fuzzy)`
Matches a sequence against known patterns.

#### `detectFromTracer(patternLength)`
Detects patterns from ExecutionTracer trace.

#### `analyzePatternEvolution()`
Analyzes pattern evolution over time.

#### `getPatternStats()`
Returns pattern statistics.

#### `getPerformanceStats()`
Returns performance statistics.

#### `clear()`
Clears all patterns and resets state.

#### `exportPatterns()`
Exports patterns to JSON.

#### `importPatterns(data)`
Imports patterns from JSON.

#### `createVisualizationUI(infiniteMap)`
Creates pattern visualization UI.

#### `updateVisualization(timestamp)`
Updates pattern visualization UI.

#### `removeVisualizationUI()`
Removes visualization UI.

#### `setAutoDetection(enabled)`
Enables or disables automatic pattern detection.

#### `setConfig(options)`
Sets configuration options.

#### `getConfig()`
Returns current configuration.

## Performance Benchmarks

The PatternRecognizer is optimized for performance:

- **Target**: <5ms for 10,000 instructions
- **Sequence Extraction**: O(n) complexity
- **Pattern Identification**: O(n × m) where n is sequence count and m is pattern length
- **Pattern Matching**: O(p) where p is number of stored patterns

## Testing

Run the test suite in a browser:

```bash
# Open the test HTML file in a browser
open systems/visual_shell/web/test_pattern_recognizer.html
```

Or run with Node.js:

```bash
node systems/visual_shell/web/test_pattern_recognizer.js
```

## Example Output

```
✓ PatternRecognizer initialized
✓ PatternRecognizer linked to ExecutionTracer
✓ Extracted 996 sequences
✓ Detected 15 patterns
✓ Top pattern: MOV → ADD → LOAD → ADD → STORE (45x)
```

## Pattern Visualization

The visualization UI displays:

1. **Statistics**: Total patterns, occurrences, average pattern length
2. **Top Patterns**: List of most frequent patterns with counts
3. **Pattern Details**: Length distribution and frequency analysis
4. **Pattern Bars**: Visual representation of pattern frequencies

## Integration with Other Components

### ExecutionTracer Integration

The PatternRecognizer integrates with the ExecutionTracer to automatically detect patterns from instruction traces:

```javascript
const tracer = new ExecutionTracer();
const recognizer = new PatternRecognizer();

// Record instructions in tracer
tracer.recordInstruction(pc, opcode, dest, src1, src2, registers);

// Detect patterns
recognizer.setExecutionTracer(tracer);
const patterns = recognizer.detectFromTracer();
```

### Pixel CPU Integration

The PatternRecognizer can analyze execution patterns from the Pixel CPU:

```javascript
const cpu = new SimplePixelCPU();
const tracer = new ExecutionTracer();
const recognizer = new PatternRecognizer();

// Set up instruction callback
cpu.instructionCallback = (pc, opcode, dest, src1, src2, registers) => {
    tracer.recordInstruction(pc, opcode, dest, src1, src2, registers);
};

// Run CPU
await cpu.loadBrick('program.brick');
cpu.run();

// Analyze patterns
recognizer.setExecutionTracer(tracer);
const patterns = recognizer.detectFromTracer();
```

## License

This component is part of the Geometry OS project.

## See Also

- [`ExecutionTracer.js`](ExecutionTracer.js) - Execution tracing for pattern detection
- [`pixel_cpu.js`](pixel_cpu.js) - Pixel CPU emulator
- [`infinite_map.js`](infinite_map.js) - Infinite map visualization
