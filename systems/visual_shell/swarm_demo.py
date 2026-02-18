import os
import sys
import time
import asyncio
import json
import websockets
from pathlib import Path

# Add systems to path
sys.path.append(os.getcwd())

from systems.visual_shell.gui_protocol import GUIProtocol

class SwarmAgent:
    def __init__(self, agent_id: str, bridge_port: int, vnc_display: str, role: str):
        self.agent_id = agent_id
        self.bridge_port = bridge_port
        self.vnc_display = vnc_display
        self.role = role
        self.protocol = GUIProtocol(
            bridge_dir="/tmp/vision_bridge_" + str(agent_id),
            vnc_display=vnc_display
        )
        self.a2a_url = "ws://localhost:8766"
        self.bridge_url = "ws://localhost:" + str(bridge_port)

    async def poll_vision_state(self, timeout: float = 10.0) -> dict:
        """Poll the Vision Bridge for current GUI state."""
        try:
            async with websockets.connect(self.bridge_url) as ws:
                # Request state update
                await ws.send(json.dumps({"type": "get_state"}))

                # Wait for response with timeout
                try:
                    response = await asyncio.wait_for(ws.recv(), timeout=timeout)
                    return json.loads(response)
                except asyncio.TimeoutError:
                    return {"error": "timeout"}
        except Exception as e:
            return {"error": str(e)}

    async def find_element(self, label: str, timeout: float = 30.0) -> dict:
        """Find an element by label, polling vision state until found or timeout."""
        start_time = asyncio.get_event_loop().time()

        while asyncio.get_event_loop().time() - start_time < timeout:
            state = await self.poll_vision_state()

            if "error" in state:
                await asyncio.sleep(2)
                continue

            # Check elements in state
            elements = state.get("elements", [])
            for el in elements:
                el_label = el.get("label", "").lower()
                el_type = el.get("type", "").lower()

                if label.lower() in el_label or label.lower() in el_type:
                    return {
                        "found": True,
                        "element": el,
                        "x": el.get("x", 0),
                        "y": el.get("y", 0)
                    }

            await asyncio.sleep(2)

        return {"found": False, "error": "timeout"}

    async def run_firefox_mission(self):
        print(f"[{self.role}] Starting Firefox mission...")
        # 1. Search for slogan
        # We'll simulate the search for now to prove the A2A routing
        slogan = "The Screen is the Hard Drive"
        print(f"[{self.role}] Found slogan: '{slogan}'")

        # 2. Send to A2A Router
        async with websockets.connect(self.a2a_url, subprotocols=["a2a"]) as ws:
            # Register
            await ws.send(json.dumps({
                "type": "register",
                "agent_id": self.agent_id,
                "agent_type": "researcher"
            }))
            await ws.recv()

            # Broadcast slogan
            print(f"[{self.role}] Broadcasting slogan to swarm...")
            await ws.send(json.dumps({
                "type": "broadcast",
                "from_agent": self.agent_id,
                "message_type": "asset_found",
                "payload": {"slogan": slogan}  # Router expects 'payload' key
            }))
            print(f"[{self.role}] Mission complete.")

    async def run_shotcut_mission(self):
        print(f"[{self.role}] Starting Shotcut mission, waiting for assets...")

        async with websockets.connect(self.a2a_url, subprotocols=["a2a"]) as ws:
            # Register
            await ws.send(json.dumps({
                "type": "register",
                "agent_id": self.agent_id,
                "agent_type": "producer"
            }))
            await ws.recv()

            # Wait for broadcast
            while True:
                msg_raw = await ws.recv()
                msg = json.loads(msg_raw)

                if msg.get("type") == "broadcast" and msg.get("message_type") == "asset_found":
                    slogan = msg["payload"]["slogan"]
                    print(f"[{self.role}] Received slogan: '{slogan}'")

                    # Wait for Shotcut to be visible via Vision Bridge
                    print(f"[{self.role}] Waiting for Shotcut window...")
                    await asyncio.sleep(5)  # Give vision bridge time to capture state

                    # Try to find text input field
                    print(f"[{self.role}] Looking for text input...")
                    element = await self.find_element("text", timeout=15.0)

                    if element.get("found"):
                        print(f"[{self.role}] Found text input at ({element['x']}, {element['y']})")
                        self.protocol._execute_bridge(f"click: text_field")
                        await asyncio.sleep(1)
                    else:
                        # Fallback: click center of screen
                        print(f"[{self.role}] Using fallback: click center")
                        self.protocol._execute_direct("move 640 400 click 1")
                        await asyncio.sleep(1)

                    # Type the slogan
                    print(f"[{self.role}] Typing slogan...")
                    self.protocol._execute_bridge(f"type: {slogan}")
                    print(f"[{self.role}] Slogan entered. Mission complete.")
                    break

async def main():
    researcher = SwarmAgent("1", 8765, "127.0.0.1:0", "Researcher")
    producer = SwarmAgent("2", 8768, "127.0.0.1:1", "Producer")
    
    # Run in parallel
    await asyncio.gather(
        researcher.run_firefox_mission(),
        producer.run_shotcut_mission()
    )

if __name__ == "__main__":
    asyncio.run(main())
