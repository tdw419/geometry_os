"""
Tests for PixelRTS3Detector - Geometric instruction analysis.
"""

import pytest
import os
import sys
import tempfile
from PIL import Image
import numpy as np

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestPixelRTS3DetectorInit:
    """Test PixelRTS3Detector initialization."""

    def test_detector_imports(self):
        """Test that PixelRTS3Detector can be imported."""
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import PixelRTS3Detector
        assert PixelRTS3Detector is not None

    def test_detector_default_halt_opcode(self):
        """Test default HALT opcode is 0x07."""
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import PixelRTS3Detector

        detector = PixelRTS3Detector()
        assert detector.halt_opcode == 0x07

    def test_detector_custom_halt_opcode(self):
        """Test custom HALT opcode can be set."""
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import PixelRTS3Detector

        detector = PixelRTS3Detector(halt_opcode=0xFF)
        assert detector.halt_opcode == 0xFF


class TestHilbertCurve:
    """Test Hilbert curve coordinate mapping."""

    def test_hilbert_d2xy_roundtrip(self):
        """Test that d2xy and xy2d are inverses."""
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import HilbertCurve

        hilbert = HilbertCurve(4)

        for d in range(16):
            x, y = hilbert.d2xy(d)
            d_back = hilbert.xy2d(x, y)
            assert d == d_back, f"Roundtrip failed: {d} -> ({x},{y}) -> {d_back}"

    def test_hilbert_known_values(self):
        """Test known Hilbert curve positions."""
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import HilbertCurve

        hilbert = HilbertCurve(4)

        # First 4 positions in 2x2 quadrant (verified by roundtrip test)
        assert hilbert.d2xy(0) == (0, 0)
        assert hilbert.d2xy(1) == (1, 0)
        assert hilbert.d2xy(2) == (1, 1)
        assert hilbert.d2xy(3) == (0, 1)


class TestPixelRTS3DetectorHalt:
    """Test HALT detection."""

    @pytest.fixture
    def detector(self):
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import PixelRTS3Detector
        return PixelRTS3Detector()

    @pytest.fixture
    def halt_image(self):
        """Create a test image with HALT at PC=3."""
        # 2x2 image: LDI, LDI, ADD, HALT
        # Hilbert order for 2x2: (0,0), (0,1), (1,1), (1,0)
        img = Image.new('RGBA', (2, 2), (0, 0, 0, 0))
        pixels = img.load()

        pixels[0, 0] = (0x08, 10, 0, 1)   # LDI r1, 10 at PC=0
        pixels[0, 1] = (0x08, 20, 0, 2)   # LDI r2, 20 at PC=1
        pixels[1, 1] = (0x33, 1, 2, 3)    # ADD r3, r1, r2 at PC=2
        pixels[1, 0] = (0x07, 0, 0, 0)    # HALT at PC=3

        # Save to temp file
        fd, path = tempfile.mkstemp(suffix='.rts.png')
        os.close(fd)
        img.save(path)
        return path

    def test_detects_halt_at_pc3(self, detector, halt_image):
        """Test that HALT is detected at PC=3."""
        match = detector.detect_halt(halt_image)

        assert match is not None
        assert match.opcode == "HALT"
        assert match.pc == 3
        assert match.rgba[0] == 0x07  # Red channel = HALT opcode

        # Cleanup
        os.unlink(halt_image)

    def test_returns_none_for_no_halt(self, detector):
        """Test that no HALT returns None."""
        # Create image without HALT
        img = Image.new('RGBA', (2, 2), (0x08, 0, 0, 0))  # All LDI

        fd, path = tempfile.mkstemp(suffix='.rts.png')
        os.close(fd)
        img.save(path)

        match = detector.detect_halt(path)
        assert match is None

        os.unlink(path)

    def test_match_has_coordinates(self, detector, halt_image):
        """Test that match includes pixel coordinates."""
        match = detector.detect_halt(halt_image)

        assert match is not None
        # HALT is at Hilbert position 3, which is (1, 0) for 2x2 grid
        assert match.x == 1
        assert match.y == 0

        os.unlink(halt_image)


