
import asyncio
import json
import os
import sys
from pathlib import Path
import websockets
import logging

# Add project root to path
sys.path.append(os.getcwd())

from systems.visual_shell.gui_protocol import GUIProtocol

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("HealerAgent")

class HealerAgent:
    """Agent that detects visual fractures and heals the substrate."""
    
    def __init__(self, bridge_port: int = 8765, vnc_display: str = "127.0.0.1:0"):
        self.bridge_url = f"ws://localhost:{bridge_port}"
        self.protocol = GUIProtocol(bridge_dir=f"/tmp/vision_bridge_1", vnc_display=vnc_display)
        self.target_file = Path("systems/visual_shell/wgsl/fracture.wgsl")
        self.a2a_url = "ws://localhost:8766"
        self.agent_id = "healer-001"

    async def detect_fracture(self) -> bool:
        """Use Vision Bridge to check for systemic fractures."""
        logger.info("Scanning substrate for visual fractures...")
        
        description = ""
        suggested = []
        
        try:
            async with websockets.connect(self.bridge_url) as ws:
                # Request state
                await ws.send(json.dumps({"type": "get_state"}))
                resp = await asyncio.wait_for(ws.recv(), timeout=5)
                data = json.loads(resp)
                description = data.get("raw_description", "").lower()
                suggested = data.get("suggested_actions", [])
        except Exception as e:
            logger.warning(f"WebSocket detection failed ({e}), falling back to state file...")
            if self.protocol.state_file.exists():
                description = self.protocol.state_file.read_text().lower()
            else:
                logger.error("No state file found for fallback.")
                return False
        
        # Heuristic: Look for "fracture", "glow", "red", "tear", "broken"
        fracture_indicators = ["fracture", "neon red", "glow", "jagged", "discontinuity", "broken shader", "anomaly"]
        if any(ind in description for ind in fracture_indicators):
            logger.warning("🚨 VISUAL FRACTURE DETECTED in substrate!")
            return True
        
        if any("fix" in s.lower() or "heal" in s.lower() for s in suggested):
            logger.warning("🚨 Vision Model suggests healing action!")
            return True
            
        return False

    def heal_substrate(self):
        """Repair the fractured shader code."""
        logger.info(f"Initiating HEAL sequence for {self.target_file}...")
        
        if not self.target_file.exists():
            logger.error("Target file missing!")
            return False
            
        content = self.target_file.read_text()
        
        # Repair the intentional bug
        broken_line = "let threshold = 0.5; // fracture.intensity * 0.1;"
        fixed_line = "let threshold = fracture.intensity * 0.1;"
        
        if broken_line in content:
            new_content = content.replace(broken_line, fixed_line)
            self.target_file.write_text(new_content)
            logger.info("✅ SUBSTRATE HEALED: Shader code restored.")
            return True
        else:
            logger.info("ℹ️ Substrate appears healthy or already healed.")
            return True

    async def run_mission(self):
        logger.info("=== STARTING SELF-HEALING MISSION ===")
        
        # 1. Register with A2A
        try:
            async with websockets.connect(self.a2a_url, subprotocols=["a2a"]) as ws:
                await ws.send(json.dumps({
                    "type": "register",
                    "agent_id": self.agent_id,
                    "agent_type": "healer",
                    "region": {"x": 400, "y": 10, "width": 100, "height": 100}
                }))
                await ws.recv()
                
                # 2. Detect
                if await self.detect_fracture():
                    # 3. Heal
                    self.heal_substrate()
                    
                    # 4. Broadcast Success
                    await ws.send(json.dumps({
                        "type": "broadcast",
                        "from_agent": self.agent_id,
                        "message_type": "substrate_healed",
                        "payload": {"status": "success", "file": str(self.target_file)}
                    }))
                    logger.info("Mission Complete: Substrate integrity restored.")
                else:
                    logger.info("No fractures detected. Substrate is stable.")
                    
        except Exception as e:
            logger.error(f"Mission failed: {e}")

if __name__ == "__main__":
    agent = HealerAgent()
    asyncio.run(agent.run_mission())
