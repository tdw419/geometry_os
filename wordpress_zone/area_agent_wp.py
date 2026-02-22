import asyncio
import websockets
import json
import os
import time
import requests
from pathlib import Path

# Geometry OS Area Agent for WordPress Zone
# ----------------------------------------
# This agent monitors the WordPress installation, parses local telemetry,
# and bridges it to the Geometry OS Visual Bridge (Port 8768).

class WordPressAreaAgent:
    def __init__(self, zone_path, bridge_url="ws://localhost:8768"):
        self.zone_path = Path(zone_path)
        self.bridge_url = bridge_url
        self.telemetry_file = self.zone_path / "telemetry" / "events.jsonl"
        self.last_pos = 0
        self.running = True
        self.district_id = "wordpress_zone"
        
        # Hilbert Mapping coordinates (Spatial Tectonics)
        # Choosing a cyan/blue district (Development tools/Applications)
        self.spatial_pos = {"x": 3200, "y": 1200} 

    async def connect_bridge(self):
        """Connect to the Visual Bridge WebSocket."""
        while self.running:
            try:
                print(f"📡 Connecting to Visual Bridge at {self.bridge_url}...")
                async with websockets.connect(self.bridge_url) as ws:
                    print(f"✅ Connected to Geometry OS Visual Bridge.")
                    
                    # Register this district on the Infinite Map
                    await ws.send(json.dumps({
                        "type": "district_upgrade",
                        "district_id": self.district_id,
                        "upgrade_type": "INITIALIZATION",
                        "status": "ONLINE",
                        "position": self.spatial_pos
                    }))

                    # Initial thought log
                    await ws.send(json.dumps({
                        "type": "thought_journal",
                        "data": {
                            "agent_id": "architect",
                            "thought_type": "inference",
                            "text": "WordPress Zone Area Agent synchronized with Visual Shell."
                        }
                    }))

                    # Start telemetry tailing task
                    tail_task = asyncio.create_task(self.tail_telemetry(ws))
                    
                    # Heartbeat loop
                    while self.running:
                        # Check PHP server health
                        health = self.check_wordpress_health()
                        
                        await ws.send(json.dumps({
                            "type": "diagnostic_pulse",
                            "district_id": self.district_id,
                            "status": "HEALTHY" if health else "CRITICAL",
                            "matched_pattern": "WP_HEALTH_CHECK" if health else "WP_CONNECTION_REFUSED",
                            "timestamp": time.time()
                        }))
                        
                        await asyncio.sleep(10)
                        
            except Exception as e:
                print(f"❌ Connection error: {e}. Retrying in 5s...")
                await asyncio.sleep(5)

    def check_wordpress_health(self):
        """Simple HTTP health check."""
        try:
            r = requests.get("http://localhost:8080/wp-admin/install.php", timeout=2)
            return r.status_code == 200
        except:
            return False

    async def tail_telemetry(self, ws):
        """Monitor events.jsonl and forward to bridge."""
        print(f"🧐 Monitoring telemetry: {self.telemetry_file}")
        
        # Ensure dir exists
        self.telemetry_file.parent.mkdir(parents=True, exist_ok=True)
        if not self.telemetry_file.exists():
            self.telemetry_file.touch()

        while self.running:
            try:
                with open(self.telemetry_file, 'r') as f:
                    f.seek(self.last_pos)
                    lines = f.readlines()
                    self.last_pos = f.tell()
                    
                    for line in lines:
                        if not line.strip(): continue
                        event = json.loads(line)
                        print(f"🚀 Forwarding event: {event.get('type')}")
                        
                        # Forward exactly as formatted in the plugin
                        await ws.send(json.dumps(event))
            except Exception as e:
                print(f"⚠️ Telemetry tail error: {e}")
            
            await asyncio.sleep(1)

    def stop(self):
        self.running = False

async def main():
    agent = WordPressAreaAgent("/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone")
    await agent.connect_bridge()

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("🛑 Agent stopped.")
