import asyncio
import logging
import pytest
import numpy as np
from systems.swarm.telepathy_bridge import TelepathyBridge
from systems.visual_shell.swarm.consciousness.thought import Thought, ThoughtType

# Set up logging for test clarity
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("CrossWorktreeTest")

class TestCrossWorktreeTelepathy:
    """
    Tests for cross-worktree (simulated by multi-node) thought transmission.
    Uses TelepathyBridge to sync ConsciousnessState.
    """
    
    @pytest.mark.asyncio
    async def test_thought_sync_between_bridges(self):
        logger.info("🧪 Starting Cross-Worktree Sync Test")
        
        # 1. Initialize two bridges on different TCP ports but same discovery port
        discovery_port = 5555
        bridge_a = TelepathyBridge(agent_id="worktree-a", port=7001, discovery_port=discovery_port)
        bridge_b = TelepathyBridge(agent_id="worktree-b", port=7002, discovery_port=discovery_port)
        
        # 2. Start nodes in background
        task_a = asyncio.create_task(bridge_a.start())
        task_b = asyncio.create_task(bridge_b.start())
        
        logger.info("⏳ Waiting for discovery (needs >5s)...")
        await asyncio.sleep(7)
        
        # 3. Verify Discovery
        assert bridge_b.node.node_id in bridge_a.node.peers
        assert bridge_a.node.node_id in bridge_b.node.peers
        logger.info("✅ Peer discovery successful between bridges.")
        
        # 4. Agent A generates an INSIGHT thought and broadcasts it
        insight = Thought(
            agent_id="worktree-a",
            thought_type=ThoughtType.INFERENCE,
            content=np.array([0.1, 0.2, 0.3], dtype=np.float32),
            confidence=0.95,
            metadata={"source": "experiment-1", "topic": "worktree-isolation"}
        )
        
        logger.info("📢 Bridge A broadcasting insight...")
        await bridge_a.broadcast_thought(insight)
        
        # 5. Allow time for transmission
        await asyncio.sleep(1.5)
        
        # 6. Verify Bridge B integrated the thought into its local state
        recent_thoughts = bridge_b.state.get_recent_thoughts(ThoughtType.INFERENCE)
        assert len(recent_thoughts) > 0
        received = recent_thoughts[-1]
        
        assert received.agent_id == bridge_a.node.node_id
        assert received.thought_type == ThoughtType.INFERENCE
        assert received.confidence == 0.95
        assert received.metadata["topic"] == "worktree-isolation"
        np.testing.assert_array_almost_equal(received.content, insight.content)
        
        logger.info("✅ Bridge B successfully integrated Bridge A's thought.")
        
        # Cleanup
        bridge_a.node.running = False
        bridge_b.node.running = False
        task_a.cancel()
        task_b.cancel()
        try:
            await task_a
            await task_b
        except asyncio.CancelledError:
            pass
        logger.info("✨ Test complete.")
