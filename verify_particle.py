#!/usr/bin/env python3
"""Verify particle_sandbox.asm assembles and runs correctly."""
import subprocess

def run_geo(commands):
    p = subprocess.run(
        ['cargo', 'run', '--release', '--', '--cli'],
        input='\n'.join(commands) + '\n',
        capture_output=True, text=True, timeout=30
    )
    return (p.stdout + p.stderr).split('\n')

def extract_ram(lines, addr):
    for line in lines:
        if f'RAM[0x{addr:X}]' in line or f'RAM[0x{addr:x}]' in line:
            return int(line.split('=')[1].strip(), 16)
    return None

# 1. Verify assembly succeeds and particles spawn
lines = run_geo(['load programs/particle_sandbox.asm', 'run', 'peek 0x7802', 'regs', 'quit'])

print("=== Assembly & Run ===")
for line in lines:
    if 'Assembled' in line or 'Loaded' in line or 'Running' in line:
        print(line.strip())

# Check particle count
count = extract_ram(lines, 0x7802)
print(f"Particle count: {count}")
assert count is not None and count > 0, f"Expected particles > 0, got {count}"
print("PASS: Particles spawned")

# Check SP
for line in lines:
    if 'SP=' in line:
        sp = line.split('SP=')[1].split()[0]
        assert sp == 'FF00', f"Expected SP=FF00, got SP={sp}"
        print("PASS: Stack pointer initialized")
        break

# 2. Verify color table
lines2 = run_geo(['load programs/particle_sandbox.asm', 'run', 'peek 0x7600', 'peek 0x760F', 'quit'])
color0 = extract_ram(lines2, 0x7600)
color15 = extract_ram(lines2, 0x760F)
print(f"\nColor table: [0]=0x{color0:06X}, [15]=0x{color15:06X}")
assert color0 == 0x0000FF, f"Expected blue, got 0x{color0:06X}"
assert color15 == 0xFF0044, f"Expected red-pink, got 0x{color15:06X}"
print("PASS: Color table built correctly")

# 3. Verify gravity state
lines3 = run_geo(['load programs/particle_sandbox.asm', 'run', 'peek 0x7800', 'peek 0x7801', 'quit'])
gx = extract_ram(lines3, 0x7800)
gy = extract_ram(lines3, 0x7801)
print(f"\nGravity: gx={gx}, gy={gy}")
assert gx == 0, f"Expected gx=0, got {gx}"
assert gy == 1, f"Expected gy=1, got {gy}"
print("PASS: Gravity initialized correctly")

print("\n=== ALL CHECKS PASSED ===")
