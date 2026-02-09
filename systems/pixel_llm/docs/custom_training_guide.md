# Custom Training Guide

This guide shows you how to train Pixel LLM models on your own custom datasets. The training module provides tools for dataset loading, checkpoint management, and training loop execution.

## Overview

The Pixel LLM training module (`systems/pixel_llm/training/`) includes:

- **ImageCaptionDataset**: Load images and captions from disk
- **CheckpointManager**: Save and load training checkpoints
- **Trainer**: Complete training loop with validation

## Prerequisites

```bash
pip install torch torchvision pillow numpy
```

## Dataset Preparation

### Format Options

The training module supports two dataset formats:

#### 1. Text File Format

Organize your data as:

```
dataset_dir/
    image1.jpg
    image1.txt
    image2.png
    image2.txt
    image3.webp
    image3.txt
```

Each `.txt` file contains the caption for its corresponding image.

#### 2. JSON Manifest Format

Create a JSON file with image-caption mappings:

```json
{
    "image1.jpg": "A red square on a white background",
    "image2.png": "A blue circle with black outline",
    "image3.webp": "A green triangle pointing upward"
}
```

Directory structure:

```
dataset_dir/
    manifest.json
    image1.jpg
    image2.png
    image3.webp
```

### Creating a Dataset

```python
from systems.pixel_llm.training import ImageCaptionDataset

# Text file format
dataset = ImageCaptionDataset(
    dataset_dir="./my_dataset",
    caption_format="text",
    image_size=(224, 224),
)

# JSON manifest format
dataset = ImageCaptionDataset(
    dataset_dir="./my_dataset",
    caption_format="json",
    manifest_file="./my_dataset/manifest.json",
    image_size=(224, 224),
)

print(f"Loaded {len(dataset)} samples")
```

### Custom Transforms

```python
from torchvision import transforms

custom_transform = transforms.Compose([
    transforms.Resize(256),
    transforms.CenterCrop(224),
    transforms.RandomHorizontalFlip(),  # Data augmentation
    transforms.ToTensor(),
    transforms.Normalize(
        mean=[0.485, 0.456, 0.406],
        std=[0.229, 0.224, 0.225],
    ),
])

dataset = ImageCaptionDataset(
    dataset_dir="./my_dataset",
    transform=custom_transform,
)
```

### DataLoaders

```python
from torch.utils.data import DataLoader

# Create dataloader
train_loader = DataLoader(
    dataset,
    batch_size=8,
    shuffle=True,
    num_workers=4,
    collate_fn=dataset.get_collate_fn(),
)

# Iterate batches
for batch in train_loader:
    images = batch['images']      # [B, 3, 224, 224]
    captions = batch['captions']  # List[str] of length B
    # ... training code
```

## Training Setup

### Basic Training Loop

```python
import torch
from systems.pixel_llm.models import create_pixel_llm
from systems.pixel_llm.training import Trainer, ImageCaptionDataset
from torch.utils.data import DataLoader

# Create model
model = create_pixel_llm(
    image_size=224,
    patch_size=16,
    vision_embed_dim=512,
    vocab_size=50000,
)

# Load dataset
train_dataset = ImageCaptionDataset(
    dataset_dir="./train_data",
    caption_format="text",
)
train_loader = DataLoader(
    train_dataset,
    batch_size=8,
    shuffle=True,
    collate_fn=train_dataset.get_collate_fn(),
)

# Create trainer
trainer = Trainer(
    model=model,
    train_loader=train_loader,
    checkpoint_dir="./checkpoints",
    log_interval=10,
)

# Train
history = trainer.train(num_epochs=10)
```

### With Validation

```python
# Create validation dataset
val_dataset = ImageCaptionDataset(
    dataset_dir="./val_data",
    caption_format="text",
)
val_loader = DataLoader(
    val_dataset,
    batch_size=8,
    shuffle=False,
    collate_fn=val_dataset.get_collate_fn(),
)

# Create trainer with validation
trainer = Trainer(
    model=model,
    train_loader=train_loader,
    val_loader=val_loader,
    checkpoint_dir="./checkpoints",
    checkpoint_interval=1,  # Save every epoch
)

# Train
history = trainer.train(num_epochs=10)
```

## Checkpoint Management

### Basic Checkpointing

