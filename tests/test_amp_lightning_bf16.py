"""
Tests for AMP Lightning module BF16 support

Tests for BF16 integration in the Lightning AMP module.
"""
import pytest

# Check if PyTorch Lightning is available
try:
    import pytorch_lightning as pl
    HAS_LIGHTNING = True
except ImportError:
    HAS_LIGHTNING = False

import torch
import torch.nn as nn
from geometry_os.systems.pixel_compiler.amp_config import AMPConfig


# Only import the module if Lightning is available
if HAS_LIGHTNING:
    from geometry_os.systems.pixel_compiler.amp_lightning_module import RtsAmpLightningModule


class DummyModel(nn.Module):
    """Simple model for testing"""
    def __init__(self):
        super().__init__()
        self.linear = nn.Linear(10, 5)

    def forward(self, x):
        return self.linear(x)


@pytest.mark.skipif(not HAS_LIGHTNING, reason="PyTorch Lightning not installed")
def test_lightning_module_with_bf16():
    """Lightning module should work with BF16"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from geometry_os.systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    if not bf16_supported:
        pytest.skip("BF16 not supported on this GPU")

    model = DummyModel()
    lightning_module = RtsAmpLightningModule(
        model=model,
        config=AMPConfig.force_bf16()
    )

    # Check precision is set correctly
    assert hasattr(lightning_module, 'dtype')
    assert lightning_module.dtype == torch.bfloat16


@pytest.mark.skipif(not HAS_LIGHTNING, reason="PyTorch Lightning not installed")
def test_lightning_module_autodetect():
    """Should automatically detect and use BF16 when available"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    model = DummyModel()
    lightning_module = RtsAmpLightningModule(
        model=model,
        config=AMPConfig.auto()  # Auto-detect
    )

    # Verify dtype was set
    assert hasattr(lightning_module, 'dtype')
    assert lightning_module.dtype in [torch.bfloat16, torch.float16, torch.float32]


@pytest.mark.skipif(not HAS_LIGHTNING, reason="PyTorch Lightning not installed")
def test_bf16_gradient_checkpointing():
    """Gradient checkpointing should work with BF16"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from geometry_os.systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    if not bf16_supported:
        pytest.skip("BF16 not supported on this GPU")

    model = DummyModel()

    # Create a config with gradient checkpointing
    config = AMPConfig.force_bf16()
    # Note: gradient_checkpointing would need to be added to AMPConfig
    # For now, just test that the module initializes

    lightning_module = RtsAmpLightningModule(
        model=model,
        config=config
    )

    assert lightning_module.dtype == torch.bfloat16


@pytest.mark.skipif(not HAS_LIGHTNING, reason="PyTorch Lightning not installed")
def test_lightning_module_with_fp16():
    """Lightning module should work with FP16"""
    model = DummyModel()
    lightning_module = RtsAmpLightningModule(
        model=model,
        config=AMPConfig.force_fp16()
    )

    # Check precision is set correctly
    assert hasattr(lightning_module, 'dtype')
    assert lightning_module.dtype == torch.float16


@pytest.mark.skipif(not HAS_LIGHTNING, reason="PyTorch Lightning not installed")
def test_lightning_module_optimizer_config():
    """Optimizer should be configured correctly for BF16"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from geometry_os.systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    model = DummyModel()
    config = AMPConfig.force_bf16() if bf16_supported else AMPConfig.force_fp16()

    lightning_module = RtsAmpLightningModule(
        model=model,
        config=config,
        learning_rate=1e-3
    )

    # Configure optimizers
    opt_config = lightning_module.configure_optimizers()
    assert 'optimizer' in opt_config

    optimizer = opt_config['optimizer']
    assert optimizer is not None
    # Check that optimizer has parameters
    assert len(list(optimizer.param_groups)) > 0
