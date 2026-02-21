#!/usr/bin/env python3
"""
Unit tests for VerseClassifier.

Tests classification of Bible verses into CTRM categories including:
- Prophetic reference lookup
- Keyword pattern matching
- Priority order enforcement
- Default fallback behavior
"""

import unittest
from systems.intelligence.verse_classifier import VerseClassifier, VerseCategory


class TestVerseClassifier(unittest.TestCase):
    """Test cases for VerseClassifier classification logic."""

    def test_prophetic_lookup_genesis_3_15(self):
        """Genesis 3:15 (seed of woman) should classify as PROPHETIC."""
        # "And I will put enmity between thee and the woman,
        # and between thy seed and her seed..."
        text = "And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel."
        result = VerseClassifier.classify(text, chapter=3, book="Genesis", verse=15)
        self.assertEqual(result, VerseCategory.PROPHETIC)

    def test_prophetic_lookup_genesis_12_3(self):
        """Genesis 12:3 (bless all families) should classify as PROPHETIC."""
        # "...in thee shall all families of the earth be blessed."
        text = "And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed."
        result = VerseClassifier.classify(text, chapter=12, book="Genesis", verse=3)
        self.assertEqual(result, VerseCategory.PROPHETIC)

    def test_prophetic_lookup_genesis_22_18(self):
        """Genesis 22:18 (seed blessed) should classify as PROPHETIC."""
        # "...in thy seed shall all the nations of the earth be blessed..."
        text = "And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice."
        result = VerseClassifier.classify(text, chapter=22, book="Genesis", verse=18)
        self.assertEqual(result, VerseCategory.PROPHETIC)

    def test_cosmological_detection(self):
        """'In the beginning God created' should classify as COSMOLOGICAL."""
        text = "In the beginning God created the heaven and the earth."
        # Genesis 1:1 triggers cosmological detection via special case rule
        result = VerseClassifier.classify(text, chapter=1, book="Genesis", verse=1)
        self.assertEqual(result, VerseCategory.COSMOLOGICAL)

    def test_historical_fallback(self):
        """Unknown patterns should default to HISTORICAL."""
        # Text without any matching keywords should return HISTORICAL
        text = "And the days of Adam after he had begotten Seth were eight hundred years: and he begat sons and daughters:"
        # This has "begat" which matches historical, so use text without keywords
        text = "And some random text that has no matching keywords at all for any category."
        result = VerseClassifier.classify(text, chapter=5, book="Genesis", verse=4)
        self.assertEqual(result, VerseCategory.HISTORICAL)

    def test_priority_order(self):
        """Prophetic keywords should be detected before historical."""
        # Text containing both "seed" (prophetic) and "begat" (historical)
        # Should return PROPHETIC due to priority order
        text = "This is about the seed that begat many descendants."
        result = VerseClassifier.classify(text, chapter=10, book="Genesis", verse=1)
        self.assertEqual(result, VerseCategory.PROPHETIC)


if __name__ == "__main__":
    unittest.main()