```python
from systems.pixel_llm.training import CheckpointManager

# Create checkpoint manager
checkpoint_manager = CheckpointManager(
    checkpoint_dir="./checkpoints",
    max_checkpoints=3,  # Keep only 3 best checkpoints
    metric_mode="min",   # Lower loss is better
)

# Save checkpoint
checkpoint_manager.save(
    checkpoint_name="epoch_5",
    model=model,
    optimizer=optimizer,
    epoch=5,
    metric=0.1234,  # Validation loss
)
```

### Loading Checkpoints

```python
# Load specific checkpoint
info = checkpoint_manager.load(
    checkpoint_name="epoch_5",
    model=model,
    optimizer=optimizer,
    device=torch.device("cuda"),
)
print(f"Resumed from epoch {info['epoch']}")

# Load best checkpoint
checkpoint_manager.load_best(
    model=model,
    optimizer=optimizer,
    device=torch.device("cuda"),
)

# Load most recent checkpoint
checkpoint_manager.load_latest(
    model=model,
    optimizer=optimizer,
    device=torch.device("cuda"),
)
```

### Resuming Training

```python
# Resume from checkpoint
trainer = Trainer(
    model=model,
    train_loader=train_loader,
    val_loader=val_loader,
    checkpoint_dir="./checkpoints",
)

# Resume training
history = trainer.train(
    num_epochs=10,
    start_epoch=5,
    resume_from="epoch_5",
)
```

## Advanced Training

### Custom Loss Function

```python
import torch.nn as nn

class CustomLoss(nn.Module):
    def __init__(self):
        super().__init__()
        self.ce_loss = nn.CrossEntropyLoss()
        self.alpha = 0.5  # Balance between losses

    def forward(self, predictions, targets):
        # Your custom loss computation
        loss1 = self.ce_loss(predictions, targets)
        loss2 = compute_auxiliary_loss(predictions, targets)
        return self.alpha * loss1 + (1 - self.alpha) * loss2

# Use with trainer
trainer = Trainer(
    model=model,
    train_loader=train_loader,
    loss_fn=CustomLoss(),
)
```

### Custom Optimizer

```python
import torch.optim as optim

# Custom optimizer
optimizer = optim.AdamW(
    model.parameters(),
    lr=1e-4,
    weight_decay=0.01,
    betas=(0.9, 0.999),
)

# Use with trainer
trainer = Trainer(
    model=model,
    train_loader=train_loader,
    optimizer=optimizer,
)
```

### Learning Rate Scheduling

```python
from torch.optim.lr_scheduler import CosineAnnealingLR

# Create scheduler
optimizer = torch.optim.Adam(model.parameters(), lr=1e-4)
scheduler = CosineAnnealingLR(optimizer, T_max=10)

# Training loop with scheduler
for epoch in range(num_epochs):
    # Train one epoch
    trainer._train_epoch(epoch)

    # Update learning rate
    scheduler.step()
    current_lr = scheduler.get_last_lr()[0]
    print(f"LR: {current_lr}")
```

### Mixed Precision Training

```python
from torch.cuda.amp import GradScaler, autocast

# Modify trainer for mixed precision
scaler = GradScaler()

for batch in train_loader:
    images = batch['images'].to(device)
    captions = batch['captions']

    optimizer.zero_grad()

    with autocast():
        outputs = model(images, captions)
        loss = loss_fn(outputs, targets)

    scaler.scale(loss).backward()
    scaler.step(optimizer)
    scaler.update()
```

## Monitoring and Logging

### Training History

```python
# Get training history
history = trainer.get_history()
train_losses = history['train_losses']
val_losses = history['val_losses']

# Plot losses
import matplotlib.pyplot as plt

plt.figure(figsize=(10, 5))
plt.plot(train_losses, label='Train Loss')
if val_losses:
    plt.plot(val_losses, label='Val Loss')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend()
plt.savefig('training_curve.png')
```

### Custom Logging

```python
import logging

# Setup logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('training.log'),
        logging.StreamHandler(),
    ],
)

# Log during training
logger = logging.getLogger(__name__)
logger.info(f"Starting training for {num_epochs} epochs")
```

### Metrics Tracking

```python
# Track additional metrics
class MetricsTracker:
    def __init__(self):
        self.metrics = {}

    def update(self, **kwargs):
        for key, value in kwargs.items():
            if key not in self.metrics:
                self.metrics[key] = []
            self.metrics[key].append(value)

    def get averages(self):
        return {k: sum(v)/len(v) for k, v in self.metrics.items()}
```

## Best Practices

### 1. Dataset Size

- **Minimum**: 1,000 images for basic learning
- **Good**: 10,000+ images for reasonable performance
- **Excellent**: 100,000+ images for production models

