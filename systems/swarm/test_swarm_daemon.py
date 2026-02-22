import asyncio
import unittest
import numpy as np
import logging
from systems.swarm.swarm_daemon import SwarmDaemon

# Silence specific loggers for clean output
logging.getLogger("TelepathyProtocol").setLevel(logging.INFO)
logging.getLogger("RelativityEngine").setLevel(logging.INFO)
logging.getLogger("SwarmDaemon").setLevel(logging.INFO)


class TestSwarmDaemon(unittest.IsolatedAsyncioTestCase):
    async def asyncSetUp(self):
        # Create vectors
        # Vector A: [1, 0, 0] (The "Self")
        self.vec_order = [1.0] + [0.0]*127
        # Vector B: [0.9, 0.1, 0] (Resonant friend)
        self.vec_friend = [0.9, 0.1] + [0.0]*126
        # Vector C: [-1.0, 0, 0] (Heretic)
        self.vec_heretic = [-1.0] + [0.0]*127

    async def test_swarm_interaction(self):
        print("\n🧪 Starting Swarm Daemon Integrated Test")
        
        # 1. Initialize Daemons
        # Daemon A usually runs on 6000, but we use non-standard ports to avoid conflicts
        daemon_a = SwarmDaemon(port=7000, local_embedding=self.vec_order)
        daemon_b = SwarmDaemon(port=7001, local_embedding=self.vec_friend)
        daemon_c = SwarmDaemon(port=7002, local_embedding=self.vec_heretic)

        # 2. Start them in background tasks
        tasks = [
            asyncio.create_task(daemon_a.start()),
            asyncio.create_task(daemon_b.start()),
            asyncio.create_task(daemon_c.start())
        ]
        
        # Wait for initialization
        await asyncio.sleep(1)
        
        # 3. Simulate Peer Discovery
        # Since UDP might be flaky in test or take time, we can manually inject peers if needed.
        # But let's try the real discovery first. It waits 5s usually.
        # To speed up, we can direct connect or trust the UDP loop (which sleeps 5s).
        # Let's manually inject for speed and reliability in unit test.
        daemon_a.telepathy.peers[daemon_b.telepathy.node_id] = ('127.0.0.1', 7001)
        daemon_a.telepathy.peers[daemon_c.telepathy.node_id] = ('127.0.0.1', 7002)
        
        # Also let B and C know A
        daemon_b.telepathy.peers[daemon_a.telepathy.node_id] = ('127.0.0.1', 7000)
        daemon_c.telepathy.peers[daemon_a.telepathy.node_id] = ('127.0.0.1', 7000)

        # 4. Daemon B (Friend) Broadcasts
        print("📢 Daemon B (Friend) broadcasting intent...")
        await daemon_b.broadcast_intent(
            intent_type="LEND_COMPUTE", 
            payload={"concept": "OPTIMIZATION", "priority": 0.8}
        )
        
        # 5. Daemon C (Heretic) Broadcasts
        print("📢 Daemon C (Heretic) broadcasting intent...")
        await daemon_c.broadcast_intent(
            intent_type="DESTROY_STRUCTURE", 
            payload={"concept": "ENTROPY", "priority": 0.9}
        )

        # Give time for processing
        await asyncio.sleep(2)
        
        # 6. Verify Log Handling
        # We can't easily assert on logs without capturing them, but we can verify internal state
        # or checking if known_thoughts are populated.
        
        # Check A's thoughts
        thoughts_from_b = [t for t in daemon_a.telepathy.known_thoughts if t.source_id == daemon_b.telepathy.node_id]
        thoughts_from_c = [t for t in daemon_a.telepathy.known_thoughts if t.source_id == daemon_c.telepathy.node_id]
        
        self.assertTrue(len(thoughts_from_b) > 0, "Daemon A should have received thoughts from B")
        self.assertTrue(len(thoughts_from_c) > 0, "Daemon A should have received thoughts from C")
        
        # Check Relativity Processing (Manual verification of logic)
        # B should be low dissonance
        diss_b = daemon_a.relativity.calculate_dissonance(daemon_b.telepathy.node_id)
        # Note: In real flow, B needs to send its embedding first or with the signal.
        # The TelepathySignal definition has `vector_embedding` field.
        # broadcast_intent currently sends it?
        # Let's check `process_signal` in SwarmDaemon:
        # if signal.vector_embedding: self.relativity.update_peer_frame(...)
        
        # Does broadcast_intent attach the embedding?
        # In SwarmDaemon.broadcast_intent: 
        # await self.telepathy.broadcast_thought(..., payload=payload)
        # TelepathyNode.broadcast_thought calls transmit_thought which creates TelepathySignal.
        # It does NOT automatically attach the embedding to the signal object, 
        # unless TelepathyNode knows about the embedding? No. 
        # TelepathySignal has vector_embedding field optionally.
        
        # FIX: SwarmDaemon should attach its embedding to the broadcast signal.
        # NOW FIXED: We expect automatic update via handle_incoming_signal
        
        # daemon_a.relativity.update_peer_frame(daemon_b.telepathy.node_id, self.vec_friend)
        # daemon_a.relativity.update_peer_frame(daemon_c.telepathy.node_id, self.vec_heretic)
        
        diss_b = daemon_a.relativity.calculate_dissonance(daemon_b.telepathy.node_id)
        diss_c = daemon_a.relativity.calculate_dissonance(daemon_c.telepathy.node_id)
        
        print(f"Calculated Dissonance B (Friend): {diss_b}")
        print(f"Calculated Dissonance C (Heretic): {diss_c}")
        
        self.assertLess(diss_b, 0.2, "Friend should be resonant")
        self.assertGreater(diss_c, 0.8, "Heretic should be dissonant")
        
        # Cleanup
        for t in tasks:
            t.cancel()
        print("✅ Swarm Test Complete")

if __name__ == "__main__":
    unittest.main()
