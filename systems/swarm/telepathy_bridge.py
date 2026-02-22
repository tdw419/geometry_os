import asyncio
import logging
from typing import Dict, Any, Optional, List
import numpy as np
from systems.swarm.telepathy_protocol import TelepathyNode, TelepathySignal
from systems.visual_shell.swarm.consciousness.thought import Thought, ThoughtType
from systems.visual_shell.swarm.consciousness.consciousness_state import ConsciousnessState

logger = logging.getLogger("TelepathyBridge")

class TelepathyBridge:
    """
    Bridges TelepathyNode (P2P Swarm) with ConsciousnessState (Thought Data).
    Enables cross-worktree thought transmission.
    """
    def __init__(self, agent_id: str, port: int = 5000, discovery_port: int = 5001):
        self.agent_id = agent_id
        self.node = TelepathyNode(port=port, peer_discovery_port=discovery_port, capabilities=["consciousness_bridge"])
        self.state = ConsciousnessState()
        self.node.register_observer(self._on_signal_received)
        
    async def start(self):
        """Start the telepathy node."""
        await self.node.start()
        
    def _on_signal_received(self, signal: TelepathySignal):
        """Callback for incoming TelepathySignals."""
        try:
            # Convert TelepathySignal back to Thought
            thought_type_str = signal.signal_type
            # Handle mapping if necessary, or just use strings
            try:
                thought_type = ThoughtType(thought_type_str.lower())
            except ValueError:
                # Fallback for custom types
                thought_type = ThoughtType.INFERENCE
                
            content = None
            if signal.vector_embedding:
                content = np.array(signal.vector_embedding, dtype=np.float32)
            
            thought = Thought(
                agent_id=signal.source_id,
                thought_type=thought_type,
                content=content,
                confidence=signal.payload.get("confidence", 1.0),
                timestamp=signal.timestamp,
                metadata=signal.payload.get("metadata", {})
            )
            
            # Add to local consciousness state
            self.state.add_thought(thought)
            if content is not None:
                self.state.add_embedding(signal.source_id, content)
                
            logger.info(f"🌁 Bridge integrated thought from {signal.source_id}: {thought_type}")
        except Exception as e:
            logger.error(f"Failed to bridge signal: {e}")

    async def broadcast_thought(self, thought: Thought):
        """Broadcast a Thought object over the telepathy network."""
        signal_type = thought.thought_type.value.upper()
        payload = {
            "confidence": thought.confidence,
            "metadata": thought.metadata,
            "agent_id": self.agent_id
        }
        
        vector_embedding = None
        if thought.content is not None:
            vector_embedding = thought.content.tolist()
            
        await self.node.broadcast_thought(
            signal_type=signal_type,
            payload=payload,
            vector_embedding=vector_embedding
        )

if __name__ == "__main__":
    import sys
    logging.basicConfig(level=logging.INFO)
    agent_id = sys.argv[1] if len(sys.argv) > 1 else "bridge-agent"
    port = int(sys.argv[2]) if len(sys.argv) > 2 else 5000
    bridge = TelepathyBridge(agent_id=agent_id, port=port)
    asyncio.run(bridge.start())
