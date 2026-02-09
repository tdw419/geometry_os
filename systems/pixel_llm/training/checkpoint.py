"""
Checkpoint Manager for Pixel LLM Training.

Provides CheckpointManager class for saving and loading model checkpoints
with support for automatic checkpointing during training.
"""

import json
import shutil
from pathlib import Path
from typing import Any, Dict, List, Optional, Union

import torch
import torch.nn as nn


class CheckpointManager:
    """
    Manages model checkpoints with save, load, and auto-save functionality.

    Features:
    - Save complete model state (model, optimizer, epoch, etc.)
    - Load checkpoints with resume capability
    - Auto-save at specified intervals
    - Keep only N best checkpoints (by metric)
    - Keep only N most recent checkpoints
    """

    def __init__(
        self,
        checkpoint_dir: Union[str, Path],
        max_checkpoints: int = 3,
        metric_mode: str = "max",  # "max" or "min"
        metric_name: str = "loss",
        auto_save_interval: Optional[int] = None,  # Save every N batches
    ) -> None:
        """
        Initialize checkpoint manager.

        Args:
            checkpoint_dir: Directory to save checkpoints
            max_checkpoints: Maximum number of checkpoints to keep
            metric_mode: "max" for higher-is-better metrics, "min" for lower-is-better
            metric_name: Name of metric to track for best checkpoints
            auto_save_interval: Save checkpoint every N batches (None = disabled)
        """
        self.checkpoint_dir = Path(checkpoint_dir)
        self.max_checkpoints = max_checkpoints
        self.metric_mode = metric_mode
        self.metric_name = metric_name
        self.auto_save_interval = auto_save_interval

        # Create checkpoint directory
        self.checkpoint_dir.mkdir(parents=True, exist_ok=True)

        # Tracking
        self.batch_count = 0
        self.checkpoint_history: List[Dict[str, Any]] = []
        self.best_metric: Optional[float] = None
        self.best_checkpoint: Optional[str] = None

        # Load checkpoint history if exists
        self._load_history()

    def _load_history(self) -> None:
        """Load checkpoint history from disk."""
        history_file = self.checkpoint_dir / "checkpoint_history.json"
        if history_file.exists():
            try:
                with open(history_file, 'r') as f:
                    self.checkpoint_history = json.load(f)
                self.best_checkpoint = self.checkpoint_history[0].get("best_checkpoint")
                self.best_metric = self.checkpoint_history[0].get("best_metric")
            except Exception as e:
                print(f"Warning: Failed to load checkpoint history: {e}")

    def _save_history(self) -> None:
        """Save checkpoint history to disk."""
        history_file = self.checkpoint_dir / "checkpoint_history.json"
        data = {
            "best_checkpoint": self.best_checkpoint,
            "best_metric": self.best_metric,
            "history": self.checkpoint_history,
        }
        with open(history_file, 'w') as f:
            json.dump(data, f, indent=2)

    def _get_checkpoint_path(self, name: str) -> Path:
        """Get full path for checkpoint file."""
        return self.checkpoint_dir / f"{name}.pt"

    def _is_better(self, metric: float) -> bool:
        """Check if metric is better than current best."""
        if self.best_metric is None:
            return True
        if self.metric_mode == "max":
            return metric > self.best_metric
        else:
            return metric < self.best_metric

    def save(
        self,
        checkpoint_name: str,
        model: nn.Module,
        optimizer: Optional[torch.optim.Optimizer] = None,
        epoch: Optional[int] = None,
        batch: Optional[int] = None,
        metric: Optional[float] = None,
        extra_state: Optional[Dict[str, Any]] = None,
    ) -> Path:
        """
        Save a checkpoint.

        Args:
            checkpoint_name: Name for the checkpoint
            model: Model to save
            optimizer: Optimizer state (optional)
            epoch: Current epoch (optional)
            batch: Current batch (optional)
            metric: Metric value for tracking best checkpoint (optional)
            extra_state: Additional state to save

        Returns:
            Path to saved checkpoint
        """
        checkpoint_path = self._get_checkpoint_path(checkpoint_name)

        # Prepare checkpoint state
        state = {
            "model_state_dict": model.state_dict(),
            "checkpoint_name": checkpoint_name,
            "epoch": epoch,
            "batch": batch,
            "metric": metric,
        }

        if optimizer is not None:
            state["optimizer_state_dict"] = optimizer.state_dict()

        if extra_state is not None:
            state["extra_state"] = extra_state

        # Save checkpoint
        torch.save(state, checkpoint_path)

        # Update history
        checkpoint_info = {
            "name": checkpoint_name,
            "path": str(checkpoint_path),
            "epoch": epoch,
            "batch": batch,
            "metric": metric,
        }
        self.checkpoint_history.append(checkpoint_info)

        # Update best checkpoint tracking
        if metric is not None and self._is_better(metric):
            self.best_metric = metric
            self.best_checkpoint = checkpoint_name

            # Save as "best.pt" for easy access
            best_path = self._get_checkpoint_path("best")
            shutil.copy(checkpoint_path, best_path)

        # Cleanup old checkpoints
        self._cleanup_checkpoints()

        # Save history
        self._save_history()

        return checkpoint_path

    def load(
        self,
        checkpoint_name: str,
        model: nn.Module,
        optimizer: Optional[torch.optim.Optimizer] = None,
        device: Optional[torch.device] = None,
    ) -> Dict[str, Any]:
        """
        Load a checkpoint.

        Args:
            checkpoint_name: Name of checkpoint to load
            model: Model to load state into
            optimizer: Optimizer to load state into (optional)
            device: Device to load checkpoint to (optional)

        Returns:
            Dictionary with checkpoint information (epoch, batch, metric, etc.)
        """
        checkpoint_path = self._get_checkpoint_path(checkpoint_name)

        if not checkpoint_path.exists():
            raise FileNotFoundError(f"Checkpoint not found: {checkpoint_path}")

        # Load checkpoint
        checkpoint = torch.load(checkpoint_path, map_location=device)

        # Load model state
        model.load_state_dict(checkpoint["model_state_dict"])

        # Load optimizer state
        if optimizer is not None and "optimizer_state_dict" in checkpoint:
            optimizer.load_state_dict(checkpoint["optimizer_state_dict"])

        # Return checkpoint info
        info = {
            "epoch": checkpoint.get("epoch"),
            "batch": checkpoint.get("batch"),
            "metric": checkpoint.get("metric"),
            "extra_state": checkpoint.get("extra_state", {}),
        }

        return info

    def load_best(
        self,
        model: nn.Module,
        optimizer: Optional[torch.optim.Optimizer] = None,
        device: Optional[torch.device] = None,
    ) -> Dict[str, Any]:
        """
        Load the best checkpoint.

        Args:
            model: Model to load state into
            optimizer: Optimizer to load state into (optional)
            device: Device to load checkpoint to (optional)

        Returns:
            Dictionary with checkpoint information
        """
        if self.best_checkpoint is None:
            raise ValueError("No best checkpoint available")

        return self.load(
            self.best_checkpoint,
            model=model,
            optimizer=optimizer,
            device=device,
        )

    def load_latest(
        self,
        model: nn.Module,
        optimizer: Optional[torch.optim.Optimizer] = None,
        device: Optional[torch.device] = None,
    ) -> Dict[str, Any]:
        """
        Load the most recent checkpoint.

        Args:
            model: Model to load state into
            optimizer: Optimizer to load state into (optional)
            device: Device to load checkpoint to (optional)

        Returns:
            Dictionary with checkpoint information
        """
        if not self.checkpoint_history:
            raise ValueError("No checkpoints available")

        latest = self.checkpoint_history[-1]
        return self.load(
            latest["name"],
            model=model,
            optimizer=optimizer,
            device=device,
        )

    def _cleanup_checkpoints(self) -> None:
        """Remove old checkpoints keeping only max_checkpoints."""
        if len(self.checkpoint_history) <= self.max_checkpoints:
            return

        # Sort by metric if available, otherwise by recency
        if self.metric_mode == "max":
            reverse = True
        else:
            reverse = False

        # Filter to checkpoints with metrics
        with_metric = [c for c in self.checkpoint_history if c.get("metric") is not None]

        if with_metric:
            # Sort by metric
            sorted_checkpoints = sorted(
                with_metric,
                key=lambda x: x["metric"],
                reverse=reverse,
            )
        else:
            # Sort by recency (last in list is newest)
            sorted_checkpoints = list(self.checkpoint_history)

        # Keep only the best ones
        to_keep = sorted_checkpoints[-self.max_checkpoints:]
        to_remove = [c for c in self.checkpoint_history if c not in to_keep]

        # Remove old checkpoint files
        for checkpoint in to_remove:
            path = Path(checkpoint["path"])
            if path.exists() and path.name != "best.pt":
                path.unlink()

        # Update history
        self.checkpoint_history = to_keep

    def auto_save(
        self,
        model: nn.Module,
        optimizer: Optional[torch.optim.Optimizer] = None,
        epoch: Optional[int] = None,
        metric: Optional[float] = None,
        extra_state: Optional[Dict[str, Any]] = None,
    ) -> Optional[Path]:
        """
        Auto-save checkpoint if interval has elapsed.

        Call this at the end of each batch. Will save every auto_save_interval batches.

        Args:
            model: Model to save
            optimizer: Optimizer state (optional)
            epoch: Current epoch (optional)
            metric: Metric value (optional)
            extra_state: Additional state (optional)

        Returns:
            Path if saved, None if not due for save
        """
        if self.auto_save_interval is None:
            return None

        self.batch_count += 1

        if self.batch_count % self.auto_save_interval == 0:
            checkpoint_name = f"auto_epoch{epoch}_batch{self.batch_count}"
            return self.save(
                checkpoint_name=checkpoint_name,
                model=model,
                optimizer=optimizer,
                epoch=epoch,
                batch=self.batch_count,
                metric=metric,
                extra_state=extra_state,
            )

        return None

    def list_checkpoints(self) -> List[Dict[str, Any]]:
        """
        List all available checkpoints.

        Returns:
            List of checkpoint info dictionaries
        """
        return list(self.checkpoint_history)

    def get_best_metric(self) -> Optional[float]:
        """Get the best metric value seen so far."""
        return self.best_metric
