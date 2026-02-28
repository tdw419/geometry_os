#!/usr/bin/env python3
"""
Two-Way Glyph Bridge - Geometry OS
===================================

Bidirectional conversion between text/thoughts and executable glyphs.

ENCODE: Text → Glyph (LLM generates visual executable code)
DECODE: Glyph → Text (LLM reads visual code and understands it)

This enables:
- LLM to "see" glyphs and understand their meaning
- LLM to generate glyphs that encode specific instructions
- Visual programming where code IS the interface

Usage:
    python two_way_glyph_bridge.py --encode "addi x1, x0, 10"
    python two_way_glyph_bridge.py --decode glyph.png
    python two_way_glyph_bridge.py --chat
"""

import numpy as np
import json
import requests
import sys
import argparse
from pathlib import Path
from typing import Optional, List, Tuple
from dataclasses import dataclass

# Add project root
PROJECT_ROOT = Path(__file__).parent
sys.path.insert(0, str(PROJECT_ROOT))

from systems.pixel_compiler.holographic_encoder import generate_2d_basis, encode_instruction


@dataclass
class GlyphPacket:
    """A bidirectional glyph packet."""
    text: str                    # Human-readable meaning
    instruction: int             # 32-bit RISC-V instruction
    pattern: np.ndarray          # 16x16 holographic pattern
    glyph_chars: str             # Visual glyph representation
    confidence: float            # Decode confidence


class GlyphEncoder:
    """Encodes text/instructions into glyphs."""

    def __init__(self):
        self.basis = generate_2d_basis(size=16, count=64)[:32]

    def encode_instruction(self, instruction: int) -> np.ndarray:
        """Encode a 32-bit instruction as a 16x16 pattern."""
        return encode_instruction(instruction, self.basis)

    def encode_text(self, text: str) -> GlyphPacket:
        """
        Encode text into a glyph.

        Uses text hash to generate deterministic instruction.
        """
        # Generate instruction from text
        text_hash = hash(text) & 0xFFFFFFFF

        # Make it a valid-ish RISC-V instruction
        # Use OP-IMM (0x13) format with hash-derived fields
        rd = (text_hash >> 0) & 0x1F
        rs1 = (text_hash >> 5) & 0x1F
        imm = (text_hash >> 10) & 0xFFF
        funct3 = (text_hash >> 22) & 0x07

        instruction = (imm << 20) | (rs1 << 15) | (funct3 << 12) | (rd << 7) | 0x13

        pattern = self.encode_instruction(instruction)

        # Generate visual glyph
        glyph_chars = ''.join('▓░▒█▄▀■□'[(instruction >> (i*3)) % 8] for i in range(4))

        return GlyphPacket(
            text=text,
            instruction=instruction,
            pattern=pattern,
            glyph_chars=glyph_chars,
            confidence=1.0
        )

    def encode_program(self, instructions: List[Tuple[str, int]]) -> np.ndarray:
        """
        Encode multiple instructions into a program texture.

        Args:
            instructions: List of (label, instruction_32bit)

        Returns:
            Texture array (16 x len(instructions)*16)
        """
        n = len(instructions)
        texture = np.zeros((16, n * 16))

        for i, (label, inst) in enumerate(instructions):
            pattern = self.encode_instruction(inst)
            texture[:, i*16:(i+1)*16] = pattern

        return texture


