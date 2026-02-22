
import base64
import json
import os
import subprocess
import sys
from pathlib import Path

def main():
    print("🚀 Inception Protocol Packer")
    print("Target: Packing Tiny Core Linux (vmlinuz-virt + core.gz) into ubuntu.rts.png")

    # Paths
    kernel_path = Path("vmlinuz-virt")
    initrd_path = Path("temp_linux_embed/iso/boot/core.gz")
    output_path = Path("systems/visual_shell/web/ubuntu.rts.png")
    temp_json_path = Path("temp_inception.rts")

    if not kernel_path.exists() or not initrd_path.exists():
        print(f"❌ Missing files!")
        if not kernel_path.exists(): print(f"  - {kernel_path} not found")
        if not initrd_path.exists(): print(f"  - {initrd_path} not found")
        sys.exit(1)

    # Read binary data
    print(f"📖 Reading Kernel ({kernel_path}) and Initrd ({initrd_path})...")
    with open(kernel_path, 'rb') as f:
        kernel_data = f.read()
    with open(initrd_path, 'rb') as f:
        initrd_data = f.read()

    print(f"  - Kernel size: {len(kernel_data):,} bytes")
    print(f"  - Initrd size: {len(initrd_data):,} bytes")

    # Encode to Base64
    print("⏳ Encoding to Base64...")
    kernel_b64 = base64.b64encode(kernel_data).decode('utf-8')
    initrd_b64 = base64.b64encode(initrd_data).decode('utf-8')

    # Construct RTS Data Structure
    rts_data = {
        "version": "1.0",
        "arch": "x86_64",
        "bootable": True,
        "kernel_cmdline": "console=ttyS0 boot=live user=tc quiet disable_vmx=1",
        "boot_method": "qemu-direct",
        "boot_files": {
            "kernel": {
                "content": kernel_b64
            },
            "initrd": {
                "content": initrd_b64
            }
        }
    }

    # Write temporary JSON
    print(f"💾 Saving temporary RTS definition to {temp_json_path}...")
    with open(temp_json_path, 'w') as f:
        json.dump(rts_data, f, indent=2)

    # Run Converter
    print("🏭 Running PixelRTS v2 Converter...")
    converter_script = "pixelrts_v2_converter.py"
    cmd = [sys.executable, converter_script, str(temp_json_path), str(output_path)]
    
    result = subprocess.run(cmd)

    # Cleanup
    if result.returncode == 0:
        print("🧹 Cleaning up temp file...")
        if temp_json_path.exists():
            os.remove(temp_json_path)
        print("✅ Inception Protocol Artifact Created Successfully!")
        print(f"   Target: {output_path}")
    else:
        print("❌ Conversion Failed!")
        sys.exit(1)

if __name__ == "__main__":
    main()
