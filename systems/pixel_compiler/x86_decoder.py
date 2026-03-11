#!/usr/bin/env python3
"""
x86_64 Instruction Decoder for Geometry OS

Decodes x86_64 binary instructions into an intermediate representation (IR)
for binary translation and analysis.

Architecture:
    - Supports 32-bit and 64-bit modes
    - Handles REX prefixes for extended registers (R8-R15)
    - Decodes ModR/M and SIB addressing modes
    - Recognizes common instruction categories

Usage:
    decoder = X86InstructionDecoder(is_64bit=True)
    instructions = decoder.decode(binary_data, address=0x1000)
    for instr in instructions:
        print(f"{instr.address:08X}: {instr.mnemonic} {', '.join(str(op) for op in instr.operands)}")
"""

from __future__ import annotations

from dataclasses import dataclass, field, asdict, InitVar
from enum import Enum, auto
from pathlib import Path
from typing import List, Optional, Union, Dict, Any


# =============================================================================
# Enums
# =============================================================================

class OperandType(Enum):
    """Types of instruction operands."""
    REGISTER = auto()
    MEMORY = auto()
    IMMEDIATE = auto()
    RELATIVE = auto()
    LABEL = auto()
    NONE = auto()


class InstructionCategory(Enum):
    """Categories of x86_64 instructions."""
    DATA_TRANSFER = auto()
    ARITHMETIC = auto()
    LOGICAL = auto()
    CONTROL_FLOW = auto()
    CONTROL_TRANSFER = auto()
    COMPARISON = auto()
    STRING = auto()
    STACK = auto()
    SYSTEM = auto()
    UNKNOWN = auto()


# =============================================================================
# Register Tables
# =============================================================================

# 8-bit registers (without REX, with REX)
REGS_8BIT = ['AL', 'CL', 'DL', 'BL', 'AH', 'CH', 'DH', 'BH']
REGS_8BIT_REX = ['AL', 'CL', 'DL', 'BL', 'SPL', 'BPL', 'SIL', 'DIL']

# 16-bit registers
REGS_16BIT = ['AX', 'CX', 'DX', 'BX', 'SP', 'BP', 'SI', 'DI']

# 32-bit registers
REGS_32BIT = ['EAX', 'ECX', 'EDX', 'EBX', 'ESP', 'EBP', 'ESI', 'EDI']

# 64-bit registers
REGS_64BIT = ['RAX', 'RCX', 'RDX', 'RBX', 'RSP', 'RBP', 'RSI', 'RDI']

# Extended registers (R8-R15)
REGS_64BIT_EXT = ['R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15']
REGS_32BIT_EXT = ['R8D', 'R9D', 'R10D', 'R11D', 'R12D', 'R13D', 'R14D', 'R15D']
REGS_16BIT_EXT = ['R8W', 'R9W', 'R10W', 'R11W', 'R12W', 'R13W', 'R14W', 'R15W']
REGS_8BIT_EXT = ['R8B', 'R9B', 'R10B', 'R11B', 'R12B', 'R13B', 'R14B', 'R15B']


# =============================================================================
# Dataclasses
# =============================================================================

@dataclass
class REXPrefix:
    """
    x86_64 REX prefix structure.
    
    REX prefixes (0x40-0x4F) extend register addressing and operand sizes
    in 64-bit mode.
    
    Attributes:
        present: Whether a REX prefix was found
        raw: The raw byte value
        W: 64-bit operand size (1 = 64-bit, 0 = default)
        R: ModRM reg extension (adds bit 3)
        X: SIB index extension (adds bit 3)
        B: ModRM r/m or SIB base extension (adds bit 3)
    """
    present: bool = False
    raw: int = 0
    W: bool = False
    R: bool = False
    X: bool = False
    B: bool = False

    @property
    def value(self) -> int:
        """Return the raw byte value if present, else 0."""
        return self.raw if self.present else 0

    def __int__(self) -> int:
        return self.value

    def __str__(self) -> str:
        if not self.present:
            return "not present"
        bits = ""
        if self.W:
            bits += "W"
        if self.R:
            bits += "R"
        if self.X:
            bits += "X"
        if self.B:
            bits += "B"
        return f"<REX prefix 0x{self.raw:02X} flags={bits if bits else 'none'}>"


