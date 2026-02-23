"""
Unit tests for TriadScorer - CTRM Hybrid Scoring System
"""

import pytest
import sys
sys.path.insert(0, '..')
from triad_scorer import TriadScorer, TriadScore


class TestTriadScorer:
    def test_default_config(self):
        """Scorer has default author/source weights"""
        scorer = TriadScorer()
        assert scorer.author_weights["admin"] == 0.9
        assert scorer.author_weights["editor"] == 0.8
        assert scorer.author_weights["author"] == 0.7
        assert scorer.author_weights["contributor"] == 0.6

    def test_custom_config(self):
        """Scorer accepts custom configuration"""
        scorer = TriadScorer(author_weights={"admin": 1.0})
        assert scorer.author_weights["admin"] == 1.0

    def test_calculate_score_basic(self):
        """calculate_score returns TriadScore with valid range"""
        scorer = TriadScorer()
        score = scorer.calculate_score(0.8, "admin", "post", 2)
        assert isinstance(score, TriadScore)
        assert 0.0 <= score.confidence <= 1.0
        assert 50 <= score.distance_from_center <= 90

    def test_admin_role_boosts_confidence(self):
        """Admin role > contributor confidence"""
        scorer = TriadScorer()
        admin_score = scorer.calculate_score(0.7, "admin", "post", 0)
        contrib_score = scorer.calculate_score(0.7, "contributor", "post", 0)
        assert admin_score.confidence > contrib_score.confidence

    def test_high_confidence_closer_to_center(self):
        """Higher confidence = lower distance"""
        scorer = TriadScorer()
        high = scorer.calculate_score(0.9, "admin", "post", 5)
        low = scorer.calculate_score(0.5, "contributor", "comment", 0)
        assert high.distance_from_center < low.distance_from_center
