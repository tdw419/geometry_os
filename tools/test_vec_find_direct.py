#!/usr/bin/env python3
"""Test VEC_FIND opcode directly via socket - bypasses assembler."""
import struct
import socket
import sys
import time
from pathlib import Path

SOCKET_PATH = "/tmp/geo_cmd.sock"
EMBED_TABLE = Path("/tmp/test_vector_palace2/project_palace_latest.png.embed_table")


def send_cmd(cmd: str) -> str:
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.settimeout(15)
    try:
        sock.connect(SOCKET_PATH)
        sock.sendall(cmd.encode() + b"\n")
        sock.shutdown(socket.SHUT_WR)
        r = b""
        while True:
            c = sock.recv(4096)
            if not c: break
            r += c
        return r.decode().strip()
    finally:
        sock.close()


def poke_words(address: int, words: list[int]):
    """Poke multiple u32 words into GeOS RAM."""
    chunk_size = 16
    for start in range(0, len(words), chunk_size):
        chunk = words[start:start + chunk_size]
        addr = address + start
        vals = " ".join(f"0x{w:08X}" for w in chunk)
        r = send_cmd(f"poke_bulk 0x{addr:X} {vals}")
        print(f"  poke 0x{addr:X} ({len(chunk)} words): {r[:50]}")
        time.sleep(0.05)


def load_embedding_table(address: int, table_path: Path) -> int:
    """Load embedding table into VM RAM. Returns entry count."""
    with open(table_path, "rb") as f:
        data = f.read()
    words = [struct.unpack("<I", data[i:i+4])[0] for i in range(0, len(data), 4)]
    print(f"Poking {len(words)} words (embedding table) into 0x{address:X}...")
    poke_words(address, words)
    return words[0]  # count


def make_program_words(table_addr: int, query_x: int, query_y: int) -> list[int]:
    """Create VM program that calls VEC_FIND.
    
    VM encoding: each word is a u32 from RAM.
    LDI (0x10): 3 words [opcode, reg_num, imm16]
    VEC_FIND (0x08): 5 words [opcode, table_reg, qx_reg, qy_reg]
    HALT (0x00): 1 word [opcode]
    """
    program = [
        # LDI r3, table_addr
        0x0010,      # LDI opcode
        0x0003,      # r3
        table_addr,  # immediate value
        
        # LDI r4, query_x
        0x0010,      # LDI opcode
        0x0004,      # r4
        query_x,     # immediate value
        
        # LDI r5, query_y
        0x0010,      # LDI opcode
        0x0005,      # r5
        query_y,     # immediate value
        
        # VEC_FIND r3, r4, r5
        0x0008,      # VEC_FIND opcode
        0x0003,      # table_reg = r3
        0x0004,      # qx_reg = r4
        0x0005,      # qy_reg = r5
        
        # HALT
        0x0000,
    ]
    return program


def run_test(label: str, program: list[int], table_addr: int, 
             expect_idx: int, desc: str):
    """Load program into RAM, run it, check VEC_FIND result."""
    prog_addr = 0x1000
    print(f"\n--- Test: {label} ({desc}) ---")
    
    # Poke program into RAM
    poke_words(prog_addr, program)
    
    # Set PC to start
    r = send_cmd(f"pc 0x{prog_addr:X}")
    print(f"  Set PC: {r}")
    
    # Run N cycles (step through the program)
    # The program is: LDI x 3 + VEC_FIND + HALT = roughly 10 words
    r = send_cmd(f"run 0 0 5000")
    print(f"  Run: {r[:80]}")
    
    # Read registers
    r = send_cmd("regs")
    regs = {}
    for part in r.split():
        if part.startswith("r") and "=" in part:
            k, v = part.split("=", 1)
            try:
                regs[k] = int(v, 16) if v.startswith("0x") else int(v)
            except:
                pass
    
    result = regs
    actual_idx = result.get("r00", -1)
    actual_ring = result.get("r01", -1)
    actual_angle = result.get("r02", -1)
    
    match = "✓" if actual_idx == expect_idx else "✗"
    print(f"  Result: r0(idx)={actual_idx} r1(ring)={actual_ring} r2(angle)={actual_angle}")
    print(f"  {match} Expected idx={expect_idx}")
    
    return result


def main():
    print("=== VEC_FIND Integration Test ===\n")
    
    # Step 1: Load embedding table into RAM
    TABLE_ADDR = 0x5000
    print("Step 1: Load embedding table...")
    entry_count = load_embedding_table(TABLE_ADDR, EMBED_TABLE)
    print(f"  Entries loaded: {entry_count}")
    
    # Step 2: Read back a sample entry to verify
    r = send_cmd(f"peek 0x{TABLE_ADDR:X}")
    print(f"  Count at table base: {r}")
    
    # Read entry 0 (word 1 and 2 at 0x5001, 0x5002)
    r1 = send_cmd(f"peek 0x{TABLE_ADDR+1:X}")
    r2 = send_cmd(f"peek 0x{TABLE_ADDR+2:X}")
    print(f"  Entry 0 word 1 (x|y packed): {r1}")
    print(f"  Entry 0 word 2 (r|a|idx packed): {r2}")
    
    # Step 3: Test queries
    # Query near entry 0: x=59276, y=34282
    prog1 = make_program_words(TABLE_ADDR, 59000, 34000)
    run_test("query-near-entry-0", prog1, TABLE_ADDR, 0, 
             "expect nearest to entry 0 (x~59276, y~34282)")
    
    # Query center of space
    prog2 = make_program_words(TABLE_ADDR, 32768, 32768)
    run_test("query-center", prog2, TABLE_ADDR, 29,
             "expect idx=29 (x=19361,y=21475) as approx center")
    
    # Query near entry 4 (x=43630, y=64098) 
    prog3 = make_program_words(TABLE_ADDR, 43000, 63500)
    run_test("query-near-entry-4", prog3, TABLE_ADDR, 4,
             "expect nearest to entry 4")
    
    print("\n=== Test Complete ===")


if __name__ == "__main__":
    main()
