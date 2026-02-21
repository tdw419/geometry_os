"""
Reference Implementation of the Geometric Virtual Machine (GVM) for PixelRTS v3.
"""

from PIL import Image
from typing import List, Dict
from .hilbert import HilbertCurve
from .isa import Opcodes

class GVM:
    """
    The Geometric Virtual Machine state and execution logic.
    """
    def __init__(self):
        self.regs: List[int] = [0] * 32
        self.pc: int = 0
        self.halted: bool = False
        self.instructions: List[List[int]] = []

    def read_reg(self, idx: int) -> int:
        """Reads a value from a register."""
        if 0 <= idx < 32:
            return self.regs[idx]
        return 0 # Reading out of bounds returns 0

    def write_reg(self, idx: int, val: int):
        """Writes a value to a register, masking to 32 bits."""
        if 0 <= idx < 32:
            # All registers are 32-bit
            self.regs[idx] = val & 0xFFFFFFFF
    
    def load_instructions_from_image(self, img: Image.Image):
        """Linearizes an instruction image into a 1D list using the Hilbert curve."""
        img = img.convert('RGBA')
        width, height = img.size
        pixels = img.load()
        hilbert = HilbertCurve(width)
        
        self.instructions = []
        for d in range(width * height):
            x, y = hilbert.d2xy(d)
            self.instructions.append(list(pixels[x, y]))

    def run(self, max_steps: int = 1000) -> Dict[str, int]:
        """
        Executes the loaded program for a maximum number of steps.

        Args:
            max_steps: The maximum number of instructions to execute.

        Returns:
            A dictionary representing the final state of the registers.
        """
        step_count = 0
        while not self.halted and self.pc < len(self.instructions) and step_count < max_steps:
            instr = self.instructions[self.pc]
            op, rs1, rs2, rd = instr
            self.execute_step(op, rs1, rs2, rd)
            step_count += 1
        
        # Return a user-friendly dictionary of register states
        return {f"r{i}": self.regs[i] for i in range(32)}

    def execute_step(self, op: int, rs1: int, rs2: int, rd: int):
        """Executes a single instruction."""
        
        # To avoid a massive if/elif chain, we can use a dictionary-based dispatch,
        # but for this refactor, a simple chain is clear and sufficient.
        
        opcode = Opcodes(op)
        
        original_pc = self.pc

        if opcode == Opcodes.ADD:
            res = self.read_reg(rs1) + self.read_reg(rs2)
            self.write_reg(rd, res)
        elif opcode == Opcodes.SUB:
            res = self.read_reg(rs1) - self.read_reg(rs2)
            self.write_reg(rd, res)
        elif opcode == Opcodes.MOV:
            self.write_reg(rd, self.read_reg(rs1))
        elif opcode == Opcodes.LDI:
            self.write_reg(rd, rs1) # Immediate is stored in rs1 channel
        elif opcode == Opcodes.JMP:
            # JMP can be to a register or a raw address encoded in rs1
            if rs1 < 32: # Assuming addresses are >= 32
                self.pc = self.read_reg(rs1)
            else:
                self.pc = rs1
        elif opcode == Opcodes.BEQ:
            if self.read_reg(rs1) == self.read_reg(rs2):
                self.pc = rd # Target address is in rd channel
            else:
                self.pc += 1
        elif opcode == Opcodes.CMP:
            val1 = self.read_reg(rs1)
            val2 = self.read_reg(rs2)
            self.write_reg(rd, 1 if val1 == val2 else 0)
        elif opcode == Opcodes.HALT:
            self.halted = True
        
        # --- Other Opcodes would be handled here ---

        # Increment PC if it wasn't changed by a jump
        if self.pc == original_pc:
            self.pc += 1

def execute(img: Image.Image, max_steps: int = 1000) -> Dict[str, int]:
    """
    High-level function to execute a PixelRTS image.

    Args:
        img: The PIL.Image.Image object to execute.
        max_steps: The maximum number of steps to run the VM for.

    Returns:
        A dictionary representing the final state of the registers.
    """
    vm = GVM()
    vm.load_instructions_from_image(img)
    final_state = vm.run(max_steps)
    return final_state
