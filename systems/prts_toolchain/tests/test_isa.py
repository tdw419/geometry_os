import unittest
from prts_toolchain.isa import Opcodes, Registers, MNEMONICS

class TestISA(unittest.TestCase):

    def test_opcodes(self):
        """Test that key opcodes have the correct integer values."""
        self.assertEqual(Opcodes.NOP, 0x00)
        self.assertEqual(Opcodes.MOV, 0x01)
        self.assertEqual(Opcodes.ADD, 0x33)
        self.assertEqual(Opcodes.HALT, 0x07)
        self.assertEqual(Opcodes.NATIVE_EXEC, 0xF0)

    def test_registers(self):
        """Test that key registers have the correct integer values."""
        self.assertEqual(Registers.R0, 0)
        self.assertEqual(Registers.R31, 31)
        self.assertEqual(Registers.PC, 31)
        self.assertEqual(Registers.SP, 30)
        
    def test_mnemonics(self):
        """Test the reverse mapping from opcode value to mnemonic string."""
        self.assertEqual(MNEMONICS[0x01], "MOV")
        self.assertEqual(MNEMONICS[0x33], "ADD")
        self.assertEqual(MNEMONICS[0x07], "HALT")

if __name__ == '__main__':
    unittest.main()
