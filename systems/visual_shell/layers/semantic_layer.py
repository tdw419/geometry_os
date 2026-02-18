"""
Layer 2: Semantic Semantic API
Interacts with the Vision Bridge gui_state.txt to find elements by text.
"""

from pathlib import Path
from typing import Optional, Tuple

class SemanticLayer:
    def __init__(self, state_path: str = "/tmp/vision_bridge/gui_state.txt"):
        self.state_path = Path(state_path)

    def execute(self, intent: str) -> bool:
        """
        Attempt to find and click a UI element matching the intent.
        """
        if not self.state_path.exists():
            return False
            
        state_text = self.state_path.read_text()
        
        # Simple heuristic: Look for lines like "  - [button] Export"
        # In a real implementation, we'd parse the structured sections
        
        target = self._extract_target(intent) # e.g. "click Export" -> "Export"
        if not target:
            return False
            
        for line in state_text.splitlines():
            if target.lower() in line.lower() and "@ (" in line:
                # Found it!
                print(f"[Layer 2] Semantic match found: {line.strip()}")
                # In real implementation: write to actions.txt
                # echo "click: {target}" > actions.txt
                return True
                
        return False

    def _extract_target(self, intent: str) -> Optional[str]:
        # Extract the noun/label from the intent
        # "Click Export" -> "Export"
        # "Open File" -> "File"
        words = intent.split()
        if len(words) >= 2 and words[0].lower() in ["click", "press", "select"]:
            return " ".join(words[1:])
        return intent # Fallback to full string
