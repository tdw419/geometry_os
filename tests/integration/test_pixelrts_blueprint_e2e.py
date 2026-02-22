"""End-to-end integration tests for PixelRTS blueprint layer."""

import pytest
import tempfile
import json
from pathlib import Path
from PIL import Image

from systems.pixel_compiler.pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder
from systems.pixel_compiler.pixelrts_blueprint_analyzer import BlueprintAnalyzer
from systems.pixel_compiler.pixelrts_blueprint_viewer import BlueprintViewer
from systems.pixel_compiler.pixelrts_blueprint import PixelRTSBlueprint


@pytest.fixture
def sample_kernel_data():
    """Create sample kernel-like binary data."""
    # ELF header + simple content
    return b'\x7fELF\x02\x01\x01\x00' + b'\x00' * 10000


def test_full_blueprint_workflow(sample_kernel_data):
    """Test complete workflow: encode -> analyze -> view -> decode."""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        output_png = tmpdir / "kernel.rts.png"

        # Step 1: Analyze and generate blueprint
        analyzer = BlueprintAnalyzer()
        blueprint = analyzer.analyze(
            sample_kernel_data,
            system_name="Test Kernel",
            architecture="x86_64"
        )

        assert isinstance(blueprint, PixelRTSBlueprint)
        assert blueprint.system_name == "Test Kernel"

        # Step 2: Encode with blueprint
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(
            sample_kernel_data,
            str(output_png),
            blueprint=blueprint.to_dict()
        )

        # Verify files created
        assert output_png.exists()
        assert (tmpdir / "kernel.rts.png.meta.json").exists()
        assert (tmpdir / "kernel.rts.png.blueprint.json").exists()

        # Step 3: Load blueprint from sidecar
        viewer = BlueprintViewer()
        loaded_blueprint = viewer.load_blueprint(str(output_png))

        assert loaded_blueprint is not None
        assert loaded_blueprint.system_name == "Test Kernel"

        # Step 4: Generate overlay
        overlay_path = tmpdir / "overlay.png"
        viewer.render_overlay(
            str(output_png),
            loaded_blueprint,
            str(overlay_path)
        )

        assert overlay_path.exists()

        # Verify overlay is valid image
        overlay = Image.open(overlay_path)
        # Grid size is auto-calculated based on data size (10008 bytes)
        # For 10008 bytes at 4 bytes/pixel = 2502 pixels -> ceil(sqrt(2502)) = 50 -> next power of 2 = 64
        assert overlay.size == (64, 64)  # Auto-calculated grid size

        # Step 5: Decode and verify data integrity
        decoder = PixelRTSDecoder()
        decoded_data = decoder.load(str(output_png), verify_hash=True)

        assert decoded_data == sample_kernel_data


def test_blueprint_roundtrip_serialization():
    """Test blueprint survives JSON serialization roundtrip."""
    from systems.pixel_compiler.pixelrts_blueprint import (
        Component, ComponentType, HilbertRange
    )

    original = PixelRTSBlueprint(
        system_name="Roundtrip Test",
        system_type="Test Container",
        architecture="x86_64",
        entry_point="0x1000",
        components=[
            Component(
                id="test_component",
                type=ComponentType.EXECUTABLE,
                description="Test component",
                hilbert_range=HilbertRange(0, 100, (0, 0), (10, 10)),
                entropy_profile="high",
                visual_hint="red_dominant"
            )
        ]
    )

    # Serialize to JSON
    json_str = original.to_json()

    # Deserialize from JSON
    restored = PixelRTSBlueprint.from_json(json_str)

    # Verify all fields match
    assert restored.system_name == original.system_name
    assert restored.system_type == original.system_type
    assert restored.architecture == original.architecture
    assert restored.entry_point == original.entry_point
    assert len(restored.components) == 1
    assert restored.components[0].id == "test_component"


def test_entropy_calculation_accuracy():
    """Test entropy calculation produces expected values."""
    analyzer = BlueprintAnalyzer()

    # All zeros = minimum entropy
    zeros = b'\x00' * 1000
    zeros_entropy = analyzer._calculate_entropy(zeros)
    assert zeros_entropy < 0.1

    # All byte values = maximum entropy
    full_range = bytes(range(256)) * 4
    full_entropy = analyzer._calculate_entropy(full_range)
    assert full_entropy > 7.5

    # Repeating pattern = medium entropy
    pattern = b'ABCDEFGH' * 125
    pattern_entropy = analyzer._calculate_entropy(pattern)
    assert 2.0 < pattern_entropy < 7.5


