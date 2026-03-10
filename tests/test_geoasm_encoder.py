"""
Tests for GeoASM Semantic Encoder

Tests the encoding of GeoASM instructions to RGBA pixels with:
- Heat-scaled red channel for opcodes
- Green for source register
- Blue for destination register
- Alpha for immediate value
"""

import pytest
import numpy as np

from systems.visual_shell.geoasm import (
    Instruction, Opcode,
    EMBED, ATTEND, PROJECT, SAMPLE, LAYER, KV_APPEND, THOUGHT_PULSE
)


class TestGeoASMSemanticEncoder:
    """Tests for semantic (heat-scaled) encoding mode."""

    @pytest.fixture(autouse=True)
    def setup(self):
        """Import encoder for each test."""
        from systems.pixel_compiler.geoasm_encoder import GeoASMEncoder
        self.encoder = GeoASMEncoder()

    def test_attend_has_highest_red_value(self):
        """ATTEND (0xD1) should have the highest red value (1.0 heat)."""
        attend_pixel = self.encoder.encode_instruction(ATTEND(0, 1))
        embed_pixel = self.encoder.encode_instruction(EMBED(0, 1))
        project_pixel = self.encoder.encode_instruction(PROJECT(0, 1))
        sample_pixel = self.encoder.encode_instruction(SAMPLE(0, 1))
        layer_pixel = self.encoder.encode_instruction(LAYER(0))
        kv_pixel = self.encoder.encode_instruction(KV_APPEND(0))
        pulse_pixel = self.encoder.encode_instruction(THOUGHT_PULSE(0))

        # ATTEND should have highest red
        assert attend_pixel[0] > embed_pixel[0], "ATTEND should be brighter than EMBED"
        assert attend_pixel[0] > project_pixel[0], "ATTEND should be brighter than PROJECT"
        assert attend_pixel[0] > sample_pixel[0], "ATTEND should be brighter than SAMPLE"
        assert attend_pixel[0] > layer_pixel[0], "ATTEND should be brighter than LAYER"
        assert attend_pixel[0] > kv_pixel[0], "ATTEND should be brighter than KV_APPEND"
        assert attend_pixel[0] > pulse_pixel[0], "ATTEND should be brighter than THOUGHT_PULSE"

    def test_layer_has_lowest_red_value(self):
        """LAYER (0xD4) should have the lowest red value (0.3 heat)."""
        layer_pixel = self.encoder.encode_instruction(LAYER(0))
        embed_pixel = self.encoder.encode_instruction(EMBED(0, 1))
        kv_pixel = self.encoder.encode_instruction(KV_APPEND(0))
        pulse_pixel = self.encoder.encode_instruction(THOUGHT_PULSE(0))

        # LAYER should have lowest red
        assert layer_pixel[0] < embed_pixel[0], "LAYER should be dimmer than EMBED"
        assert layer_pixel[0] < kv_pixel[0], "LAYER should be dimmer than KV_APPEND"
        assert layer_pixel[0] < pulse_pixel[0], "LAYER should be dimmer than THOUGHT_PULSE"

    def test_heat_intensity_ordering(self):
        """Verify heat intensity ordering from highest to lowest."""
        pixels = {
            Opcode.ATTEND: self.encoder.encode_instruction(ATTEND(0, 1)),
            Opcode.PROJECT: self.encoder.encode_instruction(PROJECT(0, 1)),
            Opcode.THOUGHT_PULSE: self.encoder.encode_instruction(THOUGHT_PULSE(0)),
            Opcode.SAMPLE: self.encoder.encode_instruction(SAMPLE(0, 1)),
            Opcode.EMBED: self.encoder.encode_instruction(EMBED(0, 1)),
            Opcode.KV_APPEND: self.encoder.encode_instruction(KV_APPEND(0)),
            Opcode.LAYER: self.encoder.encode_instruction(LAYER(0)),
        }

        # Expected order: ATTEND > PROJECT > THOUGHT_PULSE > SAMPLE > EMBED > KV_APPEND > LAYER
        red_values = [(op, pixel[0]) for op, pixel in pixels.items()]
        sorted_by_red = sorted(red_values, key=lambda x: x[1], reverse=True)

        expected_order = [
            Opcode.ATTEND,
            Opcode.PROJECT,
            Opcode.THOUGHT_PULSE,
            Opcode.SAMPLE,
            Opcode.EMBED,
            Opcode.KV_APPEND,
            Opcode.LAYER,
        ]

        actual_order = [op for op, _ in sorted_by_red]
        assert actual_order == expected_order, f"Heat order wrong: {actual_order}"

    def test_green_channel_source_register(self):
        """Green channel should encode source register (Rs: R0-R7)."""
        for rs in range(8):
            instr = Instruction(Opcode.EMBED, rs=rs, rd=0, imm=0)
            pixel = self.encoder.encode_instruction(instr)
            # R0=0, R1=32, R2=64, ..., R7=224 (scaled to 0-255)
            expected_green = int(rs * 255 / 7)
            assert pixel[1] == expected_green, f"R{rs} green mismatch: {pixel[1]} != {expected_green}"

    def test_blue_channel_destination_register(self):
        """Blue channel should encode destination register (Rd: R0-R7)."""
        for rd in range(8):
            instr = Instruction(Opcode.EMBED, rs=0, rd=rd, imm=0)
            pixel = self.encoder.encode_instruction(instr)
            # R0=0, R1=32, R2=64, ..., R7=224 (scaled to 0-255)
            expected_blue = int(rd * 255 / 7)
            assert pixel[2] == expected_blue, f"R{rd} blue mismatch: {pixel[2]} != {expected_blue}"

    def test_alpha_channel_immediate_value(self):
        """Alpha channel should directly encode immediate value (0-255)."""
        for imm in [0, 64, 128, 192, 255]:
            instr = Instruction(Opcode.LAYER, rs=0, rd=0, imm=imm)
            pixel = self.encoder.encode_instruction(instr)
            assert pixel[3] == imm, f"Immediate value mismatch: {pixel[3]} != {imm}"


