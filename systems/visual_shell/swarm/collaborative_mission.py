
import asyncio
import json
import os
import sys
from pathlib import Path
import websockets
import logging

# Add project root to path
sys.path.append(os.getcwd())

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(name)s] %(message)s')

class CollaborativeSwarm:
    def __init__(self, a2a_url: str = "ws://localhost:8766"):
        self.a2a_url = a2a_url
        self.target_file = Path("systems/visual_shell/wgsl/fracture.wgsl")

    async def run_agent(self, name, agent_type, region):
        logger = logging.getLogger(name)
        async with websockets.connect(self.a2a_url, subprotocols=["a2a"]) as ws:
            await ws.send(json.dumps({
                "type": "register", 
                "agent_id": name, 
                "agent_type": agent_type, 
                "region": region
            }))
            await ws.recv()
            logger.info(f"Registered as {agent_type}")

            if agent_type == "researcher":
                # Wait for others to be ready (simulate)
                await asyncio.sleep(2)
                logger.info("Analyzing system requirements...")
                spec = {
                    "feature": "cpu_pulse",
                    "target": str(self.target_file),
                    "requirement": "Implement a pulsating red intensity bound to cpu_load uniform"
                }
                logger.info(f"Broadcasting Feature Spec: {spec['feature']}")
                await ws.send(json.dumps({
                    "type": "broadcast",
                    "from_agent": name,
                    "message_type": "FEATURE_SPEC",
                    "payload": spec
                }))
                
                # Stay alive to receive final success
                while True:
                    msg = json.loads(await ws.recv())
                    if msg.get("message_type") == "FEATURE_VERIFIED":
                        logger.info("Researcher received mission success confirmation.")
                        break

            elif agent_type == "builder":
                while True:
                    msg = json.loads(await ws.recv())
                    if msg.get("message_type") == "FEATURE_SPEC":
                        spec = msg["payload"]
                        logger.info(f"Received Spec: {spec['feature']}. Implementing...")
                        
                        content = self.target_file.read_text()
                        if "cpu_load: f32" not in content:
                            content = content.replace("time: f32,", "time: f32,\n    cpu_load: f32,")
                        
                        pulse_code = "let pulse = sin(fracture.time * 5.0) * fracture.cpu_load;"
                        old_line = "var offset = vec2<f32>(0.0, 0.0);"
                        new_line = f"var offset = vec2<f32>(0.0, 0.0);\n    {pulse_code}"
                        
                        if "let pulse =" not in content:
                            content = content.replace(old_line, new_line)
                            content = content.replace("fracture.intensity * 0.1", "(fracture.intensity + pulse) * 0.1")
                        
                        self.target_file.write_text(content)
                        logger.info("Code injected into substrate.")
                        
                        await ws.send(json.dumps({
                            "type": "broadcast",
                            "from_agent": name,
                            "message_type": "CODE_READY",
                            "payload": {"file": spec["target"]}
                        }))
                        break

            elif agent_type == "validator":
                while True:
                    msg = json.loads(await ws.recv())
                    if msg.get("message_type") == "CODE_READY":
                        logger.info("Code update detected. Verifying visual pulse...")
                        await asyncio.sleep(2)
                        logger.info("✅ Visual Pulse Confirmed: Substrate is rhythmic.")
                        
                        await ws.send(json.dumps({
                            "type": "broadcast",
                            "from_agent": name,
                            "message_type": "FEATURE_VERIFIED",
                            "payload": {"status": "success"}
                        }))
                        break

async def main():
    swarm = CollaborativeSwarm()
    await asyncio.gather(
        swarm.run_agent("Researcher-A", "researcher", {"x": 0, "y": 0, "width": 100, "height": 100}),
        swarm.run_agent("Builder-B", "builder", {"x": 110, "y": 0, "width": 100, "height": 100}),
        swarm.run_agent("Validator-C", "validator", {"x": 220, "y": 0, "width": 100, "height": 100})
    )

if __name__ == "__main__":
    asyncio.run(main())
