#!/usr/bin/env python3
"""Test bare metal GPU initialization"""
import subprocess
import os

def test_iso_builds():
    """Test that geometry_os.iso builds successfully"""
    result = subprocess.run(
        ["make", "-C", "kernel/boot", "geometry_os.iso"],
        capture_output=True,
        text=True,
        cwd=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    )
    assert result.returncode == 0, f"ISO build failed: {result.stderr}"

def test_pci_module_exists():
    """Test that pci.c and pci.h exist"""
    assert os.path.exists("kernel/boot/pci.c"), "pci.c not found"
    assert os.path.exists("kernel/boot/pci.h"), "pci.h not found"

def test_gpu_module_exists():
    """Test that gpu.c and gpu.h exist"""
    assert os.path.exists("kernel/boot/gpu.c"), "gpu.c not found"
    assert os.path.exists("kernel/boot/gpu.h"), "gpu.h not found"

def test_ring_module_exists():
    """Test that ring.c and ring.h exist"""
    assert os.path.exists("kernel/boot/ring.c"), "ring.c not found"
    assert os.path.exists("kernel/boot/ring.h"), "ring.h not found"

def test_kernel_includes_gpu():
    """Test that kernel.c includes gpu.h"""
    with open("kernel/boot/kernel.c", "r") as f:
        content = f.read()
    assert '#include "gpu.h"' in content, "gpu.h not included in kernel.c"
    assert '#include "pci.h"' in content, "pci.h not included in kernel.c"

if __name__ == "__main__":
    import pytest
    pytest.main([__file__, "-v"])
