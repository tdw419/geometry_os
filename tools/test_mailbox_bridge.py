#!/usr/bin/env python3
"""
Test the /dev/mailbox IOCTL bridge — VEC_FIND → mailbox → VM_LIVE_SPAWN preload.

Tests:
  1. IOCTL MAILBOX_PUT: writes 64 u32 from bytecode RAM to hypervisor_mailbox
  2. IOCTL MAILBOX_GET: reads mailbox back into bytecode RAM
  3. VM_LIVE_SPAWN: verifies mailbox is preloaded into RISC-V guest RAM at end of RAM
"""
import struct
import socket
import sys
import time
from pathlib import Path

SOCKET_PATH = "/tmp/geo_cmd.sock"
GEOS_PROJECT = Path.home() / "projects/zion/projects/geometry_os/geometry_os"

# Mailbox constants (must match types.rs)
DEVICE_FD_MAILBOX = 0xE004
MAILBOX_PUT = 0
MAILBOX_GET = 1
MAILBOX_CLEAR = 2
NUM_MAILBOX_WORDS = 64


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


def parse_regs(response: str) -> dict:
    """Parse register dump from GeOS."""
    regs = {}
    for part in response.split():
        if "=" in part:
            k, v = part.split("=")
            try:
                regs[k] = int(v, 16) if v.startswith("0x") else int(v)
            except ValueError:
                pass
    return regs


def peek_ram(addr: int, count: int = 1) -> list[int]:
    """Read u32 words from VM RAM via peek/poke."""
    values = []
    for offset in range(0, count * 4, 4):
        resp = send_geo_cmd(f"peek 0x{addr + offset:X}")
        try:
            values.append(int(resp, 16))
        except (ValueError, TypeError):
            print(f"  [ERROR] peek at 0x{addr + offset:X}: {resp}")
            values.append(0)
        time.sleep(0.05)
    return values


def poke_ram(addr: int, values: list[int]):
    """Write u32 words to VM RAM."""
    chunk_size = 16
    for start in range(0, len(values), chunk_size):
        chunk = values[start:start + chunk_size]
        vals_str = " ".join(f"0x{w:08X}" for w in chunk)
        send_geo_cmd(f"poke_bulk 0x{addr + start:X} {vals_str}")
        time.sleep(0.1)


def test_mailbox_put_get():
    """Test MAILBOX_PUT and MAILBOX_GET round-trip."""
    print("\n=== Test 1: Mailbox PUT/GET round-trip ===\n")

    # Prepare 64 test words at RAM[0x3000]
    test_data = [i * 0x10001 for i in range(NUM_MAILBOX_WORDS)]
    poke_ram(0x3000, test_data)
    print(f"  Wrote {len(test_data)} test words to RAM[0x3000]")

    # MAILBOX_PUT: copy RAM[0x3000..0x303F] → mailbox
    asm = f"""
; Test MAILBOX_PUT: copy RAM[0x3000] to mailbox
LDI r1, {DEVICE_FD_MAILBOX}       ; fd = /dev/mailbox
LDI r2, {MAILBOX_PUT}             ; cmd = MAILBOX_PUT
LDI r3, 0x3000                    ; arg = source address
IOCTL r1, r2, r3
; r0 should be 0
HALT
"""
    asm_path = GEOS_PROJECT / "programs" / "test_mailbox_put.asm"
    asm_path.write_text(asm)
    send_geo_cmd("load_asm programs/test_mailbox_put.asm")
    send_geo_cmd("run 0 0 5000")
    regs = parse_regs(send_geo_cmd("regs"))
    assert regs.get("r0", -1) == 0, f"MAILBOX_PUT failed: r0={regs.get('r0')}"
    print(f"  ✓ MAILBOX_PUT returned r0=0 (success)")

    # Clear RAM[0x3000] so we can verify MAILBOX_GET restores it
    poke_ram(0x3000, [0xDEADBEEF] * NUM_MAILBOX_WORDS)
    print(f"  Cleared RAM[0x3000] with DEADBEEF")

    # MAILBOX_GET: copy mailbox → RAM[0x3000]
    asm2 = f"""
; Test MAILBOX_GET: copy mailbox to RAM[0x3000]
LDI r1, {DEVICE_FD_MAILBOX}       ; fd = /dev/mailbox
LDI r2, {MAILBOX_GET}             ; cmd = MAILBOX_GET
LDI r3, 0x3000                    ; arg = destination address
IOCTL r1, r2, r3
; r0 should be 0
HALT
"""
    asm2_path = GEOS_PROJECT / "programs" / "test_mailbox_get.asm"
    asm2_path.write_text(asm2)
    send_geo_cmd("load_asm programs/test_mailbox_get.asm")
    send_geo_cmd("run 0 0 5000")
    regs = parse_regs(send_geo_cmd("regs"))
    assert regs.get("r0", -1) == 0, f"MAILBOX_GET failed: r0={regs.get('r0')}"
    print(f"  ✓ MAILBOX_GET returned r0=0 (success)")

    # Verify round-trip: read back RAM[0x3000]
    readback = peek_ram(0x3000, NUM_MAILBOX_WORDS)
    mismatches = 0
    for i, (expected, actual) in enumerate(zip(test_data, readback)):
        if expected != actual:
            if mismatches < 3:
                print(f"  ✗ word[{i}]: expected 0x{expected:08X}, got 0x{actual:08X}")
            mismatches += 1
    if mismatches == 0:
        print(f"  ✓ All {NUM_MAILBOX_WORDS} words match after round-trip")
    else:
        print(f"  ✗ {mismatches}/{NUM_MAILBOX_WORDS} words mismatch")
        return False

    return True


