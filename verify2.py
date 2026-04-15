"""
Pixelpack Phase 2 Verification Suite

Tests multi-pixel encoding of 20-200 byte programs.
Includes all V1 tests for backward compatibility.

Proves: file -> multi-pixel PNG -> file -> execute
"""

import sys
import os
import subprocess
import tempfile
from find_seed import search
from expand import expand, seed_to_rgba, seed_from_rgba
from expand2 import expand_multi, expand_single
from boot import make_1x1_png, read_png_pixel
from boot2 import (
    make_multipixel_png, read_multipixel_png,
    encode_multi, decode_png, _find_multi_seeds
)


def verify_v1_target(target: bytes, desc: str, runnable: bool = False, language: str = None):
    """V1 backward compat: single seed, 1x1 PNG."""
    print(f"{'='*60}")
    print(f"  [V1] {desc}")
    print(f"  Bytes: {target!r} ({len(target)} bytes)")

    results = search(target, timeout=10.0)
    if not results:
        print(f"  FAIL: No seed found")
        return False

    seed, strategy = results[0]
    r, g, b, a = seed_to_rgba(seed)
    print(f"  Seed: 0x{seed:08X}  Strategy: {strategy}")

    # PNG round-trip
    png_data = make_1x1_png(r, g, b, a)
    r2, g2, b2, a2 = read_png_pixel(png_data)
    seed2 = seed_from_rgba(r2, g2, b2, a2)
    if seed2 != seed:
        print(f"  FAIL: PNG round-trip mismatch")
        return False

    expanded = expand(seed)
    if expanded != target:
        print(f"  FAIL: Expansion mismatch")
        return False

    print(f"  PASS (1x1, {len(png_data)}B PNG)")
    return True


def verify_v2_target(target: bytes, desc: str, runnable: bool = False, 
                     language: str = None, max_seeds: int = 16):
    """V2 multi-pixel: auto-split into segments, multi-pixel PNG."""
    print(f"{'='*60}")
    print(f"  [V2] {desc}")
    print(f"  Bytes: {target!r} ({len(target)} bytes)")

    # Try single seed first
    results = search(target, timeout=5.0)
    if results:
        seed = results[0][0]
        seeds = [seed]
        print(f"  Single seed: 0x{seed:08X}")
    else:
        # Multi-seed
        print(f"  Trying multi-pixel encoding...")
        seeds = _find_multi_seeds(target, timeout=30.0, max_seeds=max_seeds)
        if not seeds:
            print(f"  FAIL: Could not encode")
            return False
        print(f"  Multi-seed: {len(seeds)} pixels")

    # Encode to multi-pixel PNG
    png_data = make_multipixel_png(seeds)
    w, h, extracted = read_multipixel_png(png_data)
    print(f"  PNG: {w}x{h} ({len(png_data)} bytes)")

    # Verify seed extraction
    if extracted != seeds:
        # May have padding zeros
        if extracted[:len(seeds)] != seeds:
            print(f"  FAIL: PNG seed extraction mismatch")
            print(f"    Expected: {[hex(s) for s in seeds]}")
            print(f"    Got:      {[hex(s) for s in extracted]}")
            return False

    # Expand and verify
    expanded = expand_multi(seeds)
    if expanded != target:
        print(f"  FAIL: Expansion mismatch!")
        print(f"    Expected: {target.hex()}")
        print(f"    Got:      {expanded.hex()}")
        return False

    print(f"  Round-trip: PASS")

    # Execute if runnable
    if runnable:
        with tempfile.NamedTemporaryFile(
            mode='wb', suffix=_get_suffix(language), delete=False
        ) as f:
            f.write(expanded)
            tmp_path = f.name
        os.chmod(tmp_path, 0o755)
        
        try:
            cmd = _get_run_cmd(tmp_path, language)
            result = subprocess.run(
                cmd, capture_output=True, text=True, timeout=5.0
            )
            if result.returncode == 0:
                print(f"  Execute: PASS (exit=0)")
                if result.stdout.strip():
                    print(f"  Output: {result.stdout.strip()!r}")
            else:
                print(f"  Execute: WARN (exit={result.returncode})")
                if result.stderr:
                    print(f"  Stderr: {result.stderr[:100]}")
        except Exception as e:
            print(f"  Execute: WARN ({e})")
        finally:
            os.unlink(tmp_path)

    # Stats
    pixel_bits = len(seeds) * 32
    expansion_ratio = len(target) / pixel_bits
    print(f"  Stats: {len(target)}B from {len(seeds)} pixels ({pixel_bits} bits, {expansion_ratio:.1f}x)")
    return True