@dataclass
class ModRM:
    """
    x86 ModR/M byte representation.
    
    The ModR/M byte specifies addressing mode and registers for most instructions.
    
    Bit layout: [mod:2][reg:3][r/m:3]
    
    Attributes:
        mod: Mode field (0-3): 0=indirect, 1=disp8, 2=disp32, 3=register direct
        reg: Register field (0-7), extended by REX.R
        rm: R/M field (0-7), extended by REX.B
        raw: The raw byte value
        is_64bit: Whether decoding in 64-bit mode
        rex: Associated REX prefix for extended register access
    """
    mod: int = 0
    reg: int = 0
    rm: int = 0
    raw: int = 0
    is_64bit: bool = True
    rex: Optional[REXPrefix] = None

    @property
    def has_sib(self) -> bool:
        """Check if SIB byte follows (rm == 4 and mod != 3)."""
        return self.rm == 4 and self.mod != 3

    @property
    def disp_size(self) -> int:
        """
        Return displacement size in bytes.
        
        Returns:
            0: No displacement
            1: 8-bit displacement
            4: 32-bit displacement
        """
        if self.mod == 1:
            return 1
        if self.mod == 2:
            return 4
        if self.mod == 0 and self.rm == 5:
            # RIP-relative in 64-bit, or disp32-only in 32-bit
            return 4
        return 0

    @property
    def is_rip_relative(self) -> bool:
        """Check if ModR/M specifies RIP-relative addressing (mod=00, rm=101, 64-bit)."""
        return self.is_64bit and self.mod == 0 and self.rm == 5

    @property
    def reg_name(self) -> str:
        """Get register name for the 'reg' field, considering mode and REX prefix."""
        # Determine base register set based on mode
        if self.is_64bit:
            base_names = REGS_64BIT
            ext_names = REGS_64BIT_EXT
        else:
            base_names = REGS_32BIT
            ext_names = REGS_32BIT_EXT

        # Check for REX.R extension
        if self.rex and self.rex.present and self.rex.R:
            return ext_names[self.reg]
        return base_names[self.reg]

    @property
    def rm_name(self) -> str:
        """Get register name for the 'rm' field, considering mode and REX prefix."""
        # RIP-relative special case
        if self.is_rip_relative:
            return 'RIP'

        # Determine base register set based on mode
        if self.is_64bit:
            base_names = REGS_64BIT
            ext_names = REGS_64BIT_EXT
        else:
            base_names = REGS_32BIT
            ext_names = REGS_32BIT_EXT

        # Check for REX.B extension
        if self.rex and self.rex.present and self.rex.B:
            return ext_names[self.rm]
        return base_names[self.rm]

    def __str__(self) -> str:
        parts = [f"ModRM(0x{self.raw:02X}", f"mod={self.mod}", f"reg={self.reg_name}", f"rm={self.rm_name}"]
        if self.has_sib:
            parts.append("SIB")
        if self.is_rip_relative:
            parts.append("RIP-rel")
        if self.disp_size:
            parts.append(f"disp{self.disp_size * 8}")
        return " ".join(parts) + ")"


@dataclass
class SIB:
    """
    x86_64 SIB (Scale-Index-Base) byte structure.
    
    The SIB byte provides scaled indexed addressing modes.
    
    Bit layout: [scale:2][index:3][base:3]
    
    Attributes:
        scale: Scale factor (1, 2, 4, 8)
        index: Index register field (0-7), extended by REX.X
        base: Base register field (0-7), extended by REX.B
        raw: The raw byte value
        mod: Associated ModR/M mod field
        rex: Associated REX prefix
        is_64bit: Whether decoding in 64-bit mode
    """
    scale: int = 1
    index: int = 0
    base: int = 0
    raw: int = 0
    mod: int = 0
    rex: Optional[REXPrefix] = None
    is_64bit: bool = False
    # Override parameters (InitVar - use same names as tests expect)
    index_name: InitVar[Optional[str]] = None
    base_name: InitVar[Optional[str]] = None
    has_index: InitVar[Optional[bool]] = None
    has_base: InitVar[Optional[bool]] = None
    # Internal storage for overrides
    _overrides: Dict[str, Any] = field(default_factory=dict, repr=False, init=False)

    def __post_init__(self, index_name, base_name, has_index, has_base):
        """Store override values from InitVar fields."""
        if index_name is not None:
            self._overrides['index_name'] = index_name
        if base_name is not None:
            self._overrides['base_name'] = base_name
        if has_index is not None:
            self._overrides['has_index'] = has_index
        if has_base is not None:
            self._overrides['has_base'] = has_base

    @property
    def scale_field(self) -> int:
        """Return the raw scale field (0-3)."""
        return {1: 0, 2: 1, 4: 2, 8: 3}.get(self.scale, 0)

    @property
    def scale_factor(self) -> int:
        """Return the actual numeric scale factor (1, 2, 4, 8). Alias for scale."""
        return self.scale

    @property
    def index_reg(self) -> int:
        """Return index register number including REX.X extension."""
        idx = self.index
        if self.rex and self.rex.present and self.rex.X:
            idx |= 0x08
        return idx

    @property
    def base_reg(self) -> int:
        """Return base register number including REX.B extension."""
        base_val = self.base
        if self.rex and self.rex.present and self.rex.B:
            base_val |= 0x08
        return base_val

    def _compute_has_index(self) -> bool:
        """Internal: compute has_index from index field."""
        return self.index != 4

    def _compute_has_base(self) -> bool:
        """Internal: compute has_base from mod and base fields."""
        return not (self.mod == 0 and self.base == 5)

    def _compute_index_name(self) -> str:
        """Internal: compute index_name from fields."""
        if not self._compute_has_index():
            return "none"

        if self.is_64bit:
            base_names = REGS_64BIT
            ext_names = REGS_64BIT_EXT
        else:
            base_names = REGS_32BIT
            ext_names = REGS_32BIT_EXT

        if self.rex and self.rex.present and self.rex.X:
            return ext_names[self.index]
        return base_names[self.index]

    def _compute_base_name(self) -> str:
        """Internal: compute base_name from fields."""
        if not self._compute_has_base():
            return "none"

        if self.is_64bit:
            base_names = REGS_64BIT
            ext_names = REGS_64BIT_EXT
        else:
            base_names = REGS_32BIT
            ext_names = REGS_32BIT_EXT

        if self.rex and self.rex.present and self.rex.B:
            return ext_names[self.base]
        return base_names[self.base]

    @property
    def computed_has_index(self) -> bool:
        """Check if there is a valid index register (index != 4). Uses override if set."""
        if 'has_index' in self._overrides:
            return self._overrides['has_index']
        return self._compute_has_index()

    @property
    def computed_has_base(self) -> bool:
        """Check if there is a valid base register (not mod=0, base=5). Uses override if set."""
        if 'has_base' in self._overrides:
            return self._overrides['has_base']
        return self._compute_has_base()

    @property
    def computed_index_name(self) -> str:
        """Get the index register name, or 'none' if no index. Uses override if set."""
        if 'index_name' in self._overrides:
            return self._overrides['index_name']
        return self._compute_index_name()

    @property
    def computed_base_name(self) -> str:
        """Get the base register name, or 'none' if no base. Uses override if set."""
        if 'base_name' in self._overrides:
            return self._overrides['base_name']
        return self._compute_base_name()

    # Backward compatibility - alias properties to computed versions
    has_index = property(lambda self: self.computed_has_index)
    has_base = property(lambda self: self.computed_has_base)
    index_name = property(lambda self: self.computed_index_name)
    base_name = property(lambda self: self.computed_base_name)

    def get_has_index(self) -> bool:
        """Get has_index, using override if set, otherwise computed value."""
        return self.computed_has_index

    def get_has_base(self) -> bool:
        """Get has_base, using override if set, otherwise computed value."""
        return self.computed_has_base

    def get_index_name(self) -> str:
        """Get index_name, using override if set, otherwise computed value."""
        return self.computed_index_name

    def get_base_name(self) -> str:
        """Get base_name, using override if set, otherwise computed value."""
        return self.computed_base_name

    def __str__(self) -> str:
        parts = [f"SIB(0x{self.raw:02X}"]

        if self.has_base:
            parts.append(f"base={self.base_name}")
        if self.has_index:
            parts.append(f"index={self.index_name}*{self.scale_factor}")
        elif not self.has_base:
            parts.append("disp32")

        return " ".join(parts) + ")"