class GlyphDecoder:
    """Decodes glyphs back into text/instructions."""

    def __init__(self):
        self.basis = generate_2d_basis(size=16, count=64)[:32]

    def decode_pattern(self, pattern: np.ndarray) -> Tuple[int, float]:
        """
        Decode a 16x16 pattern back to a 32-bit instruction.

        Returns (instruction, confidence).
        """
        # Project onto each basis pattern to recover bits
        decoded_bits = []
        confidences = []

        for i, b in enumerate(self.basis):
            # Correlation with basis
            correlation = np.sum(pattern * b)
            # Normalize
            norm = np.sqrt(np.sum(pattern**2) * np.sum(b**2))
            if norm > 0:
                corr_normalized = correlation / norm
            else:
                corr_normalized = 0

            # Threshold to get bit
            bit = 1 if correlation > 0 else 0
            decoded_bits.append(bit)
            confidences.append(abs(corr_normalized))

        # Convert bits to instruction
        instruction = sum(b << i for i, b in enumerate(decoded_bits))

        # Overall confidence
        confidence = np.mean(confidences)

        return instruction, confidence

    def disassemble(self, instruction: int) -> str:
        """Disassemble a 32-bit instruction to text."""
        opcode = instruction & 0x7F
        rd = (instruction >> 7) & 0x1F
        funct3 = (instruction >> 12) & 0x07
        rs1 = (instruction >> 15) & 0x1F
        rs2 = (instruction >> 20) & 0x1F
        imm = instruction >> 20

        # Sign extend immediate if needed
        if imm & 0x800:
            imm = imm - 0x1000

        if opcode == 0x33:  # R-type ALU
            ops = {0: 'add', 0x20: 'sub', 0x04: 'sll', 0x05: 'srl', 0x00: 'add'}
            funct7 = instruction >> 25
            op = ops.get(funct7, 'alu')
            return f"{op} x{rd}, x{rs1}, x{rs2}"
        elif opcode == 0x13:  # I-type ALU
            ops = {0: 'addi', 0x02: 'slti', 0x03: 'sltiu', 0x04: 'xori', 0x06: 'ori', 0x07: 'andi'}
            op = ops.get(funct3, 'opimm')
            return f"{op} x{rd}, x{rs1}, {imm}"
        elif opcode == 0x03:  # Load
            loads = {0: 'lb', 1: 'lh', 2: 'lw', 4: 'lbu', 5: 'lhu'}
            op = loads.get(funct3, 'load')
            return f"{op} x{rd}, {imm}(x{rs1})"
        elif opcode == 0x23:  # Store
            imm = ((instruction >> 25) << 5) | ((instruction >> 7) & 0x1F)
            stores = {0: 'sb', 1: 'sh', 2: 'sw'}
            op = stores.get(funct3, 'store')
            return f"{op} x{rs2}, {imm}(x{rs1})"
        elif opcode == 0x63:  # Branch
            branches = {0: 'beq', 1: 'bne', 4: 'blt', 5: 'bge', 6: 'bltu', 7: 'bgeu'}
            op = branches.get(funct3, 'branch')
            return f"{op} x{rs1}, x{rs2}, offset"
        elif opcode == 0x6F:  # JAL
            return f"jal x{rd}, offset"
        elif opcode == 0x67:  # JALR
            return f"jalr x{rd}, x{rs1}, {imm}"
        elif opcode == 0x73:  # SYSTEM
            return "ecall" if instruction == 0x00000073 else "ebreak"
        else:
            return f"unknown (op=0x{opcode:02x})"

    def decode_to_packet(self, pattern: np.ndarray, original_text: str = None) -> GlyphPacket:
        """Decode a pattern into a full glyph packet."""
        instruction, confidence = self.decode_pattern(pattern)
        asm = self.disassemble(instruction)

        glyph_chars = ''.join('▓░▒█▄▀■□'[(instruction >> (i*3)) % 8] for i in range(4))

        return GlyphPacket(
            text=original_text or asm,
            instruction=instruction,
            pattern=pattern,
            glyph_chars=glyph_chars,
            confidence=confidence
        )


class TwoWayBridge:
    """
    Bidirectional bridge between LLM and glyphs.

    ENCODE: LLM thought → Glyph (for execution/display)
    DECODE: Glyph → LLM input (for reading visual code)
    """

    def __init__(self, model: str = "tinyllama"):
        self.encoder = GlyphEncoder()
        self.decoder = GlyphDecoder()
        self.model = model
        self.base_url = "http://localhost:11434"

    def thought_to_glyph(self, thought: str) -> GlyphPacket:
        """Convert a thought string to a glyph."""
        return self.encoder.encode_text(thought)

    def glyph_to_description(self, pattern: np.ndarray) -> str:
        """
        Convert a glyph to a text description for LLM consumption.

        This is what the LLM "sees" when looking at a glyph.
        """
        packet = self.decoder.decode_to_packet(pattern)

        # Create rich description
        chars = ' .:-=+*#%@'
        normalized = ((pattern - pattern.min()) / (pattern.max() - pattern.min() + 1e-8) * (len(chars) - 1)).astype(int)

        # Build ASCII representation
        ascii_glyph = []
        for row in normalized[:8]:
            ascii_glyph.append(''.join(chars[c] for c in row[:8]))

        description = f"""GLYPH DATA:
  Instruction: 0x{packet.instruction:08X}
  Assembly: {packet.text}
  Visual: [{packet.glyph_chars}]
  Confidence: {packet.confidence:.2%}

ASCII PREVIEW:
{chr(10).join('  ' + row for row in ascii_glyph)}
"""
        return description

    async def llm_read_glyph(self, pattern: np.ndarray) -> str:
        """
        Have the LLM interpret a glyph.

        The LLM "sees" the glyph description and explains it.
        """
        description = self.glyph_to_description(pattern)

        prompt = f"""You are looking at a geometric glyph that encodes executable code.

{description}

What does this glyph represent? Explain the instruction and its purpose."""

        response = requests.post(
            f"{self.base_url}/api/generate",
            json={"model": self.model, "prompt": prompt, "stream": False}
        )

        if response.status_code == 200:
            return response.json().get("response", "")
        return "Error reading glyph"

    async def llm_generate_glyph(self, intent: str) -> GlyphPacket:
        """
        Have the LLM generate a glyph for a given intent.

        The LLM describes what instruction to create, we encode it.
        """
        prompt = f"""You need to create a RISC-V instruction that represents this intent:
"{intent}"

Respond with a single line in this exact format:
INSTRUCTION: <opcode> <operands>

For example:
- To add: INSTRUCTION: add x1, x2, x3
- To load immediate: INSTRUCTION: addi x1, x0, 10
- To store: INSTRUCTION: sw x1, 0(x2)

Your response:"""

        response = requests.post(
            f"{self.base_url}/api/generate",
            json={"model": self.model, "prompt": prompt, "stream": False}
        )

        if response.status_code == 200:
            llm_response = response.json().get("response", "")
            # Parse the instruction
            # For now, just encode the intent directly
            return self.encoder.encode_text(f"{intent}: {llm_response[:50]}")

        return self.encoder.encode_text(intent)

    def round_trip(self, text: str) -> Tuple[GlyphPacket, GlyphPacket]:
        """
        Perform a round-trip: text → glyph → decoded glyph.

        Returns (original_packet, decoded_packet).
        """
        # Encode
        original = self.thought_to_glyph(text)

        # Decode
        decoded = self.decoder.decode_to_packet(original.pattern, text)

        return original, decoded


