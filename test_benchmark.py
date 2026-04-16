#!/usr/bin/env python3
import sys; sys.path.insert(0,'.')
from boot3 import encode_v3
from expand3 import expand_from_png_v3
from PIL import Image
import tempfile, os

total_seeds = 0
total_bytes = 0
for fname in ['expand.py','boot3.py']:
    with open(fname,'rb') as f: orig = f.read()
    png_path = tempfile.mktemp(suffix='.png')
    seeds, png_data = encode_v3(orig, png_path, timeout=120.0)
    result = expand_from_png_v3(png_data)
    img = Image.open(png_path); w,h = img.size
    n_seeds = w*h - 1
    ok = result == orig
    status = "PASS" if ok else "FAIL"
    print(f'{fname}: {len(orig)}B, {n_seeds} seeds, {len(orig)/n_seeds:.2f} B/seed, roundtrip={status}')
    total_seeds += n_seeds
    total_bytes += len(orig)
    os.unlink(png_path)
print(f'Overall: {total_bytes}B, {total_seeds} seeds, {total_bytes/total_seeds:.2f} B/seed')
