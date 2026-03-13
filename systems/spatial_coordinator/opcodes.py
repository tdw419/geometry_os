"""Opcode definitions for Glyph VM.

A minimal register-based VM for executing glyph applications.

Register Layout:
  R0-R27: General purpose
  R0-R3:  Syscall args/return
  R28:    Region origin (x<<16 | y)
  R29:    INT_PAYLOAD
  R30:    INT_TYPE
  R31:    INT_SOURCE

Instruction Format:
  All instructions are 4 bytes:
  | Opcode (1) | Rd (1) | Rs1 (1) | Rs2/Imm (1) |

  Rd:   Destination register
  Rs1:  Source register 1
  Rs2:  Source register 2 OR immediate value
"""

from enum import IntEnum


class Opcode(IntEnum):
    """Glyph VM instruction opcodes."""

    # --- Control Flow ---
    NOP = 0x00      # No operation
    HALT = 0xFF     # Stop execution
    JMP = 0x01      # Jump to address in Rs1
    JEQ = 0x02      # Jump if Rd == Rs1
    JNE = 0x03      # Jump if Rd != Rs1
    JLT = 0x04      # Jump if Rd < Rs1
    JGT = 0x05      # Jump if Rd > Rs1
    JLE = 0x06      # Jump if Rd <= Rs1
    JGE = 0x07      # Jump if Rd >= Rs1
    CALL = 0x08     # Call subroutine at address
    RET = 0x09      # Return from subroutine

    # --- Data Movement ---
    MOV = 0x10      # Rd = Rs1
    MOVI = 0x11     # Rd = imm8
    LD = 0x12       # Rd = memory[Rs1]
    ST = 0x13       # memory[Rs1] = Rd
    LDI = 0x14      # Rd = imm8 (load immediate, alias for MOVI)

    # --- Arithmetic ---
    ADD = 0x20      # Rd = Rd + Rs1
    SUB = 0x21      # Rd = Rd - Rs1
    MUL = 0x22      # Rd = Rd * Rs1
    DIV = 0x23      # Rd = Rd / Rs1
    MOD = 0x24      # Rd = Rd % Rs1
    ADDI = 0x25     # Rd = Rd + imm8
    SUBI = 0x26     # Rd = Rd - imm8
    NEGA = 0x27     # Rd = -Rs1 (negate)

    # --- Logic ---
    AND = 0x30      # Rd = Rd & Rs1
    OR = 0x31       # Rd = Rd | Rs1
    XOR = 0x32      # Rd = Rd ^ Rs1
    NOT = 0x33      # Rd = ~Rd
    SHL = 0x34      # Rd = Rd << Rs1
    SHR = 0x35      # Rd = Rd >> Rs1

    # --- Compare ---
    CMP = 0x40      # Set flags based on Rd - Rs1
    CMPI = 0x41     # Set flags based on Rd - imm8

    # --- Special ---
    SYNC = 0xFE     # Syscall: R0=syscall_id, R1,R2=args, R3=return
    INT = 0x10      # Interrupt opcode (same as OP_INT in types.py)
    DRAW = 0x50     # Draw glyph/color to current position
    PUSH = 0x60     # Push Rd to stack
    POP = 0x61      # Pop stack to Rd

    # --- Memory Operations ---
    LOAD_OFF = 0x70 # Rd = memory[Rs1 + imm8]
    STORE_OFF = 0x71 # memory[Rs1 + imm8] = Rd


# Flags for comparison results
class CompareFlags(IntEnum):
    """Flags set by CMP instruction."""
    ZERO = 0x01
    NEGATIVE = 0x02
    CARRY = 0x04
    OVERFLOW = 0x08


# Register aliases
R0, R1, R2, R3 = 0, 1, 2, 3       # Syscall args/return
R4, R5, R6, R7 = 4, 5, 6, 7       # General purpose
R8, R9, R10, R11 = 8, 9, 10, 11   # General purpose
R12, R13, R14, R15 = 12, 13, 14, 15  # General purpose
R_REGION_ORIGIN = 28
R_INT_PAYLOAD = 29
R_INT_TYPE = 30
R_INT_SOURCE = 31


# Assembler directive markers (not real opcodes)
DIRECTIVE_COORD = 0xF0      # @COORD(x, y)
DIRECTIVE_HANDLER = 0xF1    # @INT_HANDLER(type)
DIRECTIVE_HEADER = 0xF2     # @HEADER
DIRECTIVE_DATA = 0xF3       # .byte, .word, .ascii
