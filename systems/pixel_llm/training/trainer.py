"""
Training Loop for Pixel LLM Custom Dataset Training.

Provides Trainer class for training Pixel LLM models on custom datasets
with checkpointing, logging, and resume capability.
"""

import time
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Union

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
        val_loader: Optional[DataLoader] = None,
        optimizer: Optional[torch.optim.Optimizer] = None,
        loss_fn: Optional[Callable] = None,
        device: Optional[torch.device] = None,
        checkpoint_dir: Union[str, Path] = "./checkpoints",
        checkpoint_interval: int = 1,  # Save every N epochs
        batch_checkpoint_interval: Optional[int] = None,  # Save every N batches
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
        self.train_losses: List[float] = []
        self.val_losses: List[float] = []

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

            # TODO: Adjust forward call based on actual model
            # outputs = self.model(images, captions)
            # loss = self.loss_fn(outputs, targets)

            # For now, using a dummy loss for template
            # Replace with actual forward pass
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

    def _compute_loss(self, batch: Dict[str, Any]) -> torch.Tensor:
        """
        Compute loss for a batch.

        This is a template method - override or modify based on actual model.

        Args:
            batch: Batch dictionary from dataset

        Returns:
            Loss tensor
        """
        # TODO: Implement actual loss computation based on model
        # This is a placeholder that returns a dummy loss

        # Example for image captioning model:
        # images = batch['images'].to(self.device)
        # captions = batch['captions']  # Process captions
        # outputs = self.model(images, captions)
        # loss = self.loss_fn(outputs, targets)
        # return loss

        # Placeholder - replace with actual implementation
        return torch.tensor(0.0, requires_grad=True, device=self.device)

    def _validate(self, epoch: int) -> Optional[float]:
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
        resume_from: Optional[str] = None,
    ) -> Dict[str, List[float]]:
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
        metric: Optional[float] = None,
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
    ) -> Dict[str, Any]:
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

    def get_history(self) -> Dict[str, List[float]]:
        """
        Get training history.

        Returns:
            Dictionary with train_losses and val_losses
        """
        return {
            "train_losses": self.train_losses,
            "val_losses": self.val_losses,
        }