class TestLosslessMode:
    """Tests for lossless encoding mode with exact roundtrip."""

    @pytest.fixture(autouse=True)
    def setup(self):
        """Import encoder for each test."""
        from systems.pixel_compiler.geoasm_encoder import GeoASMEncoder
        self.encoder = GeoASMEncoder(lossless=True)

    def test_lossless_red_is_exact_opcode(self):
        """In lossless mode, red channel should be exact opcode value."""
        opcode_pixel_map = {
            Opcode.EMBED: 0xD0,
            Opcode.ATTEND: 0xD1,
            Opcode.PROJECT: 0xD2,
            Opcode.SAMPLE: 0xD3,
            Opcode.LAYER: 0xD4,
            Opcode.KV_APPEND: 0xD5,
            Opcode.THOUGHT_PULSE: 0xD6,
        }

        for opcode, expected_red in opcode_pixel_map.items():
            instr = Instruction(opcode, rs=0, rd=0, imm=0)
            pixel = self.encoder.encode_instruction(instr)
            assert pixel[0] == expected_red, f"{opcode.name} red mismatch: {pixel[0]} != {expected_red}"

    def test_lossless_roundtrip_single_instruction(self):
        """Single instruction should roundtrip perfectly in lossless mode."""
        original = Instruction(Opcode.ATTEND, rs=3, rd=5, imm=42)
        pixel = self.encoder.encode_instruction(original)
        decoded = self.encoder.decode_pixel(pixel)

        assert decoded.opcode == original.opcode, "Opcode mismatch"
        assert decoded.rs == original.rs, "Source register mismatch"
        assert decoded.rd == original.rd, "Destination register mismatch"
        assert decoded.imm == original.imm, "Immediate value mismatch"

    def test_lossless_roundtrip_all_opcodes(self):
        """All opcodes should roundtrip perfectly in lossless mode."""
        instructions = [
            EMBED(0, 1),
            ATTEND(2, 3),
            PROJECT(4, 5),
            SAMPLE(6, 7),
            LAYER(128),
            KV_APPEND(2),
            THOUGHT_PULSE(4),
        ]

        for original in instructions:
            pixel = self.encoder.encode_instruction(original)
            decoded = self.encoder.decode_pixel(pixel)

            assert decoded.opcode == original.opcode, f"{original.opcode.name} opcode mismatch"
            assert decoded.rs == original.rs, f"{original.opcode.name} rs mismatch"
            assert decoded.rd == original.rd, f"{original.opcode.name} rd mismatch"
            assert decoded.imm == original.imm, f"{original.opcode.name} imm mismatch"

    def test_lossless_roundtrip_all_registers(self):
        """All register combinations should roundtrip in lossless mode."""
        for rs in range(8):
            for rd in range(8):
                original = Instruction(Opcode.PROJECT, rs=rs, rd=rd, imm=100)
                pixel = self.encoder.encode_instruction(original)
                decoded = self.encoder.decode_pixel(pixel)

                assert decoded.rs == rs, f"Rs {rs} roundtrip failed"
                assert decoded.rd == rd, f"Rd {rd} roundtrip failed"

    def test_lossless_roundtrip_all_immediates(self):
        """All immediate values should roundtrip in lossless mode."""
        test_values = [0, 1, 127, 128, 255]

        for imm in test_values:
            original = Instruction(Opcode.LAYER, imm=imm)
            pixel = self.encoder.encode_instruction(original)
            decoded = self.encoder.decode_pixel(pixel)

            assert decoded.imm == imm, f"Immediate {imm} roundtrip failed"


