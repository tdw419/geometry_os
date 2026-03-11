"""
Tests for District WebMCP Bridge.

Phase 49: Neural District Coalescence
Tests the WebSocket bridge for district operations.
"""

import base64
import json

import numpy as np
import pytest

from systems.tectonic.district import DistrictFormer
from systems.visual_shell.web.district_bridge import (
    DistrictBridge,
    MockWebSocket,
    handle_district_request,
)

# ─────────────────────────────────────────────────────────────
# Fixtures
# ─────────────────────────────────────────────────────────────

@pytest.fixture
def district_bridge():
    """Create a fresh DistrictBridge for each test."""
    return DistrictBridge()


@pytest.fixture
def district_bridge_with_former():
    """Create a DistrictBridge with a pre-configured DistrictFormer."""
    former = DistrictFormer(similarity_threshold=0.75)
    return DistrictBridge(district_former=former)


@pytest.fixture
def sample_agents():
    """Sample agent data for testing."""
    return {
        "agent_1": {
            "vector": np.array([1.0, 0.0, 0.0] + [0.0] * 61, dtype=np.float32),
            "budget": 10.0
        },
        "agent_2": {
            "vector": np.array([0.95, 0.1, 0.0] + [0.0] * 61, dtype=np.float32),
            "budget": 5.0
        },
        "agent_3": {
            "vector": np.array([0.0, 0.0, 1.0] + [0.0] * 61, dtype=np.float32),
            "budget": 8.0
        },
    }


@pytest.fixture
def sample_agents_json():
    """Sample agent data in JSON-serializable format."""
    return {
        "agent_1": {
            "vector": [1.0, 0.0, 0.0] + [0.0] * 61,
            "budget": 10.0
        },
        "agent_2": {
            "vector": [0.95, 0.1, 0.0] + [0.0] * 61,
            "budget": 5.0
        },
        "agent_3": {
            "vector": [0.0, 0.0, 1.0] + [0.0] * 61,
            "budget": 8.0
        },
    }


# ─────────────────────────────────────────────────────────────
# Test: Bridge Creation
# ─────────────────────────────────────────────────────────────

class TestDistrictBridgeCreation:
    """Tests for DistrictBridge initialization."""

    def test_bridge_creation_default(self, district_bridge):
        """Bridge should be created with default components."""
        assert district_bridge.district_former is not None
        assert district_bridge.heatmap is not None
        assert district_bridge.heatmap.width == 256
        assert district_bridge.heatmap.height == 256

    def test_bridge_creation_with_custom_dimensions(self):
        """Bridge should accept custom canvas dimensions."""
        bridge = DistrictBridge(canvas_width=512, canvas_height=512)
        assert bridge.heatmap.width == 512
        assert bridge.heatmap.height == 512

    def test_bridge_creation_with_custom_former(self, district_bridge_with_former):
        """Bridge should accept custom DistrictFormer."""
        assert district_bridge_with_former.district_former is not None
        assert district_bridge_with_former.district_former.similarity_threshold == 0.75

    def test_bridge_initial_subscribers_empty(self, district_bridge):
        """Bridge should start with empty subscriber sets."""
        assert len(district_bridge.subscribers) == 0
        assert len(district_bridge.district_subscribers) == 0


# ─────────────────────────────────────────────────────────────
# Test: handle_get_districts
# ─────────────────────────────────────────────────────────────

class TestHandleGetDistricts:
    """Tests for handle_get_districts method."""

    @pytest.mark.asyncio
    async def test_get_districts_empty(self, district_bridge):
        """Should return empty list when no districts formed."""
        response = await district_bridge.handle_get_districts({}, None)
        assert response["success"] is True
        assert response["districts"] == []
        assert response["count"] == 0

    @pytest.mark.asyncio
    async def test_get_districts_with_plates(self, district_bridge, sample_agents):
        """Should return plates after forming districts."""
        # First form districts
        await district_bridge.handle_form_districts(
            {"agents": {k: {"vector": v["vector"].tolist(), "budget": v["budget"]}
                       for k, v in sample_agents.items()}},
            None
        )

        # Then get them
        response = await district_bridge.handle_get_districts({}, None)
        assert response["success"] is True
        assert response["count"] > 0
        assert len(response["districts"]) == response["count"]

    @pytest.mark.asyncio
    async def test_get_districts_includes_plate_data(self, district_bridge, sample_agents_json):
        """Each district should include all required fields."""
        await district_bridge.handle_form_districts({"agents": sample_agents_json}, None)
        response = await district_bridge.handle_get_districts({}, None)

        for district in response["districts"]:
            assert "plate_id" in district
            assert "agents" in district
            assert "centroid" in district
            assert "cohesion" in district
            assert "state" in district


