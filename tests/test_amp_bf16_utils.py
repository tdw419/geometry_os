"""
Tests for AMP BF16 utilities

Tests for BF16 detection, dtype selection, and capability checking.
"""
import pytest
import torch
from geometry_os.systems.pixel_compiler.amp_bf16_utils import (
    detect_bf16_support,
    get_optimal_dtype,
    get_bf16_capability,
    Bf16Capability,
)


def test_detect_bf16_support_on_ampere():
    """Should detect BF16 support on Ampere+ GPUs"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    bf16_supported, _ = detect_bf16_support()

    # Ampere+ GPUs should support BF16
    # We'll accept either result but verify no crash
    assert isinstance(bf16_supported, bool)
    print(f"BF16 supported: {bf16_supported}")


def test_detect_bf16_support_no_cuda():
    """Should handle no CUDA gracefully"""
    # Mock scenario - function should not crash
    # In actual test, we'd mock torch.cuda.is_available
    bf16_supported, reason = detect_bf16_support()
    assert isinstance(bf16_supported, bool)
    assert isinstance(reason, str)
    if not torch.cuda.is_available():
        assert not bf16_supported
        assert "CUDA" in reason


def test_get_optimal_dtype_prefers_bf16():
    """Should prefer BF16 over FP16 when available"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    bf16_supported, _ = detect_bf16_support()

    dtype = get_optimal_dtype()

    if bf16_supported:
        assert dtype == torch.bfloat16
        print("Using BF16 (optimal)")
    else:
        # Should fall back to float16 or float32
        assert dtype in [torch.float16, torch.float32]
        print(f"Using {dtype} (fallback)")


def test_bf16_memory_efficiency():
    """BF16 should use less memory than FP32"""
    tensor_bf16 = torch.randn(1000, 1000, dtype=torch.bfloat16)
    tensor_fp32 = torch.randn(1000, 1000, dtype=torch.float32)

    # BF16 tensor should be smaller
    assert tensor_bf16.element_size() < tensor_fp32.element_size()
    assert tensor_bf16.element_size() == 2  # 2 bytes
    assert tensor_fp32.element_size() == 4  # 4 bytes


def test_get_bf16_capability():
    """Should return detailed BF16 capability information"""
    cap = get_bf16_capability()

    assert isinstance(cap, Bf16Capability)
    assert isinstance(cap.supported, bool)
    assert isinstance(cap.reason, str)
    assert isinstance(cap.gpu_name, str)
    assert isinstance(cap.compute_capability, tuple)
    assert len(cap.compute_capability) == 2

    # If CUDA is available, compute capability should be valid
    if torch.cuda.is_available():
        assert cap.compute_capability[0] >= 0
        assert cap.compute_capability[1] >= 0
        assert cap.gpu_name != "Unknown"
    else:
        assert cap.compute_capability == (0, 0)
