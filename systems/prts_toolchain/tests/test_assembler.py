import unittest
from PIL import Image
from prts_toolchain.assembler import assemble
from prts_toolchain.isa import Opcodes

class TestAssembler(unittest.TestCase):

    def test_simple_program(self):
        """
        Test assembling a simple program that loads two numbers, adds them, and halts.
        """
        code = """
        ; Simple addition program
        LDI r1, 10
        LDI r2, 20
        ADD r3, r1, r2
        HALT
        """
        
        img = assemble(code)
        
        self.assertIsInstance(img, Image.Image)
        self.assertEqual(img.mode, 'RGBA')
        self.assertEqual(img.size, (2, 2))

        pixels = img.load()

        # Hilbert curve for 2x2: (0,0), (0,1), (1,1), (1,0)
        # We will check the pixels in the order they appear on the curve (d-order)

        # d=0: LDI r1, 10 at (0,0)
        p_d0 = pixels[0, 0]
        self.assertEqual(p_d0, (Opcodes.LDI.value, 10, 0, 1))

        # d=1: LDI r2, 20 at (0,1)
        p_d1 = pixels[0, 1]
        self.assertEqual(p_d1, (Opcodes.LDI.value, 20, 0, 2))
        
        # d=2: ADD r3, r1, r2 at (1,1)
        p_d2 = pixels[1, 1]
        self.assertEqual(p_d2, (Opcodes.ADD.value, 1, 2, 3))
        
        # d=3: HALT at (1,0)
        p_d3 = pixels[1, 0]
        self.assertEqual(p_d3, (Opcodes.HALT.value, 0, 0, 0))

    def test_labels(self):
        """
        Test correct handling of labels for jumps.
        """
        code = """
        LDI r1, 5
        JMP loop
        HALT ; Should be skipped
        loop:
        SUB r1, r1, 1
        CMP r1, 0
        BEQ r1, 0, end
        JMP loop
        end:
        HALT
        """
        img = assemble(code)
        self.assertEqual(img.size, (4, 4))
        pixels = img.load()

        p_jmp = pixels[1,0]
        self.assertEqual(p_jmp, (Opcodes.JMP.value, 3, 0, 0))

        p_beq = pixels[0,3]
        self.assertEqual(p_beq, (Opcodes.BEQ.value, 1, 0, 7))

    def test_minimal_two_line(self):
        """
        A very simple test with just two instructions to isolate the bug.
        """
        code = "LDI r1, 10\nHALT"
        img = assemble(code)
        self.assertEqual(img.size, (2,2))
        pixels = img.load()
        # d=0, pos=(0,0)
        self.assertEqual(pixels[0,0], (Opcodes.LDI.value, 10, 0, 1))
        # d=1, pos=(0,1)
        self.assertEqual(pixels[0,1], (Opcodes.HALT.value, 0, 0, 0))

if __name__ == '__main__':
    unittest.main()
