# systems/visual_shell/web/district_server.py
"""
District WebSocket Server

Phase 49: Neural District Coalescence
Bridges WebMCP District tools to Python DistrictFormer and visualization.
"""

import asyncio
import json
import logging
import websockets

from systems.visual_shell.web.district_bridge import DistrictBridge

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("district_server")

# Global bridge instance
bridge = DistrictBridge()


async def district_handler(websocket, path):
    """Handle incoming WebSocket connections from WebMCP."""
    logger.info(f"New connection from {websocket.remote_address}")

    try:
        async for message in websocket:
            try:
                request = json.loads(message)
                action = request.get("action")
                logger.info(f"Request: {action}")

                if action == "get_districts":
                    response = await bridge.handle_get_districts(request, websocket)
                elif action == "form_districts":
                    response = await bridge.handle_form_districts(request, websocket)
                elif action == "render_heatmap":
                    response = await bridge.handle_render_heatmap(request, websocket)
                elif action == "subscribe_district":
                    response = await bridge.handle_subscribe_district(request, websocket)
                elif action == "unsubscribe":
                    bridge.handle_unsubscribe(websocket)
                    response = {"success": True, "message": "Unsubscribed from district notifications"}
                else:
                    response = {"success": False, "error": f"Unknown action: {action}"}

                await websocket.send(json.dumps(response))
            except json.JSONDecodeError:
                await websocket.send(json.dumps({
                    "success": False,
                    "error": "Invalid JSON"
                }))
            except Exception as e:
                logger.error(f"Error handling message: {e}")
                await websocket.send(json.dumps({
                    "success": False,
                    "error": str(e)
                }))
    except websockets.ConnectionClosed:
        logger.info(f"Connection closed: {websocket.remote_address}")
        bridge.handle_unsubscribe(websocket)


async def main():
    port = 8773  # Port for District operations
    logger.info(f"Starting District Server on ws://localhost:{port}")
    async with websockets.serve(district_handler, "localhost", port):
        await asyncio.Future()  # run forever


if __name__ == "__main__":
    asyncio.run(main())