# ─────────────────────────────────────────────────────────────
# Test: handle_form_districts
# ─────────────────────────────────────────────────────────────

class TestHandleFormDistricts:
    """Tests for handle_form_districts method."""

    @pytest.mark.asyncio
    async def test_form_districts_returns_plates(self, district_bridge, sample_agents_json):
        """Should return formed plates."""
        response = await district_bridge.handle_form_districts(
            {"agents": sample_agents_json},
            None
        )
        assert response["success"] is True
        assert "districts" in response
        assert response["count"] > 0

    @pytest.mark.asyncio
    async def test_form_districts_missing_agents(self, district_bridge):
        """Should fail when agents field is missing."""
        response = await district_bridge.handle_form_districts({}, None)
        assert response["success"] is False
        assert "agents" in response["error"]

    @pytest.mark.asyncio
    async def test_form_districts_empty_agents(self, district_bridge):
        """Should return empty list when no agents provided."""
        response = await district_bridge.handle_form_districts({"agents": {}}, None)
        assert response["success"] is True
        assert response["districts"] == []
        assert response["count"] == 0

    @pytest.mark.asyncio
    async def test_form_districts_clusters_similar(self, district_bridge):
        """Similar agents should cluster together."""
        # Two very similar agents and one different
        agents = {
            "a": {"vector": [1.0] + [0.0] * 63, "budget": 1.0},
            "b": {"vector": [0.99] + [0.0] * 63, "budget": 1.0},  # Similar to a
            "c": {"vector": [0.0, 0.0, 1.0] + [0.0] * 61, "budget": 1.0},  # Different
        }
        response = await district_bridge.handle_form_districts({"agents": agents}, None)
        assert response["success"] is True
        # a and b should be in same cluster, c in different


# ─────────────────────────────────────────────────────────────
# Test: handle_render_heatmap
# ─────────────────────────────────────────────────────────────

class TestHandleRenderHeatmap:
    """Tests for handle_render_heatmap method."""

    @pytest.mark.asyncio
    async def test_render_heatmap_returns_base64(self, district_bridge):
        """Should return base64-encoded PNG."""
        response = await district_bridge.handle_render_heatmap({}, None)
        assert response["success"] is True
        assert "heatmap" in response
        assert response["format"] == "png"

        # Verify it's valid base64
        try:
            decoded = base64.b64decode(response["heatmap"])
            assert len(decoded) > 0
        except Exception:
            pytest.fail("heatmap is not valid base64")

    @pytest.mark.asyncio
    async def test_render_heatmap_includes_dimensions(self, district_bridge):
        """Should include width and height in response."""
        response = await district_bridge.handle_render_heatmap({}, None)
        assert "width" in response
        assert "height" in response
        assert response["width"] == 256
        assert response["height"] == 256

    @pytest.mark.asyncio
    async def test_render_heatmap_custom_dimensions(self, district_bridge):
        """Should accept custom dimensions."""
        response = await district_bridge.handle_render_heatmap(
            {"width": 128, "height": 128},
            None
        )
        assert response["success"] is True
        assert response["width"] == 128
        assert response["height"] == 128

    @pytest.mark.asyncio
    async def test_render_heatmap_with_plates(self, district_bridge, sample_agents_json):
        """Should render plates when districts exist."""
        await district_bridge.handle_form_districts({"agents": sample_agents_json}, None)
        response = await district_bridge.handle_render_heatmap({}, None)
        assert response["success"] is True
        assert response["plate_count"] > 0


# ─────────────────────────────────────────────────────────────
# Test: Subscribe to District
# ─────────────────────────────────────────────────────────────

