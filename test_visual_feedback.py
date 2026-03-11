
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

class MockBridge:
    def __init__(self):
        self.glows = []
    def emit_atlas_glow(self, weight_indices, intensity=1.0, duration_ms=500):
        self.glows.append(weight_indices)
        print(f"✨ Bridge: Glow emitted for {len(weight_indices)} indices")

def test_visual_feedback():
    bridge = MockBridge()
    pipeline = PixelBrainPipeline("tinystories_brain.rts.png", visual_bridge=bridge)
    
    print("🚀 Generating with visual feedback...")
    tokens = pipeline.generate([7454, 2402, 257, 640], max_tokens=3)
    print(f"Generated: {tokens}")
    print(f"Total glows: {len(bridge.glows)}")

if __name__ == "__main__":
    test_visual_feedback()
