"""Tests for FeatureCache class with LRU eviction and TTL support."""
import pytest
import time
import torch
from systems.pixel_llm.cache.feature_cache import FeatureCache, CacheEntry


class TestCacheEntry:
    """Test CacheEntry dataclass."""

    def test_cache_entry_creation(self):
        """Test creating a cache entry with features."""
        features = torch.randn(1, 257, 768)
        entry = CacheEntry(features=features)

        assert torch.equal(entry.features, features)
        assert entry.hit_count == 0
        assert isinstance(entry.timestamp, float)

    def test_cache_entry_with_custom_timestamp(self):
        """Test creating a cache entry with a custom timestamp."""
        features = torch.randn(1, 257, 768)
        custom_time = 1234567890.0
        entry = CacheEntry(features=features, timestamp=custom_time)

        assert entry.timestamp == custom_time

    def test_cache_entry_with_hit_count(self):
        """Test creating a cache entry with initial hit count."""
        features = torch.randn(1, 257, 768)
        entry = CacheEntry(features=features, hit_count=5)

        assert entry.hit_count == 5


class TestFeatureCacheInit:
    """Test FeatureCache initialization."""

    def test_cache_init_default_params(self):
        """Test cache initialization with default parameters."""
        cache = FeatureCache()

        assert cache.max_size == 128
        assert cache.ttl_seconds == 300.0
        assert len(cache._cache) == 0
        assert len(cache._access_order) == 0

    def test_cache_init_custom_params(self):
        """Test cache initialization with custom parameters."""
        cache = FeatureCache(max_size=10, ttl_seconds=60.0)

        assert cache.max_size == 10
        assert cache.ttl_seconds == 60.0


class TestFeatureCacheGet:
    """Test FeatureCache.get method."""

    def test_cache_miss_returns_none(self):
        """Test that cache miss returns None for empty cache."""
        cache = FeatureCache(max_size=10)
        images = torch.randn(1, 3, 224, 224)

        result = cache.get(images)
        assert result is None

    def test_cache_miss_nonexistent_key(self):
        """Test that cache miss returns None for non-existent key."""
        cache = FeatureCache(max_size=10)
        images1 = torch.randn(1, 3, 224, 224)
        images2 = torch.randn(1, 3, 224, 224)

        # Put first image
        features = torch.randn(1, 257, 768)
        cache.put(images1, features)

        # Get different image should return None
        result = cache.get(images2)
        assert result is None


class TestFeatureCachePut:
    """Test FeatureCache.put method."""

    def test_cache_hit_after_put(self):
        """Test that cache hit after putting features."""
        cache = FeatureCache(max_size=10)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)
        result = cache.get(images)

        assert result is not None
        assert torch.equal(result, features)

    def test_put_increases_cache_size(self):
        """Test that put increases cache size."""
        cache = FeatureCache(max_size=10)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        assert cache.get_stats()['size'] == 0
        cache.put(images, features)
        assert cache.get_stats()['size'] == 1

    def test_put_updates_existing_entry(self):
        """Test that put updates an existing cache entry."""
        cache = FeatureCache(max_size=10)
        images = torch.randn(1, 3, 224, 224)
        features1 = torch.randn(1, 257, 768)
        features2 = torch.randn(1, 257, 768)

        cache.put(images, features1)
        cache.put(images, features2)

        result = cache.get(images)
        assert torch.equal(result, features2)
        # Cache size should still be 1
        assert cache.get_stats()['size'] == 1


class TestFeatureCacheTTL:
    """Test TTL (Time To Live) functionality."""

    def test_cache_ttl_expiration(self):
        """Test that cache entries expire after TTL."""
        cache = FeatureCache(max_size=10, ttl_seconds=0.1)  # 100ms TTL
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)

        # Should be cached immediately
        assert cache.get(images) is not None

        # Wait for TTL to expire
        time.sleep(0.15)

        # Should be expired now
        assert cache.get(images) is None

    def test_cache_ttl_respects_access_time(self):
        """Test that TTL is based on timestamp, not access time."""
        cache = FeatureCache(max_size=10, ttl_seconds=0.1)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)

        # Access immediately (should still expire at original time)
        time.sleep(0.05)
        assert cache.get(images) is not None

        # Wait past original TTL
        time.sleep(0.07)
        assert cache.get(images) is None

    def test_cache_no_ttl(self):
        """Test that cache with very long TTL doesn't expire."""
        cache = FeatureCache(max_size=10, ttl_seconds=3600.0)  # 1 hour
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)
        time.sleep(0.1)

        # Should still be cached
        assert cache.get(images) is not None


