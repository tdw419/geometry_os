import asyncio
import json
import time
import numpy as np
from PIL import Image
import websockets
from pathlib import Path
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("HeatmapGen")

class SwarmHeatmapGenerator:
    """Generates an RTS PNG representing swarm activity using A2A Discover."""
    
    def __init__(self, router_url: str = "ws://localhost:8766", output_path: str = "swarm_heatmap.rts.png"):
        self.router_url = router_url
        self.output_path = Path(output_path)
        self.grid_size = 512 # 512x512 grid for spatial visualization
        self.heatmap = np.zeros((self.grid_size, self.grid_size), dtype=np.uint8)
        self.running = False
        
    async def fetch_swarm_state(self):
        """Fetch agent regions and activity from A2A Router."""
        try:
            async with websockets.connect(self.router_url, subprotocols=["a2a"]) as ws:
                # Register
                await ws.send(json.dumps({"type": "register", "agent_id": "heatmap-monitor", "agent_type": "monitor"}))
                await ws.recv() # ACK
                
                while self.running:
                    # Discover all agents
                    await ws.send(json.dumps({"type": "discover"}))
                    resp = await ws.recv()
                    data = json.loads(resp)
                    
                    if data.get("type") == "ack":
                        self.update_heatmap(data.get("agents", []))
                        self.save_as_rts_png()
                    
                    await asyncio.sleep(2) # Update every 2 seconds
        except Exception as e:
            logger.error(f"Failed to fetch swarm state: {e}")

    def update_heatmap(self, agents: list):
        """Update heatmap based on agent regions."""
        # Decay existing activity
        self.heatmap = (self.heatmap * 0.8).astype(np.uint8)
        
        for agent_info in agents:
            # Map logical region to grid
            region = agent_info.get("region")
            if not region: continue
            
            x = region.get("x", 0) % self.grid_size
            y = region.get("y", 0) % self.grid_size
            w = region.get("width", 50) % self.grid_size
            h = region.get("height", 50) % self.grid_size
            
            # Fill region with "heat"
            self.heatmap[y:y+h, x:x+w] = 255

    def save_as_rts_png(self):
        """Convert heatmap to a visual RTS PNG."""
        # Create RGBA image: R=Activity, G=Agents, B=System, A=255
        img_data = np.zeros((self.grid_size, self.grid_size, 4), dtype=np.uint8)
        img_data[..., 0] = self.heatmap # Red channel for activity
        img_data[..., 3] = 255 # Full alpha
        
        img = Image.fromarray(img_data, 'RGBA')
        img.save(self.output_path)
        logger.info(f"Updated heatmap: {self.output_path}")

    async def run(self):
        self.running = True
        logger.info("Swarm Heatmap Generator active.")
        await self.fetch_swarm_state()

if __name__ == "__main__":
    generator = SwarmHeatmapGenerator()
    asyncio.run(generator.run())
