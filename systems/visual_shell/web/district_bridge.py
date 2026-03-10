# systems/visual_shell/web/district_bridge.py
"""
District Bridge - WebSocket bridge for district operations.

Phase 49: Neural District Coalescence
Bridges WebMCP district tools to Python DistrictFormer and visualization.
"""

import asyncio
import base64
import io
import json
import logging
from dataclasses import dataclass, field
from typing import Dict, Any, Set, Optional, List

import numpy as np

from systems.tectonic.district import DistrictFormer
from systems.tectonic.visual import DistrictHeatmap

logger = logging.getLogger("district_bridge")


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


class DistrictBridge:
    """
    WebSocket bridge for district operations.

    Handles get_districts, form_districts, render_heatmap, and subscribe operations.
    Manages subscriptions for district change notifications.

    Attributes:
        district_former: DistrictFormer instance for clustering
        heatmap: DistrictHeatmap instance for rendering
        subscribers: Clients subscribed to all district notifications
        district_subscribers: Clients watching specific districts
    """

    def __init__(
        self,
        district_former: Optional[DistrictFormer] = None,
        heatmap: Optional[DistrictHeatmap] = None,
        canvas_width: int = 256,
        canvas_height: int = 256,
    ):
        """
        Initialize the bridge.

        Args:
            district_former: Optional DistrictFormer instance (creates new if None)
            heatmap: Optional DistrictHeatmap instance (creates new if None)
            canvas_width: Width for heatmap rendering (default: 256)
            canvas_height: Height for heatmap rendering (default: 256)
        """
        self.district_former = district_former or DistrictFormer()
        self.heatmap = heatmap or DistrictHeatmap(width=canvas_width, height=canvas_height)
        self.subscribers: Set[Any] = set()  # WebSocket clients for all district changes
        self.district_subscribers: Dict[str, Set[Any]] = {}  # district_id -> WebSocket clients

    async def handle_get_districts(self, data: dict, websocket: Any) -> dict:
        """
        Get all current districts/plates.

        Args:
            data: Request data (unused, kept for consistency)
            websocket: WebSocket connection (unused but kept for consistency)

        Returns:
            Response dict with success status and plates list
        """
        try:
            plates = self.district_former.plates
            plates_data = [plate.to_dict() for plate in plates]

            return {
                "success": True,
                "districts": plates_data,
                "count": len(plates_data)
            }
        except Exception as e:
            logger.error(f"Error getting districts: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    async def handle_form_districts(self, data: dict, websocket: Any) -> dict:
        """
        Form districts from agent data.

        Args:
            data: Request data with agents dict
            websocket: WebSocket connection (unused but kept for consistency)

        Returns:
            Response dict with success status and formed plates
        """
        # Validate required fields
        if "agents" not in data:
            return {
                "success": False,
                "error": "Missing required field: agents"
            }

        try:
            agents_data = data["agents"]

            # Convert agent vectors from lists to numpy arrays
            agents: Dict[str, Dict] = {}
            for agent_id, agent_info in agents_data.items():
                vector = agent_info.get("vector", [])
                if isinstance(vector, list):
                    vector = np.array(vector, dtype=np.float32)
                agents[agent_id] = {
                    "vector": vector,
                    "budget": agent_info.get("budget", 0.0)
                }

            # Form districts
            plates = self.district_former.form_districts(agents)
            plates_data = [plate.to_dict() for plate in plates]

            # Notify subscribers of district formation
            await self.notify_district_change("formed", plates_data)

            return {
                "success": True,
                "districts": plates_data,
                "count": len(plates_data)
            }
        except Exception as e:
            logger.error(f"Error forming districts: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    async def handle_render_heatmap(self, data: dict, websocket: Any) -> dict:
        """
        Render current districts as a heatmap.

        Args:
            data: Request data with optional width/height overrides
            websocket: WebSocket connection (unused but kept for consistency)

        Returns:
            Response dict with success status and base64-encoded PNG
        """
        try:
            # Get optional dimensions
            width = data.get("width", self.heatmap.width)
            height = data.get("height", self.heatmap.height)

            # Update heatmap dimensions if needed
            if width != self.heatmap.width or height != self.heatmap.height:
                self.heatmap = DistrictHeatmap(width=width, height=height)

            # Render plates
            plates = self.district_former.plates
            frame = self.heatmap.render(plates)

            # Convert to PNG
            from PIL import Image
            img = Image.fromarray(frame, mode="RGBA")

            # Encode to base64
            buffer = io.BytesIO()
            img.save(buffer, format="PNG")
            img_base64 = base64.b64encode(buffer.getvalue()).decode("utf-8")

            return {
                "success": True,
                "heatmap": img_base64,
                "width": width,
                "height": height,
                "format": "png",
                "plate_count": len(plates)
            }
        except Exception as e:
            logger.error(f"Error rendering heatmap: {e}")
            return {
                "success": False,
                "error": str(e)
            }

    async def handle_subscribe_district(self, data: dict, websocket: Any) -> dict:
        """
        Subscribe to district change notifications.

        Args:
            data: Request data with optional district_id for specific district
            websocket: WebSocket connection to add to subscribers

        Returns:
            Response dict with success status
        """
        district_id = data.get("district_id")

        if district_id:
            # Subscribe to specific district
            if district_id not in self.district_subscribers:
                self.district_subscribers[district_id] = set()
            self.district_subscribers[district_id].add(websocket)
            logger.info(f"WebSocket subscribed to district {district_id}")
            return {
                "success": True,
                "message": f"Subscribed to district {district_id}"
            }
        else:
            # Subscribe to all district changes
            self.subscribers.add(websocket)
            logger.info("WebSocket subscribed to all district changes")
            return {
                "success": True,
                "message": "Subscribed to all district changes"
            }

    async def notify_district_change(
        self,
        event_type: str,
        districts_data: Optional[List[dict]] = None,
        district_id: Optional[str] = None
    ) -> None:
        """
        Broadcast district change notification to subscribers.

        Args:
            event_type: Type of event (formed, updated, dissolved)
            districts_data: List of district dicts (optional)
            district_id: Specific district ID if event is for one district
        """
        message_data = {
            "type": "district_change",
            "event": event_type,
        }

        if districts_data:
            message_data["districts"] = districts_data

        if district_id:
            message_data["district_id"] = district_id

        message = json.dumps(message_data)

        # Notify global subscribers
        for ws in list(self.subscribers):
            try:
                await ws.send(message)
            except Exception as e:
                logger.warning(f"Failed to notify subscriber: {e}")
                self.subscribers.discard(ws)

        # Notify district-specific subscribers
        if district_id and district_id in self.district_subscribers:
            for ws in list(self.district_subscribers[district_id]):
                try:
                    await ws.send(message)
                except Exception as e:
                    logger.warning(f"Failed to notify district subscriber: {e}")
                    self.district_subscribers[district_id].discard(ws)

    def handle_unsubscribe(self, websocket: Any) -> None:
        """
        Remove a WebSocket from all subscriptions.

        Args:
            websocket: The WebSocket to unsubscribe
        """
        self.subscribers.discard(websocket)

        for district_id in list(self.district_subscribers.keys()):
            self.district_subscribers[district_id].discard(websocket)
            if not self.district_subscribers[district_id]:
                del self.district_subscribers[district_id]


# Module-level bridge for sync operations
_sync_bridge: Optional[DistrictBridge] = None


def _get_sync_bridge() -> DistrictBridge:
    """Get or create the singleton bridge for sync operations."""
    global _sync_bridge
    if _sync_bridge is None:
        _sync_bridge = DistrictBridge()
    return _sync_bridge


def handle_district_request(request: Dict[str, Any]) -> Dict[str, Any]:
    """
    Main entry point for synchronous district requests.

    For async WebSocket operations, use DistrictBridge class directly.

    Args:
        request: Request dict with action and action-specific data

    Returns:
        Response dict with success status and result data
    """
    bridge = _get_sync_bridge()

    action = request.get("action", "")

    if action == "get_districts":
        return asyncio.run(bridge.handle_get_districts(request, None))
    elif action == "form_districts":
        return asyncio.run(bridge.handle_form_districts(request, None))
    elif action == "render_heatmap":
        return asyncio.run(bridge.handle_render_heatmap(request, None))
    elif action == "subscribe_district":
        return {
            "success": False,
            "error": "Subscribe action requires WebSocket connection"
        }
    else:
        return {
            "success": False,
            "error": f"Unknown action: {action}"
        }
