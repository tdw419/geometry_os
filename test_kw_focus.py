#!/usr/bin/env python3
"""Focused test: trace keyword table through encode and decode."""
import sys; sys.path.insert(0, '.')
from boot3 import encode_v3, _build_keyword_table
from expand3 import expand_from_png_v3, _read_text_chunk
from expand import set_keyword_table, get_keyword_table
from PIL import Image
import tempfile, os, struct

# Build keyword table from boot3.py
with open('boot3.py', 'rb') as f:
    target = f.read()

kw = _build_keyword_table(target)
print(f"Encoder built {len(kw) if kw else 0} keywords")
if kw:
    for i, k in enumerate(kw[:5]):
        print(f"  kw[{i}]: {k!r} (len={len(k)})")

# Encode to PNG
png_path = tempfile.mktemp(suffix='.png')
seeds, png_data = encode_v3(target, png_path, timeout=120.0)
print(f"\nEncoded: {len(seeds)} seeds, PNG size={len(png_data)}")

# Read raw keyword_table chunk
kw_hex = _read_text_chunk(png_data, 'keyword_table')
print(f"keyword_table hex string length: {len(kw_hex)}")
print(f"keyword_table hex first 100 chars: {kw_hex[:100]}")

if kw_hex:
    kw_data = bytes.fromhex(kw_hex)
    print(f"keyword_table decoded bytes: {len(kw_data)}")
    print(f"keyword_table first 30 bytes: {kw_data[:30]!r}")
    
    # Parse keywords
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
    print(f"Parsed {len(keywords)} keywords from hex data")
    for i, k in enumerate(keywords[:5]):
        print(f"  parsed_kw[{i}]: {k!r} (len={len(k)})")
else:
    print("keyword_table hex is EMPTY!")

# Now decode
result = expand_from_png_v3(png_data)
ok = result == target
print(f"\nRoundtrip: {'PASS' if ok else 'FAIL'}")

# Check what get_keyword_table returns after decode
from expand import get_keyword_table as gkt2
kw_after = gkt2()
print(f"keyword_table after decode: {len(kw_after) if kw_after else 0} keywords")

os.unlink(png_path)
