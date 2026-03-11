"""
Tests for Glyph Primitives in GeoASM

Task 9 from STATE_V4.md: Native Glyph Shell Glyph Primitives

Tests the "Screen is the Hard Drive" architecture glyph primitives:
- GLYPH_DEFINE: Register glyph bitmap
- GLYPH_BLIT: Render glyph to framebuffer
- GLYPH_TRANSFORM: Apply rotation/scale matrix
- GLYPH_COMPOSITE: Layer multiple glyphs
- GLYPH_CACHE_EVICT: LRU cache eviction
- ORB: File visualization primitive
- PANEL: Glass panel primitive
- HEATMAP_CELL: Heatmap visualization
"""

import sys
from pathlib import Path

import pytest

# Add geoasm-cli to path
sys.path.insert(0, str(Path(__file__).parent.parent / "geoasm-cli"))

from geoasm_lib import (
    OPCODE_NAMES,
    OPCODES,
    GeoASMAssembler,
    GeoASMVM,
)


class TestGlyphOpcodesDefined:
    """Tests for opcode definitions"""

    def test_glyph_define_opcode_exists(self):
        """GLYPH_DEFINE should be opcode 0xC5"""
        assert 0xC5 in OPCODES
        assert OPCODES[0xC5][0] == "GLYPH_DEFINE"
        assert OPCODES[0xC5][1] == 4  # 4 operands

    def test_glyph_blit_opcode_exists(self):
        """GLYPH_BLIT should be opcode 0xC6"""
        assert 0xC6 in OPCODES
        assert OPCODES[0xC6][0] == "GLYPH_BLIT"
        assert OPCODES[0xC6][1] == 3

    def test_glyph_transform_opcode_exists(self):
        """GLYPH_TRANSFORM should be opcode 0xC7"""
        assert 0xC7 in OPCODES
        assert OPCODES[0xC7][0] == "GLYPH_TRANSFORM"
        assert OPCODES[0xC7][1] == 2

    def test_glyph_composite_opcode_exists(self):
        """GLYPH_COMPOSITE should be opcode 0xC8"""
        assert 0xC8 in OPCODES
        assert OPCODES[0xC8][0] == "GLYPH_COMPOSITE"
        assert OPCODES[0xC8][1] == 2

    def test_glyph_cache_evict_opcode_exists(self):
        """GLYPH_CACHE_EVICT should be opcode 0xC9"""
        assert 0xC9 in OPCODES
        assert OPCODES[0xC9][0] == "GLYPH_CACHE_EVICT"
        assert OPCODES[0xC9][1] == 1

    def test_orb_opcode_exists(self):
        """ORB should be opcode 0xCA"""
        assert 0xCA in OPCODES
        assert OPCODES[0xCA][0] == "ORB"
        assert OPCODES[0xCA][1] == 4

    def test_panel_opcode_exists(self):
        """PANEL should be opcode 0xCB"""
        assert 0xCB in OPCODES
        assert OPCODES[0xCB][0] == "PANEL"
        assert OPCODES[0xCB][1] == 5

    def test_heatmap_cell_opcode_exists(self):
        """HEATMAP_CELL should be opcode 0xCE"""
        assert 0xCE in OPCODES
        assert OPCODES[0xCE][0] == "HEATMAP_CELL"
        assert OPCODES[0xCE][1] == 3

    def test_opcode_names_reverse_lookup(self):
        """All glyph opcodes should have reverse lookup"""
        assert "GLYPH_DEFINE" in OPCODE_NAMES
        assert "GLYPH_BLIT" in OPCODE_NAMES
        assert "GLYPH_TRANSFORM" in OPCODE_NAMES
        assert "GLYPH_COMPOSITE" in OPCODE_NAMES
        assert "GLYPH_CACHE_EVICT" in OPCODE_NAMES
        assert "ORB" in OPCODE_NAMES
        assert "PANEL" in OPCODE_NAMES
        assert "HEATMAP_CELL" in OPCODE_NAMES


