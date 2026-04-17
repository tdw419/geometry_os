#!/usr/bin/env python3
"""Quick check: what does expand_with_context do for FREQ seeds?"""
import sys; sys.path.insert(0,'.')
from expand3 import ExpandContext, expand_with_context

# Create a FREQ seed with top bytes
# Strategy 0xB, params with some freq indices
seed = 0xB0000000 | 0x1111111  # dummy FREQ seed

ctx = ExpandContext()
result = expand_with_context(seed, ctx)
print(f"Seed: 0x{seed:08X}")
print(f"Strategy: {(seed >> 28) & 0xF}")
print(f"Result: {result!r}")
print(f"Length: {len(result)}")
