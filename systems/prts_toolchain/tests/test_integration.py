import unittest
import os
import subprocess
from pathlib import Path

class TestIntegration(unittest.TestCase):
    def setUp(self):
        self.src_file = "test_cli.pasm"
        self.img_file = "test_cli.rts.png"
        with open(self.src_file, "w") as f:
            f.write("LDI r1, 42\nHALT")

    def tearDown(self):
        for f in [self.src_file, self.img_file]:
            if os.path.exists(f):
                os.remove(f)

    def test_cli_flow(self):
        # 1. Compile
        env = os.environ.copy()
        # Use src directory relative to this test file
        env["PYTHONPATH"] = str(Path(__file__).parent.parent / "src")

        subprocess.run(["python3", "-m", "prts_toolchain.main", "compile", self.src_file, self.img_file], env=env, check=True)
        self.assertTrue(os.path.exists(self.img_file))

        # 2. Run
        result = subprocess.run(["python3", "-m", "prts_toolchain.main", "run", self.img_file], env=env, capture_output=True, text=True, check=True)
        self.assertIn("r1: 42", result.stdout)

        # 3. Disasm
        result = subprocess.run(["python3", "-m", "prts_toolchain.main", "disasm", self.img_file], env=env, capture_output=True, text=True, check=True)
        self.assertIn("LDI r1, 42", result.stdout)

if __name__ == '__main__':
    unittest.main()
