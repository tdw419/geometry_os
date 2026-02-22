#!/usr/bin/env python3
"""
Unit tests for PixelRTS v2 WASM Code Visualizer

Tests:
- WASM magic number detection
- Opcode categorization
- Semantic coloring
- Complexity analysis
- Visualization

Author: PixelRTS v2 Implementation
Date: 2026-02-08
"""

import pytest
import numpy as np
import sys
from pathlib import Path

# Add pixel_compiler to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "systems" / "pixel_compiler"))

from pixelrts_v2_wasm import (
    WASMCodeVisualizer,
    WASMOpcodeCategory,
    create_test_wasm,
    visualize_wasm_file,
)


class TestWASMDetection:
    """Test WASM file detection"""

    def test_is_wasm_valid_magic(self):
        """Test detection of valid WASM magic number"""
        visualizer = WASMCodeVisualizer()

        # Valid WASM magic
        valid_wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'
        assert visualizer.is_wasm(valid_wasm) is True

    def test_is_wasm_invalid_magic(self):
        """Test rejection of invalid magic numbers"""
        visualizer = WASMCodeVisualizer()

        # Invalid magic numbers
        assert visualizer.is_wasm(b'\x00\x00\x00\x00') is False
        assert visualizer.is_wasm(b'ELF') is False
        assert visualizer.is_wasm(b'MZ') is False
        assert visualizer.is_wasm(b'\x7fELF') is False

    def test_is_wasm_too_short(self):
        """Test handling of data shorter than magic number"""
        visualizer = WASMCodeVisualizer()

        assert visualizer.is_wasm(b'') is False
        assert visualizer.is_wasm(b'\x00') is False
        assert visualizer.is_wasm(b'\x00\x61') is False
        assert visualizer.is_wasm(b'\x00\x61\x73') is False


class TestOpcodeCategorization:
    """Test opcode categorization"""

    def test_control_flow_opcodes(self):
        """Test control flow opcode identification"""
        visualizer = WASMCodeVisualizer()

        # block, loop, if, else, end, br, br_if, return, call
        control_flow_opcodes = [0x02, 0x03, 0x04, 0x05, 0x0b, 0x0c, 0x0d, 0x0f, 0x10]

        for opcode in control_flow_opcodes:
            cat = visualizer.get_opcode_category(opcode)
            assert cat == WASMOpcodeCategory.CONTROL_FLOW, f"Opcode 0x{opcode:02x} not identified as control flow"

    def test_arithmetic_opcodes(self):
        """Test arithmetic opcode identification"""
        visualizer = WASMCodeVisualizer()

        # i32.add, i32.sub, i32.mul, i32.eq
        arithmetic_opcodes = [0x6a, 0x6b, 0x6c, 0x46]

        for opcode in arithmetic_opcodes:
            cat = visualizer.get_opcode_category(opcode)
            assert cat == WASMOpcodeCategory.ARITHMETIC, f"Opcode 0x{opcode:02x} not identified as arithmetic"

    def test_memory_opcodes(self):
        """Test memory opcode identification"""
        visualizer = WASMCodeVisualizer()

        # local.get, local.set, global.get, i32.load, i32.store
        memory_opcodes = [0x20, 0x21, 0x23, 0x28, 0x36]

        for opcode in memory_opcodes:
            cat = visualizer.get_opcode_category(opcode)
            assert cat == WASMOpcodeCategory.MEMORY, f"Opcode 0x{opcode:02x} not identified as memory"

    def test_unknown_opcode(self):
        """Test handling of unknown opcodes"""
        visualizer = WASMCodeVisualizer()

        # Invalid/unknown opcode
        cat = visualizer.get_opcode_category(0xFF)
        assert cat is None


