# PixelRTS v3 Toolchain (`prts`) - Quick Reference

## Installation

```bash
cd systems/prts_toolchain
python3 -m venv .venv
.venv/bin/pip install -e .
```

For global access, add to `~/bin/prts`:
```bash
#!/bin/bash
cd /path/to/geometry_os/systems/prts_toolchain
exec .venv/bin/prts "$@"
```

## Commands

### Compile PASM to RTS.PNG
```bash
prts compile source.pasm [output.rts.png]
```
- Compiles `.pasm` assembly to geometric texture (PNG)
- Output defaults to `<source>.rts.png`

### Run RTS.PNG in GVM
```bash
prts run image.rts.png
```
- Loads and executes the image in the Geometric Virtual Machine
- Prints non-zero register values on completion

### Disassemble RTS.PNG
```bash
prts disasm image.rts.png
```
- Converts geometric texture back to symbolic assembly

## Example

```bash
# Create a simple program
cat > hello.pasm << 'EOF'
LDI r1, 10  ; Load 10 into r1
LDI r2, 20  ; Load 20 into r2
ADD r3, r1, r2  ; r3 = 10 + 20 = 30
HALT
EOF

# Compile
prts compile hello.pasm hello.rts.png

# Run
prts run hello.rts.png
# Output:
# Execution complete.
# r1: 10
# r2: 20
# r3: 30

# Disassemble
prts disasm hello.rts.png
# Output:
# LDI r1, 10
# LDI r2, 20
# ADD r3, r1, r2
# HALT
```

## ISA Reference

| Opcode | Format | Description |
|--------|--------|-------------|
| LDI | `LDI rd, imm` | Load immediate into register |
| ADD | `ADD rd, rs1, rs2` | Add rs1 + rs2 → rd |
| SUB | `SUB rd, rs1, rs2` | Subtract rs1 - rs2 → rd |
| MUL | `MUL rd, rs1, rs2` | Multiply rs1 * rs2 → rd |
| AND | `AND rd, rs1, rs2` | Bitwise AND |
| OR | `OR rd, rs1, rs2` | Bitwise OR |
| XOR | `XOR rd, rs1, rs2` | Bitwise XOR |
| JMP | `JMP label` | Unconditional jump |
| JZ | `JZ rs, label` | Jump if zero |
| JNZ | `JNZ rs, label` | Jump if not zero |
| HALT | `HALT` | Stop execution |

## Test Suite

```bash
cd systems/prts_toolchain
.venv/bin/python -m pytest -v
# 12 tests: assembler, disassembler, hilbert, ISA, integration
```

## Architecture

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│   source.pasm   │────>│    Assembler    │────>│  output.rts.png │
│  (text format)  │     │  (prts compile) │     │ (geometric tex) │
└─────────────────┘     └─────────────────┘     └─────────────────┘
                                                        │
                         ┌──────────────────────────────┤
                         │                              │
                         v                              v
                ┌─────────────────┐            ┌─────────────────┐
                │       GVM       │            │   Disassembler  │
                │    (prts run)   │            │  (prts disasm)  │
                └─────────────────┘            └─────────────────┘
                         │                              │
                         v                              v
                ┌─────────────────┐            ┌─────────────────┐
                │ Register Output │            │  Restored PASM  │
                └─────────────────┘            └─────────────────┘
```

## Encoding Details

- **Texture Format**: PNG with RGBA channels
- **Pixel Mapping**: Hilbert curve for spatial locality
- **Instruction Encoding**: 32-bit per instruction across RGBA channels
- **R**: Opcode (8 bits)
- **G**: Destination register (5 bits)
- **B**: Source register 1 (5 bits)
- **A**: Source register 2 / immediate (14 bits)
