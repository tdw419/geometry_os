#!/usr/bin/env python3
"""
Test Runner for ASCII Desktop Control Python Tests

Run with: python3 tests/python/run_tests.py
"""

import sys
import os

# Add current directory to path
sys.path.insert(0, os.path.dirname(__file__))

if __name__ == '__main__':
    import unittest

    # Discover and run all tests
    loader = unittest.TestLoader()
    suite = loader.discover(os.path.dirname(__file__), pattern='test_*.py')

    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)

    # Exit with appropriate code
    sys.exit(0 if result.wasSuccessful() else 1)