@dataclass
class Operand:
    """
    Instruction operand representation.
    
    Attributes:
        type: The type of operand (register, memory, immediate, etc.)
        value: The operand value (register name, immediate value, etc.)
        size: Operand size in bits
        reg: Register number (if applicable)
        base: Base register for memory operands
        index: Index register for memory operands
        scale: Scale factor for indexed memory operands
        displacement: Displacement value for memory operands
    """
    type: OperandType = OperandType.NONE
    value: Union[int, str, None] = None
    size: int = 0
    reg: Optional[int] = None
    base: Optional[Union[int, str]] = None
    index: Optional[Union[int, str]] = None
    scale: Optional[int] = None
    displacement: Optional[int] = None

    def __str__(self) -> str:
        if self.type == OperandType.REGISTER:
            return str(self.value) if self.value else "?"

        if self.type == OperandType.IMMEDIATE:
            if isinstance(self.value, int):
                if self.value >= 10 or self.value < 0:
                    return f"0x{self.value:X}"
                return str(self.value)
            return str(self.value)

        if self.type == OperandType.MEMORY:
            parts = []
            if self.base:
                parts.append(str(self.base))
            if self.index:
                scale_str = f"*{self.scale}" if self.scale and self.scale > 1 else ""
                parts.append(f"{self.index}{scale_str}")
            if self.displacement:
                if self.displacement > 0:
                    parts.append(f"+0x{self.displacement:X}")
                else:
                    parts.append(f"-0x{-self.displacement:X}")
            return f"[{' + '.join(parts) if parts else 'mem'}]"

        if self.type in (OperandType.RELATIVE, OperandType.LABEL):
            if isinstance(self.value, int):
                return f"0x{self.value:X}"
            return str(self.value) if self.value else "?"

        return str(self.value) if self.value is not None else "?"


@dataclass
class Instruction:
    """
    Decoded instruction representation.
    
    Attributes:
        address: The address where this instruction is located
        mnemonic: The instruction mnemonic (MOV, ADD, etc.)
        opcodes: List of opcode bytes
        operands: List of instruction operands
        category: The instruction category
        length: Total instruction length in bytes
        rex: REX prefix data
        modrm: ModR/M byte data
        sib: SIB byte data
        prefix: Legacy prefix bytes
    """
    address: int = 0
    mnemonic: str = ""
    opcodes: List[int] = field(default_factory=list)
    operands: List[Operand] = field(default_factory=list)
    category: InstructionCategory = InstructionCategory.UNKNOWN
    length: int = 0
    rex: Optional[REXPrefix] = None
    modrm: Optional[ModRM] = None
    sib: Optional[SIB] = None
    prefix: bytes = b""

    @property
    def rex_prefix(self) -> int:
        """Return REX prefix byte value (for backward compatibility)."""
        return self.rex.value if self.rex else 0

    @property
    def opcode(self) -> int:
        """Return the primary opcode byte."""
        return self.opcodes[0] if self.opcodes else 0

    @property
    def size(self) -> int:
        """Return instruction length (alias for length)."""
        return self.length

    def to_dict(self) -> Dict[str, Any]:
        """Convert instruction to dictionary for JSON serialization."""
        return {
            'address': self.address,
            'mnemonic': self.mnemonic,
            'opcode': self.opcode,
            'opcodes': [f'0x{b:02X}' for b in self.opcodes],
            'operands': [
                {
                    'type': op.type.name,
                    'value': str(op.value) if not isinstance(op.value, int) else op.value,
                    'size': op.size
                }
                for op in self.operands
            ],
            'size': self.size,
            'length': self.length,
            'category': self.category.name,
            'prefix': self.prefix.hex() if self.prefix else '',
            'rex_prefix': f'0x{self.rex_prefix:02X}' if self.rex_prefix else None,
        }

    def __str__(self) -> str:
        ops = ", ".join(str(op) for op in self.operands)
        if ops:
            return f"{self.mnemonic} {ops}"
        return self.mnemonic