class TestGlyphDefineExecution:
    """Tests for GLYPH_DEFINE execution"""

    def test_glyph_define_registers_glyph(self):
        """GLYPH_DEFINE should register a glyph in the VM"""
        assembler = GeoASMAssembler()
        # GLYPH_DEFINE with 3 operands: id, width, height_data_high
        # height is lower 4 bits, data_ptr high nibble in third operand
        program = assembler.assemble("""
            MOVI R0, 0x00  ; data_ptr low byte
            GLYPH_DEFINE 1, 8, 0x81
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert 1 in vm.glyphs
        assert vm.glyphs[1][0] == 8  # width

    def test_glyph_define_multiple_glyphs(self):
        """Should be able to define multiple glyphs"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            GLYPH_DEFINE 1, 8, 0x81
            GLYPH_DEFINE 2, 16, 0x02
            GLYPH_DEFINE 3, 4, 0x03
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.glyphs) == 3
        assert 1 in vm.glyphs
        assert 2 in vm.glyphs
        assert 3 in vm.glyphs


class TestGlyphBlitExecution:
    """Tests for GLYPH_BLIT execution"""

    def test_glyph_blit_renders_glyph(self):
        """GLYPH_BLIT should render a glyph at specified position"""
        assembler = GeoASMAssembler()
        # GLYPH_BLIT: glyph_id in dst, x in src1 (register), y in src2
        program = assembler.assemble("""
            MOVI R0, 100   ; x = 100
            GLYPH_DEFINE 1, 8, 0x81
            GLYPH_BLIT 1, R0, 200
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.glyph_blits) == 1
        assert vm.glyph_blits[0][0] == 1  # glyph_id
        assert vm.glyph_blits[0][2] == 200  # y

    def test_glyph_blit_multiple_positions(self):
        """Should be able to blit same glyph at multiple positions"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            GLYPH_DEFINE 1, 8, 0x81
            MOVI R0, 0
            GLYPH_BLIT 1, R0, 0
            MOVI R0, 8
            GLYPH_BLIT 1, R0, 0
            MOVI R0, 16
            GLYPH_BLIT 1, R0, 0
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.glyph_blits) == 3


class TestGlyphCacheEviction:
    """Tests for GLYPH_CACHE_EVICT execution"""

    def test_cache_evict_removes_oldest(self):
        """GLYPH_CACHE_EVICT should remove oldest glyphs (LRU)"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            GLYPH_DEFINE 1, 8, 8, 0x100
            GLYPH_DEFINE 2, 8, 8, 0x200
            GLYPH_DEFINE 3, 8, 8, 0x300
            GLYPH_CACHE_EVICT 1
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        # First defined glyph (1) should be evicted
        assert 1 not in vm.glyphs
        assert 2 in vm.glyphs
        assert 3 in vm.glyphs

    def test_cache_evict_multiple(self):
        """Should be able to evict multiple glyphs"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            GLYPH_DEFINE 1, 8, 8, 0x100
            GLYPH_DEFINE 2, 8, 8, 0x200
            GLYPH_DEFINE 3, 8, 8, 0x300
            GLYPH_CACHE_EVICT 2
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        # First two should be evicted
        assert 1 not in vm.glyphs
        assert 2 not in vm.glyphs
        assert 3 in vm.glyphs


class TestOrbExecution:
    """Tests for ORB (file visualization) execution"""

    def test_orb_creates_visualization(self):
        """ORB should create a file visualization orb"""
        assembler = GeoASMAssembler()
        # ORB: x in dst register, y in src1 register, radius in src2
        program = assembler.assemble("""
            SET_COLOR 255, 128, 64
            MOVI R0, 100
            MOVI R1, 100
            ORB R0, R1, 10, 0
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.orbs) == 1
        x, y, radius, r, g, b, a = vm.orbs[0]
        assert x == 100
        assert y == 100
        assert radius == 10
        assert r == 255
        assert g == 128
        assert b == 64

    def test_orb_multiple_files(self):
        """Should be able to visualize multiple files as orbs"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            SET_COLOR 100, 100, 200
            MOVI R0, 50
            MOVI R1, 50
            ORB R0, R1, 5, 0
            MOVI R0, 60
            MOVI R1, 60
            ORB R0, R1, 8, 0
            MOVI R0, 70
            MOVI R1, 70
            ORB R0, R1, 3, 0
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.orbs) == 3


