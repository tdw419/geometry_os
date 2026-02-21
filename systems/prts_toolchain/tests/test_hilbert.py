import unittest
from prts_toolchain.hilbert import HilbertCurve

class TestHilbertCurve(unittest.TestCase):

    def test_d2xy_order_4(self):
        """
        Test the d2xy conversion for a 4x4 grid.
        Values taken from Wikipedia.
        """
        hc = HilbertCurve(4)
        expected_coords = [
            (0, 0), (1, 0), (1, 1), (0, 1),
            (0, 2), (0, 3), (1, 3), (1, 2),
            (2, 2), (2, 3), (3, 3), (3, 2),
            (3, 1), (2, 1), (2, 0), (3, 0)
        ]
        
        for i, (ex, ey) in enumerate(expected_coords):
            x, y = hc.d2xy(i)
            self.assertEqual((x, y), (ex, ey), f"d2xy({i}) failed")

    def test_xy2d_order_4(self):
        """
        Test the xy2d conversion for a 4x4 grid.
        """
        hc = HilbertCurve(4)
        for i in range(16):
            x, y = hc.d2xy(i)
            d = hc.xy2d(x, y)
            self.assertEqual(d, i, f"xy2d({x},{y}) failed")
            
    def test_roundtrip_8x8(self):
        """
        Test that d2xy and xy2d are inverses for an 8x8 grid.
        """
        n = 8
        hc = HilbertCurve(n)
        for d_orig in range(n * n):
            x, y = hc.d2xy(d_orig)
            self.assertLess(x, n)
            self.assertLess(y, n)
            d_new = hc.xy2d(x, y)
            self.assertEqual(d_orig, d_new, f"Roundtrip failed for d={d_orig}")

if __name__ == '__main__':
    unittest.main()
