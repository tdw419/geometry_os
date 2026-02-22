"""Feature caching for Pixel LLM vision encoders.

This module provides LRU caching with TTL support for vision features,
enabling fast repeated image processing.
"""
from .feature_cache import FeatureCache, CacheEntry

__all__ = ['FeatureCache', 'CacheEntry']
