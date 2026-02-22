#!/usr/bin/env python3
"""
Nursery Packer: Enhanced Inception Protocol with Build Tools

Phase 18: The Nursery - Recursive Compilation

This packer creates an enhanced bootable container that includes:
- Build tools (gcc, python3, rustc)
- 9p virtio filesystem support
- Recursive compilation test scripts
- Artifact ejection mechanism
"""

import base64
import json
import os
import subprocess
import sys
import tarfile
import tempfile
import shutil
from pathlib import Path

def create_bootlocal_with_build_tools():
    """
    Create bootlocal.sh that installs build tools at boot
    
    This script runs automatically when Tiny Core Linux boots
    """
    bootlocal_content = """#!/bin/sh
# Phase 18: Nursery - Build Tool Installation
# This script runs at boot to install compilation tools

echo "🌱 Phase 18 Nursery: Initializing build environment..."

# Set up network
sudo /usr/sbin/setup-network

# Create shared directory for 9p filesystem
sudo mkdir -p /mnt/host_shared

# Download and install build tools from Tiny Core extensions
echo "📦 Installing build tools..."

# Install compiletc (gcc, make, etc.)
tce-load -wi compiletc.tcz

# Install Python 3
tce-load -wi python3.tcz

# Install Rust (we'll download a pre-compiled binary)
echo "🦀 Installing Rust..."
cd /tmp
wget -q https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
chmod +x rustup-init
./rustup-init -y --default-toolchain stable --profile minimal
export PATH="$HOME/.cargo/bin:$PATH"

# Verify installations
echo "✅ Build tools installed:"
gcc --version | head -n 1
python3 --version
rustc --version

# Mount 9p filesystem if available
echo "🔗 Mounting host shared filesystem..."
if [ -d /mnt/host_shared ]; then
    sudo mount -t 9p -o trans=virtio,version=9p2000.L host_shared /mnt/host_shared 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "✅ 9p filesystem mounted at /mnt/host_shared"
        ls -la /mnt/host_shared
    else
        echo "⚠️  9p filesystem not available (expected in QEMU)"
    fi
fi

# Start recursive compilation daemon if source code is present
if [ -f /mnt/host_shared/recursive_test.rs ]; then
    echo "🔄 Found recursive test source, starting compilation..."
    /usr/local/bin/run_recursive_test.sh
fi

echo "🌱 Nursery environment ready!"
"""
    return bootlocal_content

def create_recursive_test_script():
    """
    Create script that compiles and runs the recursive test
    """
    script_content = """#!/bin/bash
# Phase 18: Recursive Compilation Test Runner

echo "🔄 Phase 18: Running Recursive Compilation Test"

# Ensure 9p filesystem is mounted
if ! mountpoint -q /mnt/host_shared; then
    echo "⚠️  9p filesystem not mounted, attempting to mount..."
    sudo mount -t 9p -o trans=virtio,version=9p2000.L host_shared /mnt/host_shared
    if [ $? -ne 0 ]; then
        echo "❌ Failed to mount 9p filesystem"
        exit 1
    fi
fi

# Check for source code
SOURCE_FILE="/mnt/host_shared/recursive_test.rs"
if [ ! -f "$SOURCE_FILE" ]; then
    echo "❌ Source file not found: $SOURCE_FILE"
    exit 1
fi

echo "📖 Source file found: $SOURCE_FILE"

# Compile with rustc
echo "🔨 Compiling with rustc..."
cd /tmp
rustc "$SOURCE_FILE" -o recursive_test_binary

if [ $? -ne 0 ]; then
    echo "❌ Compilation failed"
    exit 1
fi

echo "✅ Compilation successful"

# Run the compiled binary
echo "🚀 Running compiled binary..."
./recursive_test_binary

# Copy binary back to host
echo "💾 Ejecting compiled binary to host..."
cp recursive_test_binary /mnt/host_shared/
cp recursive_test_binary /mnt/host_shared/geometry_os_component

# Generate compilation report
cat > /mnt/host_shared/compilation_report.txt << EOF
Phase 18 Recursive Compilation Report
=====================================
Date: $(date)
Compiler: rustc $(rustc --version)
Source: $SOURCE_FILE
Output: recursive_test_binary
Status: SUCCESS

Binary SHA256: $(sha256sum /mnt/host_shared/recursive_test_binary | awk '{print $1}')
EOF

echo "✅ Recursive compilation test complete!"
echo "📁 Artifacts ejected to /mnt/host_shared/"
ls -la /mnt/host_shared/
"""
    return script_content

