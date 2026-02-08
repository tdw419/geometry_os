"""
Tests for Lightning Trainer Wrapper
"""
import pytest
import torch
from torch.utils.data import TensorDataset, DataLoader

# Try importing Lightning
try:
    from lightning.pytorch import LightningModule, Trainer
    LIGHTNING_AVAILABLE = True
except ImportError:
    try:
        from pytorch_lightning import LightningModule, Trainer
        LIGHTNING_AVAILABLE = True
    except ImportError:
        LIGHTNING_AVAILABLE = False
        LightningModule = object
        Trainer = object

from geometry_os.systems.pixel_compiler.amp_trainer import RtsLightningTrainer
from geometry_os.systems.pixel_compiler.amp_config import LightningAmpConfig

pytestmark = pytest.mark.skipif(not LIGHTNING_AVAILABLE, reason="PyTorch Lightning not installed")


class DummyLightningModule(LightningModule):
    def __init__(self):
        super().__init__()
        self.layer = torch.nn.Linear(10, 5)

    def forward(self, x):
        return self.layer(x)

    def training_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        loss = torch.nn.functional.mse_loss(y_hat, y)
        return loss

    def validation_step(self, batch, batch_idx):
        x, y = batch
        y_hat = self(x)
        loss = torch.nn.functional.mse_loss(y_hat, y)
        self.log('val_loss', loss)
        return loss

    def configure_optimizers(self):
        return torch.optim.Adam(self.parameters())


def test_trainer_creation_with_config():
    """Should create trainer with unified config"""
    config = LightningAmpConfig.auto()

    trainer = RtsLightningTrainer(
        config=config,
    )

    assert trainer is not None
    assert trainer.config == config


def test_trainer_fit_with_dummy_data():
    """Should train with dummy data"""
    config = LightningAmpConfig(
        max_epochs=2,
        log_every_n_steps=1,
        logger_type='none',  # Disable logging for tests
    )

    model = DummyLightningModule()

    # Create dummy data
    train_dataset = TensorDataset(
        torch.randn(100, 10),
        torch.randn(100, 5)
    )
    val_dataset = TensorDataset(
        torch.randn(20, 10),
        torch.randn(20, 5)
    )
    train_loader = DataLoader(train_dataset, batch_size=10)
    val_loader = DataLoader(val_dataset, batch_size=10)

    trainer = RtsLightningTrainer(config=config)

    # This should not crash
    try:
        trainer.fit(model, train_loader, val_loader)
        success = True
    except Exception as e:
        print(f"Training failed: {e}")
        success = False

    assert success, "Training should complete without errors"


def test_trainer_checkpoint_resume():
    """Should save and resume from checkpoint"""
    import tempfile
    import os

    with tempfile.TemporaryDirectory() as tmpdir:
        config = LightningAmpConfig(
            max_epochs=1,
            checkpoint_dir=tmpdir,
            save_top_k=1,
            logger_type='none',
        )

        model = DummyLightningModule()
        trainer = RtsLightningTrainer(config=config)

        # Create dummy data
        train_dataset = TensorDataset(
            torch.randn(100, 10),
            torch.randn(100, 5)
        )
        val_dataset = TensorDataset(
            torch.randn(20, 10),
            torch.randn(20, 5)
        )
        train_loader = DataLoader(train_dataset, batch_size=10)
        val_loader = DataLoader(val_dataset, batch_size=10)

        # Train and save checkpoint
        trainer.fit(model, train_loader, val_loader)

        # Find checkpoint file
        ckpt_files = [f for f in os.listdir(tmpdir) if f.endswith('.ckpt')]
        assert len(ckpt_files) > 0, "Should have saved checkpoint"

        # Resume training
        ckpt_path = os.path.join(tmpdir, ckpt_files[0])
        trainer2 = RtsLightningTrainer(config=config)
        trainer2.fit(model, train_loader, val_loader, ckpt_path=ckpt_path)


def test_trainer_validate():
    """Should run validation"""
    config = LightningAmpConfig(
        max_epochs=1,
        logger_type='none',
    )

    model = DummyLightningModule()

    # Create dummy data
    val_dataset = TensorDataset(
        torch.randn(20, 10),
        torch.randn(20, 5)
    )
    val_loader = DataLoader(val_dataset, batch_size=10)

    trainer = RtsLightningTrainer(config=config)

    # Run validation
    results = trainer.validate(model, val_loader)
    assert results is not None
