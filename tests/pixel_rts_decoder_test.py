#!/usr/bin/env python3
"""Tests for Hilbert curve implementation in pixel_rts_decoder.py"""

import sys
sys.path.insert(0, '/home/jericho/zion/projects/geometry_os/geometry_os')

from systems.pixel_compiler.pixel_rts_decoder import HilbertCurve

def test_hilbert_curve_order_1():
    """Test Hilbert curve with order 1."""
    print("Testing Hilbert curve order 1...")
    curve = HilbertCurve(order=1)
    lut = curve.generate_lut()
    
    # Order 1 should have 4 points (2^2)
    assert len(lut) == 4, f"Expected 4 points, got {len(lut)}"
    
    print("✓ Order 1 test passed")
    return True

def test_hilbert_curve_order_2():
    """Test Hilbert curve with order 2."""
    print("Testing Hilbert curve order 2...")
    curve = HilbertCurve(order=2)
    lut = curve.generate_lut()
    
    # Order 2 should have 16 points (2^4)
    assert len(lut) == 16, f"Expected 16 points, got {len(lut)}"
    
    print("✓ Order 2 test passed")
    return True

def test_hilbert_curve_order_3():
    """Test Hilbert curve with order 3."""
    print("Testing Hilbert curve order 3...")
    curve = HilbertCurve(order=3)
    lut = curve.generate_lut()
    
    # Order 3 should have 64 points (2^6)
    assert len(lut) == 64, f"Expected 64 points, got {len(lut)}"
    
    print("✓ Order 3 test passed")
    return True

def test_hilbert_curve_order_4():
    """Test Hilbert curve with order 4."""
    print("Testing Hilbert curve order 4...")
    curve = HilbertCurve(order=4)
    lut = curve.generate_lut()
    
    # Order 4 should have 256 points (2^8)
    assert len(lut) == 256, f"Expected 256 points, got {len(lut)}"
    
    print("✓ Order 4 test passed")
    return True

def test_hilbert_curve_order_5():
    """Test Hilbert curve with order 5."""
    print("Testing Hilbert curve order 5...")
    curve = HilbertCurve(order=5)
    lut = curve.generate_lut()
    
    # Order 5 should have 1024 points (2^10)
    assert len(lut) == 1024, f"Expected 1024 points, got {len(lut)}"
    
    print("✓ Order 5 test passed")
    return True

if __name__ == "__main__":
    print("=" * 50)
    print("Running Hilbert Curve Implementation Tests")
    print("=" * 50)
    
    try:
        test_hilbert_curve_order_1()
        test_hilbert_curve_order_2()
        test_hilbert_curve_order_3()
        test_hilbert_curve_order_4()
        test_hilbert_curve_order_5()
        
        print("=" * 50)
        print("✓ All tests passed!")
        print("=" * 50)
    except AssertionError as e:
        print(f"=" * 50)
        print(f"✗ Test failed: {e}")
        print("=" * 50)
        sys.exit(1)
    except Exception as e:
        print(f"=" * 50)
        print(f"✗ Unexpected error: {e}")
        print("=" * 50)
        sys.exit(1)
