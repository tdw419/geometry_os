#!/usr/bin/env python3
"""
test_compositor_launcher.py - Test compositor launcher without booting VM

Validates launcher PNG decoding and compositor configuration.
"""

import sys
import json
import base64
import subprocess
from pathlib import Path

def test_launcher_decode(png_path):
    """Test launcher PNG decoding."""
    print("=" * 60)
    print("  Compositor Launcher Test")
    print("=" * 60)
    print()

    pixelpack = Path.home() / 'projects/zion/projects/pixelpack/target/release/pixelpack'

    if not pixelpack.exists():
        print(f"[!] pixelpack not found: {pixelpack}")
        return False

    print(f"[*] Testing launcher: {png_path}")
    print(f"[*] PNG size: {Path(png_path).stat().st_size} bytes")
    print()

    # Decode
    result = subprocess.run(
        [str(pixelpack), 'decode', str(png_path)],
        capture_output=True,
        text=True,
        timeout=30
    )

    if result.returncode != 0:
        print(f"[!] Decode failed: {result.stderr}")
        return False

    try:
        palace_data = json.loads(result.stdout)
        print("[+] PNG decoded successfully")
        print(f"[*] Facts found: {len(palace_data.get('facts', []))}")
        print()

        # Extract launcher config
        for fact in palace_data.get('facts', []):
            metadata = fact.get('metadata', {})
            component = metadata.get('component')

            if component == 'launcher':
                config_data = base64.b64decode(fact['code_b64']).decode()
                config = json.loads(config_data)

                print("[+] Launcher component found")
                print(f"[*] Name: {config.get('name', 'Unknown')}")
                print(f"[*] Version: {config.get('version', 'Unknown')}")
                print(f"[*] qcow2: {config['qcow2_path']}")
                print(f"[*] Memory: {config['memory']}")
                print(f"[*] CPUs: {config['cpus']}")
                print()

                # Check compositor config
                compositor = config.get('compositor', {})
                if compositor.get('enabled', False):
                    print("[+] Compositor ENABLED")
                    print(f"[*] Binary: {compositor.get('binary_path', 'Unknown')}")
                    print(f"[*] Features: {', '.join(compositor.get('features', []))}")
                    print()

                    startup = config.get('startup_sequence', [])
                    print(f"[*] Startup sequence: {' -> '.join(startup)}")
                    print()

                    # Check binary exists
                    binary = Path(compositor.get('binary_path', './compositor'))
                    if not binary.is_absolute():
                        binary = Path.cwd() / binary

                    if binary.exists():
                        print(f"[+] Compositor binary exists: {binary}")
                        print(f"    Size: {binary.stat().st_size / 1024 / 1024:.1f} MB")
                    else:
                        print(f"[!] Compositor binary NOT found: {binary}")
                        print(f"    Expected: {binary.absolute()}")
                else:
                    print("[!] Compositor DISABLED")

                print()
                print("=" * 60)
                print("  Test Results: PASS")
                print("=" * 60)
                print()
                print("[*] To boot with compositor:")
                print(f"    python3 ubuntu_compositor_boot.py {png_path}")
                print()
                return True

        print("[!] No launcher component found")
        return False

    except Exception as e:
        print(f"[!] Parse error: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    if len(sys.argv) < 2:
        print("Usage: python3 test_compositor_launcher.py <launcher.png>")
        print()
        print("Tests launcher PNG decoding and compositor configuration.")
        sys.exit(1)

    png_path = sys.argv[1]

    if not test_launcher_decode(png_path):
        sys.exit(1)

if __name__ == '__main__':
    main()