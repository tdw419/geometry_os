"""
GeoASM Assembler

Assembles text-based GeoASM source into instruction lists and binary.
Supports labels, comments, and all 7 opcodes.
"""

import re
from typing import List, Dict, Optional
from .instruction import Instruction, Opcode


class Assembler:
    """
    GeoASM text assembler.

    Example source:
        ; Comment
        EMBED R1, R2
        ATTEND R2, R2
        SAMPLE R2, R5
        THOUGHT_PULSE R5
    """

    # Regex patterns
    COMMENT_RE = re.compile(r';.*$')
    LABEL_RE = re.compile(r'^(\w+):')
    INSTRUCTION_RE = re.compile(
        r'^\s*(\w+)\s*(?:R(\d))?\s*,?\s*(?:R(\d))?\s*(?:#\s*(\d+))?'
    )

    OPCODE_MAP = {
        'EMBED': Opcode.EMBED,
        'ATTEND': Opcode.ATTEND,
        'PROJECT': Opcode.PROJECT,
        'SAMPLE': Opcode.SAMPLE,
        'LAYER': Opcode.LAYER,
        'KV_APPEND': Opcode.KV_APPEND,
        'KVAPPEND': Opcode.KV_APPEND,
        'THOUGHT_PULSE': Opcode.THOUGHT_PULSE,
        'THOUGHTPULSE': Opcode.THOUGHT_PULSE,
        'PULSE': Opcode.THOUGHT_PULSE,
    }

    def __init__(self):
        """Initialize assembler."""
        self.labels: Dict[str, int] = {}
        self.current_address = 0

    def assemble(self, source: str) -> List[Instruction]:
        """
        Assemble source text into instruction list.

        Args:
            source: Multi-line GeoASM source code

        Returns:
            List of Instruction objects
        """
        instructions = []
        self.labels = {}
        self.current_address = 0

        # First pass: collect labels
        lines = source.strip().split('\n')
        for line in lines:
            line = self.COMMENT_RE.sub('', line).strip()
            if not line:
                continue

            label_match = self.LABEL_RE.match(line)
            if label_match:
                self.labels[label_match.group(1)] = self.current_address
                line = line[label_match.end():].strip()
                if not line:
                    continue

            self.current_address += 1

        # Second pass: assemble instructions
        self.current_address = 0
        for line in lines:
            line = self.COMMENT_RE.sub('', line).strip()
            if not line:
                continue

            # Skip label definition
            label_match = self.LABEL_RE.match(line)
            if label_match:
                line = line[label_match.end():].strip()
                if not line:
                    continue

            inst = self._parse_instruction(line)
            if inst:
                instructions.append(inst)
                self.current_address += 1

        return instructions

    def _parse_instruction(self, line: str) -> Optional[Instruction]:
        """Parse a single instruction line."""
        match = self.INSTRUCTION_RE.match(line)
        if not match:
            raise ValueError(f"Invalid instruction: {line}")

        opcode_name, rs, rd, imm = match.groups()
        opcode_name = opcode_name.upper()

        if opcode_name not in self.OPCODE_MAP:
            raise ValueError(f"Unknown opcode: {opcode_name}")

        opcode = self.OPCODE_MAP[opcode_name]

        # Parse operands
        rs_val = int(rs) if rs else 0
        rd_val = int(rd) if rd else 0
        imm_val = int(imm) if imm else 0

        return Instruction(opcode=opcode, rd=rd_val, rs=rs_val, imm=imm_val)

    def assemble_to_bytes(self, source: str) -> bytes:
        """Assemble source to binary representation."""
        instructions = self.assemble(source)
        return b''.join(inst.to_bytes() for inst in instructions)

    def disassemble(self, instructions: List[Instruction]) -> str:
        """Convert instruction list back to source."""
        lines = []
        for i, inst in enumerate(instructions):
            # Check for label
            for label, addr in self.labels.items():
                if addr == i:
                    lines.append(f"{label}:")
            lines.append(f"    {inst}")
        return '\n'.join(lines)

    def disassemble_bytes(self, data: bytes) -> str:
        """Disassemble binary to source."""
        if len(data) % 4 != 0:
            raise ValueError(f"Binary size must be multiple of 4, got {len(data)}")

        instructions = []
        for i in range(0, len(data), 4):
            inst = Instruction.from_bytes(data[i:i+4])
            instructions.append(inst)

        return self.disassemble(instructions)
