#!/usr/bin/env python3
"""
Test Geometry OS kernel module

Requires: sudo, loaded geometry_os.ko module
"""
import pytest
import os
import fcntl
import struct
import ctypes

GEOS_DEVICE = "/dev/geometry_os"
GEOS_MAGIC = ord('G')

# Struct sizes for ioctl encoding
GEOS_SPIRV_LOAD_SIZE = ctypes.sizeof(ctypes.c_uint64) + ctypes.sizeof(ctypes.c_uint32) * 2  # 16 bytes
GEOS_EXECUTE_SIZE = ctypes.sizeof(ctypes.c_uint32) * 2 + ctypes.sizeof(ctypes.c_uint64) + ctypes.sizeof(ctypes.c_uint32) * 2  # 24 bytes
GEOS_UNIFORMS_SIZE = ctypes.sizeof(ctypes.c_uint32) * 4  # 16 bytes

# Ioctl commands using proper encoding (matches kernel _IOW/_IOR macros)
# _IOW(dir, type, nr, size) on Linux: (dir << 30) | (type << 8) | (nr << 0) | (size << 16)
def _IOW(magic, nr, size):
    return (1 << 30) | (ord(str(magic)) << 8) | (nr << 0) | (size << 16)

def _IOR(magic, nr, size):
    return (2 << 30) | (ord(str(magic)) << 8) | (nr << 0) | (size << 16)

GEOS_IOCTL_LOAD_SPIRV = _IOW('G', 0x01, GEOS_SPIRV_LOAD_SIZE)
GEOS_IOCTL_EXECUTE = _IOW('G', 0x02, GEOS_EXECUTE_SIZE)
GEOS_IOCTL_GET_OUTPUT = _IOR('G', 0x03, ctypes.sizeof(ctypes.c_int))
GEOS_IOCTL_SET_UNIFORMS = _IOW('G', 0x04, GEOS_UNIFORMS_SIZE)

def _has_device():
    return os.path.exists(GEOS_DEVICE)

def test_device_exists():
    """Test that /dev/geometry_os exists"""
    assert _has_device(), f"{GEOS_DEVICE} not found - is module loaded?"

def test_device_openable():
    """Test that device can be opened"""
    if not _has_device():
        pytest.skip("Module not loaded")

    with open(GEOS_DEVICE, "r+b") as f:
        assert f is not None

def test_ioctl_load_spirv_valid():
    """Test LOAD_SPIRV with valid SPIR-V"""
    if not _has_device():
        pytest.skip("Module not loaded")

    # Minimal valid SPIR-V (magic + version)
    spirv = bytes([
        0x03, 0x02, 0x23, 0x07,  # Magic: 0x07230203
        0x00, 0x00, 0x01, 0x00,  # Version 1.0
        0x00, 0x00, 0x00, 0x00,  # Generator
        0x05, 0x00, 0x00, 0x00,  # Bound
        0x00, 0x00, 0x00, 0x00,  # Schema
    ])

    with open(GEOS_DEVICE, "r+b") as f:
        # Create struct: u64 ptr, u32 size, u32 padding
        spirv_ptr = ctypes.addressof(ctypes.create_string_buffer(spirv))
        arg = struct.pack("QII", spirv_ptr, len(spirv), 0)

        try:
            result = fcntl.ioctl(f.fileno(), GEOS_IOCTL_LOAD_SPIRV, arg)
            assert result == 0, f"ioctl returned {result}"
        except OSError as e:
            pytest.fail(f"ioctl failed: {e}")

def test_ioctl_load_spirv_invalid_magic():
    """Test LOAD_SPIRV rejects invalid magic"""
    if not _has_device():
        pytest.skip("Module not loaded")

    # Invalid SPIR-V (wrong magic)
    spirv = bytes([0xDE, 0xAD, 0xBE, 0xEF] + [0] * 16)

    with open(GEOS_DEVICE, "r+b") as f:
        spirv_ptr = ctypes.addressof(ctypes.create_string_buffer(spirv))
        arg = struct.pack("QII", spirv_ptr, len(spirv), 0)

        with pytest.raises(OSError):
            fcntl.ioctl(f.fileno(), GEOS_IOCTL_LOAD_SPIRV, arg)

def test_ioctl_set_uniforms():
    """Test SET_UNIFORMS ioctl"""
    if not _has_device():
        pytest.skip("Module not loaded")

    with open(GEOS_DEVICE, "r+b") as f:
        # struct: u32 width, u32 height, float time, float padding
        arg = struct.pack("IIff", 1024, 768, 0.0, 0.0)

        try:
            result = fcntl.ioctl(f.fileno(), GEOS_IOCTL_SET_UNIFORMS, arg)
            assert result == 0
        except OSError as e:
            pytest.fail(f"ioctl failed: {e}")

if __name__ == "__main__":
    pytest.main([__file__, "-v"])
