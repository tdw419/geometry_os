import pytest
import asyncio
from systems.visual_shell.swarm.visual_perception.visual_perception_agent import VisualPerceptionAgent

class TestVisualPerceptionAgent:
    """Tests for the Visual Perception Agent."""

    @pytest.fixture
    def agent(self):
        return VisualPerceptionAgent("visual-perception-1")

    @pytest.mark.asyncio
    async def test_agent_initialization(self, agent):
        """Agent initializes with correct capabilities."""
        assert "visual_perception" in agent.capabilities
        assert "extraction" in agent.capabilities

    @pytest.mark.asyncio
    async def test_message_handler_registration(self, agent):
        """Agent handles PERCEIVE_REGION messages."""
        msg = {
            "type": "PERCEIVE_REGION",
            "from_agent": "requester-1",
            "payload": {
                "region": {"x": 0, "y": 0, "w": 512, "h": 512}
            }
        }
        
        # Mock extraction for this test
        agent._extract_region = lambda r, i: {"widgets": [], "metadata": {}}
        
        response = await agent.handle_message(msg)
        assert response["type"] == "PERCEPTION_RESULT"
        assert "scene_graph" in response["payload"]

    @pytest.mark.asyncio
    async def test_change_aware_broadcasting(self, agent):
        """Agent detects changes in visual state."""
        state1 = {"widgets": [{"id": 1}]}
        state2 = {"widgets": [{"id": 1}]} # Same state
        state3 = {"widgets": [{"id": 1}, {"id": 2}]} # Changed state
        
        assert agent._detect_change(state1, state2) is False
        assert agent._detect_change(state2, state3) is True