class TestPanelExecution:
    """Tests for PANEL (glass panel) execution"""

    def test_panel_creates_glass_panel(self):
        """PANEL should create a glass panel"""
        assembler = GeoASMAssembler()
        # PANEL: x in dst register, y in src1 register, w in src2 (8-bit)
        # Note: h is computed as w * 0.75 for default aspect ratio
        program = assembler.assemble("""
            SET_COLOR 64, 64, 64
            MOVI R0, 100
            MOVI R1, 100
            PANEL R0, R1, 200
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.panels) == 1
        x, y, w, h, r, g, b, a = vm.panels[0]
        assert x == 100
        assert y == 100
        assert w == 200

    def test_panel_multiple_windows(self):
        """Should be able to create multiple panels"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            SET_COLOR 64, 64, 64
            MOVI R0, 100
            MOVI R1, 100
            PANEL R0, R1, 0xC896
            MOVI R0, 150
            MOVI R1, 150
            PANEL R0, R1, 0xB478  ; 180 x 120
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.panels) == 2


class TestHeatmapExecution:
    """Tests for HEATMAP_CELL execution"""

    def test_heatmap_cell_creates_cell(self):
        """HEATMAP_CELL should create a heatmap cell"""
        assembler = GeoASMAssembler()
        # HEATMAP_CELL: x in dst register, y in src1 register, value in src2
        program = assembler.assemble("""
            MOVI R0, 10
            MOVI R1, 10
            HEATMAP_CELL R0, R1, 128
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.heatmap_cells) == 1
        x, y, value, r, g, b = vm.heatmap_cells[0]
        assert x == 10
        assert y == 10
        # value should be normalized
        assert 0.0 <= value <= 1.0

    def test_heatmap_color_mapping(self):
        """Heatmap should map values to colors correctly"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            MOVI R0, 0
            MOVI R1, 0
            HEATMAP_CELL R0, R1, 0
            MOVI R0, 1
            HEATMAP_CELL R0, R1, 128
            MOVI R0, 2
            HEATMAP_CELL R0, R1, 255
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.heatmap_cells) == 3

        # Low value = blue (high blue, low red)
        # Tuple is (x, y, value, r, g, b)
        low = vm.heatmap_cells[0]
        assert low[5] > low[3]  # Blue > Red for low value

        # High value = red (high red, low blue)
        high = vm.heatmap_cells[2]
        assert high[3] > high[5]  # Red > Blue for high value


class TestGlyphDSL:
    """Tests for Python glyph DSL transpilation"""

    def test_glyph_dsl_simple(self):
        """Simple glyph DSL should transpile to GLYPH_DEFINE"""
        # This would be implemented in geoscript_transpiler.py
        # For now, we test the assembly output
        assembler = GeoASMAssembler()

        # Simulate transpiled output from glyph("A", [[1,0,1],[0,1,0],[1,0,1]])
        program = assembler.assemble("""
            ; Glyph "A" - 3x3 bitmap
            GLYPH_DEFINE 65, 3, 3, 0x100
            ; Bitmap data at 0x100: 1,0,1,0,1,0,1,0,1
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert 65 in vm.glyphs  # ASCII 'A'

    def test_glyph_blit_chain(self):
        """Should be able to blit a chain of glyphs for text"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            ; Define glyphs for 'HI'
            GLYPH_DEFINE 72, 5, 0x07  ; H
            GLYPH_DEFINE 73, 5, 0x07  ; I

            ; Blit "HI" at position 100, 100
            MOVI R0, 100
            GLYPH_BLIT 72, R0, 100
            MOVI R0, 106
            GLYPH_BLIT 73, R0, 100
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        assert len(vm.glyph_blits) == 2
        assert vm.glyph_blits[0][0] == 72  # glyph_id for 'H'
        assert vm.glyph_blits[1][0] == 73  # glyph_id for 'I'


class TestGlyphComposition:
    """Tests for GLYPH_COMPOSITE execution"""

    def test_glyph_composite_layers_glyphs(self):
        """GLYPH_COMPOSITE should layer multiple glyphs"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            GLYPH_DEFINE 1, 8, 8, 0x100
            GLYPH_DEFINE 2, 8, 8, 0x200
            GLYPH_COMPOSITE 3, 2, 0x00
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        # Composite glyph 3 should be created
        assert 3 in vm.glyphs


class TestGlyphTransform:
    """Tests for GLYPH_TRANSFORM execution"""

    def test_glyph_transform_applies_matrix(self):
        """GLYPH_TRANSFORM should apply transformation matrix"""
        assembler = GeoASMAssembler()
        program = assembler.assemble("""
            GLYPH_DEFINE 1, 8, 8, 0x100
            GLYPH_TRANSFORM 1, 0x00
            HALT
        """)

        vm = GeoASMVM(program)
        vm.run()

        # Glyph should be marked as transformed (high bit set)
        assert 1 in vm.glyphs


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
