import asyncio
import json
import logging
import websockets
from datetime import datetime

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger("console-bridge")

class ConsoleBridge:
    """
    WebSocket server that receives UART output from the RISC-V GPU VM
    and prints it to the console.
    """

    def __init__(self, host="localhost", port=8768):
        self.host = host
        self.port = port
        self.clients = set()

    async def handle_client(self, websocket):
        """Handle incoming WebSocket connections from run_riscv."""
        self.clients.add(websocket)
        logger.info(f"✅ RISC-V VM connected from {websocket.remote_address}")
        
        try:
            async for message in websocket:
                try:
                    data = json.loads(message)
                    msg_type = data.get("type")
                    
                    if msg_type == "riscv_uart":
                        text = data.get("text", "")
                        # Print to real console
                        print(text, end="", flush=True)
                    elif msg_type == "event":
                        event_data = data.get("data", {})
                        logger.info(f"Event: {event_data.get('type')} - {event_data.get('message')}")
                    else:
                        logger.debug(f"Received unknown message type: {msg_type}")
                        
                except json.JSONDecodeError:
                    logger.error("Received invalid JSON message")
                except Exception as e:
                    logger.error(f"Error processing message: {e}")
                    
        except websockets.exceptions.ConnectionClosed:
            pass
        finally:
            self.clients.discard(websocket)
            logger.info(f"❌ RISC-V VM disconnected")

    async def run(self):
        """Start the WebSocket server."""
        logger.info(f"🚀 Console Bridge starting on ws://{self.host}:{self.port}")
        async with websockets.serve(self.handle_client, self.host, self.port):
            await asyncio.Future()  # Run forever

if __name__ == "__main__":
    bridge = ConsoleBridge()
    try:
        asyncio.run(bridge.run())
    except KeyboardInterrupt:
        logger.info("🛑 Console Bridge stopped")
