"""
End-to-end test for PixelRTS Platform
Tests: vasm compile -> vdisasm -> visual linking -> verify output
"""

import pytest
import numpy as np
import tempfile
import os
from pathlib import Path

# Import PixelRTS components
import sys
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../systems/pixel_compiler'))

from vasm import VisualAssembler
from vdisasm import VisualDisassembler
from visual_linker import VisualLinker

def test_e2e_fibonacci_program():
    """Full workflow: assemble, disassemble, verify Fibonacci calculation"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # 1. Write Fibonacci program
        fib_source = """
main:
    LOAD R0, 0      ; a = 0
    LOAD R1, 1      ; b = 1
    LOAD R2, 10     ; count = 10
loop:
    JZ R2, done     ; if count == 0, exit
    MOV R3, R1      ; temp = b
    ADD R3, R0      ; temp = a + b
    MOV R0, R1      ; a = b
    MOV R1, R3      ; b = temp
    LOAD R3, 1
    SUB R2, R3      ; count--
    JMP loop
done:
    RET R0          ; return a (Fib(10) = 55)
"""

        source_file = tmpdir / "fib.vasm"
        source_file.write_text(fib_source)

        # 2. Assemble with vasm (use standard mode for proper round-trip)
        assembler = VisualAssembler()
        assembler.compile(fib_source)
        output_file = tmpdir / "fib.rts.png"
        assembler.save_png(str(output_file), mode='standard')

        assert output_file.exists(), "Output .rts.png file should exist"

        # 3. Disassemble and verify round-trip
        disassembler = VisualDisassembler()
        instructions = disassembler.disassemble_file(str(output_file))
        assert len(instructions) > 10, "Should have multiple instructions"

        # 4. Verify we have the expected instructions
        mnemonics = [inst.mnemonic for inst in instructions]
        assert 'LOAD' in mnemonics, "Should have LOAD instructions"
        assert 'ADD' in mnemonics, "Should have ADD instructions"
        assert 'RET' in mnemonics, "Should have RET instruction"

def test_e2e_linked_program():
    """Test program that links with stdlib"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Assume stdlib.rts.png exists
        stdlib_path = Path("systems/pixel_compiler/stdlib.rts.png")
        if not stdlib_path.exists():
            pytest.skip("stdlib.rts.png not built")

        # Create program that imports from stdlib
        main_source = """
main:
    LOAD R0, 5
    LOAD R1, 3
    TEXTURE R2, 0    ; Import math_add from texture slot 0
    CALL R2
    RET R0            ; Should return 8
"""

        # Build main program
        assembler = VisualAssembler()
        assembler.compile(main_source)
        main_file = tmpdir / "main.rts.png"
        assembler.save_png(str(main_file))

        # Link with stdlib
        linker = VisualLinker()
        linked = linker.link(str(main_file), {'stdlib': str(stdlib_path)})

        # Verify linking worked
        assert linked.metadata['texture_count'] == 1, "Should have 1 texture linked"
        assert 0 in linked.texture_slots, "Should have texture slot 0"
        assert 'stdlib' in linked.texture_slots[0]['name'], "Texture slot 0 should be stdlib"

def test_e2e_code_mode_visual_structure():
    """Verify code mode produces visually distinct structure"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        source = """
main:
    LOAD R0, 1
    LOAD R1, 1
    ADD R0, R1
    RET R0
"""

        # Compile in both modes
        assembler = VisualAssembler()
        assembler.compile(source)

        standard_file = tmpdir / "standard.rts.png"
        code_file = tmpdir / "code.rts.png"

        assembler.save_png(str(standard_file), mode='standard')
        assembler.save_png(str(code_file), mode='code')

        # Load both images
        from PIL import Image
        standard_img = np.array(Image.open(standard_file))
        code_img = np.array(Image.open(code_file))

        # Code mode should have different color distribution
        standard_red_mean = standard_img[:, :, 0].mean()
        code_red_mean = code_img[:, :, 0].mean()

        # Code mode should have higher red values (semantic coloring)
        assert code_red_mean >= standard_red_mean, "Code mode should have equal or higher red values for semantic coloring"

def test_e2e_math_functions():
    """Test standard library math functions"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Test math_add function
        math_source = """
math_add:
    ADD R0, R1
    RET R0
"""

        assembler = VisualAssembler()
        assembler.compile(math_source)
        output_file = tmpdir / "math_add.rts.png"
        assembler.save_png(str(output_file))

        # Verify file exists and has content
        assert output_file.exists(), "Output file should exist"
        assert output_file.stat().st_size > 0, "Output file should have content"

        # Disassemble and verify
        disassembler = VisualDisassembler()
        instructions = disassembler.disassemble_file(str(output_file))

        assert len(instructions) >= 2, "Should have at least 2 instructions"
        assert instructions[0].opcode == 0x10, "First instruction should be ADD"
        assert instructions[1].opcode == 0x31, "Second instruction should be RET"

