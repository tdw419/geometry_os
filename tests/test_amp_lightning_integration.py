"""
Tests for AMP Lightning Integration
"""
import pytest
import torch

# Try importing Lightning
try:
    from lightning.pytorch import LightningModule
    LIGHTNING_AVAILABLE = True
except ImportError:
    try:
        from pytorch_lightning import LightningModule
        LIGHTNING_AVAILABLE = True
    except ImportError:
        LIGHTNING_AVAILABLE = False
        LightningModule = object

from geometry_os.systems.pixel_compiler.amp_lightning_module import RtsAmpLightningModule
from geometry_os.systems.pixel_compiler.amp_config import LightningAmpConfig

pytestmark = pytest.mark.skipif(not LIGHTNING_AVAILABLE, reason="PyTorch Lightning not installed")


class SimpleModel(torch.nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = torch.nn.Sequential(
            torch.nn.Linear(10, 20),
            torch.nn.ReLU(),
            torch.nn.Linear(20, 5),
        )

    def forward(self, x):
        return self.layers(x)


def test_lightning_module_with_unified_config():
    """Should work with unified config"""
    model = SimpleModel()
    config = LightningAmpConfig.auto()

    lightning_module = RtsAmpLightningModule(
        model=model,
        config=config,
    )

    assert lightning_module is not None
    assert lightning_module.model is model


def test_lightning_module_training_step():
    """Training step should work"""
    model = SimpleModel()
    config = LightningAmpConfig(
        learning_rate=0.001,
    )

    class TestModule(RtsAmpLightningModule):
        def training_step(self, batch, batch_idx):
            x, y = batch
            y_hat = self(x)
            loss = torch.nn.functional.mse_loss(y_hat, y)
            self.log('train_loss', loss)
            return loss

        def validation_step(self, batch, batch_idx):
            x, y = batch
            y_hat = self(x)
            loss = torch.nn.functional.mse_loss(y_hat, y)
            self.log('val_loss', loss)
            return loss

    lightning_module = TestModule(model=model, config=config)

    # Simulate training step
    batch = (torch.randn(4, 10), torch.randn(4, 5))
    loss = lightning_module.training_step(batch, 0)

    assert loss is not None
    assert loss.item() > 0  # MSE loss should be positive


def test_lightning_module_configure_optimizers():
    """Should configure optimizer with AMP settings"""
    model = SimpleModel()
    config = LightningAmpConfig(
        learning_rate=0.001,
    )

    class TestModule(RtsAmpLightningModule):
        def training_step(self, batch, batch_idx):
            x, y = batch
            y_hat = self(x)
            loss = torch.nn.functional.mse_loss(y_hat, y)
            return loss

        def validation_step(self, batch, batch_idx):
            x, y = batch
            y_hat = self(x)
            loss = torch.nn.functional.mse_loss(y_hat, y)
            return loss

    lightning_module = TestModule(model=model, config=config)

    optimizer = lightning_module.configure_optimizers()

    assert optimizer is not None
    assert isinstance(optimizer, torch.optim.Optimizer)
