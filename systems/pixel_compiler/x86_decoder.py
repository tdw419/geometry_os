#!/usr/bin/env python3
"""
x86_64 Instruction Decoder for Geometry OS

A modular decoder for x86_64 binary instructions, supporting:
- REX prefix decoding with W/R/X/B bit extraction
- ModR/M byte decoding with SIB detection and RIP-relative addressing
- SIB byte decoding with scale factor calculation
- Full instruction decoding for common opcodes

Architecture Constants:
    REX_PREFIX_MIN (0x40): Minimum REX prefix value
    REX_PREFIX_MAX (0x4F): Maximum REX prefix value
    REX_W_BIT (0x08): REX.W bit mask (64-bit operand)
    REX_R_BIT (0x04): REX.R bit mask (register extension)
    REX_X_BIT (0x02): REX.X bit mask (index extension)
    REX_B_BIT (0x01): REX.B bit mask (base extension)
"""

from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import List, Optional, Union, Dict, Any


# =============================================================================
# Constants
# =============================================================================

# REX prefix range
REX_PREFIX_MIN = 0x40
REX_PREFIX_MAX = 0x4F

# REX bit masks
REX_W_BIT = 0x08  # 64-bit operand size
REX_R_BIT = 0x04  # ModRM reg extension
REX_X_BIT = 0x02  # SIB index extension
REX_B_BIT = 0x01  # ModRM r/m or SIB base extension

# ModR/M bit masks
MODRM_MOD_MASK = 0xC0  # bits 7-6
MODRM_REG_MASK = 0x38  # bits 5-3
MODRM_RM_MASK = 0x07   # bits 2-0

# SIB bit masks
SIB_SCALE_MASK = 0xC0  # bits 7-6
SIB_INDEX_MASK = 0x38  # bits 5-3
SIB_BASE_MASK = 0x07   # bits 2-0

# Register name tables (32-bit mode)
REG32_NAMES = ('EAX', 'ECX', 'EDX', 'EBX', 'ESP', 'EBP', 'ESI', 'EDI')
REG32_EXT_NAMES = ('R8D', 'R9D', 'R10D', 'R11D', 'R12D', 'R13D', 'R14D', 'R15D')

# Register name tables (64-bit mode)
REG64_NAMES = ('RAX', 'RCX', 'RDX', 'RBX', 'RSP', 'RBP', 'RSI', 'RDI')
REG64_EXT_NAMES = ('R8', 'R9', 'R10', 'R11', 'R12', 'R13', 'R14', 'R15')

# 8-bit registers
REG8_NAMES = ('AL', 'CL', 'DL', 'BL', 'AH', 'CH', 'DH', 'BH')
REG8_REX_NAMES = ('AL', 'CL', 'DL', 'BL', 'SPL', 'BPL', 'SIL', 'DIL')
REG8_EXT_NAMES = ('R8B', 'R9B', 'R10B', 'R11B', 'R12B', 'R13B', 'R14B', 'R15B')

# 16-bit registers
REG16_NAMES = ('AX', 'CX', 'DX', 'BX', 'SP', 'BP', 'SI', 'DI')
REG16_EXT_NAMES = ('R8W', 'R9W', 'R10W', 'R11W', 'R12W', 'R13W', 'R14W', 'R15W')


# =============================================================================
# Enums
# =============================================================================

class OperandType(Enum):
    """Classification of instruction operand types."""
    REGISTER = auto()
    MEMORY = auto()
    IMMEDIATE = auto()
    RELATIVE = auto()
    LABEL = auto()
    NONE = auto()


class InstructionCategory(Enum):
    """Classification of instruction categories."""
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
# Data Classes
# =============================================================================

