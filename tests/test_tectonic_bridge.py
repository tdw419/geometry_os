"""
Tests for TectonicBridge - WebSocket bridge for tectonic operations.

Task 4.1 of Tectonic Realignment Plan.
"""

import json
import time

import pytest

from systems.tectonic.claim import TectonicClaim
from systems.tectonic.negotiator import TectonicNegotiator
from systems.visual_shell.web.tectonic_bridge import (
    MockWebSocket,
    TectonicBridge,
    handle_tectonic_request,
)


class TestTectonicBridge:
    """Tests for TectonicBridge class."""

    @pytest.fixture
    def bridge(self):
        """Create a fresh TectonicBridge for each test."""
        return TectonicBridge()

    @pytest.fixture
    def mock_ws(self):
        """Create a mock WebSocket for each test."""
        return MockWebSocket()

    # Test 1: Handle claim creates correct response
    @pytest.mark.asyncio
    async def test_handle_claim_creates_correct_response(self, bridge, mock_ws):
        """Test that handle_claim creates a valid claim response."""
        data = {
            "tile": [10, 20],
            "purpose": "build_shelter",
            "bid": 1.5,
            "agent_id": "agent_001"
        }

        response = await bridge.handle_claim(data, mock_ws)

        assert response["success"] is True
        assert "claim_id" in response
        assert response["claim_id"]  # Non-empty claim_id

        # Verify claim was added to negotiator
        pending = bridge.negotiator.get_pending_claims()
        assert response["claim_id"] in pending

    # Test 2: Handle bid within window accepted
    @pytest.mark.asyncio
    async def test_handle_bid_within_window_accepted(self, bridge, mock_ws):
        """Test that a bid within the bid window is accepted."""
        # First submit a claim
        claim_data = {
            "tile": [5, 5],
            "purpose": "test",
            "bid": 1.0,
            "agent_id": "agent_001"
        }
        claim_response = await bridge.handle_claim(claim_data, mock_ws)
        claim_id = claim_response["claim_id"]

        # Immediately submit a bid (within window)
        bid_data = {
            "claim_id": claim_id,
            "amount": 2.0,
            "agent_id": "agent_002"
        }

        response = await bridge.handle_bid(bid_data, mock_ws)

        assert response["success"] is True
        assert response["accepted"] is True

    # Test 3: Handle bid after window rejected
    @pytest.mark.asyncio
    async def test_handle_bid_after_window_rejected(self, bridge, mock_ws):
        """Test that a bid after the bid window is rejected."""
        # First submit a claim
        claim_data = {
            "tile": [7, 7],
            "purpose": "test",
            "bid": 1.0,
            "agent_id": "agent_001"
        }
        claim_response = await bridge.handle_claim(claim_data, mock_ws)
        claim_id = claim_response["claim_id"]

        # Wait for bid window to close (500ms + buffer)
        time.sleep(0.6)

        # Submit a bid (after window)
        bid_data = {
            "claim_id": claim_id,
            "amount": 2.0,
            "agent_id": "agent_002"
        }

        response = await bridge.handle_bid(bid_data, mock_ws)

        assert response["success"] is True
        assert response["accepted"] is False

    # Test 4: Handle settle returns settlement
    @pytest.mark.asyncio
    async def test_handle_settle_returns_settlement(self, bridge, mock_ws):
        """Test that handle_settle returns a valid settlement."""
        # First submit a claim
        claim_data = {
            "tile": [3, 4],
            "purpose": "settlement_test",
            "bid": 2.0,
            "agent_id": "agent_001"
        }
        claim_response = await bridge.handle_claim(claim_data, mock_ws)
        claim_id = claim_response["claim_id"]

        # Settle the claim
        settle_data = {"claim_id": claim_id}
        response = await bridge.handle_settle(settle_data, mock_ws)

        assert response["success"] is True
        assert "settlement" in response

        settlement = response["settlement"]
        assert "claim" in settlement
        assert "winner" in settlement
        assert "force" in settlement
        assert "program" in settlement

    # Test 5: Subscribe adds to subscribers list
    @pytest.mark.asyncio
    async def test_subscribe_adds_to_subscribers_list(self, bridge, mock_ws):
        """Test that handle_subscribe adds WebSocket to subscribers."""
        # Subscribe to all settlements
        await bridge.handle_subscribe({}, mock_ws)

        assert mock_ws in bridge.subscribers

        # Subscribe to specific claim
        ws2 = MockWebSocket()
        await bridge.handle_subscribe({"claim_id": "test_claim_123"}, ws2)

        assert ws2 in bridge.claim_subscribers.get("test_claim_123", set())

    # Test 6: Notification broadcasts to subscribers
    @pytest.mark.asyncio
    async def test_notification_broadcasts_to_subscribers(self, bridge):
        """Test that settlement notifications are broadcast to subscribers."""
        # Create mock subscribers
        ws1 = MockWebSocket()
        ws2 = MockWebSocket()

        bridge.subscribers.add(ws1)
        bridge.subscribers.add(ws2)

        # Create and submit a claim
        claim = TectonicClaim(
            tile=(1, 1),
            purpose="test",
            bid=1.0,
            agent_id="agent_001"
        )
        claim_id = bridge.negotiator.submit_claim(claim)

        # Settle and notify
        settlement = bridge.negotiator.settle(claim_id)
        await bridge.notify_settlement(settlement)

        # Verify both subscribers received notification
        assert len(ws1.messages) == 1
        assert len(ws2.messages) == 1

        # Verify message format
        msg = ws1.messages[0]
        assert msg["type"] == "settlement"
        assert "settlement" in msg

    # Test 7: Invalid action returns error
    def test_invalid_action_returns_error(self):
        """Test that handle_tectonic_request returns error for invalid action."""
        response = handle_tectonic_request({"action": "invalid_action"})

        assert response["success"] is False
        assert "error" in response
        assert "Unknown action" in response["error"]

    # Test 8: Missing fields return error
    @pytest.mark.asyncio
    async def test_missing_fields_return_error(self, bridge, mock_ws):
        """Test that missing required fields return error response."""
        # Missing all fields
        response = await bridge.handle_claim({}, mock_ws)
        assert response["success"] is False
        assert "error" in response
        assert "Missing required fields" in response["error"]

        # Missing some fields
        response = await bridge.handle_claim({"tile": [0, 0]}, mock_ws)
        assert response["success"] is False
        assert "Missing required fields" in response["error"]

        # Missing bid fields
        response = await bridge.handle_bid({"claim_id": "test"}, mock_ws)
        assert response["success"] is False
        assert "Missing required fields" in response["error"]

        # Missing settle fields
        response = await bridge.handle_settle({}, mock_ws)
        assert response["success"] is False
        assert "Missing required field" in response["error"]

    # Test 9: JSON serialization of settlement
    @pytest.mark.asyncio
    async def test_json_serialization_of_settlement(self, bridge, mock_ws):
        """Test that settlement can be properly serialized to JSON."""
        # Submit claim
        claim_data = {
            "tile": [15, 25],
            "purpose": "json_test",
            "bid": 3.5,
            "agent_id": "agent_json"
        }
        claim_response = await bridge.handle_claim(claim_data, mock_ws)
        claim_id = claim_response["claim_id"]

        # Settle
        settle_data = {"claim_id": claim_id}
        response = await bridge.handle_settle(settle_data, mock_ws)

        # Verify settlement dict is JSON serializable
        settlement_dict = response["settlement"]
        json_str = json.dumps(settlement_dict)

        # Verify it can be parsed back
        parsed = json.loads(json_str)
        assert parsed["claim"]["tile"] == [15, 25]
        assert parsed["claim"]["purpose"] == "json_test"

    # Test 10: Integration with negotiator
    @pytest.mark.asyncio
    async def test_integration_with_negotiator(self, mock_ws):
        """Test full integration with TectonicNegotiator."""
        # Create bridge with custom negotiator
        negotiator = TectonicNegotiator(
            semantic_weight=1.5,
            competing_weight=0.5,
            anchor_constant=0.2
        )
        bridge = TectonicBridge(negotiator=negotiator)

        # Submit claim
        claim_data = {
            "tile": [10, 10],
            "purpose": "integration_test",
            "bid": 2.0,
            "agent_id": "agent_main"
        }
        claim_response = await bridge.handle_claim(claim_data, mock_ws)
        claim_id = claim_response["claim_id"]

        # Submit counter-bid
        bid_data = {
            "claim_id": claim_id,
            "amount": 1.0,
            "agent_id": "agent_counter"
        }
        bid_response = await bridge.handle_bid(bid_data, mock_ws)
        assert bid_response["accepted"] is True

        # Settle
        settle_data = {"claim_id": claim_id}
        settle_response = await bridge.handle_settle(settle_data, mock_ws)

        assert settle_response["success"] is True
        assert settle_response["settlement"]["winner"] in ["agent_main", "agent_counter"]

        # Verify negotiator statistics
        stats = negotiator.get_statistics()
        assert stats["total_settlements"] == 1
        assert stats["semantic_weight"] == 1.5

    # Test 11: Subscribe to specific claim notifications
    @pytest.mark.asyncio
    async def test_subscribe_to_specific_claim_notifications(self, bridge):
        """Test that claim-specific subscribers receive notifications."""
        ws_specific = MockWebSocket()
        ws_global = MockWebSocket()

        # Create a claim first to get claim_id
        claim = TectonicClaim(
            tile=(5, 5),
            purpose="specific_test",
            bid=1.0,
            agent_id="agent_001"
        )
        claim_id = bridge.negotiator.submit_claim(claim)

        # Subscribe to specific claim
        await bridge.handle_subscribe({"claim_id": claim_id}, ws_specific)

        # Subscribe to all
        await bridge.handle_subscribe({}, ws_global)

        # Settle
        settlement = bridge.negotiator.settle(claim_id)
        await bridge.notify_settlement(settlement)

        # Both should receive notification
        assert len(ws_specific.messages) == 1
        assert len(ws_global.messages) == 1

        # Claim-specific subscribers should be cleaned up
        assert claim_id not in bridge.claim_subscribers

    # Test 12: Unsubscribe removes from all lists
    def test_unsubscribe_removes_from_all_lists(self, bridge):
        """Test that handle_unsubscribe removes WebSocket from all subscriptions."""
        ws = MockWebSocket()

        bridge.subscribers.add(ws)
        bridge.claim_subscribers["claim_1"] = {ws}
        bridge.claim_subscribers["claim_2"] = {ws}

        bridge.handle_unsubscribe(ws)

        assert ws not in bridge.subscribers
        assert ws not in bridge.claim_subscribers.get("claim_1", set())
        assert ws not in bridge.claim_subscribers.get("claim_2", set())

    # Test 13: Settle non-existent claim returns error
    @pytest.mark.asyncio
    async def test_settle_nonexistent_claim_returns_error(self, bridge, mock_ws):
        """Test that settling a non-existent claim returns error."""
        response = await bridge.handle_settle({"claim_id": "nonexistent"}, mock_ws)

        assert response["success"] is False
        assert "error" in response

    # Test 14: Bid on non-existent claim returns not accepted
    @pytest.mark.asyncio
    async def test_bid_on_nonexistent_claim_returns_not_accepted(self, bridge, mock_ws):
        """Test that bidding on non-existent claim returns accepted=False."""
        bid_data = {
            "claim_id": "nonexistent_claim",
            "amount": 1.0,
            "agent_id": "agent_001"
        }

        response = await bridge.handle_bid(bid_data, mock_ws)

        assert response["success"] is True
        assert response["accepted"] is False


