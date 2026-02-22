# tests/test_cuda_detector.py
import pytest
import sys
import os

# Add parent directory to path to allow imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from geometry_os.systems.pixel_compiler.cuda_detector import (
    get_cuda_version,
    get_gpu_architecture,
    get_compute_capability,
    supports_cuda_version,
    get_supported_architectures,
)

def test_get_cuda_version():
    """Should detect CUDA version"""
    version = get_cuda_version()

    # Should return a version tuple or None
    assert version is None or isinstance(version, tuple)
    if version:
        assert len(version) == 2 or len(version) == 3
        assert all(isinstance(x, int) for x in version)
        print(f"CUDA version: {version}")

def test_get_compute_capability():
    """Should detect compute capability"""
    if not supports_cuda_version((11, 0)):
        pytest.skip("CUDA 11+ not available")

    capability = get_compute_capability(device=0)

    assert capability is not None
    assert isinstance(capability, tuple)
    assert len(capability) == 2
    print(f"Compute capability: {capability[0]}.{capability[1]}")

def test_get_gpu_architecture():
    """Should detect GPU architecture"""
    if not supports_cuda_version((11, 0)):
        pytest.skip("CUDA not available")

    arch = get_gpu_architecture(device=0)

    assert arch is not None
    assert isinstance(arch, str)
    print(f"GPU architecture: {arch}")

def test_blackwell_architecture_detection():
    """Should detect Blackwell architecture (RTX 50xx)"""
    if not supports_cuda_version((12, 6)):
        pytest.skip("CUDA 12.6+ not available")

    capability = get_compute_capability(device=0)
    if capability:
        arch = get_gpu_architecture(device=0)
        # Blackwell is compute capability 10.x
        if capability[0] >= 10:
            assert 'blackwell' in arch.lower() or '10' in arch
            print(f"Detected Blackwell: {arch}")

def test_get_supported_architectures():
    """Should return list of supported architectures"""
    archs = get_supported_architectures()

    assert isinstance(archs, list)
    assert len(archs) > 0

    # Should include common architectures
    expected_archs = ['volta', 'turing', 'ampere', 'hopper', 'blackwell']
    for expected in expected_archs:
        assert any(expected in arch.lower() for arch in archs)

def test_nvcc_compatibility():
    """Should check NVCC compatibility"""
    from geometry_os.systems.pixel_compiler.cuda_detector import get_nvcc_version, get_nvcc_compute_capabilities

    nvcc_version = get_nvcc_version()

    if nvcc_version:
        print(f"NVCC version: {nvcc_version}")
        assert isinstance(nvcc_version, tuple)

        capabilities = get_nvcc_compute_capabilities()
        print(f"NVCC supported capabilities: {capabilities}")
        assert isinstance(capabilities, list)