def test_component_hilbert_ranges():
    """Test Hilbert ranges are correctly calculated."""
    analyzer = BlueprintAnalyzer()
    blueprint = analyzer.analyze(b'\x7fELF' + b'\x00' * 10000)

    # All components should have valid ranges
    for component in blueprint.components:
        assert component.hilbert_range.start_index >= 0
        assert component.hilbert_range.end_index > component.hilbert_range.start_index
        assert len(component.hilbert_range.pixel_start) == 2
        assert len(component.hilbert_range.pixel_end) == 2


def test_visual_overlay_generates_valid_png():
    """Test visual overlay generation produces valid PNG."""
    viewer = BlueprintViewer()

    with tempfile.TemporaryDirectory() as tmpdir:
        # Create test image
        test_png = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256), color=(128, 128, 128, 255)).save(test_png)

        # Create simple blueprint
        blueprint = PixelRTSBlueprint(system_name="Test")

        output = Path(tmpdir) / "overlay.png"
        result = viewer.render_overlay(str(test_png), blueprint, str(output))

        # Verify output
        assert result == str(output)
        assert output.exists()

        # Verify it's a valid PNG
        img = Image.open(output)
        assert img.format == 'PNG'
        assert img.size == (256, 256)


def test_html_visualization_generates_valid_html():
    """Test HTML visualization produces valid HTML."""
    viewer = BlueprintViewer()

    with tempfile.TemporaryDirectory() as tmpdir:
        # Create test image
        test_png = Path(tmpdir) / "test.rts.png"
        Image.new('RGBA', (256, 256)).save(test_png)

        blueprint = PixelRTSBlueprint(
            system_name="HTML Test",
            components=[]
        )

        output = Path(tmpdir) / "view.html"
        result = viewer.create_interactive_html(str(test_png), blueprint, str(output))

        assert result == str(output)
        assert output.exists()

        # Verify HTML content
        with open(output) as f:
            html_content = f.read()

        assert '<!DOCTYPE html>' in html_content
        assert 'HTML Test' in html_content
        assert '</html>' in html_content


def test_real_elf_binary_handling():
    """Test handling of real ELF binary structure."""
    # Create a minimal valid ELF header (64-bit little-endian)
    elf_magic = b'\x7fELF'           # ELF magic
    elf_class = b'\x02'              # 64-bit
    elf_data = b'\x01'               # Little-endian
    elf_version = b'\x01'            # ELF version
    elf_padding = b'\x00' * 9        # Padding/ABI
    elf_padding2 = b'\x00' * 7       # Padding
    elf_type = b'\x03\x00'           # Type: EXEC
    elf_machine = b'\x3e\x00'        # Machine: x86_64
    elf_version2 = b'\x01\x00\x00\x00'  # Version

    elf_header = elf_magic + elf_class + elf_data + elf_version + elf_padding + elf_padding2 + elf_type + elf_machine + elf_version2
    test_data = elf_header + b'\x00' * 1000
    
    analyzer = BlueprintAnalyzer()
    
    # Should detect as ELF
    assert analyzer.is_elf_binary(test_data) is True
    
    # Should analyze and generate blueprint
    blueprint = analyzer.analyze(test_data, system_name="Test ELF")
    
    assert blueprint.system_name == "Test ELF"
    # Even without pyelftools, should fallback to entropy analysis
    assert len(blueprint.components) > 0 or len(blueprint.memory_map) > 0


def test_data_integrity_preservation():
    """Test that encoding with blueprint preserves data integrity."""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        output_png = tmpdir / "test.rts.png"
        
        # Create test data with identifiable pattern
        test_data = bytes(range(256)) * 10  # 2560 bytes
        
        analyzer = BlueprintAnalyzer()
        blueprint = analyzer.analyze(test_data, system_name="Integrity Test")
        
        # Encode with blueprint
        encoder = PixelRTSEncoder(mode="standard")
        encoder.save(test_data, str(output_png), blueprint=blueprint.to_dict())
        
        # Decode and verify
        decoder = PixelRTSDecoder()
        decoded_data = decoder.load(str(output_png))
        
        # Data should match exactly
        assert decoded_data == test_data
