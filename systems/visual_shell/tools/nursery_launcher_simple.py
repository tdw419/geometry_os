#!/usr/bin/env python3
"""
Nursery Launcher (Simplified): Phase 18 Recursive Compilation

This simplified approach:
1. Uses the existing ubuntu.rts.png from Phase 17
2. Injects build tools and test scripts via 9p filesystem at runtime
3. No initrd modification required (no root privileges needed)
4. VM downloads and installs build tools automatically
"""

import asyncio
import json
import logging
import os
import subprocess
import sys
import time
import hashlib
from pathlib import Path

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger("NurseryLauncher")

# Configuration
SHARED_DIR = Path("/tmp/geometry_os/shared")
ARTIFACT_NAME = "ubuntu.rts.png"
TEST_SOURCE_FILE = "recursive_test.rs"
COMPILED_BINARY = "recursive_test_binary"
COMPILATION_REPORT = "compilation_report.txt"
TEST_RESULT = "test_result.txt"
BUILD_SCRIPT = "install_build_tools.sh"

class NurseryLauncherSimple:
    def __init__(self):
        self.shared_dir = SHARED_DIR
        self.rts_path = Path(f"systems/visual_shell/web/{ARTIFACT_NAME}")
        self.vm_process = None
        
    def setup_shared_directory(self):
        """Create and prepare the shared directory for 9p filesystem"""
        logger.info("🔧 Setting up shared directory...")
        
        # Create shared directory
        self.shared_dir.mkdir(parents=True, exist_ok=True)
        
        # Write build tool installation script
        build_script = """#!/bin/bash
# Phase 18: Build Tool Installation Script
# This script runs in the VM to install compilation tools

echo "🌱 Phase 18 Nursery: Installing build tools..."

# Set up network
echo "🌐 Setting up network..."
sudo /usr/sbin/setup-network

# Download and install compiletc (gcc, make, etc.)
echo "📦 Installing compiletc (gcc, make)..."
tce-load -wi compiletc.tcz

# Install Python 3
echo "🐍 Installing Python 3..."
tce-load -wi python3.tcz

# Download and install Rust
echo "🦀 Installing Rust..."
cd /tmp
if [ ! -f rustup-init ]; then
    wget -q https://static.rust-lang.org/rustup/dist/x86_64-unknown-linux-gnu/rustup-init
    chmod +x rustup-init
fi
./rustup-init -y --default-toolchain stable --profile minimal

# Add Rust to PATH
export PATH="$HOME/.cargo/bin:$PATH"

# Verify installations
echo "✅ Build tools installed:"
gcc --version | head -n 1
python3 --version
rustc --version

echo "🌱 Build environment ready!"
"""
        
        build_script_path = self.shared_dir / BUILD_SCRIPT
        with open(build_script_path, 'w') as f:
            f.write(build_script)
        os.chmod(build_script_path, 0o755)
        
        logger.info(f"✅ Build script written to {build_script_path}")
        
        # Write recursive test source code
        test_source = """// Phase 18: Recursive Compilation Test Component
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
        
        source_path = self.shared_dir / TEST_SOURCE_FILE
        with open(source_path, 'w') as f:
            f.write(test_source)
        
        logger.info(f"✅ Test source written to {source_path}")
        
        # Calculate source hash for verification
        with open(source_path, 'rb') as f:
            source_hash = hashlib.sha256(f.read()).hexdigest()
        logger.info(f"📋 Source SHA256: {source_hash[:32]}...")
        
        return source_hash
    
    def extract_rts_artifact(self):
        """Extract the RTS artifact to get kernel and initrd"""
        logger.info("📦 Extracting RTS artifact...")
        
        # Check if artifact exists
        if not self.rts_path.exists():
            logger.error(f"❌ Artifact not found: {self.rts_path}")
            logger.info("   Run inception_packer.py first to create the artifact")
            return None, None
        
        # Extract using pixelrts_v2_extractor.py
        extractor_path = Path("pixelrts_v2_extractor.py")
        if not extractor_path.exists():
            logger.error(f"❌ Extractor not found: {extractor_path}")
            return None, None
        
        # Create extraction directory
        extract_dir = Path("/tmp/geometry_os/runtime")
        extract_dir.mkdir(parents=True, exist_ok=True)
        
        # Run extractor
        cmd = [sys.executable, str(extractor_path), str(self.rts_path), str(extract_dir)]
        result = subprocess.run(cmd, capture_output=True, text=True)
        
        if result.returncode != 0:
            logger.error(f"❌ Extraction failed: {result.stderr}")
            return None, None
        
        kernel_path = extract_dir / "kernel_extracted"
        initrd_path = extract_dir / "initrd_extracted"
        
        if not kernel_path.exists() or not initrd_path.exists():
            logger.error("❌ Extracted files not found")
            return None, None
        
        logger.info(f"✅ Extraction complete:")
        logger.info(f"   Kernel: {kernel_path}")
        logger.info(f"   Initrd: {initrd_path}")
        
        return kernel_path, initrd_path
    
    def launch_vm(self, kernel_path, initrd_path):
        """Launch QEMU VM with 9p virtio support"""
        logger.info("🚀 Launching VM with 9p filesystem support...")
        
        # QEMU command with 9p virtio
        cmd = [
            "qemu-system-x86_64",
            "-m", "2048",  # More memory for Rust compilation
            "-kernel", str(kernel_path),
            "-initrd", str(initrd_path),
            "-append", "console=ttyS0 boot=live user=tc quiet",
            "-virtfs", f"local,path={self.shared_dir},mount_tag=host_shared,security_model=mapped",
            "-device", "virtio-9p-pci,fsdev=fsdev0,mount_tag=host_shared",
            "-fsdev", f"local,id=fsdev0,path={self.shared_dir},security_model=mapped",
            "-nographic"
        ]
        
        logger.info("📋 QEMU command:")
        logger.info("   " + " ".join(cmd))
        
        # Launch VM
        self.vm_process = subprocess.Popen(
            cmd,
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            bufsize=1
        )
        
        logger.info(f"✅ VM launched (PID: {self.vm_process.pid})")
        return self.vm_process
    
    def monitor_vm_output(self, timeout=600):
        """Monitor VM output for compilation progress"""
        logger.info("👀 Monitoring VM output...")
        
        start_time = time.time()
        build_tools_installed = False
        compilation_started = False
        compilation_complete = False
        
        try:
            for line in iter(self.vm_process.stdout.readline, ''):
                if line:
                    print(line.rstrip())
                    
                    # Look for boot completion
                    if "tc@box:~$" in line and not build_tools_installed:
                        logger.info("✅ VM booted, installing build tools...")
                        build_tools_installed = True
                        
                        # Send commands to install build tools
                        self.vm_process.stdin.write("sudo mkdir -p /mnt/host_shared\\n")
                        self.vm_process.stdin.write("sudo mount -t 9p -o trans=virtio,version=9p2000.L host_shared /mnt/host_shared\\n")
                        self.vm_process.stdin.write("cd /mnt/host_shared\\n")
                        self.vm_process.stdin.write("bash install_build_tools.sh\\n")
                        self.vm_process.stdin.flush()
                    
                    # Look for build tool installation
                    if "Build tools installed" in line:
                        logger.info("🔨 Build tools installation complete")
                        compilation_started = True
                        
                        # Send compilation command
                        self.vm_process.stdin.write("export PATH=$HOME/.cargo/bin:$PATH\\n")
                        self.vm_process.stdin.write("rustc recursive_test.rs -o recursive_test_binary\\n")
                        self.vm_process.stdin.flush()
                    
                    # Look for compilation completion
                    if "Recursive compilation test complete" in line:
                        compilation_complete = True
                        logger.info("✅ Compilation complete!")
                        break
                    
                    # Check timeout
                    if time.time() - start_time > timeout:
                        logger.warning(f"⏱️  Timeout after {timeout}s")
                        break
                    
                    # Check if VM has exited
                    if self.vm_process.poll() is not None:
                        logger.info("VM process exited")
                        break
        
        except KeyboardInterrupt:
            logger.info("🛑 Interrupted by user")
        
        return compilation_complete
    
    def verify_artifacts(self):
        """Verify that compilation artifacts were ejected"""
        logger.info("🔍 Verifying ejected artifacts...")
        
        artifacts = {
            "Compiled Binary": self.shared_dir / COMPILED_BINARY,
            "Compilation Report": self.shared_dir / COMPILATION_REPORT,
            "Test Result": self.shared_dir / TEST_RESULT
        }
        
        found = {}
        for name, path in artifacts.items():
            if path.exists():
                size = path.stat().st_size
                logger.info(f"✅ {name}: {path} ({size} bytes)")
                
                # Calculate hash
                with open(path, 'rb') as f:
                    file_hash = hashlib.sha256(f.read()).hexdigest()
                logger.info(f"   SHA256: {file_hash[:32]}...")
                
                found[name] = {
                    "path": str(path),
                    "size": size,
                    "hash": file_hash
                }
                
                # Display content for text files
                if name in ["Compilation Report", "Test Result"]:
                    with open(path, 'r') as f:
                        content = f.read()
                        logger.info(f"   Content:\\n{content}")
            else:
                logger.warning(f"❌ {name}: {path} not found")
        
        return found
    
    def run_compiled_binary(self):
        """Run the compiled binary and verify output"""
        binary_path = self.shared_dir / COMPILED_BINARY
        
        if not binary_path.exists():
            logger.warning("⚠️  Compiled binary not found, skipping execution")
            return False
        
        logger.info("🚀 Running compiled binary...")
        
        # Make binary executable
        os.chmod(binary_path, 0o755)
        
        # Run binary
        try:
            result = subprocess.run(
                [str(binary_path)],
                capture_output=True,
                text=True,
                timeout=10
            )
            
            logger.info("📋 Binary output:")
            print(result.stdout)
            
            if result.returncode == 0:
                logger.info("✅ Binary executed successfully")
                return True
            else:
                logger.error(f"❌ Binary execution failed (code: {result.returncode})")
                if result.stderr:
                    logger.error(f"   Error: {result.stderr}")
                return False
        
        except subprocess.TimeoutExpired:
            logger.error("❌ Binary execution timeout")
            return False
        except Exception as e:
            logger.error(f"❌ Binary execution error: {e}")
            return False
    
    def cleanup(self):
        """Clean up VM process"""
        if self.vm_process and self.vm_process.poll() is None:
            logger.info("🛑 Terminating VM...")
            self.vm_process.terminate()
            try:
                self.vm_process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                logger.warning("⚠️  VM did not terminate gracefully, killing...")
                self.vm_process.kill()
    
    def run(self):
        """Run the complete recursive compilation test"""
        logger.info("=" * 70)
        logger.info("Phase 18: The Nursery - Recursive Compilation Test")
        logger.info("=" * 70)
        
        try:
            # Step 1: Setup shared directory
            source_hash = self.setup_shared_directory()
            
            # Step 2: Extract RTS artifact
            kernel_path, initrd_path = self.extract_rts_artifact()
            if not kernel_path or not initrd_path:
                logger.error("❌ Failed to extract artifact")
                return False
            
            # Step 3: Launch VM
            self.launch_vm(kernel_path, initrd_path)
            
            # Step 4: Wait a bit for VM to boot
            logger.info("⏳ Waiting for VM to boot (30s)...")
            time.sleep(30)
            
            # Step 5: Monitor VM output
            compilation_complete = self.monitor_vm_output(timeout=600)
            
            # Step 6: Verify artifacts
            artifacts = self.verify_artifacts()
            
            # Step 7: Run compiled binary
            binary_executed = self.run_compiled_binary()
            
            # Summary
            logger.info("=" * 70)
            logger.info("📊 Test Summary")
            logger.info("=" * 70)
            logger.info(f"Compilation Complete: {compilation_complete}")
            logger.info(f"Artifacts Found: {len(artifacts)}/3")
            logger.info(f"Binary Executed: {binary_executed}")
            
            if compilation_complete and len(artifacts) >= 2 and binary_executed:
                logger.info("✅ Phase 18 Recursive Compilation Test: SUCCESS")
                return True
            else:
                logger.error("❌ Phase 18 Recursive Compilation Test: FAILED")
                return False
        
        except Exception as e:
            logger.error(f"❌ Test failed with exception: {e}")
            import traceback
            traceback.print_exc()
            return False
        
        finally:
            self.cleanup()

def main():
    launcher = NurseryLauncherSimple()
    success = launcher.run()
    sys.exit(0 if success else 1)

if __name__ == "__main__":
    main()