class TestEncodeProgram:
    """Tests for encoding multiple instructions into pixel arrays."""

    @pytest.fixture(autouse=True)
    def setup(self):
        """Import encoder for each test."""
        from systems.pixel_compiler.geoasm_encoder import GeoASMEncoder
        self.encoder = GeoASMEncoder()

    def test_encode_program_returns_numpy_array(self):
        """Encoding a program should return a numpy array."""
        program = [
            EMBED(0, 1),
            ATTEND(1, 2),
            PROJECT(2, 3),
        ]
        pixels = self.encoder.encode_program(program)

        assert isinstance(pixels, np.ndarray), "Should return numpy array"
        assert pixels.dtype == np.uint8, "Should be uint8 dtype"
        assert pixels.shape == (3, 4), f"Shape should be (3, 4), got {pixels.shape}"

    def test_encode_empty_program(self):
        """Encoding empty program should return empty array."""
        pixels = self.encoder.encode_program([])
        assert pixels.shape == (0, 4), f"Empty program shape should be (0, 4), got {pixels.shape}"

    def test_decode_program_roundtrip(self):
        """Program should roundtrip perfectly in lossless mode."""
        from systems.pixel_compiler.geoasm_encoder import GeoASMEncoder
        self.encoder = GeoASMEncoder(lossless=True)
        original_program = [
            EMBED(0, 1),
            LAYER(0),
            ATTEND(1, 2),
            PROJECT(2, 3),
            SAMPLE(3, 4),
            KV_APPEND(5),
            THOUGHT_PULSE(4),
        ]

        pixels = self.encoder.encode_program(original_program)
        decoded_program = self.encoder.decode_program(pixels)

        assert len(decoded_program) == len(original_program), "Program length mismatch"

        for i, (original, decoded) in enumerate(zip(original_program, decoded_program)):
            assert decoded.opcode == original.opcode, f"Instruction {i}: opcode mismatch"
            assert decoded.rs == original.rs, f"Instruction {i}: rs mismatch"
            assert decoded.rd == original.rd, f"Instruction {i}: rd mismatch"
            assert decoded.imm == original.imm, f"Instruction {i}: imm mismatch"
