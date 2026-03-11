
import asyncio
import json
import logging

import websockets

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("Launcher")

async def trigger_inception():
    uri = "ws://localhost:8765"
    logger.info(f"Connecting to {uri}...")
    try:
        async with websockets.connect(uri) as websocket:
            logger.info("✅ Connected!")

            # Create execute message
            msg = {
                "type": "EXECUTE_FILE",
                "path": "systems/visual_shell/web/ubuntu.rts.png"
            }

            logger.info(f"🚀 Sending Execution Trigger: {msg}")
            await websocket.send(json.dumps(msg))

            logger.info("⏳ Waiting for server processing (2s)...")
            await asyncio.sleep(2)

            logger.info("✅ Trigger sent. Closing.")
    except Exception as e:
        logger.error(f"❌ Failed to connect or send: {e}")

if __name__ == "__main__":
    asyncio.run(trigger_inception())