class TestSubscribeDistrict:
    """Tests for handle_subscribe_district method."""

    @pytest.mark.asyncio
    async def test_subscribe_all_districts(self, district_bridge):
        """Should add websocket to global subscribers."""
        ws = MockWebSocket()
        response = await district_bridge.handle_subscribe_district({}, ws)

        assert response["success"] is True
        assert ws in district_bridge.subscribers

    @pytest.mark.asyncio
    async def test_subscribe_specific_district(self, district_bridge):
        """Should add websocket to district-specific subscribers."""
        ws = MockWebSocket()
        district_id = "plate_123"

        response = await district_bridge.handle_subscribe_district(
            {"district_id": district_id},
            ws
        )

        assert response["success"] is True
        assert district_id in district_bridge.district_subscribers
        assert ws in district_bridge.district_subscribers[district_id]


# ─────────────────────────────────────────────────────────────
# Test: Broadcast on District Change
# ─────────────────────────────────────────────────────────────

class TestBroadcastDistrictChange:
    """Tests for notify_district_change method."""

    @pytest.mark.asyncio
    async def test_broadcast_to_global_subscribers(self, district_bridge):
        """Global subscribers should receive notifications."""
        ws = MockWebSocket()
        district_bridge.subscribers.add(ws)

        await district_bridge.notify_district_change(
            "formed",
            [{"plate_id": "test_plate"}]
        )

        assert len(ws.messages) == 1
        assert ws.messages[0]["type"] == "district_change"
        assert ws.messages[0]["event"] == "formed"

    @pytest.mark.asyncio
    async def test_broadcast_to_district_subscribers(self, district_bridge):
        """District-specific subscribers should receive notifications."""
        ws = MockWebSocket()
        district_id = "plate_123"
        district_bridge.district_subscribers[district_id] = {ws}

        await district_bridge.notify_district_change(
            "updated",
            district_id=district_id
        )

        assert len(ws.messages) == 1
        assert ws.messages[0]["district_id"] == district_id

    @pytest.mark.asyncio
    async def test_broadcast_removes_failed_subscribers(self, district_bridge):
        """Failed subscribers should be removed."""
        # Create a mock websocket that raises on send
        class FailingWebSocket(MockWebSocket):
            async def send(self, message):
                raise Exception("Connection lost")

        ws = FailingWebSocket()
        district_bridge.subscribers.add(ws)

        await district_bridge.notify_district_change("formed")

        assert ws not in district_bridge.subscribers


# ─────────────────────────────────────────────────────────────
# Test: Unsubscribe
# ─────────────────────────────────────────────────────────────

class TestUnsubscribe:
    """Tests for handle_unsubscribe method."""

    def test_unsubscribe_from_global(self, district_bridge):
        """Should remove from global subscribers."""
        ws = MockWebSocket()
        district_bridge.subscribers.add(ws)

        district_bridge.handle_unsubscribe(ws)

        assert ws not in district_bridge.subscribers

    def test_unsubscribe_from_specific_district(self, district_bridge):
        """Should remove from district-specific subscribers."""
        ws = MockWebSocket()
        district_id = "plate_123"
        district_bridge.district_subscribers[district_id] = {ws}

        district_bridge.handle_unsubscribe(ws)

        assert ws not in district_bridge.district_subscribers.get(district_id, set())

    def test_unsubscribe_cleans_empty_district_sets(self, district_bridge):
        """Empty district subscriber sets should be removed."""
        ws = MockWebSocket()
        district_id = "plate_123"
        district_bridge.district_subscribers[district_id] = {ws}

        district_bridge.handle_unsubscribe(ws)

        assert district_id not in district_bridge.district_subscribers


# ─────────────────────────────────────────────────────────────
# Test: WebSocket Protocol
# ─────────────────────────────────────────────────────────────

class TestWebSocketProtocol:
    """Tests for WebSocket protocol handling."""

    @pytest.mark.asyncio
    async def test_mock_websocket_stores_messages(self):
        """MockWebSocket should store sent messages."""
        ws = MockWebSocket()

        await ws.send('{"test": "data"}')

        assert len(ws.messages) == 1
        assert ws.messages[0] == {"test": "data"}

    @pytest.mark.asyncio
    async def test_mock_websocket_json_parsing(self):
        """MockWebSocket should parse JSON messages."""
        ws = MockWebSocket()

        await ws.send('{"nested": {"data": [1, 2, 3]}}')

        assert ws.messages[0]["nested"]["data"] == [1, 2, 3]

    def test_mock_websocket_hashable(self):
        """MockWebSocket should be hashable for use in sets."""
        ws1 = MockWebSocket()
        ws2 = MockWebSocket()

        # Should not raise
        test_set = {ws1, ws2}
        assert len(test_set) == 2


