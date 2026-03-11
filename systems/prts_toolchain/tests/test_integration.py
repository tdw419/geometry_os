import os
import subprocess
import unittest
from pathlib import Path

import pytest

# Skip all tests in this module if prts_toolchain is not available
try:
    import prts_toolchain
    PRTS_AVAILABLE = True
except ImportError:
    PRTS_AVAILABLE = False

    SubprocessMock = None

pytestmark = pytest.mark.skipif(not PRTS_AVAILABLE, reason="prts_toolchain module not available")


class TestIntegration(unittest.TestCase):
    """Integration tests for prts_toolchain CLI."""

    def setUp(self):
        self.src_file = "test_cli.pasm"
        self.img_file = "test_cli.rts.png"
        with open(self.src_file, "w") as f:
            f.write("LDI r1, 42\nHALT")

    def tearDown(self):
        for f in [self.src_file, self.img_file]:
            if os.path.exists(f):
                os.remove(f)

    def test_cli_compile_exists(self):
        """Test that the compile command can be executed."""
        # This test just verifies the CLI module exists
        result = subprocess.run(
            ["python3", "-m", "prts_toolchain.main", "--help"],
            capture_output=True, text=True
        )
        self.assertEqual(result.returncode, 0)

    def test_cli_run_exists(self):
        """Test that the run command can be executed."""
        result = subprocess.run(
            ["python3", "-m", "prts_toolchain.main", "run", "--help"],
            capture_output=True, text=True
        )
        self.assertEqual(result.returncode, 0)

    def test_cli_disasm_exists(self):
        """Test that the disasm command can be executed."""
        result = subprocess.run(
            ["python3", "-m", "prts_toolchain.main", "disasm", "--help"],
            capture_output=True, text=True
        )
        self.assertEqual(result.returncode, 0)


if __name__ == '__main__':
    unittest.main()
