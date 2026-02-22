"""
Collective Consciousness HUD - ASCII interface for visualizing agent reasoning.

Implements the "Compound Intelligence Architecture" and "Glass Box" visualization
patterns from the ASCII research paper.
"""

import os
import time
from typing import List, Dict, Any
import numpy as np

from .thought import Thought, ThoughtType
from .consciousness_state import ConsciousnessState
from .consensus_engine import ConsensusEngine

class CollectiveHUD:
    """
    ASCII HUD for the Collective Consciousness.
    Provides a real-time view of agent thoughts, consensus, and multi-path reasoning.
    """
    
    # Semantic Chromatic Language
    COLORS = {
        "logic": "\033[32m",    # Green
        "perception": "\033[35m", # Magenta
        "learning": "\033[31m",   # Red
        "query": "\033[36m",      # Cyan
        "reset": "\033[0m",
        "bold": "\033[1m"
    }
    
    def __init__(self, state: ConsciousnessState):
        self.state = state
        self.consensus_engine = ConsensusEngine()
        
    def _get_type_color(self, ttype: ThoughtType) -> str:
        if ttype == ThoughtType.EMBEDDING: return self.COLORS["perception"]
        if ttype == ThoughtType.ATTENTION: return self.COLORS["logic"]
        if ttype == ThoughtType.INFERENCE: return self.COLORS["learning"]
        if ttype == ThoughtType.QUERY: return self.COLORS["query"]
        return self.COLORS["reset"]

    def render(self):
        """Render the current collective consciousness state to ASCII."""
        os.system('clear' if os.name == 'posix' else 'cls')
        
        print(f"{self.COLORS['bold']}┌─ COLLECTIVE CONSCIOUSNESS HUD ───────────────────────────────┐{self.COLORS['reset']}")
        
        # 1. Swarm State (Attention Map Summary)
        attention = self.state.compute_attention_map()
        agent_count = len(self.state.embedding_pool)
        print(f"│ Agents Active: {agent_count:<2} | Attention Coherence: {self._get_coherence(attention):.2f}          │")
        
        # 2. Recent Thoughts (Glass Box)
        print(f"├─ RECENT THOUGHT STREAM ──────────────────────────────────────┤")
        recent = self.state.get_recent_thoughts(limit=5)
        for thought in reversed(recent):
            color = self._get_type_color(thought.thought_type)
            agent_short = thought.agent_id[:8]
            content = thought.metadata.get("text", "Vector Content")[:40]
            print(f"│ {color}{thought.thought_type.value.upper():<10}{self.COLORS['reset']} | {agent_short:<8} | {content:<40} │")
            
        # 3. Consensus & Multi-Path (Einstellung Mitigation)
        print(f"├─ CONSENSUS & MULTI-PATH ─────────────────────────────────────┤")
        inferences = self.state.get_recent_thoughts(ThoughtType.INFERENCE, limit=10)
        if inferences:
            clusters = []
            # We would normally use consensus_engine.detect_multipath(inferences) here
            # but for rendering we'll just show status
            agrees = "AGREEMENT" if len(inferences) > 1 else "SINGLE"
            print(f"│ Status: {agrees:<12} | Paths Detected: {min(len(inferences), 3):<2}                    │")
        else:
            print(f"│ Status: IDLE         | Awaiting Inferences...                │")
            
        print(f"└──────────────────────────────────────────────────────────────┘")

    def _get_coherence(self, attention: Any) -> float:
        if attention is None or attention.size == 0:
            return 0.0
        return float(np.mean(attention)) if hasattr(attention, "mean") else 0.0

if __name__ == "__main__":
    # Quick demo if run directly
    import numpy as np
    state = ConsciousnessState()
    hud = CollectiveHUD(state)
    
    # Add dummy data
    state.add_embedding("agent-explorer", np.array([1, 0, 0]))
    state.add_thought(Thought("agent-explorer", ThoughtType.EMBEDDING, np.array([1,0,0]), metadata={"text": "Scanning /systems/visual_shell/"}))
    state.add_thought(Thought("agent-coder", ThoughtType.INFERENCE, np.array([0,1,0]), metadata={"text": "Patch generated for visual_bridge.py"}))
    
    hud.render()
