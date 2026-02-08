"""
Tests for AMP Trainer BF16 support

Tests for BF16 auto-detection in the trainer.
"""
import pytest
import torch
import torch.nn as nn
from geometry_os.systems.pixel_compiler.amp_trainer import AMPTrainer
from geometry_os.systems.pixel_compiler.amp_config import AMPConfig


def test_trainer_auto_detect_bf16():
    """Trainer should auto-detect BF16 capability"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from geometry_os.systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    model = nn.Linear(10, 5)
    trainer = AMPTrainer(
        model=model,
        amp_config=AMPConfig.auto(),
    )

    expected_dtype = torch.bfloat16 if bf16_supported else torch.float16
    assert trainer.precision_dtype in [expected_dtype, torch.float32]


def test_trainer_force_bf16_fallback():
    """Should handle forced BF16 gracefully when not supported"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from geometry_os.systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    if not bf16_supported:
        # Should raise error when forcing BF16 on unsupported hardware
        with pytest.raises(RuntimeError):
            config = AMPConfig.force_bf16()
            model = nn.Linear(10, 5)
            trainer = AMPTrainer(
                model=model,
                amp_config=config,
            )
    else:
        # Should work when BF16 is supported
        config = AMPConfig.force_bf16()
        model = nn.Linear(10, 5)
        trainer = AMPTrainer(
            model=model,
            amp_config=config,
        )
        assert trainer.is_using_bf16


def test_trainer_with_fp16():
    """Trainer should work with FP16 config"""
    model = nn.Linear(10, 5)
    trainer = AMPTrainer(
        model=model,
        amp_config=AMPConfig.force_fp16(),
    )

    assert not trainer.is_using_bf16
    assert trainer.precision_dtype == torch.float16


def test_trainer_bf16_properties():
    """Trainer should expose BF16-related properties"""
    if not torch.cuda.is_available():
        pytest.skip("CUDA not available")

    from geometry_os.systems.pixel_compiler.amp_bf16_utils import detect_bf16_support
    bf16_supported, _ = detect_bf16_support()

    model = nn.Linear(10, 5)
    config = AMPConfig.auto()

    trainer = AMPTrainer(
        model=model,
        amp_config=config,
    )

    # Check properties
    assert hasattr(trainer, 'is_using_bf16')
    assert hasattr(trainer, 'precision_dtype')

    if bf16_supported:
        assert trainer.is_using_bf16
        assert trainer.precision_dtype == torch.bfloat16
