# systems/visual_shell/web/tectonic_bridge.py
"""
Tectonic Bridge - WebSocket bridge for tectonic operations.

Task 4.1 of Tectonic Realignment Plan.

Bridges WebMCP tectonic tools to Python TectonicNegotiator.
"""

import asyncio
import json
import logging
from dataclasses import dataclass, field
from typing import Any

from systems.tectonic.claim import (
    TectonicBid,
    TectonicClaim,
    TectonicSettlement,
)
from systems.tectonic.negotiator import TectonicNegotiator

logger = logging.getLogger("tectonic_bridge")


@dataclass(eq=False)
class MockWebSocket:
    """
    Mock WebSocket for testing.

    Stores sent messages for verification in tests.
    Uses object identity for equality (not contents) to be hashable.
    """

    messages: list = field(default_factory=list)
    closed: bool = False
    _id: int = field(default_factory=lambda: id(object()))

    def __hash__(self) -> int:
        """Use object id for hashing."""
        return hash(self._id)

    def __eq__(self, other: object) -> bool:
        """Use object identity for equality."""
        return self is other

    async def send(self, message: str) -> None:
        """Store message for verification."""
        self.messages.append(json.loads(message))

    async def close(self) -> None:
        """Mark as closed."""
        self.closed = True


class TectonicBridge:
    """
    WebSocket bridge for tectonic operations.

    Handles claim, bid, settle, and subscribe operations via WebSocket.
    Manages subscriptions for settlement notifications.

    Attributes:
        negotiator: Shared TectonicNegotiator instance
        subscribers: Clients subscribed to all settlement notifications
        claim_subscribers: Clients watching specific claims
    """

    def __init__(self, negotiator: TectonicNegotiator | None = None):
        """
        Initialize the bridge.

        Args:
            negotiator: Optional TectonicNegotiator instance (creates new if None)
        """
        self.negotiator = negotiator or TectonicNegotiator()
        self.subscribers: set[Any] = set()  # WebSocket clients for all settlements
        self.claim_subscribers: dict[str, set[Any]] = {}  # claim_id -> WebSocket clients

    async def handle_claim(self, data: dict, websocket: Any) -> dict:
        """
        Submit a tectonic claim via WebSocket.

        Args:
            data: Request data with tile, purpose, bid, agent_id
            websocket: WebSocket connection (unused but kept for consistency)

        Returns:
            Response dict with success status and claim_id
        """
        # Validate required fields
        required = ["tile", "purpose", "bid", "agent_id"]
        missing = [f for f in required if f not in data]
        if missing:
            return {
                "success": False,
                "error": f"Missing required fields: {', '.join(missing)}"
            }

        try:
            # Create claim
            tile = tuple(data["tile"])
            claim = TectonicClaim(
                tile=tile,
                purpose=data["purpose"],
                bid=float(data["bid"]),
                agent_id=data["agent_id"],
            )

            # Submit to negotiator
            claim_id = self.negotiator.submit_claim(claim)

            return {
                "success": True,
                "claim_id": claim_id
            }
        except Exception as e:
            logger.error(f"Error submitting claim: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    async def handle_bid(self, data: dict, websocket: Any) -> dict:
        """
        Submit a counter-bid on an existing claim.

        Args:
            data: Request data with claim_id, amount, agent_id
            websocket: WebSocket connection (unused but kept for consistency)

        Returns:
            Response dict with success status and accepted flag
        """
        # Validate required fields
        required = ["claim_id", "amount", "agent_id"]
        missing = [f for f in required if f not in data]
        if missing:
            return {
                "success": False,
                "error": f"Missing required fields: {', '.join(missing)}"
            }

        try:
            # Create bid
            bid = TectonicBid(
                claim_id=data["claim_id"],
                amount=float(data["amount"]),
                agent_id=data["agent_id"],
            )

            # Submit to negotiator
            accepted = self.negotiator.submit_bid(bid)

            return {
                "success": True,
                "accepted": accepted
            }
        except ValueError as e:
            logger.error(f"Invalid bid: {e}")
            return {
                "success": False,
                "error": str(e)
            }
        except Exception as e:
            logger.error(f"Error submitting bid: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    async def handle_settle(self, data: dict, websocket: Any) -> dict:
        """
        Trigger settlement of a claim.

        Args:
            data: Request data with claim_id
            websocket: WebSocket connection (unused but kept for consistency)

        Returns:
            Response dict with success status and settlement data
        """
        # Validate required fields
        if "claim_id" not in data:
            return {
                "success": False,
                "error": "Missing required field: claim_id"
            }

        try:
            claim_id = data["claim_id"]

            # Settle the claim
            settlement = self.negotiator.settle(claim_id)

            # Notify subscribers
            await self.notify_settlement(settlement)

            return {
                "success": True,
                "settlement": settlement.to_dict()
            }
        except KeyError as e:
            logger.error(f"Claim not found: {e}")
            return {
                "success": False,
                "error": f"Claim not found: {claim_id}"
            }
        except Exception as e:
            logger.error(f"Error settling claim: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    async def handle_subscribe(self, data: dict, websocket: Any) -> None:
        """
        Subscribe to settlement notifications.

        Args:
            data: Request data with optional claim_id for specific claim
            websocket: WebSocket connection to add to subscribers
        """
        claim_id = data.get("claim_id")

        if claim_id:
            # Subscribe to specific claim
            if claim_id not in self.claim_subscribers:
                self.claim_subscribers[claim_id] = set()
            self.claim_subscribers[claim_id].add(websocket)
            logger.info(f"WebSocket subscribed to claim {claim_id}")
        else:
            # Subscribe to all settlements
            self.subscribers.add(websocket)
            logger.info("WebSocket subscribed to all settlements")

    async def notify_settlement(self, settlement: TectonicSettlement) -> None:
        """
        Broadcast settlement notification to subscribers.

        Args:
            settlement: The settlement to broadcast
        """
        message = json.dumps({
            "type": "settlement",
            "settlement": settlement.to_dict()
        })

        # Notify global subscribers
        for ws in list(self.subscribers):
            try:
                await ws.send(message)
            except Exception as e:
                logger.warning(f"Failed to notify subscriber: {e}")
                self.subscribers.discard(ws)

        # Notify claim-specific subscribers
        claim_id = settlement.claim.claim_id
        if claim_id in self.claim_subscribers:
            for ws in list(self.claim_subscribers[claim_id]):
                try:
                    await ws.send(message)
                except Exception as e:
                    logger.warning(f"Failed to notify claim subscriber: {e}")
                    self.claim_subscribers[claim_id].discard(ws)

            # Clean up claim subscribers after settlement
            del self.claim_subscribers[claim_id]

    def handle_unsubscribe(self, websocket: Any) -> None:
        """
        Remove a WebSocket from all subscriptions.

        Args:
            websocket: The WebSocket to unsubscribe
        """
        self.subscribers.discard(websocket)

        for claim_id in list(self.claim_subscribers.keys()):
            self.claim_subscribers[claim_id].discard(websocket)
            if not self.claim_subscribers[claim_id]:
                del self.claim_subscribers[claim_id]


# Module-level bridge for sync operations
_sync_bridge: TectonicBridge | None = None


def _get_sync_bridge() -> TectonicBridge:
    """Get or create the singleton bridge for sync operations."""
    global _sync_bridge
    if _sync_bridge is None:
        _sync_bridge = TectonicBridge()
    return _sync_bridge


def handle_tectonic_request(request: dict[str, Any]) -> dict[str, Any]:
    """
    Main entry point for synchronous tectonic requests.

    For async WebSocket operations, use TectonicBridge class directly.

    Args:
        request: Request dict with action and action-specific data

    Returns:
        Response dict with success status and result data
    """
    bridge = _get_sync_bridge()

    action = request.get("action", "")

    if action == "claim":
        # Synchronous claim (no actual async needed)
        return asyncio.run(bridge.handle_claim(request, None))
    elif action == "bid":
        return asyncio.run(bridge.handle_bid(request, None))
    elif action == "settle":
        return asyncio.run(bridge.handle_settle(request, None))
    elif action == "subscribe":
        return {
            "success": False,
            "error": "Subscribe action requires WebSocket connection"
        }
    else:
        return {
            "success": False,
            "error": f"Unknown action: {action}"
        }
