"""Tests for GeoASM cartridge assembly."""
import tempfile
from pathlib import Path

import pytest


class TestGeoASMCartridge:
    """Test GeoASM program packaging into .rts.png."""

    @pytest.fixture
    def cartridge_writer(self):
        """Create GeoASMCartridgeWriter instance."""
        from systems.pixel_compiler.geoasm_cartridge import GeoASMCartridgeWriter
        return GeoASMCartridgeWriter()

    def test_writer_exists(self, cartridge_writer):
        """Writer can be instantiated."""
        assert cartridge_writer is not None

    def test_create_cartridge_from_source(self, cartridge_writer):
        """Create cartridge from assembly source."""
        source = """
        EMBED R1, R2
        ATTEND R2, R2
        SAMPLE R2, R5
        """

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)

            # Verify PNG was created
            assert Path(output_path).exists()

            # Verify it's a valid PNG using PIL (more commonly available)
            from PIL import Image
            img = Image.open(output_path)
            assert img.width > 0
            assert img.height > 0
            assert img.mode == 'RGBA'
        finally:
            Path(output_path).unlink(missing_ok=True)

    def test_cartridge_metadata(self, cartridge_writer):
        """Cartridge includes GeoASM metadata."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(
                source,
                output_path,
                name="test_program",
                version="1.0"
            )

            # Check metadata file
            meta_path = Path(output_path + '.meta.json')
            assert meta_path.exists()

            import json
            with open(meta_path) as f:
                meta = json.load(f)

            assert meta.get('executor') == 'geoasm'
            assert meta.get('name') == 'test_program'
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_cartridge_grid_size(self, cartridge_writer):
        """Cartridge uses appropriate grid size."""
        # Small program should fit in small grid
        source = "EMBED R1, R2"

        grid_size = cartridge_writer.calculate_grid_size(source)
        assert grid_size >= 2  # At least 2x2 for 1 instruction
        assert grid_size <= 64  # Small program

    def test_metadata_instruction_count(self, cartridge_writer):
        """Metadata includes correct instruction count."""
        source = """
        EMBED R1, R2
        ATTEND R2, R2
        SAMPLE R2, R5
        """

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            meta = cartridge_writer.create_cartridge(source, output_path)
            assert meta.get('instruction_count') == 3
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_metadata_sha256(self, cartridge_writer):
        """Metadata includes sha256 hash."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            meta = cartridge_writer.create_cartridge(source, output_path)
            assert 'sha256' in meta
            assert len(meta['sha256']) == 64  # SHA-256 hex length
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_metadata_grid_size(self, cartridge_writer):
        """Metadata includes grid_size."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            meta = cartridge_writer.create_cartridge(source, output_path)
            assert 'grid_size' in meta
            assert meta['grid_size'] >= 2
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_metadata_regions(self, cartridge_writer):
        """Metadata includes regions structure."""
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            meta = cartridge_writer.create_cartridge(source, output_path)
            assert 'regions' in meta
            assert 'register_file' in meta['regions']
            assert 'kv_cache' in meta['regions']
            assert meta['regions']['register_file']['type'] == 'state'
            assert meta['regions']['register_file']['size'] == 8
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)

    def test_png_contains_encoded_instructions(self, cartridge_writer):
        """PNG pixel data contains the encoded instructions."""
        from systems.visual_shell.geoasm import Opcode
        source = "EMBED R1, R2"

        with tempfile.NamedTemporaryFile(suffix='.rts.png', delete=False) as f:
            output_path = f.name

        try:
            cartridge_writer.create_cartridge(source, output_path)

            # Load and verify pixel data
            from PIL import Image
            img = Image.open(output_path)
            pixels = img.load()

            # First pixel should be EMBED instruction
            # R = opcode (0xD0 for EMBED), G = rs (1), B = rd (2), A = imm (0)
            r, g, b, a = pixels[0, 0]
            assert r == Opcode.EMBED, f"Expected opcode 0xD0, got 0x{r:02X}"
            assert g == 1, f"Expected rs=1, got {g}"
            assert b == 2, f"Expected rd=2, got {b}"
        finally:
            Path(output_path).unlink(missing_ok=True)
            Path(output_path + '.meta.json').unlink(missing_ok=True)
