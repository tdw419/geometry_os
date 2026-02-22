"""
Custom Dataset Loader for Pixel LLM Training.

Provides ImageCaptionDataset class for loading images and captions
from directory-based datasets with text or JSON caption files.
"""

import json
from pathlib import Path
from typing import Any, Callable, Dict, List, Optional, Tuple, Union

import torch
from PIL import Image
from torch.utils.data import Dataset
from torchvision import transforms


class ImageCaptionDataset(Dataset):
    """
    Dataset for loading images and captions from disk.

    Supports two caption formats:
    1. Text files: image_name.txt contains caption text
    2. JSON manifest: Single JSON file with image->caption mappings

    Directory structure for text files:
        dataset_dir/
            image1.jpg
            image1.txt
            image2.png
            image2.txt

    JSON manifest format:
        {
            "image1.jpg": "caption for image 1",
            "image2.png": "caption for image 2"
        }
    """

    def __init__(
        self,
        dataset_dir: Union[str, Path],
        caption_format: str = "text",  # "text" or "json"
        manifest_file: Optional[Union[str, Path]] = None,
        transform: Optional[Callable] = None,
        image_size: Tuple[int, int] = (224, 224),
    ) -> None:
        """
        Initialize the dataset.

        Args:
            dataset_dir: Directory containing images
            caption_format: "text" for .txt files or "json" for manifest
            manifest_file: Path to JSON manifest (required if caption_format="json")
            transform: Optional torchvision transform for images
            image_size: Size to resize images to (width, height)
        """
        self.dataset_dir = Path(dataset_dir)
        self.caption_format = caption_format
        self.manifest_file = Path(manifest_file) if manifest_file else None
        self.image_size = image_size

        if not self.dataset_dir.exists():
            raise FileNotFoundError(f"Dataset directory not found: {self.dataset_dir}")

        # Load image-caption pairs
        self.samples = self._load_samples()

        if len(self.samples) == 0:
            raise ValueError(f"No valid image-caption pairs found in {self.dataset_dir}")

        # Setup image transforms
        if transform is None:
            self.transform = transforms.Compose([
                transforms.Resize(image_size),
                transforms.ToTensor(),
                transforms.Normalize(
                    mean=[0.485, 0.456, 0.406],  # ImageNet means
                    std=[0.229, 0.224, 0.225],   # ImageNet stds
                ),
            ])
        else:
            self.transform = transform

    def _load_samples(self) -> List[Tuple[Path, str]]:
        """Load image-caption pairs based on format."""
        if self.caption_format == "json":
            return self._load_from_json()
        elif self.caption_format == "text":
            return self._load_from_text()
        else:
            raise ValueError(f"Unsupported caption format: {self.caption_format}")

    def _load_from_json(self) -> List[Tuple[Path, str]]:
        """Load from JSON manifest file."""
        if self.manifest_file is None or not self.manifest_file.exists():
            raise FileNotFoundError(
                f"JSON manifest file not found: {self.manifest_file}"
            )

        with open(self.manifest_file, 'r', encoding='utf-8') as f:
            manifest = json.load(f)

        samples = []
        for image_name, caption in manifest.items():
            image_path = self.dataset_dir / image_name
            if image_path.exists() and self._is_image_file(image_path):
                samples.append((image_path, str(caption)))

        return samples

    def _load_from_text(self) -> List[Tuple[Path, str]]:
        """Load from paired text files."""
        samples = []
        valid_extensions = {'.jpg', '.jpeg', '.png', '.bmp', '.gif', '.webp'}

        for image_path in self.dataset_dir.iterdir():
            if not image_path.is_file():
                continue

            if image_path.suffix.lower() not in valid_extensions:
                continue

            # Look for matching .txt file
            caption_path = image_path.with_suffix('.txt')
            if not caption_path.exists():
                continue

            # Read caption
            try:
                with open(caption_path, 'r', encoding='utf-8') as f:
                    caption = f.read().strip()

                if caption:  # Only add if caption is non-empty
                    samples.append((image_path, caption))
            except Exception as e:
                print(f"Warning: Failed to read caption {caption_path}: {e}")
                continue

        return samples

    def _is_image_file(self, path: Path) -> bool:
        """Check if file is a valid image."""
        valid_extensions = {'.jpg', '.jpeg', '.png', '.bmp', '.gif', '.webp'}
        return path.suffix.lower() in valid_extensions

    def __len__(self) -> int:
        """Return dataset size."""
        return len(self.samples)

    def __getitem__(self, idx: int) -> Dict[str, Any]:
        """
        Get a single sample.

        Returns:
            Dictionary with keys:
                - 'image': Tensor of shape (3, H, W)
                - 'caption': String caption
                - 'image_path': Path to image file
        """
        image_path, caption = self.samples[idx]

        try:
            # Load image
            image = Image.open(image_path).convert('RGB')

            # Apply transforms
            if self.transform:
                image = self.transform(image)

            return {
                'image': image,
                'caption': caption,
                'image_path': str(image_path),
            }

        except Exception as e:
            raise RuntimeError(
                f"Failed to load image {image_path}: {e}"
            ) from e

    def get_collate_fn(self) -> Callable:
        """
        Return collate function for DataLoader.

        Handles variable-length captions if needed.
        """
        def collate_fn(batch: List[Dict[str, Any]]) -> Dict[str, Any]:
            images = torch.stack([item['image'] for item in batch])
            captions = [item['caption'] for item in batch]
            image_paths = [item['image_path'] for item in batch]

            return {
                'images': images,
                'captions': captions,
                'image_paths': image_paths,
            }

        return collate_fn


def create_dataset_from_directory(
    dataset_dir: Union[str, Path],
    caption_format: str = "text",
    **kwargs
) -> ImageCaptionDataset:
    """
    Convenience function to create dataset from directory.

    Args:
        dataset_dir: Path to dataset directory
        caption_format: "text" or "json"
        **kwargs: Additional arguments passed to ImageCaptionDataset

    Returns:
        ImageCaptionDataset instance
    """
    return ImageCaptionDataset(
        dataset_dir=dataset_dir,
        caption_format=caption_format,
        **kwargs
    )
