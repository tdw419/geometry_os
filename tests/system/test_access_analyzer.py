import pytest
import time
import asyncio
from systems.visual_shell.swarm.access_analyzer import AccessAnalyzer

class TestAccessAnalyzer:
    """Tests for the AccessAnalyzer agent."""

    @pytest.fixture
    def analyzer(self):
        return AccessAnalyzer()

    def test_analyzer_initialization(self, analyzer):
        """AccessAnalyzer initializes with empty state."""
        assert analyzer.access_counts == {}
        assert analyzer.co_occurrences == {}
        assert analyzer.last_access == {}

    def test_file_access_tracking(self, analyzer):
        """AccessAnalyzer tracks file access frequency."""
        analyzer.record_access("file_a")
        analyzer.record_access("file_a")
        analyzer.record_access("file_b")
        
        assert analyzer.access_counts["file_a"] == 2
        assert analyzer.access_counts["file_b"] == 1

    def test_co_occurrence_graph_building(self, analyzer):
        """AccessAnalyzer tracks files accessed close together in time."""
        # Record access to A then B within window
        analyzer.record_access("file_a")
        analyzer.record_access("file_b")
        
        # Check co-occurrence
        pair = tuple(sorted(["file_a", "file_b"]))
        assert analyzer.co_occurrences[pair] == 1
        
        # Record another pair
        analyzer.record_access("file_c")
        pair_bc = tuple(sorted(["file_b", "file_c"]))
        assert analyzer.co_occurrences[pair_bc] == 1

    def test_access_frequency_computation(self, analyzer):
        """AccessAnalyzer computes access frequency over time."""
        analyzer.record_access("file_a")
        # Simulate time passing
        analyzer.last_reset = time.time() - 60
        
        freq = analyzer.get_frequency("file_a")
        assert freq > 0

    @pytest.mark.asyncio
    async def test_shared_memory_publishing(self, analyzer):
        """AccessAnalyzer can publish results to a shared state."""
        analyzer.record_access("file_a")
        state = analyzer.get_state()
        
        assert "access_counts" in state
        assert "co_occurrences" in state
        assert state["access_counts"]["file_a"] == 1
