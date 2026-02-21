"""
PixelRTS v3 Detector - Geometric Instruction Analysis

Detects completion and state from PixelRTS v3 RGBA-encoded screenshots.

PixelRTS v3 Instruction Format:
  R (Opcode): ADD=51, SUB=52, MUL=53, DIV=54, MOV=1, JMP=6, HALT=7, LDI=8
  G (RS1)   : Register Index (0-31) or Immediate (for LDI)
  B (RS2)   : Register Index (0-31)
  A (RD)    : Destination Register (0-31)
"""

import logging
from typing import Dict, Any, Optional, List, Tuple
from dataclasses import dataclass
from PIL import Image
import numpy as np

logger = logging.getLogger(__name__)

# Opcode Map (from pasm.py)
OPCODES = {
    "NOP": 0x00,
    "MOV": 0x01,
    "ADD": 0x33,
    "SUB": 0x34,
    "MUL": 0x35,
    "DIV": 0x36,
    "JMP": 0x06,
    "HALT": 0x07,
    "LDI": 0x08
}

OPCODE_NAMES = {v: k for k, v in OPCODES.items()}


@dataclass
class PixelRTS3Match:
    """Represents a detected PixelRTS v3 completion."""
    opcode: str
    pc: int
    x: int
    y: int
    rgba: Tuple[int, int, int, int]
    instruction: Dict[str, int]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "opcode": self.opcode,
            "pc": self.pc,
            "x": self.x,
            "y": self.y,
            "rgba": list(self.rgba),
            "instruction": self.instruction
        }


class HilbertCurve:
    """Hilbert curve coordinate mapping for PixelRTS v3."""

    def __init__(self, n: int):
        self.n = n

    def d2xy(self, d: int) -> Tuple[int, int]:
        """Convert Hilbert index to (x, y) coordinates."""
        n = self.n
        x, y = 0, 0
        s = 1
        while s < n:
            rx = 1 & (d // 2)
            ry = 1 & (d ^ rx)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            x += s * rx
            y += s * ry
            d //= 4
            s *= 2
        return x, y

    def xy2d(self, x: int, y: int) -> int:
        """Convert (x, y) coordinates to Hilbert index."""
        n = self.n
        d = 0
        s = n // 2
        while s > 0:
            rx = 1 if (x & s) > 0 else 0
            ry = 1 if (y & s) > 0 else 0
            d += s * s * ((3 * rx) ^ ry)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            s //= 2
        return d


class PixelRTS3Detector:
    """
    Detects PixelRTS v3 completion from RGBA screenshots.

    The key insight: when a PixelRTS v3 program completes, it writes
    a HALT instruction (R=0x07) to the framebuffer. By scanning the
    Hilbert-ordered pixels, we can detect program completion and
    extract final state.
    """

    def __init__(self, halt_opcode: int = 0x07):
        """
        Initialize PixelRTS v3 detector.

        Args:
            halt_opcode: The opcode value for HALT (default 0x07)
        """
        self.halt_opcode = halt_opcode
        logger.info(f"PixelRTS3Detector initialized with HALT opcode=0x{halt_opcode:02x}")

    def detect_halt(self, screenshot_path: str) -> Optional[PixelRTS3Match]:
        """
        Detect HALT instruction in a PixelRTS v3 screenshot.

        Args:
            screenshot_path: Path to the .rts.png screenshot

        Returns:
            PixelRTS3Match if HALT detected, None otherwise
        """
        try:
            img = Image.open(screenshot_path).convert('RGBA')
            width, height = img.size
            pixels = np.array(img)

            # Ensure square grid
            grid_size = max(width, height)
            hilbert = HilbertCurve(grid_size)

            # Scan Hilbert-ordered pixels for HALT
            for pc in range(grid_size * grid_size):
                x, y = hilbert.d2xy(pc)

                # Bounds check
                if x >= width or y >= height:
                    continue

                r, g, b, a = pixels[y, x]

                if r == self.halt_opcode:
                    opcode_name = OPCODE_NAMES.get(r, f"0x{r:02x}")
                    logger.info(f"HALT detected at PC={pc}, ({x},{y})")

                    return PixelRTS3Match(
                        opcode=opcode_name,
                        pc=pc,
                        x=x,
                        y=y,
                        rgba=(int(r), int(g), int(b), int(a)),
                        instruction={
                            "opcode": r,
                            "rs1": g,
                            "rs2": b,
                            "rd": a
                        }
                    )

            return None

        except Exception as e:
            logger.error(f"PixelRTS3 detection failed: {e}")
            return None

    def decode_instruction(self, rgba: Tuple[int, int, int, int]) -> Dict[str, Any]:
        """
        Decode a single RGBA pixel into instruction components.

        Args:
            rgba: (R, G, B, A) tuple

        Returns:
            Dict with opcode name and operands
        """
        r, g, b, a = rgba
        opcode_name = OPCODE_NAMES.get(r, f"UNKNOWN_0x{r:02x}")

        return {
            "opcode": opcode_name,
            "opcode_value": r,
            "rs1": g,
            "rs2": b,
            "rd": a,
            "mnemonic": self._format_mnemonic(opcode_name, g, b, a)
        }

    def _format_mnemonic(self, opcode: str, rs1: int, rs2: int, rd: int) -> str:
        """Format instruction as assembly mnemonic."""
        if opcode == "HALT":
            return "HALT"
        elif opcode == "NOP":
            return "NOP"
        elif opcode == "MOV":
            return f"MOV r{rd}, r{rs1}"
        elif opcode == "LDI":
            return f"LDI r{rd}, {rs1}"
        elif opcode in ["ADD", "SUB", "MUL", "DIV"]:
            return f"{opcode} r{rd}, r{rs1}, r{rs2}"
        elif opcode == "JMP":
            return f"JMP {rs1}"
        else:
            return f"{opcode} r{rd}, r{rs1}, r{rs2}"

    def extract_program(self, screenshot_path: str, max_instructions: int = 100) -> List[Dict[str, Any]]:
        """
        Extract all instructions from a PixelRTS v3 screenshot.

        Args:
            screenshot_path: Path to the .rts.png screenshot
            max_instructions: Maximum number of instructions to extract

        Returns:
            List of decoded instructions
        """
        try:
            img = Image.open(screenshot_path).convert('RGBA')
            width, height = img.size
            pixels = np.array(img)

            grid_size = max(width, height)
            hilbert = HilbertCurve(grid_size)

            instructions = []
            for pc in range(min(max_instructions, grid_size * grid_size)):
                x, y = hilbert.d2xy(pc)

                if x >= width or y >= height:
                    continue

                r, g, b, a = pixels[y, x]
                decoded = self.decode_instruction((r, g, b, a))
                decoded["pc"] = pc
                decoded["x"] = x
                decoded["y"] = y
                instructions.append(decoded)

                # Stop at HALT
                if r == self.halt_opcode:
                    break

            return instructions

        except Exception as e:
            logger.error(f"Program extraction failed: {e}")
            return []
