import pytest
from systems.visual_shell.swarm.verification_agent import VerificationAgent

class TestVerificationAgent:
    """Tests for the VerificationAgent agent."""

    @pytest.fixture
    def verifier(self):
        return VerificationAgent()

    def test_verifier_initialization(self, verifier):
        """VerificationAgent initializes with zeroed metrics."""
        assert verifier.metrics_history == []

    def test_optimization_result_validation(self, verifier):
        """Verifier computes system score from map state."""
        # Related files close together = High score
        state = {
            "positions": {"a": {"x": 0, "y": 0}, "b": {"x": 10, "y": 0}},
            "relationships": [("a", "b", 10)]
        }
        score_high = verifier.compute_system_score(state)
        
        # Related files far apart = Low score
        state_bad = {
            "positions": {"a": {"x": 0, "y": 0}, "b": {"x": 1000, "y": 0}},
            "relationships": [("a", "b", 10)]
        }
        score_low = verifier.compute_system_score(state_bad)
        
        assert score_high > score_low

    def test_metric_comparison(self, verifier):
        """Verifier identifies improvements between two states."""
        before = {"positions": {"a": {"x": 0}, "b": {"x": 100}}, "relationships": [("a", "b", 1)]}
        after = {"positions": {"a": {"x": 0}, "b": {"x": 10}}, "relationships": [("a", "b", 1)]}
        
        improvement = verifier.compare_states(before, after)
        assert improvement > 0

    def test_regression_detection(self, verifier):
        """Verifier flags if an optimization made things worse."""
        before = {"positions": {"a": {"x": 0}, "b": {"x": 10}}, "relationships": [("a", "b", 1)]}
        after = {"positions": {"a": {"x": 0}, "b": {"x": 100}}, "relationships": [("a", "b", 1)]}
        
        improvement = verifier.compare_states(before, after)
        assert improvement < 0

    def test_report_generation(self, verifier):
        """Verifier generates a summary report of the optimization."""
        verifier.record_optimization("tectonic-1", score_before=0.5, score_after=0.8)
        
        report = verifier.generate_report()
        assert "tectonic-1" in report
        assert "60.0%" in report # (0.8 - 0.5) / 0.5 = 0.6