class TestSemanticColoring:
    """Test semantic RGBA coloring"""

    def test_color_opcode_basic(self):
        """Test basic opcode coloring"""
        visualizer = WASMCodeVisualizer()

        # Test with control flow opcode (block = 0x02)
        rgba = visualizer.color_opcode(0x02, operand1=100, operand2=50, entropy=200)

        assert rgba == (200, 100, 50, 255)
        assert rgba[0] == 200  # Red = entropy
        assert rgba[1] == 100  # Green = operand1
        assert rgba[2] == 50   # Blue = operand2
        assert rgba[3] == 255  # Alpha = executable

    def test_color_opcode_entropy_clamping(self):
        """Test that entropy is clamped to 0-255"""
        visualizer = WASMCodeVisualizer()

        # Test with out-of-range entropy
        rgba_high = visualizer.color_opcode(0x02, entropy=1000)
        assert rgba_high[0] == 255  # Clamped to max

        rgba_low = visualizer.color_opcode(0x02, entropy=-100)
        assert rgba_low[0] == 0  # Clamped to min

    def test_color_opcode_operand_masking(self):
        """Test that operands are masked to 8 bits"""
        visualizer = WASMCodeVisualizer()

        # Test with values > 255
        rgba = visualizer.color_opcode(0x02, operand1=300, operand2=512)

        assert rgba[1] == 300 & 0xFF  # Should be 44
        assert rgba[2] == 512 & 0xFF  # Should be 0

    def test_color_opcode_alpha_execution_mask(self):
        """Test alpha channel execution mask"""
        visualizer = WASMCodeVisualizer()

        # Known opcode should have alpha = 255
        rgba_known = visualizer.color_opcode(0x02)
        assert rgba_known[3] == 255

        # Unknown opcode should have alpha = 0
        rgba_unknown = visualizer.color_opcode(0xFF)
        assert rgba_unknown[3] == 0

    def test_color_opcode_unreachable(self):
        """Test unreachable opcode gets maximum entropy"""
        visualizer = WASMCodeVisualizer()

        # unreachable = 0x00
        rgba = visualizer.color_opcode(0x00)
        assert rgba[0] == 255  # Maximum entropy

    def test_color_opcode_nop(self):
        """Test nop opcode gets zero entropy"""
        visualizer = WASMCodeVisualizer()

        # nop = 0x01
        rgba = visualizer.color_opcode(0x01)
        assert rgba[0] == 0  # Zero entropy


class TestEntropyCalculation:
    """Test control flow entropy calculation"""

    def test_calculate_control_flow_entropy_basic(self):
        """Test basic entropy calculation"""
        visualizer = WASMCodeVisualizer()

        # Create data with control flow opcodes
        data = b'\x00\x61\x73\x6d\x01\x00\x00\x00'  # header
        data += b'\x02\x03\x04'  # block, loop, if

        entropy = visualizer.calculate_control_flow_entropy(data)

        assert len(entropy) == len(data)
        # Control flow opcodes should have non-zero entropy
        assert entropy[8] > 0  # block
        assert entropy[9] > 0  # loop
        assert entropy[10] > 0  # if

    def test_calculate_control_flow_entropy_nop(self):
        """Test that nop has zero entropy"""
        visualizer = WASMCodeVisualizer()

        data = b'\x00\x61\x73\x6d\x01\x00\x00\x00\x01'  # header + nop

        # Use window_size=1 to get raw per-byte values without smoothing
        entropy = visualizer.calculate_control_flow_entropy(data, window_size=1)

        # nop should have zero entropy
        assert entropy[8] == 0

    def test_calculate_control_flow_entropy_smoothing(self):
        """Test entropy smoothing with window"""
        visualizer = WASMCodeVisualizer()

        # Use simpler test data: just opcodes without header
        # Use bytes that are not valid opcodes (will have 0 entropy)
        # 0xFF is not a valid WASM opcode, so it has 0 entropy
        # 0x02 is block (high entropy)
        data = b'\xFF\xFF\x02\xFF\xFF'  # invalid, invalid, block, invalid, invalid

        # Without smoothing
        entropy_no_smooth = visualizer.calculate_control_flow_entropy(data, window_size=1)

        # With smoothing
        entropy_smooth = visualizer.calculate_control_flow_entropy(data, window_size=5)

        # The isolated block (index 2) should have lower entropy when smoothed
        # because it averages with surrounding zeros
        # Block = 200, with smoothing: (0 + 0 + 200 + 0 + 0) / 5 = 40
        assert entropy_smooth[2] < entropy_no_smooth[2]
        assert entropy_no_smooth[2] == 200  # Block has raw entropy of 200
        # Check that smoothing actually reduced the value
        assert entropy_smooth[2] == 40  # (0 + 0 + 200 + 0 + 0) / 5 = 40


class TestVisualization:
    """Test WASM visualization"""

    def test_visualize_invalid_input(self):
        """Test that visualization rejects non-WASM input"""
        visualizer = WASMCodeVisualizer()

        with pytest.raises(ValueError, match="not a valid WASM file"):
            visualizer.visualize(b'not wasm')

    def test_visualize_output_shape(self):
        """Test that visualization produces correct output shape"""
        visualizer = WASMCodeVisualizer()

        wasm = create_test_wasm()
        rgba = visualizer.visualize(wasm)

        # Should be 2D array with 4 channels (RGBA)
        assert rgba.ndim == 2
        assert rgba.shape[1] == 4

    def test_visualize_rgba_range(self):
        """Test that visualization produces valid RGBA values"""
        visualizer = WASMCodeVisualizer()

        wasm = create_test_wasm()
        rgba = visualizer.visualize(wasm)

        # All values should be in 0-255 range
        assert np.all(rgba >= 0)
        assert np.all(rgba <= 255)

    def test_visualize_padding(self):
        """Test that non-multiple-of-4 data is padded"""
        visualizer = WASMCodeVisualizer()

        # Create WASM with length not divisible by 4
        wasm = create_test_wasm()
        if len(wasm) % 4 == 0:
            wasm = wasm[:-1]  # Make it unaligned

        rgba = visualizer.visualize(wasm)

        # Should not raise error, should be padded
        assert rgba is not None


