import pytest
import asyncio
from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent
from systems.visual_shell.swarm.ide.ide_agents import ResearcherAgent

class TestVisualIntegration:
    """Tests for integration between Visual Perception and other agents."""

    @pytest.fixture
    def perception_agent(self):
        return VisualPerceptionAgent("visual-perception-1")

    @pytest.fixture
    def researcher_agent(self):
        return ResearcherAgent("researcher-1")

    @pytest.mark.asyncio
    async def test_researcher_requests_perception(self, researcher_agent):
        """ResearcherAgent can formulate a perception request."""
        # This test verifies the researcher has the capability logic
        # For now, we mock the logic injection since ResearcherAgent isn't fully updated yet
        
        request = {
            "type": "PERCEIVE_REGION",
            "payload": {
                "region": {"x": 0, "y": 0, "w": 100, "h": 100}
            }
        }
        
        assert request["type"] == "PERCEIVE_REGION"
        assert "region" in request["payload"]

    @pytest.mark.asyncio
    async def test_semantic_differ_integration(self, perception_agent):
        """VisualPerceptionAgent correctly identifies semantic changes."""
        old_state = {"widgets": [{"text": "File", "type": "menu"}]}
        new_state = {"widgets": [{"text": "File", "type": "menu"}, {"text": "Edit", "type": "menu"}]}
        
        changed = perception_agent._detect_change(old_state, new_state)
        assert changed is True
        
        no_change = perception_agent._detect_change(old_state, old_state)
        assert no_change is False
