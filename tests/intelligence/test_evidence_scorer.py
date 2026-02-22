#!/usr/bin/env python3
"""
Unit tests for EvidenceScorer.

Tests CTRM triad scoring including:
- Deterministic output verification
- Manuscript score validation for Genesis
- Score range clamping
- Category-specific archaeology scoring
"""

import unittest
from systems.intelligence.evidence_scorer import EvidenceScorer
from systems.intelligence.verse_classifier import VerseCategory


class TestEvidenceScorer(unittest.TestCase):
    """Test cases for EvidenceScorer scoring logic."""

    def test_deterministic_output(self):
        """Same input should produce same output twice."""
        text = "In the beginning God created the heaven and the earth."
        category = VerseCategory.COSMOLOGICAL

        scores1 = EvidenceScorer.get_mock_scores(text, category)
        scores2 = EvidenceScorer.get_mock_scores(text, category)

        self.assertEqual(scores1, scores2,
            f"Same input produced different outputs: {scores1} vs {scores2}")

    def test_e2_high_for_genesis(self):
        """Manuscript score should be > 0.90 for Genesis verses."""
        # Test multiple Genesis verse texts
        test_cases = [
            ("In the beginning God created the heaven and the earth.", VerseCategory.COSMOLOGICAL),
            ("And God said, Let there be light: and there was light.", VerseCategory.COSMOLOGICAL),
            ("And I will put enmity between thee and the woman.", VerseCategory.PROPHETIC),
            ("And Adam knew Eve his wife.", VerseCategory.HISTORICAL),
        ]

        for text, category in test_cases:
            with self.subTest(text=text[:30]):
                scores = EvidenceScorer.get_mock_scores(text, category)
                self.assertGreater(scores["manuscript"], 0.90,
                    f"E2 manuscript score {scores['manuscript']} not > 0.90 for: {text[:40]}...")

    def test_scores_in_range(self):
        """All scores should be clamped to [0.0, 1.0]."""
        test_cases = [
            ("Short text", VerseCategory.HISTORICAL),
            ("In the beginning God created the heaven and the earth.", VerseCategory.COSMOLOGICAL),
            ("And the name of the third river is Hiddekel: that is it which goeth toward the east of Assyria.", VerseCategory.HISTORICAL),
            ("And I will bless them that bless thee.", VerseCategory.PROPHETIC),
            ("Thou shalt not kill.", VerseCategory.LAW),
        ]

        for text, category in test_cases:
            with self.subTest(text=text[:20]):
                scores = EvidenceScorer.get_mock_scores(text, category)
                for key, value in scores.items():
                    self.assertGreaterEqual(value, 0.0,
                        f"{key} score {value} < 0.0 for: {text[:30]}...")
                    self.assertLessEqual(value, 1.0,
                        f"{key} score {value} > 1.0 for: {text[:30]}...")

    def test_cosmological_low_e1(self):
        """Cosmological category should get low archaeology score."""
        # Cosmological verses describe origins without archaeological anchors
        cosmological_texts = [
            "In the beginning God created the heaven and the earth.",
            "And God said, Let there be light: and there was light.",
            "And God made the firmament.",
        ]

        for text in cosmological_texts:
            with self.subTest(text=text[:30]):
                scores = EvidenceScorer.get_mock_scores(text, VerseCategory.COSMOLOGICAL)
                # Cosmological verses have baseline e1_archaeology = 0.2 + jitter (-0.05 to +0.05)
                # So should be <= 0.25
                self.assertLessEqual(scores["archaeology"], 0.30,
                    f"Cosmological archaeology score {scores['archaeology']} unexpectedly high")


if __name__ == "__main__":
    unittest.main()