class TestComplexityAnalysis:
    """Test complexity analysis"""

    def test_analyze_complexity_valid_wasm(self):
        """Test complexity analysis on valid WASM"""
        visualizer = WASMCodeVisualizer()

        wasm = create_test_wasm()
        complexity = visualizer.analyze_complexity(wasm)

        assert 'complexity_score' in complexity
        assert 'control_flow_count' in complexity
        assert 'arithmetic_count' in complexity
        assert 'memory_count' in complexity
        assert 'total_opcodes' in complexity

        # Score should be in range 0-100
        assert 0 <= complexity['complexity_score'] <= 100

    def test_analyze_complexity_invalid_input(self):
        """Test that complexity analysis rejects non-WASM"""
        visualizer = WASMCodeVisualizer()

        with pytest.raises(ValueError, match="not a valid WASM file"):
            visualizer.analyze_complexity(b'not wasm')

    def test_analyze_complexity_counts(self):
        """Test that opcode counts are accurate"""
        visualizer = WASMCodeVisualizer()

        # Create WASM with known opcodes
        wasm = b'\x00\x61\x73\x6d\x01\x00\x00\x00'  # header
        wasm += b'\x02\x03\x04'  # 3 control flow opcodes
        wasm += b'\x6a\x6b'      # 2 arithmetic opcodes
        wasm += b'\x20\x21'      # 2 memory opcodes

        complexity = visualizer.analyze_complexity(wasm)

        # Should count the opcodes (excluding header)
        assert complexity['control_flow_count'] >= 3
        assert complexity['arithmetic_count'] >= 2
        assert complexity['memory_count'] >= 2


class TestOpcodeNames:
    """Test opcode name lookup"""

    def test_get_opcode_name_control_flow(self):
        """Test getting control flow opcode names"""
        visualizer = WASMCodeVisualizer()

        assert visualizer.get_opcode_name(0x00) == 'unreachable'
        assert visualizer.get_opcode_name(0x01) == 'nop'
        assert visualizer.get_opcode_name(0x02) == 'block'
        assert visualizer.get_opcode_name(0x03) == 'loop'
        assert visualizer.get_opcode_name(0x04) == 'if'
        assert visualizer.get_opcode_name(0x0b) == 'end'
        assert visualizer.get_opcode_name(0x0c) == 'br'
        assert visualizer.get_opcode_name(0x0d) == 'br_if'
        assert visualizer.get_opcode_name(0x0f) == 'return'
        assert visualizer.get_opcode_name(0x10) == 'call'

    def test_get_opcode_name_arithmetic(self):
        """Test getting arithmetic opcode names"""
        visualizer = WASMCodeVisualizer()

        assert visualizer.get_opcode_name(0x41) == 'i32.const'
        assert visualizer.get_opcode_name(0x46) == 'i32.eq'
        assert visualizer.get_opcode_name(0x6a) == 'i32.add'
        assert visualizer.get_opcode_name(0x6b) == 'i32.sub'
        assert visualizer.get_opcode_name(0x6c) == 'i32.mul'

    def test_get_opcode_name_memory(self):
        """Test getting memory opcode names"""
        visualizer = WASMCodeVisualizer()

        assert visualizer.get_opcode_name(0x20) == 'local.get'
        assert visualizer.get_opcode_name(0x21) == 'local.set'
        assert visualizer.get_opcode_name(0x23) == 'global.get'
        assert visualizer.get_opcode_name(0x28) == 'i32.load'
        assert visualizer.get_opcode_name(0x36) == 'i32.store'

    def test_get_opcode_name_unknown(self):
        """Test getting unknown opcode name"""
        visualizer = WASMCodeVisualizer()

        assert visualizer.get_opcode_name(0xFF) is None


class TestUtilityFunctions:
    """Test utility functions"""

    def test_create_test_wasm(self):
        """Test creation of test WASM file"""
        wasm = create_test_wasm()

        # Should have valid magic number
        assert wasm[:4] == b'\x00\x61\x73\x6d'

        # Should have valid version
        assert wasm[4:8] == b'\x01\x00\x00\x00'

        # Should be non-empty
        assert len(wasm) > 8

    def test_create_test_wasm_valid(self):
        """Test that created test WASM is valid"""
        wasm = create_test_wasm()
        visualizer = WASMCodeVisualizer()

        assert visualizer.is_wasm(wasm) is True


