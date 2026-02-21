import sys
from prts_toolchain.assembler import assemble
from prts_toolchain.vm import execute

test_code = """
LDI r1, 10
LDI r2, 20
ADD r3, r1, r2
HALT
"""

print("Running test...")
image = assemble(test_code)
final_registers = execute(image)

expected_r3 = 30
actual_r3 = final_registers.get('r3', -1)

print(f"Final r3: {actual_r3}")
assert actual_r3 == expected_r3, f"Expected r3 to be {expected_r3} but got {actual_r3}"

print("Test PASSED")
