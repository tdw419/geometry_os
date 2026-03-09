
import logging
import sys
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline

logging.basicConfig(level=logging.INFO)

def test_wgpu_inference():
    brain_path = "tinystories_brain.rts.png"
    try:
        pipeline = PixelBrainPipeline(brain_path)
        if not pipeline._wgpu_initialized:
            print("❌ WGPU failed to initialize")
            return

        print("🚀 Running WGPU inference...")
        tokens = pipeline.generate([0], max_tokens=2)
        print(f"✅ Generated tokens: {tokens}")
        
    except Exception as e:
        print(f"❌ Error during inference: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    test_wgpu_inference()