### 2. Image Quality

- Use consistent image sizes or resize during preprocessing
- Ensure diverse lighting conditions
- Include various angles and perspectives
- Balance object categories

### 3. Caption Quality

- Write descriptive, accurate captions
- Use consistent language style
- Include relevant details (color, position, action)
- Avoid subjective terms

### 4. Training Tips

- Start with pre-trained models when possible
- Use data augmentation for small datasets
- Monitor validation loss to prevent overfitting
- Save checkpoints regularly
- Use GPU for faster training

### 5. Hyperparameter Tuning

```python
# Learning rate: 1e-5 to 1e-3
# Batch size: 4 to 32 (depending on GPU memory)
# Weight decay: 0 to 1e-3
# Max sequence length: 50 to 200
# Number of epochs: 10 to 100
```

## Example: Complete Training Script

```python
#!/usr/bin/env python3
"""
Complete training script for Pixel LLM on custom dataset.
"""
import torch
from torch.utils.data import DataLoader
from systems.pixel_llm.models import create_pixel_llm
from systems.pixel_llm.training import ImageCaptionDataset, Trainer

def main():
    # Configuration
    BATCH_SIZE = 8
    NUM_EPOCHS = 20
    LEARNING_RATE = 1e-4
    IMAGE_SIZE = (224, 224)
    CHECKPOINT_DIR = "./checkpoints"

    # Device
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print(f"Using device: {device}")

    # Create model
    model = create_pixel_llm(
        image_size=224,
        patch_size=16,
        vision_embed_dim=512,
        vocab_size=50000,
    )
    model = model.to(device)
    print(f"Model parameters: {sum(p.numel() for p in model.parameters()):,}")

    # Load datasets
    print("Loading datasets...")
    train_dataset = ImageCaptionDataset(
        dataset_dir="./data/train",
        caption_format="text",
        image_size=IMAGE_SIZE,
    )
    val_dataset = ImageCaptionDataset(
        dataset_dir="./data/val",
        caption_format="text",
        image_size=IMAGE_SIZE,
    )

    train_loader = DataLoader(
        train_dataset,
        batch_size=BATCH_SIZE,
        shuffle=True,
        num_workers=4,
        collate_fn=train_dataset.get_collate_fn(),
    )
    val_loader = DataLoader(
        val_dataset,
        batch_size=BATCH_SIZE,
        shuffle=False,
        num_workers=4,
        collate_fn=val_dataset.get_collate_fn(),
    )

    print(f"Train samples: {len(train_dataset)}")
    print(f"Val samples: {len(val_dataset)}")

    # Create trainer
    trainer = Trainer(
        model=model,
        train_loader=train_loader,
        val_loader=val_loader,
        device=device,
        checkpoint_dir=CHECKPOINT_DIR,
        checkpoint_interval=1,
        log_interval=10,
    )

    # Train
    print("\nStarting training...")
    history = trainer.train(num_epochs=NUM_EPOCHS)

    # Save final model
    final_path = trainer.save_checkpoint("final")
    print(f"\nFinal model saved to: {final_path}")

    # Plot training curve
    import matplotlib.pyplot as plt
    plt.figure(figsize=(10, 5))
    plt.plot(history['train_losses'], label='Train')
    plt.plot(history['val_losses'], label='Validation')
    plt.xlabel('Epoch')
    plt.ylabel('Loss')
    plt.legend()
    plt.savefig('training_curve.png')
    print("Training curve saved to: training_curve.png")

if __name__ == "__main__":
    main()
```

## Troubleshooting

### Out of Memory

**Error**: `CUDA out of memory`

**Solutions:**
- Reduce batch size
- Use gradient accumulation
- Use smaller image size
- Use gradient checkpointing

### Slow Training

**Solutions:**
- Use GPU acceleration
- Increase batch size
- Use mixed precision training
- Reduce image size
- Use fewer workers

### Overfitting

**Symptoms:** Training loss decreases, validation loss increases

**Solutions:**
- Add data augmentation
- Use dropout
- Reduce model complexity
- Increase dataset size
- Use weight decay

### Underfitting

**Symptoms:** Both training and validation loss are high

**Solutions:**
- Increase model capacity
- Train longer
- Increase learning rate
- Check dataset quality

## Related Documentation

- [Webcam Demo Guide](./webcam_demo_guide.md)
- [Compositor Integration Guide](./compositor_integration_guide.md)
- [Pixel LLM README](../README.md)
