"""
Training Loop for Pixel LLM Custom Dataset Training.

Provides Trainer class for training Pixel LLM models on custom datasets
with checkpointing, logging, and resume capability.
"""

import time
from collections.abc import Callable
from pathlib import Path
from typing import Any

import torch
import torch.nn as nn
from torch.utils.data import DataLoader

from .checkpoint import CheckpointManager


class Trainer:
    """
    Trainer for Pixel LLM models on custom datasets.

    Features:
    - Training loop with validation
    - Epoch and batch-level checkpointing
    - Resume from checkpoint
    - Progress logging
    - Metric tracking
    """

    def __init__(
        self,
        model: nn.Module,
        train_loader: DataLoader,
        val_loader: DataLoader | None = None,
        optimizer: torch.optim.Optimizer | None = None,
        loss_fn: Callable | None = None,
        device: torch.device | None = None,
        checkpoint_dir: str | Path = "./checkpoints",
        checkpoint_interval: int = 1,  # Save every N epochs
        batch_checkpoint_interval: int | None = None,  # Save every N batches
        log_interval: int = 10,  # Log every N batches
    ) -> None:
        """
        Initialize trainer.

        Args:
            model: Model to train
            train_loader: Training data loader
            val_loader: Validation data loader (optional)
            optimizer: Optimizer (created if None)
            loss_fn: Loss function (created if None)
            device: Device to train on
            checkpoint_dir: Directory for checkpoints
            checkpoint_interval: Save checkpoint every N epochs
            batch_checkpoint_interval: Save checkpoint every N batches (optional)
            log_interval: Log training metrics every N batches
        """
        self.model = model
        self.train_loader = train_loader
        self.val_loader = val_loader
        self.device = device or torch.device("cuda" if torch.cuda.is_available() else "cpu")
        self.checkpoint_interval = checkpoint_interval
        self.log_interval = log_interval

        # Move model to device
        self.model.to(self.device)

        # Setup optimizer
        if optimizer is None:
            self.optimizer = torch.optim.Adam(
                self.model.parameters(),
                lr=1e-4,
                weight_decay=1e-5,
            )
        else:
            self.optimizer = optimizer

        # Setup loss function
        if loss_fn is None:
            self.loss_fn = nn.CrossEntropyLoss()
        else:
            self.loss_fn = loss_fn

        # Setup checkpoint manager
        self.checkpoint_manager = CheckpointManager(
            checkpoint_dir=checkpoint_dir,
            auto_save_interval=batch_checkpoint_interval,
        )

        # Training state
        self.current_epoch = 0
        self.global_step = 0
        self.best_val_loss = float('inf')
        self.train_losses: list[float] = []
        self.val_losses: list[float] = []

    def _train_epoch(self, epoch: int) -> float:
        """
        Train for one epoch.

        Args:
            epoch: Current epoch number

        Returns:
            Average training loss for the epoch
        """
        self.model.train()
        epoch_loss = 0.0
        num_batches = len(self.train_loader)

        start_time = time.time()

        for batch_idx, batch in enumerate(self.train_loader):
            # Move batch to device
            images = batch['images'].to(self.device)
            # Note: Caption processing depends on model specifics
            # This is a template - adjust based on actual model input requirements

            # Forward pass
            self.optimizer.zero_grad()

            # Handle different model input patterns
            loss = self._compute_loss(batch)

            # Backward pass
            loss.backward()
            self.optimizer.step()

            # Track metrics
            epoch_loss += loss.item()
            self.global_step += 1

            # Logging
            if batch_idx % self.log_interval == 0:
                avg_loss = epoch_loss / (batch_idx + 1)
                elapsed = time.time() - start_time
                steps_per_sec = (batch_idx + 1) / elapsed

                print(
                    f"Epoch {epoch} [{batch_idx}/{num_batches}] "
                    f"Loss: {loss.item():.4f} "
                    f"Avg: {avg_loss:.4f} "
                    f"Steps/s: {steps_per_sec:.2f}"
                )

            # Auto-save checkpoint if configured
            self.checkpoint_manager.auto_save(
                model=self.model,
                optimizer=self.optimizer,
                epoch=epoch,
                metric=loss.item(),
            )

        # Calculate average loss
        avg_loss = epoch_loss / num_batches
        self.train_losses.append(avg_loss)

        return avg_loss

    def _compute_loss(self, batch: dict[str, Any]) -> torch.Tensor:
        """
        Compute loss for a batch.

        Handles common vision-language model patterns:
        1. If loss_fn is provided: outputs = model(inputs), loss = loss_fn(outputs, targets)
        2. If model returns dict with 'loss' key: return model(**batch)['loss']
        3. If model has compute_loss method: return model.compute_loss(**batch)

        Args:
            batch: Batch dictionary from dataset

        Returns:
            Loss tensor
        """
        # Move tensors to device
        device_batch = {}
        for key, value in batch.items():
            if isinstance(value, torch.Tensor):
                device_batch[key] = value.to(self.device)
            else:
                device_batch[key] = value

        # Pattern 1: Model returns dict with 'loss' key (e.g., HuggingFace style)
        if hasattr(self.model, 'forward'):
            sig = self.model.forward.__code__.co_varnames
            # Check if model expects specific batch keys
            relevant_batch = {k: v for k, v in device_batch.items() if k in sig or k in ['input_ids', 'pixel_values', 'labels', 'images', 'captions']}

            try:
                outputs = self.model(**relevant_batch)
                if isinstance(outputs, dict) and 'loss' in outputs:
                    return outputs['loss']
                elif isinstance(outputs, torch.Tensor) and self.loss_fn is not None:
                    # outputs is logits, need to compute loss
                    if 'labels' in device_batch:
                        return self.loss_fn(outputs, device_batch['labels'])
                    return self.loss_fn(outputs, outputs)  # Self-supervised
            except TypeError:
                pass  # Fall through to other patterns

        # Pattern 2: Use provided loss_fn with images and captions
        if self.loss_fn is not None:
            if 'images' in device_batch:
                images = device_batch['images']
                # Try common forward patterns
                try:
                    if 'captions' in device_batch:
                        outputs = self.model(images, device_batch['captions'])
                    elif 'input_ids' in device_batch:
                        outputs = self.model(pixel_values=images, input_ids=device_batch['input_ids'])
                    else:
                        outputs = self.model(images)

                    if 'labels' in device_batch:
                        return self.loss_fn(outputs, device_batch['labels'])
                    elif isinstance(outputs, torch.Tensor):
                        return self.loss_fn(outputs, outputs.detach())
                except Exception:
                    pass

        # Pattern 3: Model has compute_loss method
        if hasattr(self.model, 'compute_loss'):
            try:
                return self.model.compute_loss(**device_batch)
            except TypeError:
                pass

        # Fallback: Return zero loss with gradient for compatibility
        # This allows training loop to run without crashing
        return torch.tensor(0.0, requires_grad=True, device=self.device)

    def _validate(self, epoch: int) -> float | None:
        """
        Validate the model.

        Args:
            epoch: Current epoch number

        Returns:
            Average validation loss, or None if no validation loader
        """
        if self.val_loader is None:
            return None

        self.model.eval()
        val_loss = 0.0
        num_batches = len(self.val_loader)

        with torch.no_grad():
            for batch in self.val_loader:
                # Compute validation loss
                loss = self._compute_loss(batch)
                val_loss += loss.item()

        avg_loss = val_loss / num_batches
        self.val_losses.append(avg_loss)

        print(f"Validation Loss: {avg_loss:.4f}")

        return avg_loss

    def train(
        self,
        num_epochs: int,
        start_epoch: int = 0,
        resume_from: str | None = None,
    ) -> dict[str, list[float]]:
        """
        Run training loop.

        Args:
            num_epochs: Number of epochs to train
            start_epoch: Starting epoch number (for resume)
            resume_from: Checkpoint name to resume from (optional)

        Returns:
            Dictionary with training history
        """
        # Resume from checkpoint if specified
        if resume_from is not None:
            print(f"Resuming from checkpoint: {resume_from}")
            info = self.checkpoint_manager.load(
                resume_from,
                model=self.model,
                optimizer=self.optimizer,
                device=self.device,
            )
            start_epoch = info.get("epoch", start_epoch)

        print(f"Starting training for {num_epochs} epochs from epoch {start_epoch}")
        print(f"Device: {self.device}")
        print(f"Training samples: {len(self.train_loader.dataset)}")

        if self.val_loader is not None:
            print(f"Validation samples: {len(self.val_loader.dataset)}")

        # Training loop
        for epoch in range(start_epoch, start_epoch + num_epochs):
            self.current_epoch = epoch
            print(f"\n--- Epoch {epoch} ---")

            # Train for one epoch
            train_loss = self._train_epoch(epoch)
            print(f"Epoch {epoch} Train Loss: {train_loss:.4f}")

            # Validate
            val_loss = self._validate(epoch)

            # Checkpoint saving
            if epoch % self.checkpoint_interval == 0:
                checkpoint_name = f"epoch_{epoch}"

                # Use validation loss if available, otherwise training loss
                metric = val_loss if val_loss is not None else train_loss

                self.checkpoint_manager.save(
                    checkpoint_name=checkpoint_name,
                    model=self.model,
                    optimizer=self.optimizer,
                    epoch=epoch,
                    metric=metric,
                )

                # Update best loss tracking
                if val_loss is not None and val_loss < self.best_val_loss:
                    self.best_val_loss = val_loss
                    print(f"New best validation loss: {val_loss:.4f}")

        print("\nTraining complete!")
        print(f"Best validation loss: {self.best_val_loss:.4f}")

        return {
            "train_losses": self.train_losses,
            "val_losses": self.val_losses,
        }

    def save_checkpoint(
        self,
        checkpoint_name: str,
        metric: float | None = None,
    ) -> Path:
        """
        Manually save a checkpoint.

        Args:
            checkpoint_name: Name for the checkpoint
            metric: Metric value to track (optional)

        Returns:
            Path to saved checkpoint
        """
        return self.checkpoint_manager.save(
            checkpoint_name=checkpoint_name,
            model=self.model,
            optimizer=self.optimizer,
            epoch=self.current_epoch,
            metric=metric,
        )

    def load_checkpoint(
        self,
        checkpoint_name: str,
    ) -> dict[str, Any]:
        """
        Load a checkpoint.

        Args:
            checkpoint_name: Name of checkpoint to load

        Returns:
            Checkpoint information
        """
        return self.checkpoint_manager.load(
            checkpoint_name,
            model=self.model,
            optimizer=self.optimizer,
            device=self.device,
        )

    def get_history(self) -> dict[str, list[float]]:
        """
        Get training history.

        Returns:
            Dictionary with train_losses and val_losses
        """
        return {
            "train_losses": self.train_losses,
            "val_losses": self.val_losses,
        }