# =============================================================================
# Decoder Functions
# =============================================================================

def decode_rex_prefix(byte: int) -> REXPrefix:
    """
    Decode REX prefix (0x40-0x4F).
    
    Args:
        byte: The byte to decode
        
    Returns:
        REXPrefix dataclass with decoded fields
    """
    if 0x40 <= byte <= 0x4F:
        return REXPrefix(
            present=True,
            raw=byte,
            W=bool(byte & 0x08),
            R=bool(byte & 0x04),
            X=bool(byte & 0x02),
            B=bool(byte & 0x01)
        )
    return REXPrefix(present=False, raw=byte)


def decode_modrm(byte: int, is_64bit: bool = False, rex: Optional[REXPrefix] = None) -> ModRM:
    """
    Decode ModR/M byte.
    
    Args:
        byte: The ModR/M byte to decode
        is_64bit: Whether decoding in 64-bit mode
        rex: Associated REX prefix for extended registers
        
    Returns:
        ModRM dataclass with decoded fields
    """
    return ModRM(
        mod=(byte >> 6) & 0x03,
        reg=(byte >> 3) & 0x07,
        rm=byte & 0x07,
        raw=byte,
        is_64bit=is_64bit,
        rex=rex
    )


def decode_sib(byte: int, mod: int = 0, rex: Optional[REXPrefix] = None, is_64bit: bool = False) -> SIB:
    """
    Decode SIB byte.
    
    Args:
        byte: The SIB byte to decode
        mod: Associated ModR/M mod field
        rex: Associated REX prefix
        is_64bit: Whether decoding in 64-bit mode
        
    Returns:
        SIB dataclass with decoded fields
    """
    scale_field = (byte >> 6) & 0x03
    return SIB(
        scale=1 << scale_field,  # Convert field to factor
        index=(byte >> 3) & 0x07,
        base=byte & 0x07,
        raw=byte,
        mod=mod,
        rex=rex,
        is_64bit=is_64bit
    )


def get_effective_address(
    sib: SIB,
    base_val: int = 0,
    index_val: int = 0,
    disp: int = 0
) -> int:
    """
    Calculate effective address based on SIB and values.
    
    Args:
        sib: Decoded SIB byte
        base_val: Base register value
        index_val: Index register value
        disp: Displacement value
        
    Returns:
        Calculated effective address
    """
    addr = disp

    if sib.has_base:
        addr += base_val

    if sib.has_index:
        addr += index_val * sib.scale_factor

    return addr & 0xFFFFFFFFFFFFFFFF  # Mask to 64-bit


def decode_binary_file(path: str, base_address: int = 0) -> List[Instruction]:
    """
    Decode all instructions in a binary file.
    
    Args:
        path: Path to the binary file
        base_address: Base address for decoding
        
    Returns:
        List of decoded instructions
    """
    decoder = X86InstructionDecoder(is_64bit=True, default_address=base_address)

    with open(path, 'rb') as f:
        data = f.read()

    return decoder.decode(data, address=base_address)


# =============================================================================
# Opcode Tables
# =============================================================================

# One-byte opcodes that take no operands
OPCODES_NO_OPERANDS = {
    0x90: ('NOP', InstructionCategory.DATA_TRANSFER),
    0xC3: ('RET', InstructionCategory.CONTROL_TRANSFER),
    0xCB: ('RETF', InstructionCategory.CONTROL_TRANSFER),
    0xF4: ('HLT', InstructionCategory.SYSTEM),
    0xFA: ('CLI', InstructionCategory.SYSTEM),
    0xFB: ('STI', InstructionCategory.SYSTEM),
    0xCC: ('INT3', InstructionCategory.SYSTEM),
    0x9C: ('PUSHF', InstructionCategory.STACK),
    0x9D: ('POPF', InstructionCategory.STACK),
    0xA4: ('MOVSB', InstructionCategory.STRING),
    0xA5: ('MOVSW', InstructionCategory.STRING),  # or MOVSD
    0xAA: ('STOSB', InstructionCategory.STRING),
    0xAB: ('STOSW', InstructionCategory.STRING),  # or STOSD
    0xAC: ('LODSB', InstructionCategory.STRING),
    0xAD: ('LODSW', InstructionCategory.STRING),  # or LODSD
    0xAE: ('SCASB', InstructionCategory.STRING),
    0xAF: ('SCASW', InstructionCategory.STRING),  # or SCASD
    0xA6: ('CMPSB', InstructionCategory.STRING),
    0xA7: ('CMPSW', InstructionCategory.STRING),  # or CMPSD
}