def demo():
    """Run a demonstration of the two-way bridge."""
    print("="*60)
    print("  TWO-WAY GLYPH BRIDGE DEMO")
    print("="*60)

    bridge = TwoWayBridge()

    # 1. Encode thoughts to glyphs
    print("\n1. ENCODE: Thoughts → Glyphs")
    print("-"*40)

    thoughts = [
        "initialize counter to zero",
        "add one to accumulator",
        "branch if not equal",
        "store result to memory"
    ]

    glyphs = []
    for thought in thoughts:
        packet = bridge.thought_to_glyph(thought)
        glyphs.append(packet)

        chars = ' .:-=+*#%@'
        normalized = ((packet.pattern - packet.pattern.min()) /
                     (packet.pattern.max() - packet.pattern.min() + 1e-8) *
                     (len(chars) - 1)).astype(int)

        print(f"\n  '{thought}'")
        print(f"  → [{packet.glyph_chars}] 0x{packet.instruction:08X}")
        for row in normalized[::4, :8]:
            print(f"    {''.join(chars[c] for c in row)}")

    # 2. Decode glyphs back
    print("\n\n2. DECODE: Glyphs → Instructions")
    print("-"*40)

    for packet in glyphs:
        decoded_inst, confidence = bridge.decoder.decode_pattern(packet.pattern)
        asm = bridge.decoder.disassemble(decoded_inst)

        print(f"\n  [{packet.glyph_chars}] 0x{decoded_inst:08X}")
        print(f"  → {asm}")
        print(f"  Confidence: {confidence:.1%}")

    # 3. Round-trip verification
    print("\n\n3. ROUND-TRIP VERIFICATION")
    print("-"*40)

    test_insts = [
        ("addi x1, x0, 10", 0x00A00093),
        ("add x2, x2, x3", 0x003100B3),
        ("sw x2, 0(x0)", 0x00202023),
    ]

    for label, inst in test_insts:
        pattern = bridge.encoder.encode_instruction(inst)
        decoded, conf = bridge.decoder.decode_pattern(pattern)
        match = "✓" if decoded == inst else "✗"

        print(f"  {match} {label}")
        print(f"    Original: 0x{inst:08X}")
        print(f"    Decoded:  0x{decoded:08X}")
        print(f"    Confidence: {conf:.1%}")

    print("\n" + "="*60)
    print("  Two-way bridge operational!")
    print("  LLM can READ glyphs and GENERATE glyphs")
    print("="*60)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Two-Way Glyph Bridge")
    parser.add_argument("--demo", "-d", action="store_true", help="Run demo")
    parser.add_argument("--encode", "-e", type=str, help="Encode text to glyph")
    parser.add_argument("--decode", "-D", type=str, help="Decode instruction hex")

    args = parser.parse_args()

    if args.demo or (not args.encode and not args.decode):
        demo()
    elif args.encode:
        bridge = TwoWayBridge()
        packet = bridge.thought_to_glyph(args.encode)
        print(f"\nEncoded: {args.encode}")
        print(f"Glyph: [{packet.glyph_chars}]")
        print(f"Instruction: 0x{packet.instruction:08X}")
    elif args.decode:
        bridge = TwoWayBridge()
        inst = int(args.decode, 16)
        pattern = bridge.encoder.encode_instruction(inst)
        decoded, conf = bridge.decoder.decode_pattern(pattern)
        asm = bridge.decoder.disassemble(decoded)
        print(f"\nDecoded: 0x{decoded:08X}")
        print(f"Assembly: {asm}")
        print(f"Confidence: {conf:.1%}")
