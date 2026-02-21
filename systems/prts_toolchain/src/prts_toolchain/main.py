"""
Main CLI for PixelRTS v3 Toolchain (`prts`).
"""

import sys
from pathlib import Path
from PIL import Image
from .assembler import assemble
from .disassembler import disassemble
from .vm import GVM

def main():
    if len(sys.argv) < 2:
        print("Usage: prts <command> [args]")
        print("Commands: compile, run, disasm")
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "compile":
        if len(sys.argv) < 3:
            print("Usage: prts compile <source.pasm> [output.rts.png]")
            sys.exit(1)
        src_path = sys.argv[2]
        out_path = sys.argv[3] if len(sys.argv) > 3 else src_path.replace(".pasm", ".rts.png")
        
        with open(src_path, "r") as f:
            code = f.read()
        
        img = assemble(code)
        img.save(out_path)
        print(f"Compiled {src_path} -> {out_path}")

    elif cmd == "run":
        if len(sys.argv) < 3:
            print("Usage: prts run <image.rts.png>")
            sys.exit(1)
        img_path = sys.argv[2]
        img = Image.open(img_path)
        vm = GVM()
        vm.load_instructions_from_image(img)
        vm.run()
        print("Execution complete.")
        for i in range(32):
            if vm.regs[i] != 0:
                print(f"r{i}: {vm.regs[i]}")

    elif cmd == "disasm":
        if len(sys.argv) < 3:
            print("Usage: prts disasm <image.rts.png>")
            sys.exit(1)
        img_path = sys.argv[2]
        img = Image.open(img_path)
        code = disassemble(img)
        print(code)

    else:
        print(f"Unknown command: {cmd}")
        sys.exit(1)

if __name__ == "__main__":
    main()
