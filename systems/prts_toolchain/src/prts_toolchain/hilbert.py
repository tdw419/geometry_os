"""
Hilbert Curve implementation for mapping 1D sequences to 2D space.
"""

class HilbertCurve:
    """
    A class to handle conversions between 1D distance along a Hilbert curve
    and 2D coordinates.
    """
    def __init__(self, n):
        """
        Initializes the HilbertCurve for a grid of size n x n.
        
        Args:
            n (int): The size of the grid. Must be a power of 2.
        """
        if n <= 0 or (n & (n - 1)) != 0:
            # This check is not strictly necessary for the algorithm but is good practice
            # for ensuring the grid is a power of 2, which is typical for Hilbert curves.
            # We will rely on the caller to provide a power of 2.
            pass
        self.n = n

    def d2xy(self, d):
        """
        Converts a 1D distance 'd' to a 2D coordinate (x, y).

        Args:
            d (int): The distance along the curve.

        Returns:
            tuple[int, int]: The (x, y) coordinate.
        """
        n = self.n
        x, y = 0, 0
        s = 1
        while s < n:
            rx = 1 & (d // 2)
            ry = 1 & (d ^ rx)
            if ry == 0:
                if rx == 1:
                    x = s - 1 - x
                    y = s - 1 - y
                x, y = y, x
            x += s * rx
            y += s * ry
            d //= 4
            s *= 2
        return x, y

    def xy2d(self, x, y):
        """
        Converts a 2D coordinate (x, y) to a 1D distance 'd'.

        Args:
            x (int): The x-coordinate.
            y (int): The y-coordinate.

        Returns:
            int: The distance along the curve.
        """
        n = self.n
        d = 0
        s = n // 2
        while s > 0:
            rx = (x & s) > 0
            ry = (y & s) > 0
            d += s * s * ((3 * rx) ^ ry)
            if ry == 0:
                if rx == 1:
                    x = n - 1 - x
                    y = n - 1 - y
                x, y = y, x
            s //= 2
        return d