class TestHandleTectonicRequest:
    """Tests for handle_tectonic_request function."""

    def test_claim_action(self):
        """Test claim action through main entry point."""
        response = handle_tectonic_request({
            "action": "claim",
            "tile": [1, 2],
            "purpose": "test",
            "bid": 1.0,
            "agent_id": "agent_001"
        })

        assert response["success"] is True
        assert "claim_id" in response

    def test_bid_action(self):
        """Test bid action through main entry point."""
        # First create a claim
        claim_response = handle_tectonic_request({
            "action": "claim",
            "tile": [1, 2],
            "purpose": "test",
            "bid": 1.0,
            "agent_id": "agent_001"
        })
        claim_id = claim_response["claim_id"]

        # Then bid on it
        response = handle_tectonic_request({
            "action": "bid",
            "claim_id": claim_id,
            "amount": 2.0,
            "agent_id": "agent_002"
        })

        assert response["success"] is True
        assert "accepted" in response

    def test_settle_action(self):
        """Test settle action through main entry point."""
        # First create a claim
        claim_response = handle_tectonic_request({
            "action": "claim",
            "tile": [1, 2],
            "purpose": "test",
            "bid": 1.0,
            "agent_id": "agent_001"
        })
        claim_id = claim_response["claim_id"]

        # Then settle it
        response = handle_tectonic_request({
            "action": "settle",
            "claim_id": claim_id
        })

        assert response["success"] is True
        assert "settlement" in response

    def test_subscribe_requires_websocket(self):
        """Test that subscribe action returns error without WebSocket."""
        response = handle_tectonic_request({
            "action": "subscribe"
        })

        assert response["success"] is False
        assert "WebSocket" in response["error"]


class TestMockWebSocket:
    """Tests for MockWebSocket class."""

    @pytest.mark.asyncio
    async def test_send_stores_message(self):
        """Test that send stores message in messages list."""
        ws = MockWebSocket()

        await ws.send('{"test": "data"}')

        assert len(ws.messages) == 1
        assert ws.messages[0] == {"test": "data"}

    @pytest.mark.asyncio
    async def test_close_marks_closed(self):
        """Test that close marks the WebSocket as closed."""
        ws = MockWebSocket()
        assert ws.closed is False

        await ws.close()

        assert ws.closed is True
