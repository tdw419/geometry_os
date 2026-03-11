"""
Tests for GlyphCache class with LRU eviction.

Task 15 from STATE_V4.md: Native Glyph Shell: Implement Glyph Cache with LRU Eviction

Tests:
(a) GlyphCache class with max_entries parameter (default 256)
(b) cache_get(glyph_id) and cache_put(glyph_id, bitmap) methods with LRU tracking
(c) GLYPH_CACHE_EVICT instruction emitted when cache full
(d) Cache hit/miss counters for profiling
(e) Integration with existing GLYPH_DEFINE to auto-cache
"""

import sys
from pathlib import Path

import pytest

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from geoscript_transpiler import GlyphCache


class TestGlyphCacheBasic:
    """Tests for basic GlyphCache functionality."""

    def test_glyph_cache_import(self):
        """GlyphCache should be importable from geoscript_transpiler."""
        from geoscript_transpiler import GlyphCache
        assert GlyphCache is not None

    def test_glyph_cache_default_max_entries(self):
        """GlyphCache should have default max_entries of 256."""
        cache = GlyphCache()
        assert cache.max_entries == 256

    def test_glyph_cache_custom_max_entries(self):
        """GlyphCache should accept custom max_entries."""
        cache = GlyphCache(max_entries=10)
        assert cache.max_entries == 10

    def test_glyph_cache_empty(self):
        """Empty cache should have size 0."""
        cache = GlyphCache()
        assert cache.size() == 0


class TestGlyphCachePutGet:
    """Tests for cache_put and cache_get methods."""

    def test_cache_put_increases_size(self):
        """cache_put should increase cache size."""
        cache = GlyphCache(max_entries=10)
        cache.cache_put('g1', [0, 1, 2, 3])
        assert cache.size() == 1

    def test_cache_get_returns_bitmap(self):
        """cache_get should return the stored bitmap."""
        cache = GlyphCache(max_entries=10)
        bitmap = [0, 1, 2, 3]
        cache.cache_put('g1', bitmap)
        result = cache.cache_get('g1')
        assert result == bitmap

    def test_cache_get_missing_returns_none(self):
        """cache_get for missing glyph should return None."""
        cache = GlyphCache(max_entries=10)
        result = cache.cache_get('nonexistent')
        assert result is None

    def test_cache_put_overwrites(self):
        """cache_put with same ID should overwrite."""
        cache = GlyphCache(max_entries=10)
        cache.cache_put('g1', [0, 1])
        cache.cache_put('g1', [2, 3])
        result = cache.cache_get('g1')
        assert result == [2, 3]
        assert cache.size() == 1


class TestGlyphCacheLRU:
    """Tests for LRU eviction."""

    def test_lru_order_on_access(self):
        """Accessing an item should move it to most-recently-used."""
        cache = GlyphCache(max_entries=3)
        cache.cache_put('g1', [1])
        cache.cache_put('g2', [2])
        cache.cache_put('g3', [3])

        # Access g1, making g2 the LRU
        cache.cache_get('g1')

        # Add g4, should evict g2 (LRU)
        cache.cache_put('g4', [4])

        assert cache.cache_get('g1') is not None  # Still present
        assert cache.cache_get('g2') is None      # Evicted
        assert cache.cache_get('g3') is not None  # Still present
        assert cache.cache_get('g4') is not None  # Just added

    def test_eviction_returns_evicted_ids(self):
        """cache_put that causes eviction should return evicted glyph IDs."""
        cache = GlyphCache(max_entries=2)
        cache.cache_put('g1', [1])
        cache.cache_put('g2', [2])

        # This should evict g1
        evicted = cache.cache_put('g3', [3])

        assert 'g1' in evicted
        assert len(evicted) == 1

    def test_multiple_evictions(self):
        """Adding multiple items beyond capacity should evict multiple."""
        cache = GlyphCache(max_entries=2)
        cache.cache_put('g1', [1])
        cache.cache_put('g2', [2])

        evicted = cache.cache_put('g3', [3])
        assert 'g1' in evicted

        evicted = cache.cache_put('g4', [4])
        assert 'g2' in evicted

    def test_evictions_counter(self):
        """Cache should track total evictions."""
        cache = GlyphCache(max_entries=2)
        cache.cache_put('g1', [1])
        cache.cache_put('g2', [2])
        cache.cache_put('g3', [3])
        cache.cache_put('g4', [4])

        assert cache.evictions >= 2


class TestGlyphCacheCounters:
    """Tests for cache hit/miss counters."""

    def test_hit_counter(self):
        """Cache should track hits."""
        cache = GlyphCache(max_entries=10)
        cache.cache_put('g1', [1])

        cache.cache_get('g1')
        cache.cache_get('g1')
        cache.cache_get('g1')

        assert cache.hits == 3

    def test_miss_counter(self):
        """Cache should track misses."""
        cache = GlyphCache(max_entries=10)

        cache.cache_get('missing1')
        cache.cache_get('missing2')
        cache.cache_get('missing3')

        assert cache.misses == 3

    def test_hit_and_miss_counter(self):
        """Cache should track both hits and misses."""
        cache = GlyphCache(max_entries=10)
        cache.cache_put('g1', [1])

        cache.cache_get('g1')      # hit
        cache.cache_get('missing') # miss
        cache.cache_get('g1')      # hit

        assert cache.hits == 2
        assert cache.misses == 1


class TestGlyphCacheEvictInstruction:
    """Tests for GLYPH_CACHE_EVICT instruction emission."""

    def test_get_evict_instructions_returns_list(self):
        """get_evict_instructions should return list of instructions."""
        cache = GlyphCache(max_entries=2)
        cache.cache_put('g1', [1])
        cache.cache_put('g2', [2])
        cache.cache_put('g3', [3])

        instructions = cache.get_evict_instructions()
        assert isinstance(instructions, list)

    def test_evict_instruction_format(self):
        """Evict instructions should be in correct format."""
        cache = GlyphCache(max_entries=2)
        cache.cache_put('g1', [1])
        cache.cache_put('g2', [2])
        cache.cache_put('g3', [3])

        instructions = cache.get_evict_instructions()
        # Should have at least one GLYPH_CACHE_EVICT instruction
        assert len(instructions) >= 1
        assert 'GLYPH_CACHE_EVICT' in instructions[0]

    def test_no_evict_instructions_when_not_full(self):
        """No evict instructions when cache not full."""
        cache = GlyphCache(max_entries=10)
        cache.cache_put('g1', [1])

        instructions = cache.get_evict_instructions()
        # Should be empty or have no eviction instructions
        evict_count = sum(1 for i in instructions if 'EVICT' in i)
        assert evict_count == 0


class TestGlyphCacheIntegration:
    """Integration tests for GlyphCache with transpiler."""

    def test_300_glyphs_causes_eviction(self):
        """Creating 300 glyphs should cause eviction in 256-entry cache."""
        cache = GlyphCache(max_entries=256)

        for i in range(300):
            cache.cache_put(f'g{i}', [i])

        # Should have evicted at least 44 glyphs (300 - 256)
        assert cache.evictions >= 44

    def test_cache_stays_at_max_capacity(self):
        """Cache should never exceed max_entries."""
        cache = GlyphCache(max_entries=10)

        for i in range(50):
            cache.cache_put(f'g{i}', [i])

        assert cache.size() <= 10


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
