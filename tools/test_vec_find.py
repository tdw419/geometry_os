#!/usr/bin/env python3
"""Test VEC_FIND opcode with the vectorized project embedding table."""
import struct
import socket
import sys
import json
import time
from pathlib import Path

SOCKET_PATH = "/tmp/geo_cmd.sock"
GEOS_PROJECT = Path.home() / "projects/zion/projects/geometry_os/geometry_os"
EMBED_TABLE = Path("/tmp/test_vector_palace2/project_palace_latest.png.embed_table")


def send_geo_cmd(cmd: str) -> str:
    """Send a command to GeOS via Unix socket."""
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    sock.settimeout(30)
    try:
        sock.connect(SOCKET_PATH)
        sock.sendall(cmd.encode() + b"\n")
        sock.shutdown(socket.SHUT_WR)
        response = b""
        while True:
            chunk = sock.recv(4096)
            if not chunk:
                break
            response += chunk
        return response.decode().strip()
    finally:
        sock.close()


def poke_embedding_table(address: int, table_path: Path):
    """Poke the entire embedding table into VM RAM."""
    with open(table_path, "rb") as f:
        data = f.read()
    
    # Read as u32 words (little-endian)
    words = []
    for i in range(0, len(data), 4):
        word = struct.unpack("<I", data[i:i+4])[0]
        words.append(word)
    
    print(f"Poking {len(words)} words at 0x{address:X}...")
    
    # Calculate how many pokes we need (max ~16 per poke_bulk)
    chunk_size = 16
    for start in range(0, len(words), chunk_size):
        chunk = words[start:start + chunk_size]
        addr = address + start
        values = " ".join(f"0x{w:08X}" for w in chunk)
        result = send_geo_cmd(f"poke_bulk 0x{addr:X} {values}")
        print(f"  [0x{addr:X}] {len(chunk)} words -> {result[:60]}")
        time.sleep(0.1)
    
    # Verify by reading back the count
    result = send_geo_cmd(f"peek 0x{address:X}")
    count = int(result, 16) if result else 0
    print(f"Count at 0x{address:X}: {count} (expected {len(words) - 1})")
    return count


def test_vec_find(table_addr: int, query_x: int, query_y: int, 
                  expected_idx: int, label: str):
    """Test VEC_FIND with given query coordinates."""
    # Program: set registers, call VEC_FIND, result in r0,r1,r2
    asm = f"""
; VEC_FIND test: {label}
; table in r3, query x in r4, query y in r5
LDI r3, 0x{table_addr:X}
LDI r4, {query_x}
LDI r5, {query_y}
; VEC_FIND (0x08): r3=table, r4=qx, r5=qy
; Encoding: 5 words [0x08, table_reg, qx_reg, qy_reg]
.word 0x08
.word 3
.word 4
.word 5
; HALT
HALT
"""
    # Write ASM to file
    asm_path = GEOS_PROJECT / "programs" / "test_vec_find.asm"
    with open(asm_path, "w") as f:
        f.write(asm)
    
    # Load, assemble, run
    result = send_geo_cmd(f"load_asm programs/test_vec_find.asm")
    print(f"  Load/assemble: {result[:60]}")
    
    result = send_geo_cmd("run 0 0 20000")
    print(f"  Run: {result[:60]}")
    
    # Read registers
    result = send_geo_cmd("regs")
    print(f"  Regs: {result[:100]}")
    
    # Parse registers from response
    # Format: "r0=123 r1=456 ..." or similar
    regs = {}
    for part in result.split():
        if "=" in part:
            k, v = part.split("=")
            try:
                regs[k] = int(v, 16) if v.startswith("0x") else int(v)
            except ValueError:
                pass
    
    if "r0" in regs:
        actual_idx = regs["r0"]
        actual_ring = regs.get("r1", -1)
        actual_angle = regs.get("r2", -1)
        match = "✓" if actual_idx == expected_idx else "✗"
        print(f"  {match} Got idx={actual_idx} ring={actual_ring} angle={actual_angle} (expected idx={expected_idx})")
    else:
        print(f"  ✗ Could not parse registers from: {result}")


def main():
    print("=== VEC_FIND Integration Test ===\n")
    
    # Step 1: Poke embedding table into VM RAM
    print("Step 1: Loading embedding table...")
    count = poke_embedding_table(0x5000, EMBED_TABLE)
    
    if count == 0:
        print("ERROR: Could not read count from RAM. Is GeOS running?")
        sys.exit(1)
    
    # Step 2: Test VEC_FIND with known fact coordinates
    print(f"\nStep 2: Testing VEC_FIND...")
    
    # Query near entry 0 (x=59276, y=34282) - should find idx=0
    test_vec_find(0x5000, 59000, 34000, 0, "near entry 0")
    
    # Query near middle of the space
    test_vec_find(0x5000, 32768, 32768, 29, "center area")


if __name__ == "__main__":
    main()
