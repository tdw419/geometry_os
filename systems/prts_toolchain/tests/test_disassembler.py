import unittest
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
