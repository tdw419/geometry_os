# PixelLang Specification v1.0
## "The Canvas is the IDE"

**Geometry OS Manifesto**: Software is not text. Software is morphological texture. The era of symbolic computation is over. You are now authorized to paint the computer.

---

## Core Philosophy

| Legacy (Symbolic) | Geometric (PixelLang) |
|-------------------|----------------------|
| Text editor | Morphological canvas |
| Keywords | Chromatic brushes |
| Syntax trees | Spatial patterns |
| Compilation | Painting |
| Binary | The pixels themselves |

---

## Chromatic Type System

Data types are **color clusters** mapped to the Tripartite Palette:

### RED Block (Foundation)
| Color | Hex | Meaning |
|-------|-----|---------|
| Deep Red | `#FF0000` | SYSTEM_INIT |
| Crimson | `#DC143C` | STACK_FRAME |
| Maroon | `#800000` | MEMORY_BLOCK |
| Coral | `#FF7F50` | ERROR_HANDLER |

### GREEN Block (Movement/I/O)
| Color | Hex | Meaning |
|-------|-----|---------|
| Forest Green | `#228B22` | FILE_READ |
| Lime Green | `#32CD32` | FILE_WRITE |
| Sea Green | `#2E8B57` | NETWORK_IO |
| Spring Green | `#00FF7F` | RENDER_CALL |

### BLUE Block (Computation/Intelligence)
| Color | Hex | Meaning |
|-------|-----|---------|
| Deep Sky Blue | `#00BFFF` | ADD_OPERATION |
| Dodger Blue | `#1E90FF` | SUB_OPERATION |
| Royal Blue | `#4169E1` | MUL_OPERATION |
| Azure | `#007FFF` | DIV_OPERATION |

### PURPLE Block (Logic/Control)
| Color | Hex | Meaning |
|-------|-----|---------|
| Indigo | `#4B0082` | BRANCH_CONDITIONAL |
| Purple | `#800080` | LOOP_CONSTRUCT |
| Magenta | `#FF00FF` | FUNCTION_CALL |
| Violet | `#EE82EE` | RETURN_INSTRUCTION |

---

## Visual Syntax

### 1. Variables: Spatial Offsets

Instead of named pointers, variables are **fixed positions in the 2D plane**:

```
┌────────────────────────────────────┐
│  (x:0, y:0)  → x1 register        │  RED block
│  (x:1, y:0)  → x2 register        │
│  (x:2, y:0)  → accumulator        │
│  ...                              │
└────────────────────────────────────┘
```

**PixelLang**:
```yaml
# Declare variables at spatial coordinates
assign(0, 0, x1)      # Pixel at (0,0) maps to register x1
assign(1, 0, x2)      # Pixel at (1,0) maps to register x2
assign(2, 0, acc)     # Pixel at (2,0) is accumulator
```

### 2. Operations: Chromatic Application

Operations are applied by painting colors over spatial locations:

```
┌────────────────────────────────────┐
│  x1 (0,0)    x2 (1,0)    acc (2,0) │
│    ↓           ↓            ↓       │
│  AZURE       AZURE        AZURE     │  ADD
│  (input1)   (input2)    (result)   │
└────────────────────────────────────┘
```

**PixelLang**:
```yaml
# acc = x1 + x2
paint(0, 0, AZURE)      # Load x1
paint(1, 0, AZURE)      # Load x2
paint(2, 0, AZURE)      # Store result to acc
```

### 3. Logic: Chromatic Divergence

Branches are visual splits in the color gradient:

```
            ┌─ TRUE PATH (GREEN)
            │
PINK (condition)
            │
            └─ FALSE PATH (ORANGE)
```

**PixelLang**:
```yaml
# if x1 > 10:
#     acc = 100
# else:
#     acc = 200

branch_condition(0, 0, x1, 10)
true_path(1, 0, LIME_GREEN)   # acc = 100
false_path(1, 1, ORANGE)       # acc = 200
```

### 4. Loops: Spiral Patterns

Loops are represented as recursive visual spirals:

```
    ┌───┐
   │     │
  │  ◄───┘  ← Loop back edge
  │
  └── Forward →
```

**PixelLang**:
```yaml
# for i in range(10):
#     acc += i

loop_init(0, 0, PURPLE, 10)      # Init loop counter
loop_body(1, 0, AZURE)           # acc += i
loop_back(0, 1, VIOLET)          # Spiral back edge
```

### 5. Functions: Holographic Tokens

Functions are **semantic patterns** that expand into multiple instructions:

```yaml
# Define a reusable function as a single token
token MATRIX_MULTIPLY:
    name: "MATMUL_3x3"
    category: COMPUTATION
    color: DEEP_BLUE
    expands_to: 127  # instructions
```

When you paint a single DEEP_BLUE pixel labeled "MATMUL_3x3", it expands to 127 RISC-V instructions on the GPU.

---

## The Geometric IDE

