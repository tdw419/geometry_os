"""
Tests for Unified AMP-Lightning Configuration
"""
import pytest
import torch
from dataclasses import asdict
from geometry_os.systems.pixel_compiler.amp_config import AMPConfig, LightningAmpConfig


def test_unified_config_from_dict():
    """Should create unified config from dictionary"""
    config_dict = {
        'enabled': True,
        'dtype': 'bfloat16',
        'learning_rate': 0.001,
        'max_epochs': 10,
        'gradient_clip_val': 1.0,
    }

    config = LightningAmpConfig.from_dict(config_dict)

    assert config.enabled == True
    assert str(config.dtype) == 'bfloat16' or config.dtype == torch.bfloat16
    assert config.learning_rate == 0.001
    assert config.max_epochs == 10
    assert config.gradient_clip_val == 1.0


def test_unified_config_auto_detection():
    """Should auto-detect optimal settings"""
    config = LightningAmpConfig.auto()

    assert config.enabled
    assert config.dtype in ['bfloat16', 'float16', 'float32']
    assert config.max_epochs > 0


def test_unified_config_to_lightning_kwargs():
    """Should convert to Lightning Trainer kwargs"""
    config = LightningAmpConfig.auto()

    # Check that basic config attributes are set correctly
    assert config.precision in ['bf16-mixed', '16-mixed', '32-true']
    assert config.max_epochs > 0
    assert config.accelerator == 'auto'
    assert config.devices == -1

    # Test to_lightning_kwargs if Lightning is available
    try:
        kwargs = config.to_lightning_kwargs()
        assert 'precision' in kwargs
        assert 'max_epochs' in kwargs
        assert 'accelerator' in kwargs
    except ImportError as e:
        # Lightning not installed, skip this part of the test
        pytest.skip("PyTorch Lightning not installed")


def test_unified_config_with_checkpointing():
    """Should handle checkpoint configuration"""
    config = LightningAmpConfig(
        enabled=True,
        checkpoint_dir='./checkpoints',
        save_top_k=3,
        monitor='val_loss',
    )

    # Check config attributes
    assert config.checkpoint_dir == './checkpoints'
    assert config.save_top_k == 3
    assert config.monitor == 'val_loss'

    # Test to_lightning_kwargs if Lightning is available
    try:
        lightning_kwargs = config.to_lightning_kwargs()
        assert 'callbacks' in lightning_kwargs
        assert len(lightning_kwargs['callbacks']) > 0
    except ImportError as e:
        # Lightning not installed, skip this part of the test
        pytest.skip("PyTorch Lightning not installed")


def test_unified_config_get_dtype():
    """Should get PyTorch dtype from string config"""
    config = LightningAmpConfig(dtype='float32')

    dtype = config.get_dtype()
    assert dtype == torch.float32


def test_unified_config_to_dict():
    """Should convert to dictionary"""
    config = LightningAmpConfig(
        enabled=True,
        learning_rate=0.001,
        max_epochs=10,
    )

    config_dict = config.to_dict()

    assert config_dict['enabled'] == True
    assert config_dict['learning_rate'] == 0.001
    assert config_dict['max_epochs'] == 10
