"""
Layer 3: Visual Perception Layer
Falls back to direct VLM queries when semantic matching fails.
"""

class VisualLayer:
    def execute(self, intent: str) -> bool:
        """
        Ask the VLM directly where to click.
        """
        print(f"[Layer 3] Analyzing screenshot for '{intent}'...")
        # In real implementation:
        # 1. Capture screenshot
        # 2. Send to VLM: "Where should I click to {intent}?"
        # 3. Parse coordinates
        # 4. Click
        return True
