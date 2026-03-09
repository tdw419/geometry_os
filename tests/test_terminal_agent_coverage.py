import pytest
import numpy as np
from unittest.mock import MagicMock, patch
from systems.evolution_daemon.area_agents.terminal_agent import TerminalAreaAgent, EvolutionProposal

class TestTerminalAreaAgentCoverage:
    """Enhanced coverage tests for TerminalAreaAgent."""

    def setup_method(self):
        # Create a 64x64 agent
        self.bounds = (0, 0, 64, 64)
        self.agent = TerminalAreaAgent("test_agent", self.bounds, semantic_publishing=False)

    def test_analyze_sparse_region(self):
        """Test analysis of a sparse (low density) region."""
        # Create a mostly empty texture
        texture = np.zeros((128, 128, 4), dtype=np.uint8)
        
        # Manually mock the analyzer to return low density
        self.agent.texture_analyzer.analyze = MagicMock()
        self.agent.texture_analyzer.analyze.return_value.density = 0.05
        self.agent.texture_analyzer.analyze.return_value.entropy = 1.0
        self.agent.texture_analyzer.analyze.return_value.non_empty_cells = 10
        
        proposal = self.agent.propose_evolution(texture)
        
        assert proposal is not None
        assert proposal.operation == "consolidate"
        assert "low density" in proposal.rationale

    def test_analyze_high_entropy_region(self):
        """Test analysis of a high entropy region."""
        texture = np.random.randint(0, 255, (128, 128, 4), dtype=np.uint8)
        
        self.agent.texture_analyzer.analyze = MagicMock()
        self.agent.texture_analyzer.analyze.return_value.density = 0.5
        self.agent.texture_analyzer.analyze.return_value.entropy = 6.0
        
        proposal = self.agent.propose_evolution(texture)
        
        assert proposal is not None
        assert proposal.operation == "sharpen"
        assert "High entropy" in proposal.rationale

    def test_analyze_dense_region(self):
        """Test analysis of a dense region."""
        texture = np.ones((128, 128, 4), dtype=np.uint8) * 255
        
        self.agent.texture_analyzer.analyze = MagicMock()
        self.agent.texture_analyzer.analyze.return_value.density = 0.9
        self.agent.texture_analyzer.analyze.return_value.entropy = 2.0
        
        proposal = self.agent.propose_evolution(texture)
        
        assert proposal is not None
        assert proposal.operation == "erode"
        assert "Dense region" in proposal.rationale

    def test_apply_evolution_ops(self):
        """Test applying different evolution operations."""
        texture = np.random.randint(0, 255, (128, 128, 4), dtype=np.uint8)
        
        with patch('evolution_daemon.morphological_ops.erode_texture') as mock_erode, \
             patch('evolution_daemon.morphological_ops.sharpen_texture') as mock_sharpen:
            
            mock_erode.return_value = np.zeros((64, 64, 4), dtype=np.uint8)
            mock_sharpen.return_value = np.ones((64, 64, 4), dtype=np.uint8) * 255
            
            # Test Erode
            proposal = EvolutionProposal("test", "erode", self.bounds, 0.8, "test", {})
            self.agent.apply_evolution(texture, proposal)
            mock_erode.assert_called_once()
            
            # Test Sharpen
            proposal.operation = "sharpen"
            self.agent.apply_evolution(texture, proposal)
            mock_sharpen.assert_called_once()
            
            # Test Consolidate (currently a placeholder)
            proposal.operation = "consolidate"
            self.agent.apply_evolution(texture, proposal)

    def test_no_proposal_on_normal_density(self):
        """Test that no proposal is made for a balanced region."""
        texture = np.zeros((128, 128, 4), dtype=np.uint8)
        
        self.agent.texture_analyzer.analyze = MagicMock()
        self.agent.texture_analyzer.analyze.return_value.density = 0.5
        self.agent.texture_analyzer.analyze.return_value.entropy = 3.0
        
        proposal = self.agent.propose_evolution(texture)
        assert proposal is None

if __name__ == "__main__":
    import pytest
    pytest.main([__file__])