def create_recursive_test_source():
    """
    Create the Rust source code for recursive compilation test
    """
    source_code = """// Phase 18: Recursive Compilation Test Component
// This is a minimal Geometry OS component that demonstrates
// the ability to compile Geometry OS code from within the VM

use std::fs;
use std::io::Write;

fn main() {
    println!("🌱 Geometry OS Recursive Compilation Test");
    println!("===========================================");
    
    // Simple neural state computation
    let inputs = [1.0_f64, 2.0, 3.0, 4.0];
    let neural_state = calculate_neural_state(inputs);
    
    println!("Input: {:?}", inputs);
    println!("Neural State (tanh): {:?}", neural_state);
    
    // Write result to file for host verification
    let result_text = format!(
        "Geometry OS Component Test\\n\
         Input: {:?}\\n\
         Neural State: {:?}\\n\
         Status: SUCCESS\\n",
        inputs, neural_state
    );
    
    match fs::write("/mnt/host_shared/test_result.txt", result_text) {
        Ok(_) => println!("✅ Results written to /mnt/host_shared/test_result.txt"),
        Err(e) => println!("⚠️  Failed to write results: {}", e),
    }
    
    println!("✅ Recursive compilation test complete!");
}

/// Simplified neural state computation
/// In a real Geometry OS component, this would interface with
/// the neural cortex and evolution daemon
fn calculate_neural_state(inputs: [f64; 4]) -> [f64; 4] {
    inputs.map(|x| x.tanh())
}
"""
    return source_code

def create_enhanced_initrd():
    """
    Create an enhanced initrd with build tools and scripts
    
    This modifies the existing Tiny Core initrd to include:
    - bootlocal.sh with build tool installation
    - Recursive compilation scripts
    - Test source code
    """
    print("🔧 Creating enhanced initrd with build tools...")
    
    # Paths
    core_gz_path = Path("temp_linux_embed/iso/boot/core.gz")
    temp_extract_dir = Path("temp_nursery_extract")
    temp_repack_dir = Path("temp_nursery_repack")
    output_initrd = Path("temp_nursery/core_nursery.gz")
    
    # Create directories
    temp_extract_dir.mkdir(exist_ok=True)
    temp_repack_dir.mkdir(exist_ok=True)
    output_initrd.parent.mkdir(exist_ok=True)
    
    # Extract existing initrd
    print(f"📦 Extracting {core_gz_path}...")
    
    # Extract gzip to cpio
    with open(temp_extract_dir / "initrd.cpio", "wb") as f:
        subprocess.run(["gzip", "-dc", str(core_gz_path)], stdout=f, check=True)
    
    # Extract cpio archive
    subprocess.run(
        ["cpio", "-id"],
        stdin=open(temp_extract_dir / "initrd.cpio", "rb"),
        cwd=str(temp_extract_dir),
        check=True
    )
    
    # Create opt/antigravity directory structure
    opt_dir = temp_extract_dir / "opt" / "antigravity"
    opt_dir.mkdir(parents=True, exist_ok=True)
    
    # Write bootlocal.sh
    print("📝 Writing bootlocal.sh...")
    bootlocal_path = temp_extract_dir / "opt" / "bootlocal.sh"
    with open(bootlocal_path, 'w') as f:
        f.write(create_bootlocal_with_build_tools())
    os.chmod(bootlocal_path, 0o755)
    
    # Write recursive test script
    print("📝 Writing recursive test script...")
    test_script_path = opt_dir / "run_recursive_test.sh"
    with open(test_script_path, 'w') as f:
        f.write(create_recursive_test_script())
    os.chmod(test_script_path, 0o755)
    
    # Write test source code
    print("📝 Writing recursive test source...")
    source_path = opt_dir / "recursive_test.rs"
    with open(source_path, 'w') as f:
        f.write(create_recursive_test_source())
    
    # Copy test source to /tmp for easy access
    tmp_dir = temp_extract_dir / "tmp"
    tmp_dir.mkdir(exist_ok=True)
    shutil.copy(source_path, tmp_dir / "recursive_test.rs")
    
    # Repack initrd
    print("📦 Repacking initrd...")
    
    # Create cpio archive
    cpio_process = subprocess.Popen(
        ["find", ".", "-print0"],
        cwd=str(temp_extract_dir),
        stdout=subprocess.PIPE
    )
    cpio_create = subprocess.Popen(
        ["cpio", "-o", "-H", "newc", "-0"],
        stdin=cpio_process.stdout,
        stdout=subprocess.PIPE,
        cwd=str(temp_extract_dir)
    )
    gzip_process = subprocess.Popen(
        ["gzip", "-9"],
        stdin=cpio_create.stdout,
        stdout=open(str(output_initrd), "wb")
    )
    
    # Wait for all processes to complete
    gzip_process.wait()
    cpio_create.wait()
    cpio_process.wait()
    
    if gzip_process.returncode != 0:
        raise RuntimeError("Failed to repack initrd")
    
    # Cleanup
    print("🧹 Cleaning up temporary directories...")
    shutil.rmtree(temp_extract_dir)
    shutil.rmtree(temp_repack_dir)
    
    print(f"✅ Enhanced initrd created: {output_initrd}")
    return output_initrd

