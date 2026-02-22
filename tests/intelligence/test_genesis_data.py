"""Tests for Genesis KJV data file validation.

Validates the structure and content of genesis_kjv.json data file
used by the CTRM Triad batch analyzer.
"""

import json
import os
import unittest


class TestGenesisData(unittest.TestCase):
    """Test suite for Genesis KJV data file validation."""

    @classmethod
    def setUpClass(cls):
        """Set up class-level test fixtures."""
        # Path to the data file
        cls.data_path = os.path.join(
            os.path.dirname(os.path.dirname(os.path.dirname(__file__))),
            "systems", "intelligence", "data", "genesis_kjv.json"
        )
        cls.data = None

    def setUp(self):
        """Load data file for each test."""
        if self.data is None and os.path.exists(self.data_path):
            with open(self.data_path, "r", encoding="utf-8") as f:
                TestGenesisData.data = json.load(f)

    def test_data_file_exists(self):
        """Verify genesis_kjv.json exists."""
        self.assertTrue(
            os.path.exists(self.data_path),
            f"Data file not found at {self.data_path}"
        )

    def test_data_structure(self):
        """Verify JSON has book, translation, verses keys."""
        self.assertIn("book", self.data, "Missing 'book' key")
        self.assertIn("translation", self.data, "Missing 'translation' key")
        self.assertIn("verses", self.data, "Missing 'verses' key")

        # Verify types
        self.assertIsInstance(self.data["book"], str, "'book' should be string")
        self.assertIsInstance(self.data["translation"], str, "'translation' should be string")
        self.assertIsInstance(self.data["verses"], list, "'verses' should be list")

    def test_verse_count(self):
        """Verify at least 100 verses for pilot processing."""
        verse_count = len(self.data["verses"])
        self.assertGreaterEqual(
            verse_count, 100,
            f"Expected at least 100 verses, got {verse_count}"
        )

    def test_genesis_1_1_content(self):
        """Verify first verse has 'In the beginning'."""
        first_verse = self.data["verses"][0]

        # Verify structure
        self.assertIn("chapter", first_verse, "Verse missing 'chapter'")
        self.assertIn("verse", first_verse, "Verse missing 'verse'")
        self.assertIn("text", first_verse, "Verse missing 'text'")

        # Verify content
        self.assertEqual(first_verse["chapter"], 1, "First verse should be chapter 1")
        self.assertEqual(first_verse["verse"], 1, "First verse should be verse 1")
        self.assertIn(
            "In the beginning",
            first_verse["text"],
            "Genesis 1:1 should contain 'In the beginning'"
        )


if __name__ == "__main__":
    unittest.main()
