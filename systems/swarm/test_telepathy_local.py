import asyncio
import logging
import sys
import unittest
from telepathy_protocol import TelepathyNode, TelepathySignal

# Configure logging to show what's happening
logging.basicConfig(
    level=logging.INFO, 
    format='%(asctime)s [%(levelname)s] [%(name)s] %(message)s',
    handlers=[logging.StreamHandler(sys.stdout)]
)

logger = logging.getLogger("SwarmTest")

class TestTelepathyNetwork(unittest.IsolatedAsyncioTestCase):
    async def test_swarm_convergence(self):
        logger.info("🧪 Starting Swarm Convergence Test")
        
        # 1. Initialize two nodes on the same discovery port (5005) but different TCP ports
        node1 = TelepathyNode(port=6001, peer_discovery_port=5005)
        node2 = TelepathyNode(port=6002, peer_discovery_port=5005)
        
        # 2. Start them in the background
        # We use create_task because node.start() is a blocking loop
        task1 = asyncio.create_task(node1.start())
        task2 = asyncio.create_task(node2.start())
        
        logger.info("⏳ Waiting for peer discovery (needs >5s)...")
        # Allow enough time for at least one broadcast cycle (5s)
        await asyncio.sleep(7)
        
        # 3. Verify Discovery
        self.assertIn(node2.node_id, node1.peers, "Node 1 should have discovered Node 2")
        self.assertIn(node1.node_id, node2.peers, "Node 2 should have discovered Node 1")
        logger.info("✅ Discovery Successful!")
        
        # 4. Test Telepathy (Direct Message)
        test_payload = {"concept": "RELATIVITY", "confidence": 0.99}
        await node1.transmit_thought(node2.node_id, "INSIGHT", test_payload)
        
        # Give a moment for transmission
        await asyncio.sleep(1)
        
        # 5. Verify Reception
        received_thoughts = node2.known_thoughts
        self.assertTrue(len(received_thoughts) > 0, "Node 2 received no thoughts")
        last_thought = received_thoughts[-1]
        
        self.assertEqual(last_thought.signal_type, "INSIGHT")
        self.assertEqual(last_thought.payload["concept"], "RELATIVITY")
        self.assertEqual(last_thought.source_id, node1.node_id)
        
        logger.info(f"✅ Telepathy Successful: {last_thought.payload}")
        
        # 6. Test Broadcast
        await node2.broadcast_thought("EMOTION", {"state": "JOY"})
        await asyncio.sleep(1)
        
        self.assertEqual(node1.known_thoughts[-1].signal_type, "EMOTION")
        logger.info("✅ Broadcast Successful")
        
        # Cleanup
        node1.running = False
        node2.running = False
        
        # Cancel server tasks
        task1.cancel()
        task2.cancel()
        try:
            await task1
            await task2
        except asyncio.CancelledError:
            pass

if __name__ == "__main__":
    unittest.main()
