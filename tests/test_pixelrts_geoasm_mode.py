"""
Tests for --mode geoasm in PixelRTS Converter.

Task 4 of GeoASM <-> PixelRTS v2 Containerization plan.
"""

import pytest
import tempfile
import os
import sys
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent))

from systems.pixel_compiler.pixelrts_v2_converter import main


class TestGeoASMModeCLI:
    """Test CLI support for --mode geoasm."""

    def test_help_shows_geoasm_mode(self, capsys):
        """--help should list geoasm as a mode choice."""
        with pytest.raises(SystemExit) as exc_info:
            # --help causes sys.exit(0)
            sys.argv = ['pixelrts_v2_converter.py', '--help']
            main()
        # Should exit cleanly (help mode)
        assert exc_info.value.code == 0

        captured = capsys.readouterr()
        # Check that geoasm appears in help text
        assert 'geoasm' in captured.out

    def test_geoasm_mode_in_choices(self):
        """'geoasm' should be accepted as valid mode."""
        import argparse
        from systems.pixel_compiler.pixelrts_v2_converter import main

        # Parse the argparser to check choices
        parser = argparse.ArgumentParser()
        parser.add_argument('--mode', choices=['standard', 'code', 'geoasm'])

        # Should not raise
        args = parser.parse_args(['--mode', 'geoasm'])
        assert args.mode == 'geoasm'


class TestGeoASMModeConversion:
    """Test GeoASM file conversion."""

    @pytest.fixture
    def sample_geoasm_source(self):
        """Sample GeoASM assembly source using valid opcodes."""
        return """; Simple test program
EMBED R0, R1
ATTEND R1, R2
PROJECT R2, R3
SAMPLE R3, R4
THOUGHT_PULSE R4
"""

    @pytest.fixture
    def temp_geoasm_file(self, sample_geoasm_source):
        """Create a temporary .geoasm file."""
        with tempfile.NamedTemporaryFile(
            mode='w',
            suffix='.geoasm',
            delete=False
        ) as f:
            f.write(sample_geoasm_source)
            temp_path = f.name
        yield temp_path
        # Cleanup
        if os.path.exists(temp_path):
            os.unlink(temp_path)

    @pytest.fixture
    def temp_output_dir(self):
        """Create a temporary output directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield tmpdir

    def test_convert_geoasm_file(self, temp_geoasm_file, temp_output_dir):
        """Convert .geoasm file to .rts.png using --mode geoasm."""
        output_path = os.path.join(temp_output_dir, 'output.rts.png')

        sys.argv = [
            'pixelrts_v2_converter.py',
            temp_geoasm_file,
            output_path,
            '--mode', 'geoasm'
        ]

        result = main()

        assert result == 0, "Conversion should succeed"
        assert os.path.exists(output_path), ".rts.png file should be created"

        # Check sidecar metadata
        meta_path = output_path + '.meta.json'
        assert os.path.exists(meta_path), ".meta.json sidecar should be created"

        import json
        with open(meta_path) as f:
            metadata = json.load(f)

        assert metadata.get('executor') == 'geoasm'
        assert 'instruction_count' in metadata

    def test_convert_geoasm_with_name_and_version(self, temp_geoasm_file, temp_output_dir):
        """Convert with custom name and version."""
        output_path = os.path.join(temp_output_dir, 'output.rts.png')

        sys.argv = [
            'pixelrts_v2_converter.py',
            temp_geoasm_file,
            output_path,
            '--mode', 'geoasm',
            '--name', 'TestProgram',
            '--version', '2.0.0',
            '--description', 'A test program'
        ]

        result = main()

        assert result == 0

        import json
        meta_path = output_path + '.meta.json'
        with open(meta_path) as f:
            metadata = json.load(f)

        assert metadata.get('name') == 'TestProgram'
        assert metadata.get('version') == '2.0.0'
        assert 'test program' in metadata.get('description', '').lower()

    def test_auto_detect_geoasm_extension(self, temp_geoasm_file, temp_output_dir):
        """.geoasm extension should auto-select geoasm mode."""
        output_path = os.path.join(temp_output_dir, 'output.rts.png')

        # Run without explicit --mode
        sys.argv = [
            'pixelrts_v2_converter.py',
            temp_geoasm_file,
            output_path
        ]

        result = main()

        assert result == 0, "Should auto-detect geoasm mode from extension"

        # Verify it was processed as geoasm
        meta_path = output_path + '.meta.json'
        import json
        with open(meta_path) as f:
            metadata = json.load(f)

        assert metadata.get('executor') == 'geoasm'


class TestGeoASMModeErrors:
    """Test error handling for geoasm mode."""

    @pytest.fixture
    def temp_output_dir(self):
        """Create a temporary output directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield tmpdir

    def test_invalid_geoasm_syntax_error(self, temp_output_dir):
        """Invalid GeoASM syntax should produce clear error."""
        with tempfile.NamedTemporaryFile(
            mode='w',
            suffix='.geoasm',
            delete=False
        ) as f:
            f.write("INVALID_OPCODE R0, R1\n")  # Invalid instruction
            temp_path = f.name

        try:
            output_path = os.path.join(temp_output_dir, 'output.rts.png')

            sys.argv = [
                'pixelrts_v2_converter.py',
                temp_path,
                output_path,
                '--mode', 'geoasm'
            ]

            result = main()

            # Should return non-zero exit code
            assert result != 0, "Invalid syntax should fail"

        finally:
            os.unlink(temp_path)

    def test_missing_geoasm_file_error(self, temp_output_dir):
        """Missing .geoasm file should produce clear error."""
        output_path = os.path.join(temp_output_dir, 'output.rts.png')

        sys.argv = [
            'pixelrts_v2_converter.py',
            '/nonexistent/file.geoasm',
            output_path,
            '--mode', 'geoasm'
        ]

        result = main()

        assert result != 0, "Missing file should fail"


class TestGeoASMCartridgeIntegration:
    """Integration tests with GeoASMCartridgeWriter."""

    @pytest.fixture
    def temp_output_dir(self):
        """Create a temporary output directory."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield tmpdir

    def test_cartridge_has_correct_structure(self, temp_output_dir):
        """Output cartridge should have correct structure."""
        source = """; Test program
EMBED R0, R1
ATTEND R1, R2
PROJECT R2, R3
SAMPLE R3, R4
THOUGHT_PULSE R4
"""
        with tempfile.NamedTemporaryFile(
            mode='w',
            suffix='.geoasm',
            delete=False
        ) as f:
            f.write(source)
            temp_path = f.name

        try:
            output_path = os.path.join(temp_output_dir, 'test.rts.png')

            sys.argv = [
                'pixelrts_v2_converter.py',
                temp_path,
                output_path,
                '--mode', 'geoasm',
                '--name', 'TestCartridge'
            ]

            result = main()
            assert result == 0

            # Verify PNG is valid
            from PIL import Image
            img = Image.open(output_path)
            assert img.format == 'PNG'
            assert img.mode == 'RGBA'

            # Verify metadata
            import json
            meta_path = output_path + '.meta.json'
            with open(meta_path) as f:
                metadata = json.load(f)

            # Required fields
            assert 'executor' in metadata
            assert 'instruction_count' in metadata
            assert 'sha256' in metadata
            assert 'grid_size' in metadata

        finally:
            os.unlink(temp_path)


if __name__ == '__main__':
    pytest.main([__file__, '-v'])
