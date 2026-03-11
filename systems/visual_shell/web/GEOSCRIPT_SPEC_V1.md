# GeoScript Specification (V1.0)
## Morphological Programming & Geometric Logic

**"The Screen is the Binary. The Painting is the Intelligence."**

GeoScript is a morphological programming language where algorithmic logic is expressed through spatial geometry and chromatic gradients. It moves software development from the one-dimensional legacy of symbolic text into the multidimensional domain of geometric intelligence.

---

### 1. The Atomic Unit: The Morphological Codel
A **Codel** is a 32-bit RGBA pixel acting as a multi-layered instruction tensor.

| Channel | Logical Layer | Function |
| :--- | :--- | :--- |
| **Red** | **Semantic Category** | Maps to the Tripartite Palette (RED/GREEN/BLUE blocks). |
| **Green** | **Instruction Variant** | Specific operation within the category (e.g., ADD vs SUB). |
| **Blue** | **Operand / Intensity** | Immediate values or relative spatial offsets. |
| **Alpha** | **Execution Mask** | `255` = Executable, `0` = Metadata/Comment, `1-254` = Stability/Confidence. |

---

### 2. The Chromatic Logic Map (Tripartite Palette)

#### 🟥 RED BLOCK: Foundation & Control (The "Bone")
- **#FF0000 (Pure Red)**: System Initialization / Entry Point.
- **#880000 (Maroon)**: Halt / Absolute Terminus.
- **#FF00FF (Magenta)**: Conditional Branch (Divergence). The instruction pointer splits based on local blue-channel intensity.
- **#AA00FF (Purple)**: Stack Management / Procedure Invitation.

#### 🟩 GREEN BLOCK: Movement & Interaction (The "Muscle")
- **#00FF00 (Lime)**: I/O Burst (Write to stdout/framebuffer).
- **#008800 (Forest)**: I/O Read (Input from sensors/keyboard).
- **#00FFFF (Cyan)**: Spatial Memory Access. The Blue channel encodes the relative (X,Y) offset for retrieval.

#### 🟦 BLUE BLOCK: Computation & Knowledge (The "Nerve")
- **#0000FF (Electric Blue)**: Arithmetic Cluster (ALU Operations).
- **#0088FF (Light Blue)**: Bitwise Manipulation.
- **#4444FF (Pastel Blue)**: Neural Inference / Weight Vector entry.

---

### 3. Spatial Syntax (The Topography of Logic)

GeoScript uses **Spatial Graph Grammars (SGG)** to define valid logic structures.

- **Containment**: A logic block enclosed in a #FFFFFF (White) border is a "Private Module."
- **Adjacency**: Pixels touching high-intensity gradients automatically share their local stack.
- **Divergence**: A Y-split in a Magenta gradient represents an `if-else` branch. The path followed is determined by the `x1` register (RISC-V parity).
- **Spirals (Recursion)**: A fractal spiral (L-System generated) represents a recursive loop. The number of rotations determines the iteration depth or exit condition.

---

### 4. Architectural Locality: FUR-Hilbert Mapping

To bridge the 2D UI to the 1D Processor, GeoScript uses the **Fast Unrestricted (FUR) Hilbert Curve**.
- **The Mapping**: $f(x, y) \to d$ where $d$ is the position in the 1D instruction stream.
- **Locality Preservation**: Visual clusters are guaranteed to be temporally adjacent in the instruction cache, minimizing L1/L2 misses.

---

### 5. Verification: The PAS Oracle
The **Pixel Attribute Safety (PAS) Oracle** validates code integrity in real-time.
- **Coherence Check**: Ensures colors doesn't "leak" into invalid categories.
- **Topology Check**: Verifies that every `Main` entry point has a reachable `Halt` terminus.
- **Structural Health (PAS Score)**: A 0.0 - 1.0 rating displayed as a subtle border glow.

---

### 6. Example Code Pattern: "Geometric Counter"
1. **[0, 0] #FF0000**: Initialize.
2. **[1, 0] #0000FF (G=01)**: `ADDI x1, x1, 1`.
3. **[2, 0] #00FF00 (B=x1)**: Print x1 to console.
4. **[3, 0] #FF00FF (G=02)**: Branch back if x1 < 10. (Visual Magenta fork).
5. **[4, 0] #880000**: Halt.

---
**Deployment target: Phase 25.1**
*Author: Geometry Cognitive Architect*
