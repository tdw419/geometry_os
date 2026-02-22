import asyncio
import logging
import unittest
import numpy as np
from systems.swarm.swarm_daemon import SwarmDaemon

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] %(message)s')
logger = logging.getLogger("TestComputeMigration")

class TestComputeMigration(unittest.TestCase):
    def setUp(self):
        # Shared aesthetic ideal (Perfect Resonance)
        self.shared_embedding = [0.5] * 128
        
        # Node A: The Client
        self.node_a = SwarmDaemon(
            port=6020, 
            local_embedding=self.shared_embedding,
            capabilities=["client"] 
        )
        # Manually set discovery port to avoid conflict
        self.node_a.telepathy.peer_discovery_port = 5020 
        
        # Node B: The Worker
        self.node_b = SwarmDaemon(
            port=6021, 
            local_embedding=self.shared_embedding,
            capabilities=["compute", "pixel_rts"]
        )
        self.node_b.telepathy.peer_discovery_port = 5020 # Same discovery channel

    def tearDown(self):
        # Cleanup is tricky with async servers, ensuring we close sockets
        if hasattr(self, 'node_a'): self.node_a.telepathy.server.close()
        if hasattr(self, 'node_b'): self.node_b.telepathy.server.close()

    async def run_async_test(self):
        # Start Daemons
        logger.info("🚀 Starting Swarm Nodes for Migration Test...")
        task_a = asyncio.create_task(self.node_a.start())
        task_b = asyncio.create_task(self.node_b.start())
        
        # Allow time for startup
        await asyncio.sleep(1)
        
        # Manually trigger peer discovery if UDP is flaky in test env or just wait
        # In test_swarm_federation we waited 1s.
        logger.info("⏳ Waiting for peer discovery...")
        await asyncio.sleep(2)
        
        # Verify Node A sees Node B
        # self.node_a.telepathy.peers keys are IDs.
        peers_a = self.node_a.telepathy.peers
        logger.info(f"Node A peers: {peers_a}")
        
        self.assertGreater(len(peers_a), 0, "Node A should discover Node B")
        
        # Verify Capabilities Discovery
        peer_b_id = list(peers_a.keys())[0]
        peer_b_info = peers_a[peer_b_id]
        
        self.assertTrue(isinstance(peer_b_info, dict), "Peer info should be a dict")
        self.assertIn("compute", peer_b_info["capabilities"], "Node A should see Node B has 'compute' capability")
        
        # FORCE SYNC: Exchange embeddings so Relativity knows about peers
        logger.info("🔄 Forcing Aesthetic Sync...")
        await self.node_a.broadcast_intent("AESTHETIC_SYNC", {"status": "INIT"})
        await self.node_b.broadcast_intent("AESTHETIC_SYNC", {"status": "INIT"})
        await asyncio.sleep(0.5) # Allow processing
        
        # --- TEST: REAL COMPUTE MIGRATION ---
        logger.info("--- TEST: SEAMLESS COMPUTE MIGRATION ---")
        
        # Define a code fragment to migrate
        # A simple function that returns an identifiable result
        code_fragment = """
def remote_calculation(a, b):
    import math
    return math.sqrt(a**2 + b**2)
"""
        task_payload = {
            "task_id": "MIGRATION_JOB_001",
            "code": code_fragment,
            "function_name": "remote_calculation",
            "args": {"a": 3, "b": 4} # Expect 5.0
        }
        
        # Offload
        success = await self.node_a.offload_compute_task(task_payload)
        self.assertTrue(success, "Compute offload should be successful")
        
        # Wait for result
        # The result comes back as a signal. We need to capture it.
        # We'll attach a future to Node A to capture the result
        
        result_future = asyncio.Future()
        
        def result_catcher(signal):
            if signal.signal_type == "COMPUTE_RESULT" and signal.payload.get("task_id") == "MIGRATION_JOB_001":
                if not result_future.done():
                    result_future.set_result(signal.payload)
        
        self.node_a.telepathy.register_observer(result_catcher)
        
        # Wait for reaction
        try:
            result_payload = await asyncio.wait_for(result_future, timeout=5.0)
            logger.info(f"🎉 Received Result: {result_payload}")
            
            self.assertEqual(result_payload["status"], "SUCCESS")
            self.assertEqual(result_payload["result"], 5.0)
            
        except asyncio.TimeoutError:
            self.fail("Timed out waiting for migration result")

        # Cleanup
        task_a.cancel()
        task_b.cancel()

    def test_migration(self):
        asyncio.run(self.run_async_test())

if __name__ == "__main__":
    unittest.main()