@dataclass
class REXPrefix:
    """
    x86_64 REX prefix structure.
    
    The REX prefix (0x40-0x4F) extends register addressing and operand sizes
    in 64-bit mode. Each bit enables a specific extension:
    
    - W (bit 3): 64-bit operand size override
    - R (bit 2): Extends ModRM reg field to 4 bits (R8-R15)
    - X (bit 1): Extends SIB index field to 4 bits
    - B (bit 0): Extends ModRM r/m or SIB base field to 4 bits
    
    Attributes:
        present: Whether this is a valid REX prefix byte
        raw: The raw byte value
        W: 64-bit operand size flag
        R: Register extension flag
        X: Index extension flag
        B: Base extension flag
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
        """Allow conversion to integer."""
        return self.value

    def __str__(self) -> str:
        """Human-readable representation."""
        if not self.present:
            return "not present"
        bits = "".join(bit for bit, flag in [("W", self.W), ("R", self.R), 
                                              ("X", self.X), ("B", self.B)] if flag)
        return f"<REX prefix 0x{self.raw:02X} flags={bits or 'none'}>"


@dataclass
class ModRM:
    """
    x86 ModR/M byte representation.
    
    The ModR/M byte specifies addressing mode and operands:
    - mod (bits 7-6): Addressing mode (register direct, memory indirect, etc.)
    - reg (bits 5-3): Register operand or opcode extension
    - r/m (bits 2-0): Register/memory operand
    
    Attributes:
        mod: Mode field (0-3)
        reg: Register field (0-7)
        rm: Register/memory field (0-7)
        raw: The raw byte value
        is_64bit: Operating in 64-bit mode
        rex: Optional REX prefix for register extension
    """
    mod: int = 0
    reg: int = 0
    rm: int = 0
    raw: int = 0
    is_64bit: bool = False
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
            return 4  # RIP-relative in 64-bit, or disp32 in 32-bit
        return 0

    @property
    def is_rip_relative(self) -> bool:
        """Check if ModR/M specifies RIP-relative addressing (mod=00, rm=101, 64-bit)."""
        return self.is_64bit and self.mod == 0 and self.rm == 5

    def _get_reg_name(self, reg_num: int, is_rm: bool = False) -> str:
        """Get register name considering REX prefix and mode."""
        # Check for RIP-relative first
        if is_rm and self.is_rip_relative:
            return 'RIP'
        
        # Calculate extended register number
        ext_num = reg_num
        if self.rex and self.rex.present:
            if is_rm and self.rex.B:
                ext_num |= 0x08
            elif not is_rm and self.rex.R:
                ext_num |= 0x08
        
        # Select name table based on mode and extension
        if ext_num >= 8:
            return REG64_EXT_NAMES[ext_num - 8]
        else:
            if self.is_64bit:
                return REG64_NAMES[reg_num]
            return REG32_NAMES[reg_num]

    @property
    def reg_name(self) -> str:
        """Register name for the 'reg' field."""
        return self._get_reg_name(self.reg, is_rm=False)

    @property
    def rm_name(self) -> str:
        """Register name for the 'rm' field."""
        return self._get_reg_name(self.rm, is_rm=True)

    def __str__(self) -> str:
        """Human-readable representation."""
        parts = [f"mod={self.mod}", f"reg={self.reg_name}", f"rm={self.rm_name}"]
        if self.has_sib:
            parts.append("[SIB]")
        if self.is_rip_relative:
            parts.append("[RIP-rel disp32]")
        return f"<ModRM 0x{self.raw:02X} {' '.join(parts)}>"


@dataclass  
class SIB:
    """
    x86_64 SIB (Scale-Index-Base) byte structure.
    
    The SIB byte provides complex addressing modes:
    - scale (bits 7-6): Multiplier for index (1, 2, 4, 8)
    - index (bits 5-3): Index register (0-7), 4 = no index
    - base (bits 2-0): Base register (0-7), 5 with mod=0 = disp32 only
    
    Attributes:
        scale: Scale factor (1, 2, 4, or 8)
        index: Index register field (0-7)
        base: Base register field (0-7)
        raw: The raw byte value
        mod: ModR/M mod field for context
        rex: Optional REX prefix for register extension
        is_64bit: Operating in 64-bit mode
    """
    scale: int = 1
    index: int = 0
    base: int = 0
    raw: int = 0
    mod: int = 0
    rex: Optional[REXPrefix] = None
    is_64bit: bool = False

    @property
    def scale_factor(self) -> int:
        """Return the scale factor (alias for scale for backward compatibility)."""
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
        base = self.base
        if self.rex and self.rex.present and self.rex.B:
            base |= 0x08
        return base

    @property
    def has_index(self) -> bool:
        """Check if there is an index register (index != 4)."""
        return self.index != 4

    @property
    def has_base(self) -> bool:
        """Check if there is a base register (base != 5 or mod != 0)."""
        return not (self.base == 5 and self.mod == 0)

    @property
    def index_name(self) -> str:
        """Name of the index register, or 'none' if no index."""
        if not self.has_index:
            return "none"
        
        if self.is_64bit:
            names = REG64_NAMES
            ext_names = REG64_EXT_NAMES
        else:
            names = REG32_NAMES
            ext_names = REG32_EXT_NAMES
            
        if self.rex and self.rex.present and self.rex.X:
            return ext_names[self.index]
        return names[self.index]

    @property
    def base_name(self) -> str:
        """Name of the base register, or 'none' if no base."""
        if not self.has_base:
            return "none"
            
        if self.is_64bit:
            names = REG64_NAMES
            ext_names = REG64_EXT_NAMES
        else:
            names = REG32_NAMES
            ext_names = REG32_EXT_NAMES
            
        if self.rex and self.rex.present and self.rex.B:
            return ext_names[self.base]
        return names[self.base]

    def __str__(self) -> str:
        """Human-readable representation."""
        parts = [f"scale={self.scale}"]
        
        if self.has_index:
            parts.append(f"index={self.index_name}")
        else:
            parts.append("no-index")
            
        if self.has_base:
            parts.append(f"base={self.base_name}")
        else:
            parts.append("disp32-only")
            
        return f"<SIB 0x{self.raw:02X} {' '.join(parts)}>"


@dataclass
class Operand:
    """
    Instruction operand representation.
    
    Attributes:
        type: The operand type classification
        value: Immediate value or register name
        size: Operand size in bits
        reg: Register number (if applicable)
        base: Base register for memory operand
        index: Index register for memory operand
        scale: Scale factor for memory operand
        displacement: Displacement value for memory operand
    """
    type: OperandType = OperandType.NONE
    value: Union[int, str] = 0
    size: int = 0
    reg: Optional[int] = None
    base: Optional[int] = None
    index: Optional[int] = None
    scale: Optional[int] = None
    displacement: Optional[int] = None

    def __str__(self) -> str:
        """String representation of operand."""
        if self.type == OperandType.REGISTER:
            return str(self.value) if self.value else "?"
        
        if self.type == OperandType.IMMEDIATE:
            if isinstance(self.value, int):
                if self.value >= 10 or self.value < 0:
                    return f"0x{self.value:X}"
                return str(self.value)
            return str(self.value) if self.value else "?"
        
        if self.type == OperandType.MEMORY:
            parts = []
            if self.base:
                parts.append(str(self.base))
            if self.index:
                scale_str = f"*{self.scale}" if self.scale and self.scale > 1 else ""
                parts.append(f"{self.index}{scale_str}")
            if self.displacement:
                if self.displacement > 0:
                    parts.append(f"0x{self.displacement:X}")
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
        address: The instruction's address in memory
        mnemonic: The instruction mnemonic (MOV, ADD, etc.)
        opcodes: List of opcode bytes
        operands: List of instruction operands
        category: Instruction category classification
        length: Total instruction length in bytes
        rex: REX prefix, if present
        modrm: ModR/M byte, if present
        sib: SIB byte, if present
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
        """Raw REX prefix value (for backward compatibility)."""
        return self.rex.value if self.rex else 0

    def to_dict(self) -> Dict[str, Any]:
        """Convert instruction to dictionary representation."""
        return {
            'address': self.address,
            'mnemonic': self.mnemonic,
            'opcodes': self.opcodes,
            'operands': [
                {
                    'type': op.type.name,
                    'value': op.value,
                    'size': op.size
                }
                for op in self.operands
            ],
            'category': self.category.name,
            'length': self.length,
            'rex': self.rex_prefix,
            'prefix': self.prefix.hex() if self.prefix else None
        }

    def __str__(self) -> str:
        """String representation of instruction."""
        ops = ", ".join(str(op) for op in self.operands) if self.operands else ""
        return f"{self.address:08X}: {self.mnemonic} {ops}".strip()


# =============================================================================
# Decoder Functions
# =============================================================================

def decode_rex_prefix(byte: int) -> REXPrefix:
    """
    Decode a REX prefix byte (0x40-0x4F).
    
    Args:
        byte: The byte to decode
        
    Returns:
        REXPrefix dataclass with decoded fields
    """
    if REX_PREFIX_MIN <= byte <= REX_PREFIX_MAX:
        return REXPrefix(
            present=True,
            raw=byte,
            W=bool(byte & REX_W_BIT),
            R=bool(byte & REX_R_BIT),
            X=bool(byte & REX_X_BIT),
            B=bool(byte & REX_B_BIT)
        )
    return REXPrefix(present=False, raw=byte)


def decode_modrm(byte: int, is_64bit: bool = False, rex: Optional[REXPrefix] = None) -> ModRM:
    """
    Decode a ModR/M byte.
    
    Args:
        byte: The ModR/M byte to decode
        is_64bit: Whether operating in 64-bit mode
        rex: Optional REX prefix for register extension
        
    Returns:
        ModRM dataclass with decoded fields
    """
    return ModRM(
        mod=(byte & MODRM_MOD_MASK) >> 6,
        reg=(byte & MODRM_REG_MASK) >> 3,
        rm=byte & MODRM_RM_MASK,
        raw=byte,
        is_64bit=is_64bit,
        rex=rex
    )


def decode_sib(
    byte: int, 
    mod: int = 0, 
    rex: Optional[REXPrefix] = None,
    is_64bit: bool = False
) -> SIB:
    """
    Decode a SIB byte.
    
    Args:
        byte: The SIB byte to decode
        mod: The ModR/M mod field value for context
        rex: Optional REX prefix for register extension
        is_64bit: Whether operating in 64-bit mode
        
    Returns:
        SIB dataclass with decoded fields
    """
    scale_field = (byte & SIB_SCALE_MASK) >> 6
    scale_factor = 1 << scale_field
    
    return SIB(
        scale=scale_factor,
        index=(byte & SIB_INDEX_MASK) >> 3,
        base=byte & SIB_BASE_MASK,
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
    Calculate effective address from SIB byte components.
    
    The effective address is calculated as:
        base + (index * scale) + displacement
    
    Args:
        sib: The SIB byte structure
        base_val: Value of the base register
        index_val: Value of the index register
        disp: Displacement value
        
    Returns:
        The calculated effective address
    """
    result = disp
    
    if sib.has_base:
        result += base_val
        
    if sib.has_index:
        result += index_val * sib.scale
        
    return result & 0xFFFFFFFFFFFFFFFF  # Mask to 64 bits


