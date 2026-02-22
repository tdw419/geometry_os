"""Tests for WordPressMemoryProvider TMS methods."""
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone')

from unittest.mock import Mock, patch

def test_tms_url_parameter():
    """Test TMS URL can be configured."""
    from wordpress_memory_provider import WordPressMemoryProvider
    provider = WordPressMemoryProvider(tms_url="http://localhost:9000")
    assert provider.tms_url == "http://localhost:9000"

def test_sync_to_tms_method_exists():
    """Test sync_to_tms method exists."""
    from wordpress_memory_provider import WordPressMemoryProvider
    provider = WordPressMemoryProvider()
    assert hasattr(provider, 'sync_to_tms')

def test_get_truth_stats_method_exists():
    """Test get_truth_stats method exists."""
    from wordpress_memory_provider import WordPressMemoryProvider
    provider = WordPressMemoryProvider()
    assert hasattr(provider, 'get_truth_stats')

if __name__ == "__main__":
    test_tms_url_parameter()
    test_sync_to_tms_method_exists()
    test_get_truth_stats_method_exists()
    print("All memory provider TMS tests passed!")
