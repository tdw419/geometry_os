#!/usr/bin/env python3
"""Test: is keyword table set DURING seed expansion?"""
import sys; sys.path.insert(0, '.')
from boot3 import encode_v3, _build_keyword_table
from expand3 import expand_from_png_v3, _read_text_chunk, expand_with_context, ExpandContext
from expand import set_keyword_table, get_keyword_table
from PIL import Image
import tempfile, os

# Build keyword table from boot3.py
with open('boot3.py', 'rb') as f:
    target = f.read()

# Encode to PNG
png_path = tempfile.mktemp(suffix='.png')
seeds, png_data = encode_v3(target, png_path, timeout=120.0)

# Read the keyword table hex
kw_hex = _read_text_chunk(png_data, 'keyword_table')
print(f"keyword_table hex length: {len(kw_hex)}")

# Parse keywords manually
kw_data = bytes.fromhex(kw_hex)
keywords = []
current = bytearray()
for b in kw_data:
    if b == 0xFF:
        if current:
            keywords.append(bytes(current))
            current = bytearray()
    else:
        current.append(b)
if current:
    keywords.append(bytes(current))
print(f"Manual parse: {len(keywords)} keywords")

# Now set the keyword table and try expanding a KEYWORD seed
set_keyword_table(keywords)
print(f"After manual set: {len(get_keyword_table())} keywords")

# Find a KEYWORD seed
from expand3 import emit_dict_seed
ctx = ExpandContext()
dict_only_count = 0  # We don't know this yet but let's check seed types
for i, s in enumerate(seeds[:20]):
    strat = (s >> 28) & 0xF
    if strat == 0xD:
        result = expand_with_context(s, ctx)
        print(f"Seed {i}: strat=0xD (KEYWORD), result={result!r}, len={len(result)}")
        break
    else:
        result = expand_with_context(s, ctx)
        print(f"Seed {i}: strat=0x{strat:X}, result={result[:20]!r}..., len={len(result)}")

set_keyword_table(None)
os.unlink(png_path)
