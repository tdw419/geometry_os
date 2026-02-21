"""
Instruction Set Architecture (ISA) for PixelRTS v3
"""
from enum import IntEnum

class Opcodes(IntEnum):
    """
    Core Opcodes for the PixelRTS v3 Geometric ISA.
    The value is stored in the Red channel of the instruction pixel.
    """
    # Core
    NOP = 0x00
    MOV = 0x01
    JMP = 0x06
    HALT = 0x07
    LDI = 0x08
    
    # Arithmetic
    ADD = 0x33
    SUB = 0x34
    MUL = 0x35
    DIV = 0x36
    CMP = 0x37
    BEQ = 0x38
    LDI32 = 0x39

    # Terminal / TTY
    PRINT = 0x40
    SCAN = 0x41
    CURSOR = 0x42
    CLEAR = 0x43
    SCROLL = 0x44
    SETFG = 0x45
    SETBG = 0x46

    # Extended Memory
    LDP = 0x47
    STP = 0x48

    # System
    NATIVE_EXEC = 0xF0

# Create a reverse mapping for the disassembler
MNEMONICS = {v: k for k, v in Opcodes.__members__.items()}

class Registers(IntEnum):
    """
    General-purpose registers. The architecture has 32 registers.
    """
    R0 = 0
    R1 = 1
    R2 = 2
    R3 = 3
    R4 = 4
    R5 = 5
    R6 = 6
    R7 = 7
    R8 = 8
    R9 = 9
    R10 = 10
    R11 = 11
    R12 = 12
    R13 = 13
    R14 = 14
    R15 = 15
    R16 = 16
    R17 = 17
    R18 = 18
    R19 = 19
    R20 = 20
    R21 = 21
    R22 = 22
    R23 = 23
    R24 = 24
    R25 = 25
    R26 = 26
    R27 = 27
    R28 = 28
    R29 = 29
    R30 = 30
    R31 = 31

    # Aliases
    PC = 31 # Program Counter is often the last register
    SP = 30 # Stack Pointer
