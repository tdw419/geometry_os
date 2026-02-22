
import asyncio
import logging
import unittest
import numpy as np
from systems.swarm.swarm_daemon import SwarmDaemon

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("TestSwarmFederation")

class TestSwarmFederation(unittest.TestCase):
    async def run_async_test(self):
        # Setup: Two resonant nodes
        embedding_A = [1.0] + [0.0] * 127
        embedding_B = [1.0] + [0.0] * 127 # Identical -> 100% Resonance

        # Node A: The Master (Port 6010)
        node_A = SwarmDaemon(port=6010, local_embedding=embedding_A)
        # Node B: The Worker (Port 6011)
        node_B = SwarmDaemon(port=6011, local_embedding=embedding_B)

        # Start them
        task_A = asyncio.create_task(node_A.start())
        task_B = asyncio.create_task(node_B.start())
        
        # Give them time to spin up
        await asyncio.sleep(1)

        # Manually register them as peers (since UDP discovery might be flaky in test or same machine)
        # We need to hack the Telepathy peers dict
        node_A.telepathy.peers[node_B.telepathy.node_id] = ('127.0.0.1', 6011)
        node_B.telepathy.peers[node_A.telepathy.node_id] = ('127.0.0.1', 6010)
        
        # Also pre-seed Relativity so they know they are friends
        node_A.relativity.update_peer_frame(node_B.telepathy.node_id, embedding_B)
        node_B.relativity.update_peer_frame(node_A.telepathy.node_id, embedding_A)

        logger.info("--- TEST 1: COMPUTE OFFLOADING ---")
        
        # A offloads to B
        compute_payload = {"task_id": "TASK_001", "complexity": 100}
        success = await node_A.offload_compute_task(compute_payload)
        
        self.assertTrue(success, "Node A should successfully find a peer to offload to")
        
        # Wait for result
        await asyncio.sleep(1)
        
        # Check logs/state ... but hard to assert async logs.
        # Ideally we'd modify SwarmDaemon to store last received result or use a mock.
        # For now we just ensure no crash and 'success' returned True.
        
        logger.info("--- TEST 2: AESTHETIC SYNCHRONIZATION ---")
        
        # Change B's embedding slightly
        new_embedding_B = [0.9] + [0.1] + [0.0] * 126 
        # Normalize
        norm = np.linalg.norm(new_embedding_B)
        new_embedding_B = (np.array(new_embedding_B) / norm).tolist()
        
        node_B.update_self_image(new_embedding_B)
        
        # B broadcasts Sync
        await node_B.broadcast_intent("AESTHETIC_SYNC", {"status": "ALIGNING"})
        
        # Wait for A to process
        await asyncio.sleep(1)
        
        # A should have drifted towards B. 
        # index 1 of A was 0.0. index 1 of B is ~0.1.
        # After drift (alpha=0.05), A[1] should be > 0.0
        
        current_A_vec = node_A.local_embedding
        logger.info(f"Node A index 1 after drift: {current_A_vec[1]}")
        
        self.assertGreater(current_A_vec[1], 0.0, "Node A should have absorbed some of B's aesthetic (index 1 > 0)")
        
        # Cleanup
        task_A.cancel()
        task_B.cancel()
        try:
            await task_A
            await task_B
        except asyncio.CancelledError:
            pass
            
        node_A.telepathy.server.close()
        node_B.telepathy.server.close()

    def test_federation(self):
        asyncio.run(self.run_async_test())

if __name__ == "__main__":
    unittest.main()
