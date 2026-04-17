#!/usr/bin/env python3
"""Check if keyword table survives in PNG."""
import sys; sys.path.insert(0,'.')
from boot3 import encode_v3
from expand import set_keyword_table, get_keyword_table
import tempfile, os

fname = 'boot3.py'
with open(fname,'rb') as f: orig = f.read()

# Set tables before encoding
set_keyword_table(None)

png_path = tempfile.mktemp(suffix='.png')
seeds, png_data = encode_v3(orig, png_path, timeout=120.0)

# Check keyword table state after encode
kw_after_encode = get_keyword_table()
print(f"KW after encode: {len(kw_after_encode) if kw_after_encode else 0} keywords")

# Now decode
from expand3 import expand_from_png_v3
result = expand_from_png_v3(png_data)

kw_after_decode = get_keyword_table()
print(f"KW after decode: {len(kw_after_decode) if kw_after_decode else 0} keywords")

# Check PNG for keyword_table chunk
import zlib
def find_text_chunks(data):
    chunks = []
    pos = 8  # after PNG signature
    while pos < len(data):
        length = int.from_bytes(data[pos:pos+4], 'big')
        chunk_type = data[pos+4:pos+8]
        chunk_data = data[pos+8:pos+8+length]
        if chunk_type == b'tEXt':
            key, _, val = chunk_data.partition(b'\x00')
            chunks.append((key.decode(), val[:50]))
        pos += 12 + length
    return chunks

for key, val in find_text_chunks(png_data):
    print(f"  PNG chunk: {key} = {val!r}...")

os.unlink(png_path)
