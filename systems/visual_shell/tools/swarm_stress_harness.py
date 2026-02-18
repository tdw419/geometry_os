
import asyncio
import json
import time
import uuid
import random
import argparse
import logging
import psutil
import websockets
from dataclasses import dataclass, field
from datetime import datetime
from typing import List, Dict, Any

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(name)s: %(message)s'
)
logger = logging.getLogger("SwarmStress")

@dataclass
class StressMetrics:
    messages_sent: int = 0
    messages_received: int = 0
    errors: int = 0
    latencies: List[float] = field(default_factory=list)
    start_time: float = field(default_factory=time.time)

    @property
    def avg_latency(self) -> float:
        if not self.latencies:
            return 0.0
        return sum(self.latencies) / len(self.latencies)

    @property
    def msg_per_sec(self) -> float:
        duration = time.time() - self.start_time
        if duration == 0:
            return 0.0
        return self.messages_sent / duration

class MockAgent:
    """Simulates an agent in the swarm."""
    def __init__(self, agent_id: str, router_url: str, role: str = "stresser"):
        self.agent_id = agent_id
        self.router_url = router_url
        self.role = role
        self.ws = None
        self.metrics = StressMetrics()
        self.running = False
        self.task = None

    async def connect(self):
        try:
            self.ws = await websockets.connect(self.router_url, subprotocols=["a2a"])
            # Register
            await self.ws.send(json.dumps({
                "type": "register",
                "agent_id": self.agent_id,
                "agent_type": self.role
            }))
            # Wait for ACK
            resp = await self.ws.recv()
            logger.debug(f"Agent {self.agent_id} registered: {resp}")
            return True
        except Exception as e:
            logger.error(f"Agent {self.agent_id} failed to connect: {e}")
            return False

    async def run_stress_loop(self, msg_frequency: float, broadcast_ratio: float = 0.5):
        self.running = True
        print(f"DEBUG: Agent {self.agent_id} LOOP START")
        
        # Start receiver task
        self.receiver_task = asyncio.create_task(self._receiver())
        
        try:
            while self.running:
                # Decide: broadcast or direct (if other agents known)
                # For stress, we'll mostly broadcast
                msg_id = str(uuid.uuid4())
                payload = {
                    "type": "broadcast",
                    "from_agent": self.agent_id,
                    "message_type": "stress_test",
                    "payload": {
                        "msg_id": msg_id,
                        "ts": time.time(),
                        "data": "x" * 100 # 100 bytes of noise
                    }
                }
                
                # print(f"DEBUG: Agent {self.agent_id} SENDING")
                start = time.time()
                try:
                    await self.ws.send(json.dumps(payload))
                    self.metrics.messages_sent += 1
                    # print(f"DEBUG: Agent {self.agent_id} SENT OK")
                except Exception as e:
                    print(f"DEBUG: Send failed: {e}")
                
                # We don't wait for response here, just throttle
                await asyncio.sleep(1.0 / msg_frequency)
                
        except websockets.ConnectionClosed:
            logger.warning(f"Agent {self.agent_id} connection closed.")
        except Exception as e:
            logger.error(f"Agent {self.agent_id} error: {e}")
        finally:
            self.running = False
            print(f"DEBUG: Agent {self.agent_id} LOOP END")

    async def _receiver(self):
        try:
            async for message in self.ws:
                data = json.loads(message)
                self.metrics.messages_received += 1
                
                # Calculate latency if it's one of our stress messages
                if data.get("type") == "broadcast" and "payload" in data:
                    ts = data["payload"].get("ts")
                    if ts:
                        latency = time.time() - ts
                        self.metrics.latencies.append(latency)
                        # Keep latency list size manageable
                        if len(self.metrics.latencies) > 1000:
                            self.metrics.latencies.pop(0)
                            
        except Exception as e:
            if self.running:
                logger.error(f"Agent {self.agent_id} receiver error: {e}")

    async def stop(self):
        self.running = False
        if self.ws:
            await self.ws.close()
        if hasattr(self, 'receiver_task'):
            self.receiver_task.cancel()

class SwarmStressHarness:
    """Manages a swarm of mock agents to stress the A2A Router."""
    def __init__(self, router_url: str, num_agents: int, frequency: float):
        self.router_url = router_url
        self.num_agents = num_agents
        self.frequency = frequency
        self.agents: List[MockAgent] = []
        self.start_time = None

    async def start(self):
        logger.info(f"🚀 Starting Swarm Stress Harness with {self.num_agents} agents...")
        self.start_time = time.time()
        
        # 1. Spawn agents
        self.tasks = []
        for i in range(self.num_agents):
            agent_id = f"stress-agent-{i:03d}"
            agent = MockAgent(agent_id, self.router_url)
            if await agent.connect():
                self.agents.append(agent)
                task = asyncio.create_task(agent.run_stress_loop(self.frequency))
                self.tasks.append(task)
            else:
                logger.error(f"Failed to initialize agent {agent_id}")
                
        # 2. Monitor loop
        try:
            while True:
                await asyncio.sleep(5)
                self.report_status()
        except asyncio.CancelledError:
            await self.stop()

    def report_status(self):
        total_sent = sum(a.metrics.messages_sent for a in self.agents)
        total_received = sum(a.metrics.messages_received for a in self.agents)
        avg_lat = sum(a.metrics.avg_latency for a in self.agents) / len(self.agents) if self.agents else 0
        
        # System stats
        cpu = psutil.cpu_percent()
        ram = psutil.virtual_memory().percent
        
        duration = time.time() - self.start_time
        throughput = total_sent / duration if duration > 0 else 0
        
        print(f"\n--- Swarm Stress Report ({datetime.now().strftime('%H:%M:%S')}) ---")
        print(f"Agents:      {len(self.agents)} / {self.num_agents} online")
        print(f"Throughput:  {throughput:.1f} msg/sec (Total: {total_sent})")
        print(f"Broadcasts:  {total_received} messages delivered")
        print(f"Avg Latency: {avg_lat*1000:.2f} ms")
        print(f"System:      CPU: {cpu}% | RAM: {ram}%")
        print("-" * 40)

    async def stop(self):
        logger.info("Stopping swarm...")
        for agent in self.agents:
            await agent.stop()
        # Do not clear self.agents so we can inspect metrics
        # self.agents = []

async def main():
    parser = argparse.ArgumentParser(description="A2A Swarm Stress Harness")
    parser.add_argument("--url", default="ws://localhost:8766", help="A2A Router URL")
    parser.add_argument("--agents", type=int, default=10, help="Number of concurrent agents")
    parser.add_argument("--freq", type=float, default=5.0, help="Messages per second per agent")
    parser.add_argument("--duration", type=int, default=60, help="Duration in seconds")
    
    args = parser.parse_args()
    
    harness = SwarmStressHarness(args.url, args.agents, args.freq)
    
    try:
        # Run harness with timeout
        await asyncio.wait_for(harness.start(), timeout=args.duration)
    except asyncio.TimeoutError:
        logger.info(f"Stress test completed after {args.duration}s")
    finally:
        await harness.stop()

if __name__ == "__main__":
    asyncio.run(main())