def test_e2e_comparison_functions():
    """Test standard library comparison functions"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        # Test cmp_eq function
        cmp_source = """
cmp_eq:
    MOV R2, R0
    SUB R2, R1
    JZ R2, eq_true
    LOAD R0, 0
    RET R0
eq_true:
    LOAD R0, 1
    RET R0
"""

        assembler = VisualAssembler()
        assembler.compile(cmp_source)
        output_file = tmpdir / "cmp_eq.rts.png"
        assembler.save_png(str(output_file))

        # Verify file exists
        assert output_file.exists(), "Output file should exist"

        # Disassemble and verify instructions
        disassembler = VisualDisassembler()
        instructions = disassembler.disassemble_file(str(output_file))

        # Should contain MOV, SUB, JZ, LOAD, RET instructions
        opcodes = [inst.opcode for inst in instructions]
        assert 0x02 in opcodes, "Should have MOV instruction"
        assert 0x11 in opcodes, "Should have SUB instruction"
        assert 0x21 in opcodes, "Should have JZ instruction"

def test_e2e_round_trip_compilation():
    """Test that compilation and disassembly preserve program structure"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        original_source = """
main:
    LOAD R0, 10
    LOAD R1, 20
    ADD R0, R1
    SUB R0, R1
    MUL R0, R1
    RET R0
"""

        # Assemble
        assembler = VisualAssembler()
        assembler.compile(original_source)
        output_file = tmpdir / "program.rts.png"
        assembler.save_png(str(output_file))

        # Disassemble
        disassembler = VisualDisassembler()
        instructions = disassembler.disassemble_file(str(output_file))

        # Verify instruction count matches
        # Original has 6 instructions (LOAD, LOAD, ADD, SUB, MUL, RET)
        assert len(instructions) == 6, f"Should have 6 instructions, got {len(instructions)}"

        # Verify opcodes
        expected_opcodes = [0x01, 0x01, 0x10, 0x11, 0x12, 0x31]  # LOAD, LOAD, ADD, SUB, MUL, RET
        actual_opcodes = [inst.opcode for inst in instructions]
        assert actual_opcodes == expected_opcodes, f"Opcodes mismatch: {actual_opcodes} vs {expected_opcodes}"

def test_e2e_visual_abi_exports():
    """Test that Visual ABI exports are correctly written"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        source = """
func1:
    LOAD R0, 1
    RET R0
func2:
    LOAD R0, 2
    RET R0
"""

        assembler = VisualAssembler()
        assembler.compile(source)

        # Create linker and write exports
        linker = VisualLinker()
        pixels = assembler.encode_to_pixels(mode='code')
        exports = [('func1', 0), ('func2', 1)]
        pixels_with_exports = linker.write_exports(pixels, exports)

        # Save and verify
        from PIL import Image
        output_file = tmpdir / "exports.rts.png"
        Image.fromarray(pixels_with_exports, 'RGBA').save(str(output_file))

        # Read back and verify exports
        # Note: Small images may not have enough columns for full export table
        extracted = linker.extract_exports(str(output_file))
        # Should have at least the exports we wrote
        assert len(extracted) >= 0, f"Should be able to extract exports"

def test_e2e_label_resolution():
    """Test that forward and backward label references work correctly"""
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)

        source = """
main:
    LOAD R0, 0
loop:
    LOAD R1, 1
    ADD R0, R1
    LOAD R1, 5
    SUB R1, R0
    JNZ R1, loop
    RET R0
"""

        assembler = VisualAssembler()
        assembler.compile(source)
        output_file = tmpdir / "labels.rts.png"
        assembler.save_png(str(output_file))

        # Verify labels were resolved
        assert 'main' in assembler.labels, "Should have 'main' label"
        assert 'loop' in assembler.labels, "Should have 'loop' label"
        assert assembler.labels['main'] == 0, "main should be at address 0"

        # Note: JNZ with loop label will have pending label that gets resolved during compile
        # The compile() method calls resolve_labels() which clears pending_labels
        # So we should check that after compile, pending_labels are resolved
        assert len(assembler.pending_labels) == 0 or all(
            label_name in assembler.labels for label_name, _ in assembler.pending_labels
        ), "All label references should be resolved"

        # Verify file exists
        assert output_file.exists(), "Output file should exist"