def decode_binary_file(path: str, base_address: int = 0) -> List[Instruction]:
    """
    Decode all instructions in a binary file.
    
    Args:
        path: Path to the binary file
        base_address: Base address for decoding
        
    Returns:
        List of decoded instructions
    """
    with open(path, 'rb') as f:
        data = f.read()
    decoder = X86InstructionDecoder()
    return decoder.decode(data, address=base_address)


# =============================================================================
# Instruction Decoder Class
# =============================================================================

class X86InstructionDecoder:
    """
    Main x86_64 instruction decoder class.
    
    Supports linear sweep decoding of x86_64 instructions including:
    - REX prefixes
    - Legacy prefixes (LOCK, REP, etc.)
    - ModR/M and SIB addressing
    - Common opcodes (MOV, ADD, SUB, JMP, CALL, RET, PUSH, POP)
    
    Attributes:
        is_64bit: Operating in 64-bit mode
        default_address: Default starting address for decoding
    """

    # Opcode tables for common instructions
    _OPCODE_TABLE_1BYTE: Dict[int, tuple] = {
        # PUSH r64 (50-5F)
        **{op: ("PUSH", InstructionCategory.STACK) for op in range(0x50, 0x58)},
        # POP r64 (58-5F)
        **{op: ("POP", InstructionCategory.STACK) for op in range(0x58, 0x60)},
        # JMP rel8
        0xEB: ("JMP", InstructionCategory.CONTROL_TRANSFER),
        # JMP rel32
        0xE9: ("JMP", InstructionCategory.CONTROL_TRANSFER),
        # CALL rel32
        0xE8: ("CALL", InstructionCategory.CONTROL_TRANSFER),
        # RET
        0xC3: ("RET", InstructionCategory.CONTROL_TRANSFER),
        # RET imm16
        0xC2: ("RET", InstructionCategory.CONTROL_TRANSFER),
        # MOV r64, imm64 (B8-BF)
        **{op: ("MOV", InstructionCategory.DATA_TRANSFER) for op in range(0xB8, 0xC0)},
        # MOV AL/EAX/RAX, moffs
        0xA0: ("MOV", InstructionCategory.DATA_TRANSFER),
        0xA1: ("MOV", InstructionCategory.DATA_TRANSFER),
        # ADD EAX, imm32 / ADD AL, imm8
        0x05: ("ADD", InstructionCategory.ARITHMETIC),
        0x04: ("ADD", InstructionCategory.ARITHMETIC),
        # SUB EAX, imm32 / SUB AL, imm8
        0x2D: ("SUB", InstructionCategory.ARITHMETIC),
        0x2C: ("SUB", InstructionCategory.ARITHMETIC),
        # CMP EAX, imm32 / CMP AL, imm8
        0x3D: ("CMP", InstructionCategory.COMPARISON),
        0x3C: ("CMP", InstructionCategory.COMPARISON),
        # PUSH imm32 / imm8
        0x68: ("PUSH", InstructionCategory.STACK),
        0x6A: ("PUSH", InstructionCategory.STACK),
        # Conditional jumps (Jcc rel8)
        0x70: ("JO", InstructionCategory.CONTROL_TRANSFER),
        0x71: ("JNO", InstructionCategory.CONTROL_TRANSFER),
        0x72: ("JB", InstructionCategory.CONTROL_TRANSFER),
        0x73: ("JNB", InstructionCategory.CONTROL_TRANSFER),
        0x74: ("JZ", InstructionCategory.CONTROL_TRANSFER),
        0x75: ("JNZ", InstructionCategory.CONTROL_TRANSFER),
        0x76: ("JBE", InstructionCategory.CONTROL_TRANSFER),
        0x77: ("JA", InstructionCategory.CONTROL_TRANSFER),
        0x78: ("JS", InstructionCategory.CONTROL_TRANSFER),
        0x79: ("JNS", InstructionCategory.CONTROL_TRANSFER),
        0x7A: ("JP", InstructionCategory.CONTROL_TRANSFER),
        0x7B: ("JNP", InstructionCategory.CONTROL_TRANSFER),
        0x7C: ("JL", InstructionCategory.CONTROL_TRANSFER),
        0x7D: ("JGE", InstructionCategory.CONTROL_TRANSFER),
        0x7E: ("JLE", InstructionCategory.CONTROL_TRANSFER),
        0x7F: ("JG", InstructionCategory.CONTROL_TRANSFER),
        # MOV with ModR/M
        0x88: ("MOV", InstructionCategory.DATA_TRANSFER),
        0x89: ("MOV", InstructionCategory.DATA_TRANSFER),
        0x8A: ("MOV", InstructionCategory.DATA_TRANSFER),
        0x8B: ("MOV", InstructionCategory.DATA_TRANSFER),
        # NOP
        0x90: ("NOP", InstructionCategory.UNKNOWN),
    }

    def __init__(self, is_64bit: bool = True, default_address: int = 0):
        """
        Initialize the decoder.
        
        Args:
            is_64bit: Whether to decode in 64-bit mode
            default_address: Default starting address for decoding
        """
        self.is_64bit = is_64bit
        self.default_address = default_address

    def decode(self, data: bytes, address: Optional[int] = None) -> List[Instruction]:
        """
        Decode a stream of bytes into instructions.
        
        Performs linear sweep decoding from the start of the data.
        
        Args:
            data: Bytes to decode
            address: Starting address (uses default_address if None)
            
        Returns:
            List of decoded instructions
        """
        start_addr = address if address is not None else self.default_address
        instructions: List[Instruction] = []
        offset = 0
        current_addr = start_addr
        
        while offset < len(data):
            instr, consumed = self._decode_single(data, offset, current_addr)
            if instr is None or consumed == 0:
                # Emit placeholder for undecodable byte
                if offset < len(data):
                    instr = Instruction(
                        address=current_addr,
                        mnemonic="DB",
                        opcodes=[data[offset]],
                        operands=[Operand(type=OperandType.IMMEDIATE, value=data[offset], size=8)],
                        category=InstructionCategory.UNKNOWN,
                        length=1
                    )
                    instructions.append(instr)
                    offset += 1
                    current_addr += 1
                break
            instructions.append(instr)
            offset += consumed
            current_addr += consumed
            
        return instructions

    def decode_single(self, data: bytes, address: int = 0) -> Optional[Instruction]:
        """
        Decode a single instruction at the given address.
        
        Args:
            data: Bytes to decode
            address: Starting address
            
        Returns:
            Decoded instruction or None if decoding fails
        """
        instr, _ = self._decode_single(data, 0, address)
        return instr

    def _decode_single(
        self, 
        data: bytes, 
        offset: int, 
        address: int
    ) -> tuple[Optional[Instruction], int]:
        """
        Internal method to decode a single instruction.
        
        Args:
            data: Byte buffer
            offset: Current offset in buffer
            address: Current address
            
        Returns:
            Tuple of (instruction, bytes consumed) or (None, 0) on failure
        """
        if offset >= len(data):
            return None, 0

        start_offset = offset
        start_address = address
        legacy_prefix = b""

        # Parse prefixes
        rex, offset, address, legacy_prefix = self._parse_prefixes(data, offset, address)
        
        # Get opcode
        if offset >= len(data):
            return None, 0
            
        opcode = data[offset]
        opcodes = [opcode]
        offset += 1
        address += 1

        # Look up instruction
        mnemonic, category = self._OPCODE_TABLE_1BYTE.get(
            opcode, 
            ("UNKNOWN", InstructionCategory.UNKNOWN)
        )

        # Parse operands based on opcode
        modrm = None
        sib = None
        operands: List[Operand] = []
        
        # Handle specific opcode patterns
        if 0xB8 <= opcode <= 0xBF:
            # MOV r64/32, imm64/32
            reg_num = opcode - 0xB8
            imm_size = 8 if (rex and rex.W) else 4
            
            if rex and rex.B:
                reg_num |= 0x08
                
            reg_name = self._get_register(reg_num, 64 if (rex and rex.W) else 32)
            operands.append(Operand(type=OperandType.REGISTER, value=reg_name, 
                                    size=64 if (rex and rex.W) else 32, reg=reg_num))
            
            if offset + imm_size <= len(data):
                imm = int.from_bytes(data[offset:offset + imm_size], 'little')
                operands.append(Operand(type=OperandType.IMMEDIATE, value=imm, size=imm_size * 8))
                offset += imm_size
                address += imm_size
                
        elif 0x50 <= opcode <= 0x57:
            # PUSH r64
            reg_num = opcode - 0x50
            if rex and rex.B:
                reg_num |= 0x08
            reg_name = self._get_register(reg_num, 64)
            operands.append(Operand(type=OperandType.REGISTER, value=reg_name, size=64, reg=reg_num))
            
        elif 0x58 <= opcode <= 0x5F:
            # POP r64
            reg_num = opcode - 0x58
            if rex and rex.B:
                reg_num |= 0x08
            reg_name = self._get_register(reg_num, 64)
            operands.append(Operand(type=OperandType.REGISTER, value=reg_name, size=64, reg=reg_num))
            
        elif opcode == 0xEB:
            # JMP rel8
            if offset < len(data):
                rel8 = data[offset]
                if rel8 >= 0x80:
                    rel8 = rel8 - 256  # Sign extend
                operands.append(Operand(type=OperandType.RELATIVE, value=rel8, size=8))
                offset += 1
                address += 1
                
        elif opcode == 0xE9:
            # JMP rel32
            if offset + 4 <= len(data):
                rel32 = int.from_bytes(data[offset:offset + 4], 'little', signed=True)
                operands.append(Operand(type=OperandType.RELATIVE, value=rel32, size=32))
                offset += 4
                address += 4
                
        elif opcode == 0xE8:
            # CALL rel32
            if offset + 4 <= len(data):
                rel32 = int.from_bytes(data[offset:offset + 4], 'little', signed=True)
                operands.append(Operand(type=OperandType.RELATIVE, value=rel32, size=32))
                offset += 4
                address += 4
                
        elif opcode == 0xC3:
            # RET (no operands)
            pass
            
        elif opcode == 0xC2:
            # RET imm16
            if offset + 2 <= len(data):
                imm16 = int.from_bytes(data[offset:offset + 2], 'little')
                operands.append(Operand(type=OperandType.IMMEDIATE, value=imm16, size=16))
                offset += 2
                address += 2
                
        elif opcode in (0x05, 0x2D, 0x3D):
            # ADD/SUB/CMP EAX, imm32
            reg_name = 'RAX' if self.is_64bit else 'EAX'
            operands.append(Operand(type=OperandType.REGISTER, value=reg_name, 
                                    size=64 if self.is_64bit else 32))
            if offset + 4 <= len(data):
                imm32 = int.from_bytes(data[offset:offset + 4], 'little')
                operands.append(Operand(type=OperandType.IMMEDIATE, value=imm32, size=32))
                offset += 4
                address += 4
                
        elif opcode in (0x04, 0x2C, 0x3C):
            # ADD/SUB/CMP AL, imm8
            operands.append(Operand(type=OperandType.REGISTER, value='AL', size=8))
            if offset < len(data):
                operands.append(Operand(type=OperandType.IMMEDIATE, value=data[offset], size=8))
                offset += 1
                address += 1
                
        elif opcode == 0x68:
            # PUSH imm32
            if offset + 4 <= len(data):
                imm32 = int.from_bytes(data[offset:offset + 4], 'little')
                operands.append(Operand(type=OperandType.IMMEDIATE, value=imm32, size=32))
                offset += 4
                address += 4
                
        elif opcode == 0x6A:
            # PUSH imm8
            if offset < len(data):
                imm8 = data[offset]
                operands.append(Operand(type=OperandType.IMMEDIATE, value=imm8, size=8))
                offset += 1
                address += 1
                
        elif opcode in range(0x70, 0x80):
            # Jcc rel8 (conditional jumps)
            if offset < len(data):
                rel8 = data[offset]
                if rel8 >= 0x80:
                    rel8 = rel8 - 256  # Sign extend
                operands.append(Operand(type=OperandType.LABEL, value=rel8, size=8))
                offset += 1
                address += 1
                
        elif opcode in (0x88, 0x89, 0x8A, 0x8B):
            # MOV with ModR/M
            if offset < len(data):
                modrm = decode_modrm(data[offset], self.is_64bit, rex)
                offset += 1
                address += 1
                
                # Parse SIB if needed
                if modrm.has_sib:
                    if offset < len(data):
                        sib = decode_sib(data[offset], modrm.mod, rex, self.is_64bit)
                        offset += 1
                        address += 1
                        
                # Parse displacement
                disp_size = modrm.disp_size
                if disp_size > 0 and offset + disp_size <= len(data):
                    offset += disp_size
                    address += disp_size
                    
                # Add register operands
                operands.append(Operand(type=OperandType.REGISTER, value=modrm.reg_name, size=64))
                operands.append(Operand(type=OperandType.REGISTER, value=modrm.rm_name, size=64))
                
        elif opcode in (0xA0, 0xA1):
            # MOV AL/EAX/RAX, moffs
            reg_name = 'AL' if opcode == 0xA0 else ('RAX' if self.is_64bit else 'EAX')
            operands.append(Operand(type=OperandType.REGISTER, value=reg_name, 
                                    size=8 if opcode == 0xA0 else (64 if self.is_64bit else 32)))
            moffs_size = 8 if self.is_64bit else 4
            if offset + moffs_size <= len(data):
                moffs = int.from_bytes(data[offset:offset + moffs_size], 'little')
                operands.append(Operand(type=OperandType.MEMORY, displacement=moffs))
                offset += moffs_size
                address += moffs_size

        consumed = offset - start_offset
        
        instr = Instruction(
            address=start_address,
            mnemonic=mnemonic,
            opcodes=opcodes,
            operands=operands,
            category=category,
            length=consumed,
            rex=rex,
            modrm=modrm,
            sib=sib,
            prefix=legacy_prefix
        )
        
        return instr, consumed

    def _parse_prefixes(
        self, 
        data: bytes, 
        offset: int, 
        address: int
    ) -> tuple[Optional[REXPrefix], int, int, bytes]:
        """
        Parse instruction prefixes including REX.
        
        Args:
            data: Byte buffer
            offset: Current offset
            address: Current address
            
        Returns:
            Tuple of (REX prefix or None, new offset, new address, legacy prefix bytes)
        """
        rex = None
        legacy_prefix = b""
        
        while offset < len(data):
            byte = data[offset]
            
            # Check for REX prefix
            if REX_PREFIX_MIN <= byte <= REX_PREFIX_MAX:
                rex = decode_rex_prefix(byte)
                offset += 1
                address += 1
                continue
                
            # Check for legacy prefixes
            if byte in (0xF0, 0xF2, 0xF3, 0x66, 0x67, 0x26, 0x2E, 0x36, 0x3E, 0x64, 0x65):
                legacy_prefix += bytes([byte])
                offset += 1
                address += 1
                continue
                
            break
            
        return rex, offset, address, legacy_prefix

    def _get_register(self, reg_num: int, size: int, rex_value: int = 0) -> str:
        """
        Get register name for a register number and size.
        
        Args:
            reg_num: Register number (0-15)
            size: Register size in bits (8, 16, 32, 64)
            rex_value: REX prefix value (0 if no REX)
            
        Returns:
            Register name string
        """
        base_reg = reg_num & 0x07
        is_extended = reg_num >= 8 or (rex_value & 0x41)  # REX.B or REX.R
        
        if size == 8:
            # Special handling for 8-bit registers
            if rex_value & 0x40:  # Any REX prefix changes 8-bit register mapping
                if is_extended:
                    return REG8_EXT_NAMES[base_reg]
                return REG8_REX_NAMES[base_reg]
            if is_extended:
                return REG8_EXT_NAMES[base_reg]
            return REG8_NAMES[base_reg]
            
        if size == 16:
            if is_extended:
                return REG16_EXT_NAMES[base_reg]
            return REG16_NAMES[base_reg]
            
        if size == 32:
            if is_extended:
                return REG32_EXT_NAMES[base_reg]
            return REG32_NAMES[base_reg]
            
        if size == 64:
            if is_extended:
                return REG64_EXT_NAMES[base_reg]
            return REG64_NAMES[base_reg]
            
        return f"r{reg_num}"

    def print_disassembly(self, instructions: List[Instruction]) -> str:
        """
        Print formatted disassembly output.
        
        Args:
            instructions: List of instructions to print
            
        Returns:
            Formatted disassembly string
        """
        lines = []
        for instr in instructions:
            ops = ", ".join(str(op) for op in instr.operands) if instr.operands else ""
            line = f"{instr.address:08X}: {instr.mnemonic}"
            if ops:
                line += f" {ops}"
            lines.append(line)
        return "\n".join(lines)
