"""Tests for publish_to_wp.py CTRM helpers."""
import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone')

def test_publish_truth_exists():
    """Test publish_truth function exists."""
    from publish_to_wp import publish_truth
    assert callable(publish_truth)

def test_publish_ansmo_cycle_exists():
    """Test publish_ansmo_cycle function exists."""
    from publish_to_wp import publish_ansmo_cycle
    assert callable(publish_ansmo_cycle)

def test_sync_ctrm_truths_exists():
    """Test sync_ctrm_truths function exists."""
    from publish_to_wp import sync_ctrm_truths
    assert callable(sync_ctrm_truths)

if __name__ == "__main__":
    test_publish_truth_exists()
    test_publish_ansmo_cycle_exists()
    test_sync_ctrm_truths_exists()
    print("All publish CTRM tests passed!")