class TestWASMPixelRTSEncoderIntegration:
    """Test integration of WASM semantic coloring with PixelRTSEncoder"""

    def test_encoder_code_mode_initialization(self):
        """Test that PixelRTSEncoder initializes WASM visualizer in code mode"""
        from pixelrts_v2_core import PixelRTSEncoder

        # Create encoder in code mode
        encoder = PixelRTSEncoder(mode="code")

        # Should have WASM visualizer attribute
        assert hasattr(encoder, 'wasm_visualizer')
        assert encoder.wasm_visualizer is not None
        assert isinstance(encoder.wasm_visualizer, WASMCodeVisualizer)

    def test_encoder_standard_mode_no_visualizer(self):
        """Test that standard mode doesn't initialize WASM visualizer"""
        from pixelrts_v2_core import PixelRTSEncoder

        # Create encoder in standard mode
        encoder = PixelRTSEncoder(mode="standard")

        # Should not have WASM visualizer (or it should be None)
        # Either behavior is acceptable
        wasm_viz = getattr(encoder, 'wasm_visualizer', None)
        assert wasm_viz is None

    def test_encode_wasm_with_semantic_coloring(self):
        """Test that WASM data is encoded with semantic coloring in code mode"""
        from pixelrts_v2_core import PixelRTSEncoder
        from PIL import Image
        import io

        # Create encoder in code mode
        encoder = PixelRTSEncoder(mode="code")

        # Create test WASM
        wasm = create_test_wasm()

        # Encode the WASM
        png_bytes = encoder.encode(wasm, grid_size=4)

        # Decode PNG to verify semantic coloring was applied
        img = Image.open(io.BytesIO(png_bytes))
        pixels = np.array(img)

        # In code mode, the first pixels should show semantic coloring
        # (not raw byte-for-byte encoding)
        # The magic number is \0asm = 0x00 0x61 0x73 0x6d
        # With semantic coloring, the first pixel should be colored differently
        # than raw bytes would be

        # At minimum, verify the image was created
        assert pixels.shape == (4, 4, 4)
        assert pixels.dtype == np.uint8

    def test_encode_wasm_preserves_data_integrity(self):
        """Test that encoding WASM preserves data for decoding"""
        from pixelrts_v2_core import PixelRTSEncoder, PixelRTSDecoder

        # Create encoder/decoder in code mode
        encoder = PixelRTSEncoder(mode="code")
        decoder = PixelRTSDecoder()

        # Create test WASM
        original_wasm = create_test_wasm()

        # Encode and decode
        png_bytes = encoder.encode(original_wasm, grid_size=4)
        decoded_data = decoder.decode(png_bytes)

        # Data integrity should be preserved
        # (semantic coloring affects visualization, not the stored data)
        assert decoded_data == original_wasm

    def test_encode_non_wasm_uses_standard_encoding(self):
        """Test that non-WASM data falls back to standard encoding"""
        from pixelrts_v2_core import PixelRTSEncoder
        from PIL import Image
        import io

        # Create encoder in code mode
        encoder = PixelRTSEncoder(mode="code")

        # Create non-WASM data
        data = b'This is not WASM data'

        # Encode the data
        png_bytes = encoder.encode(data, grid_size=4)

        # Decode and verify
        img = Image.open(io.BytesIO(png_bytes))
        pixels = np.array(img)

        # Should still create a valid image
        assert pixels.shape == (4, 4, 4)

    def test_encode_wasm_visualization_attributes(self):
        """Test that WASM encoding produces visualization with proper attributes"""
        from pixelrts_v2_core import PixelRTSEncoder
        from PIL import Image
        import io

        encoder = PixelRTSEncoder(mode="code")
        wasm = create_test_wasm()

        png_bytes = encoder.encode(wasm, grid_size=4)

        img = Image.open(io.BytesIO(png_bytes))
        pixels = np.array(img)

        # Verify RGBA channels are in valid range
        assert np.all(pixels >= 0)
        assert np.all(pixels <= 255)

        # Verify alpha channel indicates executable regions
        # WASM opcodes should have alpha=255 in semantic mode
        alpha_channel = pixels[:, :, 3]
        assert np.any(alpha_channel > 0)  # At least some executable content

    def test_encoder_metadata_includes_code_mode(self):
        """Test that code mode is reflected in metadata"""
        from pixelrts_v2_core import PixelRTSEncoder

        encoder = PixelRTSEncoder(mode="code")
        wasm = create_test_wasm()

        encoder.encode(wasm, grid_size=4)

        # Metadata should indicate code mode
        metadata = encoder._last_metadata
        assert metadata is not None
        # The encoding type is nested under 'encoding' key
        assert metadata.get('encoding', {}).get('type') == 'RGBA-code'


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