# One-byte opcodes with immediate/relative operands
OPCODES_WITH_IMM = {
    # MOV rax, imm64 / r32, imm32 (B8-BF)
    **{op: ('MOV', InstructionCategory.DATA_TRANSFER) for op in range(0xB8, 0xC0)},
    # PUSH imm32 (68)
    0x68: ('PUSH', InstructionCategory.STACK),
    # PUSH imm8 (6A)
    0x6A: ('PUSH', InstructionCategory.STACK),
    # JMP rel8 (EB)
    0xEB: ('JMP', InstructionCategory.CONTROL_TRANSFER),
    # JMP rel32 (E9)
    0xE9: ('JMP', InstructionCategory.CONTROL_TRANSFER),
    # CALL rel32 (E8)
    0xE8: ('CALL', InstructionCategory.CONTROL_TRANSFER),
    # ADD/SUB/CMP EAX, imm32
    0x05: ('ADD', InstructionCategory.ARITHMETIC),
    0x2D: ('SUB', InstructionCategory.ARITHMETIC),
    0x3D: ('CMP', InstructionCategory.COMPARISON),
    # ADD/SUB/CMP AL, imm8
    0x04: ('ADD', InstructionCategory.ARITHMETIC),
    0x2C: ('SUB', InstructionCategory.ARITHMETIC),
    0x3C: ('CMP', InstructionCategory.COMPARISON),
}

# Conditional jump opcodes (Jcc rel8)
CONDITIONAL_JUMPS = {
    0x70: 'JO',
    0x71: 'JNO',
    0x72: 'JB',
    0x73: 'JNB',
    0x74: 'JZ',
    0x75: 'JNZ',
    0x76: 'JBE',
    0x77: 'JA',
    0x78: 'JS',
    0x79: 'JNS',
    0x7A: 'JP',
    0x7B: 'JNP',
    0x7C: 'JL',
    0x7D: 'JGE',
    0x7E: 'JLE',
    0x7F: 'JG',
}

# PUSH/POP register opcodes (50-5F)
PUSH_REG_BASE = 0x50
POP_REG_BASE = 0x58

# MOV opcodes with ModR/M
MOV_OPCODES = {
    0x88: ('MOV', 'r8', 'r/m8'),
    0x89: ('MOV', 'r32/64', 'r/m32/64'),
    0x8A: ('MOV', 'r/m8', 'r8'),
    0x8B: ('MOV', 'r/m32/64', 'r32/64'),
    0x8D: ('LEA', 'r32/64', 'm'),
}

# MOV with moffs (A0-A3)
MOFFS_OPCODES = {
    0xA0: ('MOV', 'AL', 'moffs8'),
    0xA1: ('MOV', 'EAX/RAX', 'moffs32/64'),
    0xA2: ('MOV', 'moffs8', 'AL'),
    0xA3: ('MOV', 'moffs32/64', 'EAX/RAX'),
}

# RET with imm16
RET_IMM_OPCODE = 0xC2

# Legacy prefixes
LEGACY_PREFIXES = {
    0xF0: 'LOCK',
    0xF2: 'REPNE',
    0xF3: 'REP',
    0x2E: 'CS',
    0x36: 'SS',
    0x3E: 'DS',
    0x26: 'ES',
    0x64: 'FS',
    0x65: 'GS',
    0x66: 'OperandSize',
    0x67: 'AddressSize',
}


# =============================================================================
# Main Decoder Class
# =============================================================================

