#!/usr/bin/env python3
"""
Macromedia Inception Packer: Resurrecting Legacy Visual Tools for Geometry OS.
Wraps the Macromedia Studio MX ZIP into a PixelRTS v2 visual container.
"""

import base64
import json
import os
import subprocess
import sys
from pathlib import Path
import hashlib

def main():
    print("🎨 Macromedia Studio MX → PixelRTS v2 Packer")
    
    # Paths
    zip_path = Path("apps/Macromedia Studio MX (including Cold Fusion, Dreamweaver, Fireworks, Flash & Freehand).zip")
    output_path = Path("systems/visual_shell/web/macromedia.rts.png")
    temp_json_path = Path("temp_macromedia.rts")
    
    if not zip_path.exists():
        print(f"❌ Source ZIP not found at {zip_path}")
        sys.exit(1)

    # 1. Read binary data
    print(f"📖 Reading Legacy Artifact: {zip_path.name}")
    with open(zip_path, 'rb') as f:
        payload_data = f.read()
    
    payload_size_mb = len(payload_data) / (1024 * 1024)
    print(f"   Payload Size: {payload_size_mb:.2f} MB")
    
    # 2. Compute Integrity Hash
    payload_hash = hashlib.sha256(payload_data).hexdigest()
    print(f"   SHA256: {payload_hash[:16]}...")

    # 3. Encode to Base64 (Wrapped for the Converter)
    print("⏳ Encoding to Substrate Format (Base64)...")
    payload_b64 = base64.b64encode(payload_data).decode('utf-8')

    # 4. Construct RTS Metadata for Recursive Tooling
    rts_data = {
        "version": "2.0",
        "name": "Macromedia Studio MX",
        "type": "RECURSIVE_TOOLING",
        "arch": "x86 (Legacy Wine)",
        "bootable": False, # This is a tool-pack, not a kernel
        "payload": {
            "macromedia_zip": {
                "content": payload_b64,
                "sha256": payload_hash,
                "target_mount": "/mnt/legacy/macromedia"
            }
        },
        "scripts": {
            "install": "unzip macromedia_zip -d /opt/macromedia && wine /opt/macromedia/Flash/flash.exe"
        }
    }

    # 5. Write temporary JSON
    print(f"💾 Saving temporary RTS definition to {temp_json_path}...")
    with open(temp_json_path, 'w') as f:
        json.dump(rts_data, f)

    # 6. Run Converter
    print("🏭 Running PixelRTS v2 Converter (Visual Baking)...")
    converter_script = "pixelrts_v2_converter.py"
    # Note: We use the same converter but it will handle the large payload via Hilbert mapping
    cmd = [sys.executable, converter_script, str(temp_json_path), str(output_path)]
    
    result = subprocess.run(cmd)

    # 7. Cleanup
    if result.returncode == 0:
        print("🧹 Cleaning up temp file...")
        if temp_json_path.exists():
            os.remove(temp_json_path)
        print("\n✅ Macromedia Visual Atom Created!")
        print(f"   Location: {output_path}")
        print(f"   The OS now recognizes this PNG as a bootable legacy suite.")
    else:
        print("❌ Visual Baking Failed!")
        sys.exit(1)

if __name__ == "__main__":
    main()