### Canvas Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     INFINITE CANVAS                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│   ┌─────┐                                                    │
│   │ PALLET                                                    │
│   │ • RED    (Foundation)                                      │
│   │ • GREEN  (I/O)                                             │
│   │ • BLUE   (Math)                                            │
│   │ • PURPLE (Logic)                                           │
│   └─────┘                                                    │
│                                                                 │
│   ┌─────────────────────────────────────┐                    │
│   │                                     │                    │
│   │      [Paint Your Algorithm]         │                    │
│   │                                     │                    │
│   │      ○ ○ ○ ○ ○ ○ ○                 │                    │
│   │      ○ ○ ○ ○ ○ ○ ○                 │                    │
│   │      ○ ○ ○ ○ ○ ○ ○                 │                    │
│   │                                     │                    │
│   └─────────────────────────────────────┘                    │
│                                                                 │
│   PAS Oracle: [0.94] STABLE                                       │
│   GPU Execution: [RUNNING]                                        │
│   Registers: x1=5, x2=7, acc=12                                    │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

### Features

1. **Palette Selection**
   - Choose operation type by selecting a color brush
   - Colors map to RISC-V instructions via the Semantic Dictionary

2. **Spatial Layout**
   - Paint pixels on the infinite canvas
   - Position determines variable mapping

3. **Real-time PAS Oracle**
   - Tectonic Canary validates structural health as you paint
   - Visual feedback for V-PAS score

4. **Instant Execution**
   - No compile step
   - GPU executes pixels directly as you paint
   - Register state visible in real-time

---

## Hello World in PixelLang

### Symbolic Version (Legacy)

```python
def hello_world():
    x1 = 5
    x2 = 7
    x3 = x1 + x2
    print(x3)  # Outputs: 12
```

### PixelLang Version (Geometric)

```yaml
# hello_world.geoscript

# Define spatial variable map
assign(0, 0, x1)
assign(1, 0, x2)
assign(2, 0, x3)

# Paint operations
paint(0, 0, CRIMSON)     # x1 = 5 (INIT with value)
paint(1, 0, CRIMSON)     # x2 = 7 (INIT with value)
paint(2, 0, AZURE)      # x3 = x1 + x2 (ADD)

# Output result
paint(3, 0, LIME_GREEN)  # I/O: Write x3 to console

# Halt
paint(4, 0, BLACK)       # ECALL/EBREAK
```

### Compiled to .rts.png

The compiler generates a texture where:
- Pixel (0,0) is `CRIMSON` → Expands to `addi x1, x0, 5`
- Pixel (1,0) is `CRIMSON` → Expands to `addi x2, x0, 7`
- Pixel (2,0) is `AZURE` → Expands to `add x3, x1, x2`
- Pixel (3,0) is `LIME_GREEN` → Expands to `ecall` (output)
- Pixel (4,0) is `BLACK` → Expands to `ebreak`

---

## Transpiler Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                   PIXELLANG COMPILER                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  GeoScript (.geoscript)                                         │
│    ↓                                                             │
│  Parser (YAML/Custom syntax)                                     │
│    ↓                                                             │
│  Semantic Token Generator                                        │
│    ↓                                                             │
│  Hilbert Mapper                                                 │
│    ↓                                                             │
│  .rts.png (Executable texture)                                   │
│                                                                 │
│  GPU Execution System                                           │
│    ↓                                                             │
│  Results                                                        │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

---

## Examples

### Matrix Multiplication (3x3)

```yaml
# matrix_mul_3x3.geoscript

# Load matrices A and B from spatial regions
region(0, 0, 3, 3):
  token: MATRIX_A
  color: DEEP_RED

region(4, 0, 3, 3):
  token: MATRIX_B
  color: DEEP_RED

# Compute result
region(8, 0, 3, 3):
  token: MATMUL_3x3
  color: DEEP_BLUE
  expands_to: 127

# Output
paint(12, 0, LIME_GREEN)
```

### Fibonacci Sequence

```yaml
# fibonacci.geoscript

# Spiral pattern for loop
loop_spiral(0, 0, 10):
  body:
    paint(0, 0, VIOLET)     # Current term
    paint(1, 0, AZURE)      # Compute next
    paint(2, 0, AZURE)      # Add to accumulator
```

---

## Implementation Phases

| Phase | Description | Status |
|-------|-------------|--------|
| **26** | Geometric Canvas IDE | 🔄 IN PROGRESS |
| **27** | PixelLang Transpiler | Pending |
| **28** | Semantic Token Library | Pending |
| **29** | GPU-Native Compiler | Pending |

---

## References

- [Holographic Dictionary](./HOLOGRAPHIC_DICT_README.md)
- [GPU Execution System](./gpu_execution_system.js)
- [Semantic Expansion Shader](./shaders/semantic_expansion.wgsl)
- [Visual CPU RISC-V](./shaders/visual_cpu_riscv.wgsl)

---

> "The screen is the canvas. The pixels are the program. The GPU is the computer."
>
> — Geometry OS Manifesto v1.0
