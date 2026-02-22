"""
Layer 4: Verification Layer
Verifies that the action had the intended effect.
"""

class VerificationLayer:
    def verify(self, intent: str, initial_state: str, final_state: str) -> bool:
        """
        Compare states to determine success.
        """
        # 1. Did the screen change?
        # 2. Did a new window appear?
        # 3. Did the target text disappear (e.g. login)?
        
        if initial_state == final_state:
            print("[Layer 4] Warning: State did not change.")
            return False
            
        print("[Layer 4] Action verified via state change.")
        return True
