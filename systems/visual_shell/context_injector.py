import os
import json

class ContextInjector:
    """Detects gemini/claude commands and wraps prompt with GNB state."""
    
    @staticmethod
    def intercept(cmd_line, gnb_path):
        parts = cmd_line.strip().split()
        if not parts:
            return None
            
        if parts[0] in ["gemini", "claude"]:
            # Read the GNB state
            try:
                with open(gnb_path, "r") as f:
                    gnb_content = f.read()
            except Exception:
                gnb_content = "(GNB state unavailable)"
            
            # Reconstruct the command with context injection
            user_prompt = " ".join(parts[1:])
            injected_prompt = (
                f"CONTEXT (Current G-Shell Screen):\n{gnb_content}\n\n"
                f"USER REQUEST: {user_prompt}\n"
                f"(Note: I am running inside G-Shell. Use the context above to 'see' my terminal.)"
            )
            
            # Prepare the command string for the PTY
            # We use json.dumps to handle escaping for the shell
            return f"{parts[0]} {json.dumps(injected_prompt)}\r\n"
            
        return None