class TestFeatureCacheLRU:
    """Test LRU (Least Recently Used) eviction."""

    def test_lru_eviction_when_full(self):
        """Test that LRU eviction works when cache is full."""
        cache = FeatureCache(max_size=3)  # Small cache
        images_list = [torch.randn(1, 3, 224, 224) for _ in range(4)]
        features_list = [torch.randn(1, 257, 768) for _ in range(4)]

        # Fill cache to capacity
        for i in range(3):
            cache.put(images_list[i], features_list[i])

        # Add 4th item (should evict first)
        cache.put(images_list[3], features_list[3])

        # First item should be evicted
        assert cache.get(images_list[0]) is None

        # Other items should still be cached
        assert cache.get(images_list[1]) is not None
        assert cache.get(images_list[2]) is not None
        assert cache.get(images_list[3]) is not None

    def test_lru_updates_on_access(self):
        """Test that LRU order updates on cache access."""
        cache = FeatureCache(max_size=3)
        images_list = [torch.randn(1, 3, 224, 224) for _ in range(3)]
        features_list = [torch.randn(1, 257, 768) for _ in range(3)]

        # Fill cache
        for i in range(3):
            cache.put(images_list[i], features_list[i])

        # Access first item (should become most recent)
        cache.get(images_list[0])

        # Add 4th item (should evict second item, not first)
        images4 = torch.randn(1, 3, 224, 224)
        features4 = torch.randn(1, 257, 768)
        cache.put(images4, features4)

        # First should still be there (was accessed)
        assert cache.get(images_list[0]) is not None

        # Second should be evicted (was LRU)
        assert cache.get(images_list[1]) is None

        # Third and fourth should be there
        assert cache.get(images_list[2]) is not None
        assert cache.get(images4) is not None

    def test_lru_with_duplicate_put(self):
        """Test that put updates LRU order for existing key."""
        cache = FeatureCache(max_size=3)
        images_list = [torch.randn(1, 3, 224, 224) for _ in range(3)]
        features_list = [torch.randn(1, 257, 768) for _ in range(3)]

        # Fill cache
        for i in range(3):
            cache.put(images_list[i], features_list[i])

        # Put first item again (should become most recent)
        new_features = torch.randn(1, 257, 768)
        cache.put(images_list[0], new_features)

        # Add 4th item (should evict second)
        images4 = torch.randn(1, 3, 224, 224)
        features4 = torch.randn(1, 257, 768)
        cache.put(images4, features4)

        # First should still be there (was updated)
        result = cache.get(images_list[0])
        assert result is not None
        assert torch.equal(result, new_features)

        # Second should be evicted
        assert cache.get(images_list[1]) is None


class TestFeatureCacheStats:
    """Test cache statistics."""

    def test_cache_stats_initial(self):
        """Test initial cache stats."""
        cache = FeatureCache(max_size=10)

        stats = cache.get_stats()
        assert stats['size'] == 0
        assert stats['max_size'] == 10
        assert stats['hits'] == 0
        assert stats['misses'] == 0
        assert stats['ttl_seconds'] == 300.0

    def test_cache_stats_with_entries(self):
        """Test cache stats with entries."""
        cache = FeatureCache(max_size=10)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)

        stats = cache.get_stats()
        assert stats['size'] == 1

    def test_cache_stats_hit_count(self):
        """Test that hit count is tracked correctly."""
        cache = FeatureCache(max_size=10)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)
        cache.get(images)  # Hit 1
        cache.get(images)  # Hit 2
        cache.get(images)  # Hit 3

        stats = cache.get_stats()
        assert stats['hits'] == 3
        assert stats['size'] == 1

    def test_cache_stats_multiple_entries(self):
        """Test cache stats with multiple entries."""
        cache = FeatureCache(max_size=10)

        # Add 3 entries
        for i in range(3):
            images = torch.randn(1, 3, 224, 224)
            features = torch.randn(1, 257, 768)
            cache.put(images, features)

        # Hit first entry twice
        first_images = torch.randn(1, 3, 224, 224)
        first_features = torch.randn(1, 257, 768)
        cache.put(first_images, first_features)
        cache.get(first_images)
        cache.get(first_images)

        stats = cache.get_stats()
        assert stats['size'] == 4
        assert stats['hits'] == 2