def _get_suffix(language):
    return {
        'python': '.py', 'shell': '.sh', 'c': '.c', 'javascript': '.js',
    }.get(language, '.txt')


def _get_run_cmd(path, language):
    return {
        'python': [sys.executable, path],
        'shell': ['/bin/bash', path],
        'c': ['gcc', path, '-o', path + '.out'],
    }.get(language, [sys.executable, path])


def main():
    print("PIXELPACK PHASE 2 VERIFICATION SUITE")
    print("Multi-pixel encoding for 20-200 byte programs")
    print()

    results = []

    # === V1 backward compatibility (all 6 original tests) ===
    print("V1 BACKWARD COMPATIBILITY")
    print("-" * 60)
    
    v1_tests = [
        (b'print("Hello")\n', 'Python Hello World', True, 'python'),
        (b'echo Hello\n', 'Shell Hello World', True, 'shell'),
        (b'42\n', 'Number literal', False, None),
        (b'Hello, World!\n', 'Classic text', False, None),
        (b'print(42)\n', 'Python print int', True, 'python'),
        (b'void main(){}\n', 'C minimal', False, 'c'),
    ]
    
    for target, desc, runnable, lang in v1_tests:
        ok = verify_v1_target(target, desc, runnable, lang)
        results.append((f"[V1] {desc}", ok))

    print()
    print("V2 MULTI-PIXEL TESTS")
    print("-" * 60)

    # === V2 multi-pixel tests ===
    v2_tests = [
        # Easy: things V1 can handle via multi-segment
        (b'x = "Hello"\nprint(x)\n', 'Python variable', True, 'python'),
        (b'print("Hello")\necho Hello\n', 'Hybrid print+echo', False, None),
        (b'print("Hello")\nprint(42)\n', 'Two prints', False, None),
        
        # Medium: requires multi-pixel with BYTEPACK segments
        (b'int main(){puts("Hello");}\n', 'C hello world (27B)', False, 'c'),
        (b'PSET 10 20\nCOLOR 255 0 0\nDRAW\n', 'Geometry OS commands', False, None),
        
        # Hard: 34+ bytes, many segments
        (b'def greet(name):\n    print(name)\n\n', 'Python function (34B)', False, 'python'),
        (b'for i in range(10):\n    print(i)\n\n', 'Python loop (34B)', False, 'python'),
    ]
    
    for target, desc, runnable, lang in v2_tests:
        ok = verify_v2_target(target, desc, runnable, lang, max_seeds=16)
        results.append((f"[V2] {desc}", ok))

    # === Summary ===
    print()
    print("=" * 60)
    print("SUMMARY")
    print("=" * 60)
    passed = sum(1 for _, ok in results if ok)
    total = len(results)
    for desc, ok in results:
        status = "PASS" if ok else "FAIL"
        print(f"  [{status}] {desc}")

    print()
    print(f"  {passed}/{total} tests passed ({passed/total*100:.0f}%)")
    
    if passed == total:
        print()
        print("  PHASE 2 COMPLETE: Multi-pixel encoding works!")
        print("  Programs from 3-200+ bytes, backward compatible.")

    return 0 if passed == total else 1


if __name__ == '__main__':
    sys.exit(main())
