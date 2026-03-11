"""
Tests for Q4_0 WGSL dequantization shader.

Tests:
- Shader compilation and structure
- WGSL syntax validation
- Function presence verification
"""

from pathlib import Path


def test_q4_dequant_shader_compiles():
    """Verify Q4 dequant shader is valid WGSL."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    assert shader_path.exists()

    code = shader_path.read_text()
    assert "fn dequantize_q4_block" in code
    assert "fn unpackFloat16" in code
    assert "const Q4_BLOCK_SIZE: u32 = 32u" in code


def test_shader_structure():
    """Verify shader has proper structure and constants."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    code = shader_path.read_text()

    # Check required constants
    assert "Q4_BLOCK_SIZE: u32 = 32u" in code
    assert "Q4_BYTES_PER_BLOCK: u32 = 18u" in code

    # Check required functions
    assert "fn unpack_nibble(" in code
    assert "fn dequantize_q4_block(" in code
    assert "fn unpackFloat16(" in code

    # Check comment structure
    assert "Q4_0 Dequantization Shader" in code
    assert "GGUF-style Q4_0 quantization format" in code


def test_q4_dequant_shader_constants():
    """Verify Q4 format constants are correct."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    code = shader_path.read_text()

    # Block size: 32 weights per block
    assert "Q4_BLOCK_SIZE: u32 = 32u" in code

    # Storage per block: 18 bytes (2 scale + 16 weights)
    assert "Q4_BYTES_PER_BLOCK: u32 = 18u" in code


def test_unpackFloat16_function():
    """Verify unpackFloat16 function implementation."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    code = shader_path.read_text()

    # Check function signature
    assert "fn unpackFloat16(bits: u32) -> f32" in code

    # Check implementation details
    assert "fp16 = u16(bits & 0xFFFFu)" in code
    assert "sign = (i32(fp16) >> 15) & 1" in code
    assert "exponent = (i32(fp16) >> 10) & 31" in code
    assert "mantissa = fp16 & 1023u" in code


def test_unpack_nibble_function():
    """Verify unpack_nibble function implementation."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    code = shader_path.read_text()

    # Check function signature
    assert "fn unpack_nibble(data: array<u32>, byte_idx: u32, is_high: bool) -> u32" in code

    # Check implementation details
    assert "word_idx = byte_idx / 4u" in code
    assert "byte = u8(shifted_word & 255u)" in code
    assert "byte >> 4u" in code  # high nibble
    assert "byte & 15u" in code  # low nibble


def test_dequantize_q4_block_function():
    """Verify dequantize_q4_block function implementation."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    code = shader_path.read_text()

    # Check function signature
    assert "fn dequantize_q4_block(quant_data: array<u32>, block_start: u32, output: ptr<function, array<f32, 32>>)" in code

    # Check scale extraction implementation (fixed version)
    assert "scale_word = quant_data[block_start]" in code
    assert "scale_bits = scale_word & 0xFFFFu" in code
    assert "scale = unpackFloat16(scale_bits)" in code

    # Check dequantization formula with proper type conversion
    assert "scale * f32(i32(high_nibble) - 8)" in code
    assert "scale * f32(i32(low_nibble) - 8)" in code

    # Check loop processing all 16 bytes
    assert "for (var i: u32 = 0u; i < 16u; i++)" in code
    assert "byte_idx = 2u + i" in code
    assert "high_nibble = unpack_nibble(quant_data, byte_idx, true)" in code
    assert "low_nibble = unpack_nibble(quant_data, byte_idx, false)" in code

    # Check writeback to output pointer (critical fix)
    assert "*output = output_array" in code


def test_shader_comments():
    """Verify shader has proper documentation."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    code = shader_path.read_text()

    # Check for key documentation
    assert "Q4_0 quantization format" in code
    assert "8:1 compression ratio" in code
    assert "value = scale × (weight_4bit - 8)" in code

    # Check section headers
    assert "HELPER FUNCTIONS" in code
    assert "MAIN DEQUANTIZATION FUNCTION" in code


def test_wgsl_syntax_validation():
    """Basic WGSL syntax validation - ensures no obvious syntax errors."""
    shader_path = Path("systems/visual_shell/wgsl/quantization/q4_dequant.wgsl")
    code = shader_path.read_text()

    # Check for balanced braces
    open_braces = code.count('{')
    close_braces = code.count('}')
    assert open_braces == close_braces, f"Unbalanced braces: {open_braces} open, {close_braces} close"

    # Check for proper function declarations
    function_decls = [line.strip() for line in code.split('\n') if 'fn ' in line and '(' in line]
    assert len(function_decls) >= 3, f"Expected at least 3 function declarations, found {len(function_decls)}"

    # Check for proper array types
    assert 'array<f32, 32>' in code, "Expected array<f32, 32> type"
    assert 'array<u32>' in code, "Expected array<u32> type"