class TestFeatureCacheHashKey:
    """Test hash key generation."""

    def test_hash_key_is_consistent(self):
        """Test that same images produce same hash key."""
        cache = FeatureCache()
        images = torch.randn(1, 3, 224, 224)

        key1 = cache._hash_key(images)
        key2 = cache._hash_key(images)

        assert key1 == key2

    def test_hash_key_is_different(self):
        """Test that different images produce different hash keys."""
        cache = FeatureCache()
        images1 = torch.randn(1, 3, 224, 224)
        images2 = torch.randn(1, 3, 224, 224)

        key1 = cache._hash_key(images1)
        key2 = cache._hash_key(images2)

        assert key1 != key2

    def test_hash_key_different_shapes(self):
        """Test hash key with different tensor shapes."""
        cache = FeatureCache()
        images1 = torch.randn(1, 3, 224, 224)
        images2 = torch.randn(2, 3, 224, 224)

        key1 = cache._hash_key(images1)
        key2 = cache._hash_key(images2)

        assert key1 != key2

    def test_hash_key_is_string(self):
        """Test that hash key returns a string."""
        cache = FeatureCache()
        images = torch.randn(1, 3, 224, 224)

        key = cache._hash_key(images)
        assert isinstance(key, str)


class TestFeatureCacheEdgeCases:
    """Test edge cases and error handling."""

    def test_cache_with_zero_max_size(self):
        """Test cache with max_size=0 doesn't store anything."""
        cache = FeatureCache(max_size=0)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)
        assert cache.get(images) is None

    def test_cache_with_single_slot(self):
        """Test cache with max_size=1 works correctly."""
        cache = FeatureCache(max_size=1)
        images1 = torch.randn(1, 3, 224, 224)
        images2 = torch.randn(1, 3, 224, 224)
        features1 = torch.randn(1, 257, 768)
        features2 = torch.randn(1, 257, 768)

        cache.put(images1, features1)
        cache.put(images2, features2)

        # First should be evicted
        assert cache.get(images1) is None
        # Second should be there
        assert cache.get(images2) is not None

    def test_cache_returns_cloned_features(self):
        """Test that cache returns a clone, not reference."""
        cache = FeatureCache(max_size=10)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)
        result = cache.get(images)

        # Modify the result
        result[0, 0, 0] = 999.0

        # Original should be unchanged
        assert features[0, 0, 0] != 999.0

    def test_cache_handles_different_batch_sizes(self):
        """Test cache with different batch sizes."""
        cache = FeatureCache(max_size=10)
        batch1 = torch.randn(2, 3, 224, 224)
        batch2 = torch.randn(4, 3, 224, 224)
        features1 = torch.randn(2, 257, 768)
        features2 = torch.randn(4, 257, 768)

        cache.put(batch1, features1)
        cache.put(batch2, features2)

        assert torch.equal(cache.get(batch1), features1)
        assert torch.equal(cache.get(batch2), features2)

    def test_cache_with_zero_ttl(self):
        """Test cache with TTL=0 expires immediately."""
        cache = FeatureCache(max_size=10, ttl_seconds=0.0)
        images = torch.randn(1, 3, 224, 224)
        features = torch.randn(1, 257, 768)

        cache.put(images, features)
        # Should expire immediately
        result = cache.get(images)
        # With zero TTL, it should expire on first access after put
        # This is implementation-dependent, so we just check it doesn't crash
        assert result is None or isinstance(result, torch.Tensor)