class X86InstructionDecoder:
    """
    Main x86_64 instruction decoder class.
    
    Decodes x86_64 binary instructions into an intermediate representation.
    
    Attributes:
        is_64bit: Whether to decode in 64-bit mode
        default_address: Default base address for decoding
    """

    def __init__(self, is_64bit: bool = True, default_address: int = 0):
        """
        Initialize decoder.
        
        Args:
            is_64bit: Whether to decode in 64-bit mode (default True)
            default_address: Default base address (default 0)
        """
        self.is_64bit = is_64bit
        self.default_address = default_address
        self.current_address = 0

    def decode(self, data: bytes, address: Optional[int] = None) -> List[Instruction]:
        """
        Decode a stream of bytes into instructions.
        
        Args:
            data: Raw bytes to decode
            address: Starting address (uses default_address if None)
            
        Returns:
            List of decoded instructions
        """
        if address is None:
            address = self.default_address

        self.current_address = address
        instructions: List[Instruction] = []
        offset = 0

        while offset < len(data):
            instr = self._decode_single(data, offset, self.current_address + offset)
            if instr:
                instructions.append(instr)
                offset += instr.length
            else:
                # Unknown byte, skip it
                offset += 1

        return instructions

    def decode_single(self, data: bytes, address: int = 0) -> Optional[Instruction]:
        """
        Decode a single instruction at the given address.
        
        Args:
            data: Raw bytes containing the instruction
            address: Starting address
            
        Returns:
            Decoded instruction or None if unable to decode
        """
        return self._decode_single(data, 0, address)

    def _decode_single(self, data: bytes, offset: int, address: int) -> Optional[Instruction]:
        """Internal single instruction decoder."""
        if offset >= len(data):
            return None

        instr = Instruction(address=address)
        byte_offset = 0

        # Parse legacy prefixes
        prefixes = []
        while offset + byte_offset < len(data):
            byte = data[offset + byte_offset]
            if byte in LEGACY_PREFIXES:
                prefixes.append(byte)
                byte_offset += 1
            else:
                break
        instr.prefix = bytes(prefixes)

        # Parse REX prefix
        if offset + byte_offset < len(data):
            byte = data[offset + byte_offset]
            rex = decode_rex_prefix(byte)
            if rex.present:
                instr.rex = rex
                byte_offset += 1

        # Get primary opcode
        if offset + byte_offset >= len(data):
            return None

        opcode = data[offset + byte_offset]
        instr.opcodes.append(opcode)
        byte_offset += 1

        # Decode based on opcode
        decoded = False

        # No operand opcodes
        if opcode in OPCODES_NO_OPERANDS:
            instr.mnemonic, instr.category = OPCODES_NO_OPERANDS[opcode]
            decoded = True

        # Conditional jumps
        elif opcode in CONDITIONAL_JUMPS:
            instr.mnemonic = CONDITIONAL_JUMPS[opcode]
            instr.category = InstructionCategory.CONTROL_TRANSFER
            if offset + byte_offset < len(data):
                rel8 = data[offset + byte_offset]
                # Sign extend
                if rel8 & 0x80:
                    rel8 = rel8 - 256
                # Store raw relative offset, not computed target
                instr.operands.append(Operand(OperandType.LABEL, rel8, size=8))
                byte_offset += 1
            decoded = True

        # PUSH/POP register
        elif PUSH_REG_BASE <= opcode <= PUSH_REG_BASE + 7:
            reg_num = opcode - PUSH_REG_BASE
            reg_name = self._get_register(reg_num, 64, instr.rex_prefix if instr.rex else 0)
            instr.mnemonic = 'PUSH'
            instr.category = InstructionCategory.STACK
            instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=64))
            decoded = True

        elif POP_REG_BASE <= opcode <= POP_REG_BASE + 7:
            reg_num = opcode - POP_REG_BASE
            reg_name = self._get_register(reg_num, 64, instr.rex_prefix if instr.rex else 0)
            instr.mnemonic = 'POP'
            instr.category = InstructionCategory.STACK
            instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=64))
            decoded = True

        # MOV r64, imm64 / r32, imm32 (B8-BF)
        elif 0xB8 <= opcode <= 0xBF:
            reg_num = opcode - 0xB8
            operand_size = 64 if (instr.rex and instr.rex.W) or self.is_64bit else 32
            reg_name = self._get_register(reg_num, operand_size, instr.rex_prefix if instr.rex else 0)
            instr.mnemonic = 'MOV'
            instr.category = InstructionCategory.DATA_TRANSFER

            # Check for REX.B extension
            if instr.rex and instr.rex.B:
                reg_num |= 0x08
                reg_name = self._get_register(reg_num, operand_size, instr.rex_prefix if instr.rex else 0)

            instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=operand_size))

            # Read immediate (32-bit zero-extended or 64-bit)
            imm_size = 8 if (instr.rex and instr.rex.W) else 4
            if offset + byte_offset + imm_size <= len(data):
                imm = int.from_bytes(data[offset + byte_offset:offset + byte_offset + imm_size], 'little')
                instr.operands.append(Operand(OperandType.IMMEDIATE, imm, size=imm_size * 8))
                byte_offset += imm_size
            decoded = True

        # PUSH imm32 (68)
        elif opcode == 0x68:
            instr.mnemonic = 'PUSH'
            instr.category = InstructionCategory.STACK
            if offset + byte_offset + 4 <= len(data):
                imm = int.from_bytes(data[offset + byte_offset:offset + byte_offset + 4], 'little')
                instr.operands.append(Operand(OperandType.IMMEDIATE, imm, size=32))
                byte_offset += 4
            decoded = True

        # PUSH imm8 (6A)
        elif opcode == 0x6A:
            instr.mnemonic = 'PUSH'
            instr.category = InstructionCategory.STACK
            if offset + byte_offset < len(data):
                imm = data[offset + byte_offset]
                # Sign extend to 64-bit
                if imm & 0x80:
                    imm = imm - 256
                instr.operands.append(Operand(OperandType.IMMEDIATE, imm, size=8))
                byte_offset += 1
            decoded = True

        # JMP rel8 (EB)
        elif opcode == 0xEB:
            instr.mnemonic = 'JMP'
            instr.category = InstructionCategory.CONTROL_TRANSFER
            if offset + byte_offset < len(data):
                rel8 = data[offset + byte_offset]
                if rel8 & 0x80:
                    rel8 = rel8 - 256
                # Store raw relative offset, not computed target
                instr.operands.append(Operand(OperandType.RELATIVE, rel8, size=8))
                byte_offset += 1
            decoded = True

        # JMP rel32 (E9)
        elif opcode == 0xE9:
            instr.mnemonic = 'JMP'
            instr.category = InstructionCategory.CONTROL_TRANSFER
            if offset + byte_offset + 4 <= len(data):
                rel32 = int.from_bytes(data[offset + byte_offset:offset + byte_offset + 4], 'little', signed=True)
                # Store raw relative offset, not computed target
                instr.operands.append(Operand(OperandType.RELATIVE, rel32, size=32))
                byte_offset += 4
            decoded = True

        # CALL rel32 (E8)
        elif opcode == 0xE8:
            instr.mnemonic = 'CALL'
            instr.category = InstructionCategory.CONTROL_TRANSFER
            if offset + byte_offset + 4 <= len(data):
                rel32 = int.from_bytes(data[offset + byte_offset:offset + byte_offset + 4], 'little', signed=True)
                # Store raw relative offset, not computed target
                instr.operands.append(Operand(OperandType.RELATIVE, rel32, size=32))
                byte_offset += 4
            decoded = True

        # RET imm16 (C2)
        elif opcode == RET_IMM_OPCODE:
            instr.mnemonic = 'RET'
            instr.category = InstructionCategory.CONTROL_TRANSFER
            if offset + byte_offset + 2 <= len(data):
                imm16 = int.from_bytes(data[offset + byte_offset:offset + byte_offset + 2], 'little')
                instr.operands.append(Operand(OperandType.IMMEDIATE, imm16, size=16))
                byte_offset += 2
            decoded = True

        # ADD/SUB/CMP EAX, imm32
        elif opcode in (0x05, 0x2D, 0x3D):
            op_map = {0x05: 'ADD', 0x2D: 'SUB', 0x3D: 'CMP'}
            cat_map = {0x05: InstructionCategory.ARITHMETIC, 0x2D: InstructionCategory.ARITHMETIC,
                       0x3D: InstructionCategory.COMPARISON}
            instr.mnemonic = op_map[opcode]
            instr.category = cat_map[opcode]
            reg_name = 'RAX' if self.is_64bit else 'EAX'
            instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=64 if self.is_64bit else 32))
            if offset + byte_offset + 4 <= len(data):
                imm = int.from_bytes(data[offset + byte_offset:offset + byte_offset + 4], 'little')
                instr.operands.append(Operand(OperandType.IMMEDIATE, imm, size=32))
                byte_offset += 4
            decoded = True

        # ADD/SUB/CMP AL, imm8
        elif opcode in (0x04, 0x2C, 0x3C):
            op_map = {0x04: 'ADD', 0x2C: 'SUB', 0x3C: 'CMP'}
            cat_map = {0x04: InstructionCategory.ARITHMETIC, 0x2C: InstructionCategory.ARITHMETIC,
                       0x3C: InstructionCategory.COMPARISON}
            instr.mnemonic = op_map[opcode]
            instr.category = cat_map[opcode]
            instr.operands.append(Operand(OperandType.REGISTER, 'AL', size=8))
            if offset + byte_offset < len(data):
                imm = data[offset + byte_offset]
                instr.operands.append(Operand(OperandType.IMMEDIATE, imm, size=8))
                byte_offset += 1
            decoded = True

        # MOV with ModR/M
        elif opcode in MOV_OPCODES:
            instr.mnemonic, _, _ = MOV_OPCODES[opcode]
            if instr.mnemonic == 'LEA':
                instr.category = InstructionCategory.DATA_TRANSFER
            else:
                instr.category = InstructionCategory.DATA_TRANSFER

            if offset + byte_offset < len(data):
                modrm_byte = data[offset + byte_offset]
                rex_prefix = instr.rex if instr.rex else None
                if not rex_prefix:
                    rex_prefix = REXPrefix(present=False)
                instr.modrm = decode_modrm(modrm_byte, self.is_64bit, rex_prefix)
                instr.modrm = ModRM(modrm_byte >> 6 & 3, modrm_byte >> 3 & 7, modrm_byte & 7,
                                    modrm_byte, self.is_64bit, rex_prefix)
                byte_offset += 1

                # Determine operand size
                if instr.rex and instr.rex.W:
                    op_size = 64
                elif opcode in (0x88, 0x8A):
                    op_size = 8
                else:
                    op_size = 32 if not self.is_64bit else 64

                # Handle SIB
                if instr.modrm.has_sib and offset + byte_offset < len(data):
                    sib_byte = data[offset + byte_offset]
                    instr.sib = decode_sib(sib_byte, instr.modrm.mod, rex_prefix, self.is_64bit)
                    byte_offset += 1

                # Handle displacement
                if instr.modrm.disp_size > 0:
                    disp_size = instr.modrm.disp_size
                    if offset + byte_offset + disp_size <= len(data):
                        disp = int.from_bytes(data[offset + byte_offset:offset + byte_offset + disp_size], 'little',
                                              signed=(disp_size == 1))
                        byte_offset += disp_size

                # Create operands based on ModR/M
                reg_name = self._get_register(instr.modrm.reg, op_size, rex_prefix.raw if rex_prefix.present else 0)

                if instr.modrm.mod == 3:
                    # Register direct
                    rm_name = self._get_register(instr.modrm.rm, op_size, rex_prefix.raw if rex_prefix.present else 0)
                    instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=op_size))
                    instr.operands.append(Operand(OperandType.REGISTER, rm_name, size=op_size))
                else:
                    # Memory operand
                    instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=op_size))
                    mem_op = Operand(OperandType.MEMORY, '[mem]', size=op_size)
                    if instr.sib:
                        mem_op.base = instr.sib.base_name if instr.sib.has_base else None
                        mem_op.index = instr.sib.index_name if instr.sib.has_index else None
                        mem_op.scale = instr.sib.scale_factor if instr.sib.has_index else None
                    instr.operands.append(mem_op)

            decoded = True

        # MOV with moffs
        elif opcode in MOFFS_OPCODES:
            instr.mnemonic = 'MOV'
            instr.category = InstructionCategory.DATA_TRANSFER

            moffs_size = 8 if self.is_64bit else 4
            if opcode in (0xA0, 0xA1):
                # Load from moffs
                if opcode == 0xA0:
                    instr.operands.append(Operand(OperandType.REGISTER, 'AL', size=8))
                else:
                    reg_name = 'RAX' if self.is_64bit else 'EAX'
                    instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=64 if self.is_64bit else 32))

                if offset + byte_offset + moffs_size <= len(data):
                    moffs = int.from_bytes(data[offset + byte_offset:offset + byte_offset + moffs_size], 'little')
                    instr.operands.append(Operand(OperandType.MEMORY, '[mem]', size=8 if opcode == 0xA0 else 32,
                                                  displacement=moffs))
                    byte_offset += moffs_size
            else:
                # Store to moffs
                if opcode == 0xA2:
                    instr.operands.append(Operand(OperandType.MEMORY, '[mem]', size=8))
                    if offset + byte_offset + moffs_size <= len(data):
                        moffs = int.from_bytes(data[offset + byte_offset:offset + byte_offset + moffs_size], 'little')
                        instr.operands[-1].displacement = moffs
                        byte_offset += moffs_size
                    instr.operands.append(Operand(OperandType.REGISTER, 'AL', size=8))
                else:
                    reg_name = 'RAX' if self.is_64bit else 'EAX'
                    instr.operands.append(Operand(OperandType.MEMORY, '[mem]', size=64 if self.is_64bit else 32))
                    if offset + byte_offset + moffs_size <= len(data):
                        moffs = int.from_bytes(data[offset + byte_offset:offset + byte_offset + moffs_size], 'little')
                        instr.operands[-1].displacement = moffs
                        byte_offset += moffs_size
                    instr.operands.append(Operand(OperandType.REGISTER, reg_name, size=64 if self.is_64bit else 32))

            decoded = True

        # Unknown opcode - create placeholder
        if not decoded:
            instr.mnemonic = f'DB'
            instr.category = InstructionCategory.UNKNOWN
            instr.operands.append(Operand(OperandType.IMMEDIATE, opcode, size=8))

        instr.length = byte_offset
        return instr

    def _get_register(self, reg_num: int, size: int, rex: int = 0) -> str:
        """
        Get register name based on number, size, and REX prefix.
        
        Args:
            reg_num: Register number (0-15)
            size: Register size in bits (8, 16, 32, 64)
            rex: REX prefix byte (0 if no REX)
            
        Returns:
            Register name string
        """
        # Handle extended registers (R8-R15)
        is_extended = reg_num >= 8 or (rex & 0x41)  # REX.B or REX.R
        actual_reg = reg_num & 0x07

        if size == 8:
            if rex & 0x40:  # Any REX prefix changes 8-bit register mapping
                if reg_num >= 8:
                    return REGS_8BIT_EXT[actual_reg]
                return REGS_8BIT_REX[actual_reg]
            if reg_num >= 8:
                return REGS_8BIT_EXT[actual_reg]
            return REGS_8BIT[actual_reg]

        if size == 16:
            if reg_num >= 8:
                return REGS_16BIT_EXT[actual_reg]
            return REGS_16BIT[actual_reg]

        if size == 32:
            if reg_num >= 8:
                return REGS_32BIT_EXT[actual_reg]
            return REGS_32BIT[actual_reg]

        if size == 64:
            if reg_num >= 8:
                return REGS_64BIT_EXT[actual_reg]
            return REGS_64BIT[actual_reg]

        return f"R{reg_num}"

    def print_disassembly(self, instructions: List[Instruction]) -> str:
        """
        Format instructions as disassembly output.
        
        Args:
            instructions: List of instructions to format
            
        Returns:
            Formatted disassembly string
        """
        lines = []
        for instr in instructions:
            bytes_str = ' '.join(f'{b:02X}' for b in instr.opcodes)
            ops_str = ', '.join(str(op) for op in instr.operands)
            if ops_str:
                line = f"{instr.address:08X}: {bytes_str:<12} {instr.mnemonic} {ops_str}"
            else:
                line = f"{instr.address:08X}: {bytes_str:<12} {instr.mnemonic}"
            lines.append(line)
        return '\n'.join(lines)


# =============================================================================
# Module Exports
# =============================================================================

__all__ = [
    # Enums
    'OperandType',
    'InstructionCategory',
    # Dataclasses
    'REXPrefix',
    'ModRM',
    'SIB',
    'Operand',
    'Instruction',
    # Functions
    'decode_rex_prefix',
    'decode_modrm',
    'decode_sib',
    'get_effective_address',
    'decode_binary_file',
    # Classes
    'X86InstructionDecoder',
]