def main():
    print("=" * 70)
    print("Phase 18: The Nursery - Enhanced Container Packer")
    print("=" * 70)
    
    # Paths
    kernel_path = Path("vmlinuz-virt")
    output_path = Path("systems/visual_shell/web/ubuntu_nursery.rts.png")
    temp_json_path = Path("temp_nursery.rts")
    
    # Check for kernel
    if not kernel_path.exists():
        print(f"❌ Kernel not found: {kernel_path}")
        print("   Please ensure vmlinuz-virt is in the project root")
        sys.exit(1)
    
    # Create enhanced initrd
    try:
        initrd_path = create_enhanced_initrd()
    except Exception as e:
        print(f"❌ Failed to create enhanced initrd: {e}")
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
        "version": "2.0",
        "phase": "18",
        "name": "ubuntu_nursery",
        "description": "Phase 18: The Nursery - Recursive Compilation Environment",
        "arch": "x86_64",
        "bootable": True,
        "kernel_cmdline": "console=ttyS0 boot=live user=tc quiet disable_vmx=1",
        "boot_method": "qemu-direct",
        "features": {
            "build_tools": ["gcc", "make", "python3", "rustc", "cargo"],
            "filesystem": ["9p-virtio"],
            "recursive_compilation": True,
            "artifact_ejection": True
        },
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
        
        # Clean up initrd
        if initrd_path.exists():
            os.remove(initrd_path)
        
        print("\n" + "=" * 70)
        print("✅ Phase 18 Nursery Artifact Created Successfully!")
        print("=" * 70)
        print(f"📦 Target: {output_path}")
        print(f"🌱 Features:")
        print(f"   - Build Tools: gcc, python3, rustc")
        print(f"   - Filesystem: 9p virtio support")
        print(f"   - Recursive Compilation: Enabled")
        print(f"   - Artifact Ejection: Enabled")
        print(f"\n📝 Next steps:")
        print(f"   1. Boot the container with recursive_launcher.py")
        print(f"   2. The VM will automatically install build tools")
        print(f"   3. Run recursive compilation test")
        print(f"   4. Verify ejected artifacts")
    else:
        print("❌ Conversion Failed!")
        sys.exit(1)

if __name__ == "__main__":
    main()
