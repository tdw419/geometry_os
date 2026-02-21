"""
Core Assembler for PixelRTS v3.
Converts symbolic assembly into a geometric `.rts.png` texture.
"""

import re
from PIL import Image
from .hilbert import HilbertCurve
from .isa import Opcodes

def _parse_register(arg: str) -> int:
    if not arg: return 0
    arg = arg.strip().lower()
    if arg.startswith("r") or arg.startswith("x"):
        try: return int(arg[1:])
        except (ValueError, IndexError): return 0
    try: return int(arg)
    except ValueError: return 0

def _parse_immediate(arg: str) -> int:
    try: return int(arg) & 0xFF
    except (ValueError, TypeError): return 0

def assemble(code: str) -> Image.Image:
    """
    Assembles a string of PixelRTS v3 assembly code into a PIL Image.
    """
    instructions = []
    labels = {}
    lines = code.splitlines()

    # Pass 1: Comments, whitespace, and labels
    pc = 0
    clean_lines = []
    for line in lines:
        line = line.split(';')[0].strip()
        if not line: continue
        if line.endswith(':'):
            labels[line[:-1].strip()] = pc
            continue
        clean_lines.append(line)
        pc += 1

    # Pass 2: Instruction encoding
    for line in clean_lines:
        parts = re.split(r'[\s,]+', line)
        op_str = parts[0].upper()
        args = parts[1:]

        rgba = [0, 0, 0, 0]

        if op_str not in Opcodes.__members__:
            # Not a valid opcode, treat as NOP
            instructions.append(rgba)
            continue

        opcode = Opcodes[op_str]
        rgba[0] = opcode.value

        # --- Simple, Verbose, One-Opcode-Per-Block Logic ---

        if opcode == Opcodes.NOP or opcode == Opcodes.HALT or opcode == Opcodes.CLEAR:
            pass # No args
        
        elif opcode == Opcodes.MOV:
            if len(args) > 1:
                rgba[3] = _parse_register(args[0]) # RD
                rgba[1] = _parse_register(args[1]) # RS1

        elif opcode == Opcodes.LDI:
            if len(args) > 1:
                rgba[3] = _parse_register(args[0]) # RD
                rgba[1] = _parse_immediate(args[1])# IMM
        
        elif opcode == Opcodes.ADD or opcode == Opcodes.SUB or opcode == Opcodes.MUL or opcode == Opcodes.DIV or opcode == Opcodes.CMP:
            if len(args) > 2:
                rgba[3] = _parse_register(args[0]) # RD
                rgba[1] = _parse_register(args[1]) # RS1
                rgba[2] = _parse_register(args[2]) # RS2

        elif opcode == Opcodes.JMP:
            if len(args) > 0:
                target = args[0]
                if target in labels:
                    rgba[1] = labels[target]
                else:
                    rgba[1] = _parse_register(target)

        elif opcode == Opcodes.BEQ:
            if len(args) > 2:
                rgba[1] = _parse_register(args[0]) # RS1
                rgba[2] = _parse_register(args[1]) # RS2
                target = args[2]
                if target in labels:
                    rgba[3] = labels[target]
                else:
                    rgba[3] = _parse_immediate(target)
        
        # Add other opcodes here as needed...

        instructions.append(rgba)

    # Grid Calculation & Hilbert Mapping
    num_pixels = len(instructions)
    if num_pixels == 0:
        return Image.new('RGBA', (1, 1), (0, 0, 0, 0))
        
    grid_size = 1
    while grid_size * grid_size < num_pixels:
        grid_size *= 2
        
    img = Image.new('RGBA', (grid_size, grid_size), (0, 0, 0, 0))
    pixels = img.load()
    hilbert = HilbertCurve(grid_size)
    
    for i, rgba_instruction in enumerate(instructions):
        x, y = hilbert.d2xy(i)
        pixels[x, y] = tuple(rgba_instruction)
        
    return img
