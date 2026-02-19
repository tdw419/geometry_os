"""
ThoughtLogger - Journaling thoughts to disk for Session Protocol and Glass Box transparency.

This module implements the "Session Protocol" and "Hidden State -> Externalized Memory"
patterns from the "Building ASCII Interfaces" research.
"""

import json
import logging
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, List, Optional

from .thought import Thought, ThoughtType

logger = logging.getLogger("ThoughtLogger")

class ThoughtLogger:
    """
    Journaling system for collective consciousness thoughts.
    
    Persists thoughts to a human-readable and machine-parsable journal,
    enabling session resumption and transparent reasoning.
    """
    
    def __init__(self, journal_path: str = ".geometry/journal/cortex-progress.md"):
        """
        Initialize the logger.
        
        Args:
            journal_path: Path to the markdown journal file.
        """
        self.journal_path = Path(journal_path)
        self.journal_path.parent.mkdir(parents=True, exist_ok=True)
        
        # Ensure file exists with a header if it's new
        if not self.journal_path.exists():
            with open(self.journal_path, "w") as f:
                f.write("# Geometry OS Collective Consciousness Journal\n\n")
                f.write("This journal tracks the reasoning process of the agent swarm.\n\n")

    def log_thought(self, thought: Thought):
        """
        Log a thought to the journal.
        
        Args:
            thought: The Thought instance to log.
        """
        timestamp = thought.timestamp.isoformat()
        
        # Format content for readability
        content_summary = "Vector Data"
        if "text" in thought.metadata:
            content_summary = thought.metadata["text"]
        elif thought.thought_type == ThoughtType.QUERY:
            content_summary = f"Query: {thought.metadata.get('query', '...')[:50]}"
        
        with open(self.journal_path, "a") as f:
            f.write(f"## {timestamp} | Agent: {thought.agent_id} | Type: {thought.thought_type.value}\n")
            f.write(f"- **Confidence**: {thought.confidence:.2f}\n")
            f.write(f"- **Thought ID**: `{thought.thought_id}`\n")
            
            if "text" in thought.metadata:
                f.write(f"- **Content**: {thought.metadata['text']}\n")
            
            if thought.metadata:
                f.write("- **Metadata**:\n")
                for k, v in thought.metadata.items():
                    if k != "text":
                        f.write(f"  - {k}: {v}\n")
            
            f.write("\n")
            
    def log_consensus(self, consensus_thought: Thought, sources: List[str]):
        """
        Log a consensus event.
        
        Args:
            consensus_thought: The resulting consensus Thought.
            sources: List of agent IDs that contributed.
        """
        timestamp = consensus_thought.timestamp.isoformat()
        
        with open(self.journal_path, "a") as f:
            f.write(f"## {timestamp} | CONSENSUS REACHED\n")
            f.write(f"- **Contributing Agents**: {', '.join(sources)}\n")
            f.write(f"- **Consensus ID**: `{consensus_thought.thought_id}`\n")
            f.write(f"- **Agreement Confidence**: {consensus_thought.confidence:.2f}\n")
            
            if "conflict_resolved" in consensus_thought.metadata:
                f.write("- ⚠️ **Conflict Resolved**: Disagreement was detected and merged via weighted aggregation.\n")
            
            f.write("\n")

    def get_last_session_state(self) -> Dict[str, Any]:
        """
        Extract session state from the journal for resumption.
        
        Returns:
            Dictionary containing last known tasks and progress.
        """
        # Simple parser for the journal
        state = {
            "last_active_agents": set(),
            "latest_thoughts": [],
            "completion_estimate": 0.0
        }
        
        if not self.journal_path.exists():
            return state
            
        try:
            with open(self.journal_path, "r") as f:
                lines = f.readlines()
                for line in reversed(lines):
                    if "Agent:" in line:
                        parts = line.split("Agent:")
                        if len(parts) > 1:
                            agent_id = parts[1].split("|")[0].strip()
                            state["last_active_agents"].add(agent_id)
                    if len(state["last_active_agents"]) > 5:
                        break
        except Exception as e:
            logger.error(f"Failed to parse journal for session resumption: {e}")
            
        return state
