"""
Core Disassembler for PixelRTS v3.
Converts a geometric `.rts.png` texture back into symbolic assembly.
"""

from PIL import Image
from .hilbert import HilbertCurve
from .isa import MNEMONICS, Opcodes

def disassemble(img: Image.Image) -> str:
    """
    Disassembles a PixelRTS v3 `.rts.png` image into symbolic assembly code.
    """
    if img.mode != 'RGBA':
        img = img.convert('RGBA')
    
    width, height = img.size
    grid_size = width # Assuming square
    hilbert = HilbertCurve(grid_size)
    pixels = img.load()
    
    instructions = []
    
    for d in range(grid_size * grid_size):
        x, y = hilbert.d2xy(d)
        r, g, b, a = pixels[x, y]
        
        if r == 0 and g == 0 and b == 0 and a == 0:
            # Skip empty pixels (trailing space in grid)
            continue
            
        # r is opcode value. MNEMONICS keys are IntEnum members, which might be names or values.
        # MNEMONICS = {v: k for k, v in Opcodes.__members__.items()} 
        # Opcodes.__members__.items() -> ('NOP', <Opcodes.NOP: 0>), ...
        # So MNEMONICS = {<Opcodes.NOP: 0>: 'NOP', ...}
        # To lookup by value:
        mnemonic = MNEMONICS.get(r, f"DATA_{r:02X}")
        
        # If mnemonic is a member, get its name
        if hasattr(mnemonic, 'name'):
            mnemonic = mnemonic.name

        # Determine how to format based on opcode
        line = mnemonic
        
        if r == Opcodes.LDI:
            line = f"{mnemonic} r{a}, {g}"
        elif r in (Opcodes.ADD, Opcodes.SUB, Opcodes.MUL, Opcodes.DIV, Opcodes.CMP):
            line = f"{mnemonic} r{a}, r{g}, r{b}"
        elif r == Opcodes.MOV:
            line = f"{mnemonic} r{a}, r{g}"
        elif r == Opcodes.JMP:
            line = f"{mnemonic} {g}"
        elif r == Opcodes.BEQ:
            line = f"{mnemonic} r{g}, r{b}, {a}"
        elif r in (Opcodes.HALT, Opcodes.NOP, Opcodes.CLEAR):
            pass # No arguments
        else:
            # Generic fallback
            line = f"{mnemonic} {g}, {b}, {a}"
            
        instructions.append(line)
        
        if r == Opcodes.HALT:
            break
            
    return "\n".join(instructions)
