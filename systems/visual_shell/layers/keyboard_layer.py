"""
Layer 1: Keyboard Shortcuts & Direct Commands
Registry of known application shortcuts for deterministic control.
"""

from typing import Dict, Optional

class KeyboardLayer:
    # Registry of app-specific shortcuts
    SHORTCUTS = {
        "general": {
            "open terminal": "ctrl-alt-t",
            "close window": "alt-f4",
            "switch app": "alt-tab",
            "show desktop": "super-d",
            "lock screen": "super-l"
        },
        "shotcut": {
            "new project": "ctrl-n",
            "open project": "ctrl-o",
            "save": "ctrl-s",
            "export": "e",  # Or specific export shortcut
            "play": "space",
            "split": "s",
            "undo": "ctrl-z"
        },
        "firefox": {
            "new tab": "ctrl-t",
            "close tab": "ctrl-w",
            "address bar": "ctrl-l",
            "refresh": "ctrl-r"
        }
    }

    def execute(self, intent: str, context: str) -> bool:
        """
        Attempt to execute intent via known shortcut.
        """
        shortcut = self._find_shortcut(intent, context)
        if shortcut:
            print(f"[Layer 1] Found shortcut for '{intent}': {shortcut}")
            # In real implementation, this calls the bridge
            # bridge.send_keys(shortcut)
            return True
        return False

    def _find_shortcut(self, intent: str, context: str) -> Optional[str]:
        intent = intent.lower()
        
        # Check app-specific context first
        if context in self.SHORTCUTS:
            for key, val in self.SHORTCUTS[context].items():
                if key in intent:
                    return val
                    
        # Check general global shortcuts
        for key, val in self.SHORTCUTS["general"].items():
            if key in intent:
                return val
                
        return None
