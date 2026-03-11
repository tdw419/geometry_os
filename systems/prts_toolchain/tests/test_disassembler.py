import unittest

import pytest

# Skip all tests in this module if prts_toolchain is not available
try:
    import prts_toolchain
    PRTS_AVAILABLE = True
except ImportError:
    PRTS_AVAILABLE = False

pytestmark = pytest.mark.skipif(not PRTS_AVAILABLE, reason="prts_toolchain module not available")

if PRTS_AVAILABLE:
    from PIL import Image
    from prts_toolchain.assembler import assemble
    from prts_toolchain.disassembler import disassemble


class TestDisassembler(unittest.TestCase):
    def test_roundtrip(self):
        """
        Test that assembling and then disassembling returns the same functional code.
        """
        original_code = "LDI r1, 10\nLDI r2, 20\nADD r3, r1, r2\nHALT"
        img = assemble(original_code)
        disassembled_code = disassemble(img)

        # Normalize whitespace for comparison
        self.assertEqual(disassembled_code.strip(), original_code.strip())

    def test_empty_image(self):
        """
        Test disassembling an all-black image.
        """
        img = Image.new('RGBA', (2, 2), (0, 0, 0, 0))
        disassembled_code = disassemble(img)
        self.assertEqual(disassembled_code, "")

if __name__ == '__main__':
    unittest.main()
