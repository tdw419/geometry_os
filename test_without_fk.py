#!/usr/bin/env python3
"""Test boot3.py WITHOUT FREQ/KEYWORD strategies to measure baseline."""
import sys; sys.path.insert(0,'.')
from boot3 import encode_v3
from expand3 import expand_from_png_v3
from PIL import Image
import tempfile, os

# Monkey-patch to disable FREQ/KEYWORD
import boot3
boot3._build_freq_table = lambda target: b''
boot3._build_keyword_table = lambda target: []

fname = 'boot3.py'
with open(fname,'rb') as f: orig = f.read()
png_path = tempfile.mktemp(suffix='.png')
seeds, png_data = encode_v3(orig, png_path, timeout=120.0)
result = expand_from_png_v3(png_data)
img = Image.open(png_path); w,h = img.size
n_seeds = w*h - 1
ok = result == orig
print(f'RESULT: {fname}: {len(orig)}B, {n_seeds} seeds, {len(orig)/n_seeds:.2f} B/seed, roundtrip={"PASS" if ok else "FAIL"}')
os.unlink(png_path)
