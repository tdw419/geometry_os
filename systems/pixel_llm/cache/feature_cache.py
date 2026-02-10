"""Feature cache with LRU eviction and TTL support.

This module implements a caching system for vision features extracted from
images. It uses LRU (Least Recently Used) eviction policy and TTL (Time To Live)
for automatic expiration of stale entries.
"""
import time
from dataclasses import dataclass, field
from hashlib import sha256
from typing import Optional, Dict, Any

import torch


@dataclass
class CacheEntry:
    """Single cache entry with features and metadata.

    Attributes:
        features: The cached feature tensor
        timestamp: Unix timestamp when entry was created
        hit_count: Number of times this entry has been accessed

    Example:
        >>> features = torch.randn(1, 257, 768)
        >>> entry = CacheEntry(features=features)
        >>> assert entry.hit_count == 0
    """
    features: torch.Tensor
    timestamp: float = field(default_factory=time.time)
    hit_count: int = 0


class FeatureCache:
    """LRU cache for vision features with TTL support.

    This cache stores extracted vision features to enable fast repeated
    image processing. It uses:
    - LRU eviction: Removes least recently used entries when full
    - TTL expiration: Automatically expires entries after a time limit
    - Deterministic hashing: Uses content-based hash for cache keys

    Args:
        max_size: Maximum number of entries in the cache (default: 128)
        ttl_seconds: Time-to-live for cache entries in seconds (default: 300.0)

    Attributes:
        max_size: Maximum cache size
        ttl_seconds: TTL in seconds
        _cache: Internal dictionary mapping keys to CacheEntry objects
        _access_order: List tracking LRU access order (oldest first)

    Example:
        >>> cache = FeatureCache(max_size=10, ttl_seconds=60.0)
        >>> images = torch.randn(1, 3, 224, 224)
        >>> features = torch.randn(1, 257, 768)
        >>> cache.put(images, features)
        >>> result = cache.get(images)
        >>> assert result is not None
    """

    def __init__(self, max_size: int = 128, ttl_seconds: float = 300.0):
        """Initialize the feature cache.

        Args:
            max_size: Maximum number of cache entries
            ttl_seconds: Time-to-live for entries in seconds
        """
        self.max_size = max_size
        self.ttl_seconds = ttl_seconds
        self._cache: Dict[str, CacheEntry] = {}
        self._access_order: list = []

    def get(self, images: torch.Tensor) -> Optional[torch.Tensor]:
        """Retrieve cached features for the given images.

        Args:
            images: Input image tensor [batch, channels, height, width]

        Returns:
            Cached feature tensor if found and not expired, None otherwise.
            Returns a clone of the cached features to prevent external
            modifications to the cache.

        Example:
            >>> cache = FeatureCache()
            >>> images = torch.randn(1, 3, 224, 224)
            >>> result = cache.get(images)
            >>> assert result is None  # Cache miss
        """
        key = self._hash_key(images)

        if key not in self._cache:
            return None

        entry = self._cache[key]

        # Check TTL
        if time.time() - entry.timestamp > self.ttl_seconds:
            # Entry has expired
            del self._cache[key]
            try:
                self._access_order.remove(key)
            except ValueError:
                pass  # Key not in access order, ignore
            return None

        # Update access order (move to end = most recently used)
        try:
            self._access_order.remove(key)
        except ValueError:
            pass  # Key not in access order, ignore
        self._access_order.append(key)

        # Increment hit count and return cloned features
        entry.hit_count += 1
        return entry.features.clone()

    def put(self, images: torch.Tensor, features: torch.Tensor) -> None:
        """Store features in the cache for the given images.

        If the cache is at capacity and the key is new, the least recently
        used entry will be evicted.

        Args:
            images: Input image tensor [batch, channels, height, width]
            features: Feature tensor to cache [batch, num_patches, embed_dim]

        Example:
            >>> cache = FeatureCache(max_size=10)
            >>> images = torch.randn(1, 3, 224, 224)
            >>> features = torch.randn(1, 257, 768)
            >>> cache.put(images, features)
        """
        # Don't store anything if max_size is 0
        if self.max_size == 0:
            return

        key = self._hash_key(images)

        # Evict LRU entry if at capacity and key is new
        if len(self._cache) >= self.max_size and key not in self._cache:
            if self._access_order:
                lru_key = self._access_order.pop(0)
                if lru_key in self._cache:
                    del self._cache[lru_key]

        # Create new entry with cloned features
        entry = CacheEntry(features=features.clone())
        self._cache[key] = entry

        # Update access order
        if key in self._access_order:
            self._access_order.remove(key)
        self._access_order.append(key)

    def get_stats(self) -> Dict[str, Any]:
        """Get cache statistics.

        Returns:
            Dictionary containing:
                - size: Current number of entries
                - max_size: Maximum cache capacity
                - hits: Total number of cache hits
                - misses: Always 0 (misses not tracked separately)
                - ttl_seconds: Configured TTL

        Example:
            >>> cache = FeatureCache(max_size=10)
            >>> stats = cache.get_stats()
            >>> assert stats['size'] == 0
            >>> assert stats['max_size'] == 10
        """
        hits = sum(e.hit_count for e in self._cache.values())
        return {
            'size': len(self._cache),
            'max_size': self.max_size,
            'hits': hits,
            'misses': 0,  # Not tracked separately
            'ttl_seconds': self.ttl_seconds,
        }

    def _hash_key(self, images: torch.Tensor) -> str:
        """Generate a deterministic hash key from image tensor.

        Creates a content-based hash by flattening the tensor and
        computing its SHA-256 hash. This ensures that identical images
        (same values and shape) produce the same cache key.

        Args:
            images: Input image tensor

        Returns:
            Hexadecimal hash string (truncated to 16 characters)

        Example:
            >>> cache = FeatureCache()
            >>> images = torch.randn(1, 3, 224, 224)
            >>> key = cache._hash_key(images)
            >>> assert isinstance(key, str)
            >>> assert len(key) == 16
        """
        # Convert tensor to bytes for hashing
        # Use numpy's tostring() which handles float arrays correctly
        tensor_array = images.detach().cpu().numpy()
        tensor_bytes = tensor_array.tobytes()
        hash_bytes = sha256(tensor_bytes).hexdigest()
        return hash_bytes[:16]