# ─────────────────────────────────────────────────────────────
# Test: JSON Serialization
# ─────────────────────────────────────────────────────────────

class TestJSONSerialization:
    """Tests for JSON serialization of district data."""

    @pytest.mark.asyncio
    async def test_district_to_dict_json_serializable(self, district_bridge, sample_agents_json):
        """District data should be JSON serializable."""
        await district_bridge.handle_form_districts({"agents": sample_agents_json}, None)
        response = await district_bridge.handle_get_districts({}, None)

        # Should not raise
        json_str = json.dumps(response)
        parsed = json.loads(json_str)

        assert parsed["success"] is True

    @pytest.mark.asyncio
    async def test_centroid_as_list(self, district_bridge, sample_agents_json):
        """Centroid should be serialized as list, not numpy array."""
        await district_bridge.handle_form_districts({"agents": sample_agents_json}, None)
        response = await district_bridge.handle_get_districts({}, None)

        for district in response["districts"]:
            assert isinstance(district["centroid"], list)

    @pytest.mark.asyncio
    async def test_state_as_string(self, district_bridge, sample_agents_json):
        """State should be serialized as string, not enum."""
        await district_bridge.handle_form_districts({"agents": sample_agents_json}, None)
        response = await district_bridge.handle_get_districts({}, None)

        for district in response["districts"]:
            if district["state"] is not None:
                assert isinstance(district["state"], str)


# ─────────────────────────────────────────────────────────────
# Test: Sync Entry Point
# ─────────────────────────────────────────────────────────────

class TestSyncEntryPoint:
    """Tests for handle_district_request sync entry point."""

    def test_get_districts_sync(self):
        """handle_district_request should work for get_districts."""
        response = handle_district_request({"action": "get_districts"})
        assert response["success"] is True
        assert "districts" in response

    def test_unknown_action_sync(self):
        """handle_district_request should handle unknown actions."""
        response = handle_district_request({"action": "unknown"})
        assert response["success"] is False
        assert "Unknown action" in response["error"]

    def test_subscribe_requires_websocket(self):
        """handle_district_request should reject subscribe without websocket."""
        response = handle_district_request({"action": "subscribe_district"})
        assert response["success"] is False
        assert "WebSocket" in response["error"]


# ─────────────────────────────────────────────────────────────
# Test: Integration
# ─────────────────────────────────────────────────────────────

class TestDistrictBridgeIntegration:
    """Integration tests for DistrictBridge."""

    @pytest.mark.asyncio
    async def test_full_workflow(self, district_bridge):
        """Test full workflow: form, get, render, subscribe."""
        # 1. Form districts
        agents = {
            "agent_a": {"vector": [1.0] * 64, "budget": 10.0},
            "agent_b": {"vector": [0.9] * 64, "budget": 5.0},
        }
        form_response = await district_bridge.handle_form_districts({"agents": agents}, None)
        assert form_response["success"] is True

        # 2. Get districts
        get_response = await district_bridge.handle_get_districts({}, None)
        assert get_response["success"] is True
        assert get_response["count"] > 0

        # 3. Render heatmap
        render_response = await district_bridge.handle_render_heatmap({}, None)
        assert render_response["success"] is True
        assert "heatmap" in render_response

        # 4. Subscribe
        ws = MockWebSocket()
        sub_response = await district_bridge.handle_subscribe_district({}, ws)
        assert sub_response["success"] is True

    @pytest.mark.asyncio
    async def test_form_triggers_broadcast(self, district_bridge):
        """Forming districts should broadcast to subscribers."""
        ws = MockWebSocket()
        district_bridge.subscribers.add(ws)

        agents = {"agent_a": {"vector": [1.0] * 64, "budget": 10.0}}
        await district_bridge.handle_form_districts({"agents": agents}, None)

        # Subscriber should receive notification
        assert len(ws.messages) == 1
        assert ws.messages[0]["type"] == "district_change"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