class TestPixelRTS3DetectorDecoding:
    """Test instruction decoding."""

    @pytest.fixture
    def detector(self):
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import PixelRTS3Detector
        return PixelRTS3Detector()

    def test_decode_add_instruction(self, detector):
        """Test decoding ADD instruction."""
        # ADD r3, r1, r2 = (0x33, 1, 2, 3)
        decoded = detector.decode_instruction((0x33, 1, 2, 3))

        assert decoded["opcode"] == "ADD"
        assert decoded["opcode_value"] == 0x33
        assert decoded["rs1"] == 1
        assert decoded["rs2"] == 2
        assert decoded["rd"] == 3
        assert "ADD r3, r1, r2" in decoded["mnemonic"]

    def test_decode_ldi_instruction(self, detector):
        """Test decoding LDI instruction."""
        # LDI r1, 10 = (0x08, 10, 0, 1)
        decoded = detector.decode_instruction((0x08, 10, 0, 1))

        assert decoded["opcode"] == "LDI"
        assert decoded["rs1"] == 10  # Immediate value
        assert decoded["rd"] == 1
        assert "LDI r1, 10" in decoded["mnemonic"]

    def test_decode_halt_instruction(self, detector):
        """Test decoding HALT instruction."""
        decoded = detector.decode_instruction((0x07, 0, 0, 0))

        assert decoded["opcode"] == "HALT"
        assert decoded["mnemonic"] == "HALT"

    def test_decode_unknown_opcode(self, detector):
        """Test decoding unknown opcode."""
        decoded = detector.decode_instruction((0xFF, 0, 0, 0))

        assert "UNKNOWN" in decoded["opcode"]
        assert decoded["opcode_value"] == 0xFF


class TestPixelRTS3DetectorProgramExtraction:
    """Test full program extraction."""

    @pytest.fixture
    def detector(self):
        from systems.visual_shell.swarm.visual_perception.pixelrts3_detector import PixelRTS3Detector
        return PixelRTS3Detector()

    @pytest.fixture
    def hello_program(self):
        """Create the hello.pasm program as image."""
        img = Image.new('RGBA', (2, 2), (0, 0, 0, 0))
        pixels = img.load()

        pixels[0, 0] = (0x08, 10, 0, 1)   # LDI r1, 10
        pixels[0, 1] = (0x08, 20, 0, 2)   # LDI r2, 20
        pixels[1, 1] = (0x33, 1, 2, 3)    # ADD r3, r1, r2
        pixels[1, 0] = (0x07, 0, 0, 0)    # HALT

        fd, path = tempfile.mkstemp(suffix='.rts.png')
        os.close(fd)
        img.save(path)
        return path

    def test_extract_hello_program(self, detector, hello_program):
        """Test extracting the hello program."""
        instructions = detector.extract_program(hello_program)

        assert len(instructions) == 4

        # Check instruction sequence
        assert instructions[0]["opcode"] == "LDI"
        assert instructions[0]["rs1"] == 10

        assert instructions[1]["opcode"] == "LDI"
        assert instructions[1]["rs1"] == 20

        assert instructions[2]["opcode"] == "ADD"
        assert instructions[2]["rd"] == 3

        assert instructions[3]["opcode"] == "HALT"

        os.unlink(hello_program)

    def test_extraction_stops_at_halt(self, detector, hello_program):
        """Test that extraction stops at HALT."""
        instructions = detector.extract_program(hello_program, max_instructions=100)

        # Should only have 4 instructions (stops at HALT)
        assert len(instructions) == 4

        os.unlink(hello_program)

    def test_extraction_includes_coordinates(self, detector, hello_program):
        """Test that extraction includes PC and coordinates."""
        instructions = detector.extract_program(hello_program)

        for i, instr in enumerate(instructions):
            assert "pc" in instr
            assert "x" in instr
            assert "y" in instr
            assert instr["pc"] == i

        os.unlink(hello_program)
