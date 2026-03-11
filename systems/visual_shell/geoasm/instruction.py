"""
GeoASM Instruction Definition

Neural assembly instructions for PixelBrain inference control.
Each instruction is 4 bytes: [opcode, rs, rd, imm]
"""

from dataclasses import dataclass
from enum import IntEnum


class Opcode(IntEnum):
    """GeoASM neural instruction opcodes."""
    EMBED = 0xD0        # Token → Hidden vector
    ATTEND = 0xD1       # Self-attention
    PROJECT = 0xD2      # SwiGLU FFN
    SAMPLE = 0xD3       # Hidden → Token
    LAYER = 0xD4        # Set layer index
    KV_APPEND = 0xD5    # Update KV-cache
    THOUGHT_PULSE = 0xD6  # Emit visual glyph


@dataclass
class Instruction:
    """
    A single GeoASM instruction.

    Attributes:
        opcode: The operation to perform
        rs: Source register (0-7)
        rd: Destination register (0-7)
        imm: Immediate value (optional, for LAYER instruction)
    """
    opcode: Opcode
    rd: int = 0
    rs: int = 0
    imm: int = 0

    def to_bytes(self) -> bytes:
        """Encode instruction as 4 bytes."""
        return bytes([
            self.opcode.value,
            self.rs & 0x07,
            self.rd & 0x07,
            self.imm & 0xFF,
        ])

    @classmethod
    def from_bytes(cls, data: bytes) -> "Instruction":
        """Decode instruction from bytes."""
        if len(data) < 4:
            raise ValueError(f"Instruction requires 4 bytes, got {len(data)}")

        opcode = Opcode(data[0])
        rs = data[1] & 0x07
        rd = data[2] & 0x07
        imm = data[3]

        return cls(opcode=opcode, rd=rd, rs=rs, imm=imm)

    def __repr__(self) -> str:
        """Human-readable instruction representation."""
        opcode_name = self.opcode.name

        if self.opcode == Opcode.EMBED:
            return f"EMBED R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.ATTEND:
            return f"ATTEND R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.PROJECT:
            return f"PROJECT R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.SAMPLE:
            return f"SAMPLE R{self.rs}, R{self.rd}"
        elif self.opcode == Opcode.LAYER:
            return f"LAYER #{self.imm}"
        elif self.opcode == Opcode.KV_APPEND:
            type_name = "K" if self.imm == 0 else "V"
            return f"KV_APPEND R{self.rs}, #{self.imm} ({type_name})"
        elif self.opcode == Opcode.THOUGHT_PULSE:
            return f"THOUGHT_PULSE R{self.rs}"
        else:
            return f"UNKNOWN(0x{self.opcode.value:02X})"


# Instruction builder convenience functions
def EMBED(token_reg: int, hidden_reg: int) -> Instruction:
    """Create EMBED instruction: token → hidden vector."""
    return Instruction(Opcode.EMBED, rd=hidden_reg, rs=token_reg)


def ATTEND(in_reg: int, out_reg: int) -> Instruction:
    """Create ATTEND instruction: self-attention."""
    return Instruction(Opcode.ATTEND, rd=out_reg, rs=in_reg)


def PROJECT(in_reg: int, out_reg: int) -> Instruction:
    """Create PROJECT instruction: SwiGLU FFN."""
    return Instruction(Opcode.PROJECT, rd=out_reg, rs=in_reg)


def SAMPLE(hidden_reg: int, token_reg: int) -> Instruction:
    """Create SAMPLE instruction: hidden → token."""
    return Instruction(Opcode.SAMPLE, rd=token_reg, rs=hidden_reg)


def LAYER(layer_idx: int) -> Instruction:
    """Create LAYER instruction: set current layer."""
    return Instruction(Opcode.LAYER, imm=layer_idx)


def KV_APPEND(vector_reg: int, kv_type: int = 0) -> Instruction:
    """Create KV_APPEND instruction: vector_reg → cache[type] (0=K, 1=V)."""
    return Instruction(Opcode.KV_APPEND, rs=vector_reg, imm=kv_type)


def THOUGHT_PULSE(token_reg: int) -> Instruction:
    """Create THOUGHT_PULSE instruction: emit visual."""
    return Instruction(Opcode.THOUGHT_PULSE, rs=token_reg)
