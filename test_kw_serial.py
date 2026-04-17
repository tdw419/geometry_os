#!/usr/bin/env python3
from boot3 import _build_keyword_table
kw = _build_keyword_table(open("boot3.py","rb").read())
print(f"Keywords: {len(kw)}")
for i, k in enumerate(kw[:5]):
    print(f"  [{i}] {k!r} ({len(k)} bytes)")
# Check if any contain 0xFF
for k in kw:
    if 0xFF in k:
        print(f"  WARNING: keyword contains 0xFF: {k!r}")

# Simulate serialization/deserialization
kw_bytes = b'\xff'.join(kw)
print(f"\nSerialized: {len(kw_bytes)} bytes")
# Check hex encoding
hex_str = kw_bytes.hex()
print(f"Hex: {len(hex_str)} chars")
# Deserialize
kw_data = bytes.fromhex(hex_str)
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
print(f"Deserialized: {len(keywords)} keywords")
for i, k in enumerate(keywords[:5]):
    print(f"  [{i}] {k!r}")
