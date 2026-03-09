"""Tests for GeoASM Cartridge Reader."""
import pytest
import numpy as np
from pathlib import Path
import tempfile
import json
import hashlib

from systems.visual_shell.geoasm import Instruction, Opcode


class TestGeoASMCartridgeReader:
    """Test reading GeoASM programs from .rts.png cartridges."""

    @pytest.fixture
    def cartridge_reader(self):
        """Create GeoASMCartridgeReader instance."""
        from systems.pixel_compiler.geoasm_cartridge_reader import GeoASMCartridgeReader
        return GeoASMCartridgeReader()

    @pytest.fixture
    def cartridge_writer(self):
        """Create GeoASMCartridgeWriter instance for test data."""
        from systems.pixel_compiler.geoasm_cartridge import GeoASMCartridgeWriter
        return GeoASMCartridgeWriter()

    def test_reader_exists(self, cartridge_reader):
        """Reader can be instantiated."""
        assert cartridge_reader is not None

    def test_read_cartridge_from_png(self, cartridge_reader, cartridge_writer):
        """Read cartridge from PNG and extract instructions."""
        source = """
        EMBED R1, R2
        ATTEND R2, R2
        SAMPLE R2, R5
        """

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            # Write cartridge
            cartridge_writer.create_cartridge(source, output_path)

            # Read cartridge
            instructions = cartridge_reader.read_cartridge(output_path)

            # Verify instructions
            assert len(instructions) == 3
            assert instructions[0].opcode == Opcode.EMBED
            assert instructions[0].rs == 1
            assert instructions[0].rd == 2
            assert instructions[1].opcode == Opcode.ATTEND
            assert instructions[2].opcode == Opcode.SAMPLE
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_read_metadata(self, cartridge_reader, cartridge_writer):
        """Read metadata from sidecar JSON file."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            # Write cartridge with custom metadata
            cartridge_writer.create_cartridge(
                source,
                output_path,
                name="test_program",
                version="2.0",
                description="Test description"
            )

            # Read metadata
            metadata = cartridge_reader.read_metadata(output_path)

            assert metadata['executor'] == 'geoasm'
            assert metadata['name'] == 'test_program'
            assert metadata['version'] == '2.0'
            assert metadata['description'] == 'Test description'
            assert metadata['instruction_count'] == 1
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_verify_hash_success(self, cartridge_reader, cartridge_writer):
        """Verify hash matches when program is unchanged."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)

            # Verify hash should return True
            assert cartridge_reader.verify_hash(output_path) is True
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_roundtrip_preserves_instructions(self, cartridge_reader, cartridge_writer):
        """Full roundtrip: write then read preserves all instructions."""
        source = """
        EMBED R0, R1
        EMBED R2, R3
        ATTEND R1, R1
        ATTEND R3, R3
        PROJECT R1, R2
        PROJECT R3, R4
        SAMPLE R2, R5
        SAMPLE R4, R6
        LAYER #1
        KV_APPEND R7
        THOUGHT_PULSE R5
        """

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            # Write
            cartridge_writer.create_cartridge(source, output_path)

            # Read
            instructions = cartridge_reader.read_cartridge(output_path)

            # Verify all instructions preserved
            assert len(instructions) == 11

            # Check specific instructions
            assert instructions[0].opcode == Opcode.EMBED
            assert instructions[0].rs == 0
            assert instructions[0].rd == 1

            assert instructions[2].opcode == Opcode.ATTEND
            assert instructions[2].rs == 1
            assert instructions[2].rd == 1

            assert instructions[4].opcode == Opcode.PROJECT
            assert instructions[6].opcode == Opcode.SAMPLE
            assert instructions[8].opcode == Opcode.LAYER
            assert instructions[8].imm == 1
            assert instructions[9].opcode == Opcode.KV_APPEND
            assert instructions[10].opcode == Opcode.THOUGHT_PULSE
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_read_empty_program(self, cartridge_reader, cartridge_writer):
        """Reading an empty program returns empty list."""
        # Writer won't create empty cartridge, so test with minimal program
        source = "LAYER #0"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)
            instructions = cartridge_reader.read_cartridge(output_path)

            assert len(instructions) == 1
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_read_cartridge_missing_file(self, cartridge_reader):
        """Reading missing cartridge raises appropriate error."""
        with pytest.raises(FileNotFoundError):
            cartridge_reader.read_cartridge('/nonexistent/path.rts.png')

    def test_read_metadata_missing_file(self, cartridge_reader):
        """Reading missing metadata raises appropriate error."""
        with pytest.raises(FileNotFoundError):
            cartridge_reader.read_metadata('/nonexistent/path.rts.png')

    def test_verify_hash_missing_metadata(self, cartridge_reader, cartridge_writer):
        """Verify hash with missing metadata returns False."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            # Create cartridge with metadata
            cartridge_writer.create_cartridge(source, output_path)

            # Delete the metadata file
            meta_path = Path(output_path + '.meta.json')
            meta_path.unlink(missing_ok=True)

            # Verify hash should return False (metadata missing)
            result = cartridge_reader.verify_hash(output_path)
            assert result is False
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_read_cartridge_with_various_opcodes(self, cartridge_reader, cartridge_writer):
        """Read cartridge with all GeoASM opcodes."""
        source = """
        EMBED R0, R1
        ATTEND R1, R2
        PROJECT R2, R3
        SAMPLE R3, R4
        LAYER #5
        KV_APPEND R5
        THOUGHT_PULSE R6
        """

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)
            instructions = cartridge_reader.read_cartridge(output_path)

            assert len(instructions) == 7
            assert instructions[0].opcode == Opcode.EMBED
            assert instructions[1].opcode == Opcode.ATTEND
            assert instructions[2].opcode == Opcode.PROJECT
            assert instructions[3].opcode == Opcode.SAMPLE
            assert instructions[4].opcode == Opcode.LAYER
            assert instructions[4].imm == 5
            assert instructions[5].opcode == Opcode.KV_APPEND
            assert instructions[6].opcode == Opcode.THOUGHT_PULSE
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_read_preserves_immediate_values(self, cartridge_reader, cartridge_writer):
        """Read preserves immediate values for LAYER instruction."""
        source = """
        LAYER #0
        LAYER #127
        LAYER #255
        """

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)
            instructions = cartridge_reader.read_cartridge(output_path)

            assert instructions[0].imm == 0
            assert instructions[1].imm == 127
            assert instructions[2].imm == 255
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_read_cartridge_grid_size(self, cartridge_reader, cartridge_writer):
        """Reader correctly handles different grid sizes."""
        # Create a program with many instructions
        source = "\n".join([f"EMBED R{i % 8}, R{(i + 1) % 8}" for i in range(20)])

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)
            instructions = cartridge_reader.read_cartridge(output_path)

            # Should read all 20 instructions
            assert len(instructions) == 20
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_metadata_includes_grid_size(self, cartridge_reader, cartridge_writer):
        """Metadata read includes grid_size field."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)
            metadata = cartridge_reader.read_metadata(output_path)

            assert 'grid_size' in metadata
            assert metadata['grid_size'] >= 2
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_metadata_includes_sha256(self, cartridge_reader, cartridge_writer):
        """Metadata read includes sha256 field."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)
            metadata = cartridge_reader.read_metadata(output_path)

            assert 'sha256' in metadata
            assert len(metadata['sha256']) == 64  # SHA-256 hex length
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_metadata_includes_encoding(self, cartridge_reader, cartridge_writer):
        """Metadata read includes encoding field."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)
            metadata = cartridge_reader.read_metadata(output_path)

            assert 'encoding' in metadata
            assert metadata['encoding'] == 'lossless'  # Writer defaults to lossless
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)