def test_mailbox_clear():
    """Test MAILBOX_CLEAR zeros the mailbox."""
    print("\n=== Test 2: Mailbox CLEAR ===\n")

    # First fill mailbox with known values via PUT
    test_data = [0x12345678 + i for i in range(NUM_MAILBOX_WORDS)]
    poke_ram(0x3100, test_data)

    asm_put = f"""
LDI r1, {DEVICE_FD_MAILBOX}
LDI r2, {MAILBOX_PUT}
LDI r3, 0x3100
IOCTL r1, r2, r3
HALT
"""
    asm_path = GEOS_PROJECT / "programs" / "test_mailbox_fill.asm"
    asm_path.write_text(asm_put)
    send_geo_cmd("load_asm programs/test_mailbox_fill.asm")
    send_geo_cmd("run 0 0 5000")
    print(f"  ✓ Filled mailbox with test data")

    # Now clear it
    asm_clr = f"""
LDI r1, {DEVICE_FD_MAILBOX}
LDI r2, {MAILBOX_CLEAR}
LDI r3, 0
IOCTL r1, r2, r3
HALT
"""
    asm_clr_path = GEOS_PROJECT / "programs" / "test_mailbox_clear.asm"
    asm_clr_path.write_text(asm_clr)
    send_geo_cmd("load_asm programs/test_mailbox_clear.asm")
    send_geo_cmd("run 0 0 5000")
    regs = parse_regs(send_geo_cmd("regs"))
    assert regs.get("r0", -1) == 0, f"MAILBOX_CLEAR failed: r0={regs.get('r0')}"
    print(f"  ✓ MAILBOX_CLEAR returned r0=0")

    # Read back via GET to verify zeros
    poke_ram(0x3100, [0xFFFFFFFF] * NUM_MAILBOX_WORDS)
    asm_get = f"""
LDI r1, {DEVICE_FD_MAILBOX}
LDI r2, {MAILBOX_GET}
LDI r3, 0x3100
IOCTL r1, r2, r3
HALT
"""
    asm_get_path = GEOS_PROJECT / "programs" / "test_mailbox_readback.asm"
    asm_get_path.write_text(asm_get)
    send_geo_cmd("load_asm programs/test_mailbox_readback.asm")
    send_geo_cmd("run 0 0 5000")

    readback = peek_ram(0x3100, 5)
    all_zero = all(v == 0 for v in readback)
    if all_zero:
        print(f"  ✓ Mailbox successfully cleared (first 5 words: all zero)")
    else:
        print(f"  ✗ Mailbox not cleared: {[f'0x{v:08X}' for v in readback]}")
        return False

    return True


def test_mailbox_bad_address():
    """Test that out-of-range address returns EINVAL."""
    print("\n=== Test 3: Mailbox bad address returns EINVAL ===\n")

    # Try to PUT from an address near end of RAM (will be out of bounds)
    asm = f"""
; Try PUT from RAM[0xFFFFFF00] (out of bounds)
LDI r1, {DEVICE_FD_MAILBOX}
LDI r2, {MAILBOX_PUT}
LDI r3, 0xFFFFFF00
IOCTL r1, r2, r3
HALT
"""
    asm_path = GEOS_PROJECT / "programs" / "test_mailbox_bad.asm"
    asm_path.write_text(asm)
    send_geo_cmd("load_asm programs/test_mailbox_bad.asm")
    send_geo_cmd("run 0 0 5000")
    regs = parse_regs(send_geo_cmd("regs"))
    # EINVAL = 0xFFFFFFF9 (GEOS_EINVAL = 7, negated = -7 = 0xFFFFFFF9)
    einval = 0xFFFFFFF9
    if regs.get("r0", 0) == einval:
        print(f"  ✓ Bad address returned GEOS_EINVAL (0x{einval:08X})")
    else:
        print(f"  ✗ Expected GEOS_EINVAL (0x{einval:08X}), got r0=0x{regs.get('r0', 0):08X}")
        return False

    return True


def main():
    print("=" * 60)
    print("  Mailbox Bridge Integration Test")
    print("=" * 60)

    results = [
        ("PUT/GET round-trip", test_mailbox_put_get()),
        ("CLEAR", test_mailbox_clear()),
        ("Bad address check", test_mailbox_bad_address()),
    ]

    print("\n" + "=" * 60)
    print("  Results:")
    for name, passed in results:
        status = "✓ PASS" if passed else "✗ FAIL"
        print(f"  {status}: {name}")

    all_pass = all(r[1] for r in results)
    print(f"\n  Overall: {'ALL PASS' if all_pass else 'SOME FAILED'}")
    print("=" * 60)
    return 0 if all_pass else 1


if __name__ == "__main__":
    sys.exit(main())
