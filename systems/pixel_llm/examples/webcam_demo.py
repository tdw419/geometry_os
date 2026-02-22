#!/usr/bin/env python3
"""
Pixel LLM Webcam Demo

This script demonstrates real-time image captioning using the PixelLLM model
with a webcam feed. Captions are displayed overlaid on the video feed.

Features:
    - Real-time caption generation from webcam
    - Caption overlay on video feed
    - ESC key to exit
    - Target 15 FPS for smooth operation

Usage:
    python3 systems/pixel_llm/examples/webcam_demo.py

Requirements:
    - opencv-python (install with: pip install opencv-python --break-system-packages)
    - PyTorch
    - PixelLLM model
"""
import sys
import time
from pathlib import Path

# Add parent directory to path for imports
# Script is at: .../geometry_os/systems/pixel_llm/examples/webcam_demo.py
# We need to add .../geometry_os/ to sys.path
# That's 4 levels up from the examples directory
project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))

try:
    import cv2
    import torch
    import numpy as np
    from PIL import Image
except ImportError as e:
    print(f"Error: Missing required dependency - {e}")
    print("Please install: pip install opencv-python --break-system-packages")
    sys.exit(1)

# Direct import to work around geometry_os.py file shadowing the package
import importlib.util

def import_module_from_path(module_name, file_path):
    """Import a module directly from a file path"""
    spec = importlib.util.spec_from_file_location(module_name, file_path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[module_name] = module
    spec.loader.exec_module(module)
    return module

# Get the pixel_llm directory path
pixel_llm_dir = Path(__file__).parent.parent

# Import required modules directly
models = import_module_from_path('geometry_os.systems.pixel_llm.models', pixel_llm_dir / 'models.py')
inference = import_module_from_path('geometry_os.systems.pixel_llm.inference', pixel_llm_dir / 'inference.py')

PixelLLM = models.PixelLLM
create_pixel_llm = models.create_pixel_llm
generate_caption = inference.generate_caption
GenerationConfig = inference.GenerationConfig


class WebcamCaptioner:
    """Real-time webcam captioning using PixelLLM"""

    def __init__(
        self,
        camera_index: int = 0,
        target_fps: int = 15,
        model_path: str = None,
        device: str = None,
    ):
        """Initialize webcam captioner

        Args:
            camera_index: Camera device index (default: 0)
            target_fps: Target FPS for captioning (default: 15)
            model_path: Path to saved model (optional, creates new model if None)
            device: Device to run on ('cuda', 'cpu', or None for auto)
        """
        self.camera_index = camera_index
        self.target_fps = target_fps
        self.frame_time = 1.0 / target_fps

        # Determine device
        if device is None:
            self.device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
        else:
            self.device = torch.device(device)

        print(f"Using device: {self.device}")

        # Initialize camera
        self.cap = cv2.VideoCapture(camera_index)
        if not self.cap.isOpened():
            raise RuntimeError(f"Cannot open camera {camera_index}")

        # Get camera properties
        self.width = int(self.cap.get(cv2.CAP_PROP_FRAME_WIDTH))
        self.height = int(self.cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
        print(f"Camera resolution: {self.width}x{self.height}")

        # Load or create model
        self.model = self._load_model(model_path)
        self.model.eval()

        # Create generation config for faster inference
        self.gen_config = GenerationConfig(
            max_length=30,  # Short captions for real-time
            temperature=0.8,
            do_sample=False,  # Greedy for speed
            num_beams=1,  # No beam search for speed
        )

        # FPS tracking
        self.last_caption_time = 0
        self.current_caption = "Initializing..."
        self.fps = 0

    def _load_model(self, model_path: str) -> PixelLLM:
        """Load or create PixelLLM model

        Args:
            model_path: Path to saved model checkpoint

        Returns:
            Loaded PixelLLM model
        """
        if model_path and Path(model_path).exists():
            print(f"Loading model from {model_path}...")
            checkpoint = torch.load(model_path, map_location=self.device)
            model = checkpoint["model"]
            model.load_state_dict(checkpoint["state_dict"])
        else:
            print("Creating new PixelLLM model...")
            model = create_pixel_llm(
                image_size=224,
                patch_size=16,
                vision_embed_dim=512,
                vision_num_layers=4,
                vision_num_heads=8,
                vocab_size=50000,
                text_embed_dim=512,
                text_num_layers=6,
                text_num_heads=8,
                max_seq_len=128,
                cross_attention_dim=512,
                num_cross_attention_layers=2,
            )

        model = model.to(self.device)
        print(f"Model loaded with {sum(p.numel() for p in model.parameters()):,} parameters")
        return model

    def preprocess_frame(self, frame: np.ndarray) -> torch.Tensor:
        """Preprocess camera frame for model input

        Args:
            frame: Raw camera frame (BGR format)

        Returns:
            Preprocessed tensor [1, 3, 224, 224]
        """
        # Convert BGR to RGB
        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

        # Convert to PIL Image
        image = Image.fromarray(frame_rgb)

        # Resize to 224x224
        image = image.resize((224, 224), Image.Resampling.BILINEAR)

        # Convert to tensor and normalize
        image_array = np.array(image).astype(np.float32) / 255.0
        image_tensor = torch.from_numpy(image_array).permute(2, 0, 1).unsqueeze(0)

        # Normalize with ImageNet stats
        mean = torch.tensor([0.485, 0.456, 0.406]).view(1, 3, 1, 1)
        std = torch.tensor([0.229, 0.224, 0.225]).view(1, 3, 1, 1)
        image_tensor = (image_tensor - mean) / std

        return image_tensor.to(self.device)

    def generate_caption(self, frame: np.ndarray) -> str:
        """Generate caption for camera frame

        Args:
            frame: Camera frame

        Returns:
            Generated caption text
        """
        try:
            # Preprocess frame
            image_tensor = self.preprocess_frame(frame)

            # Generate caption
            with torch.no_grad():
                tokens = generate_caption(
                    self.model,
                    image_tensor,
                    config=self.gen_config,
                )

            # For demo purposes, return a placeholder caption
            # In production, you would decode tokens to text
            if isinstance(tokens, torch.Tensor):
                # Simple token-to-text mapping for demo
                caption = f"Caption: {len(tokens)} tokens generated"
            else:
                caption = str(tokens)

            return caption

        except Exception as e:
            return f"Error: {str(e)}"

    def draw_caption(self, frame: np.ndarray, caption: str, fps: float):
        """Draw caption overlay on frame

        Args:
            frame: Camera frame
            caption: Caption text to display
            fps: Current FPS

        Returns:
            Frame with caption overlay
        """
        # Create a copy
        display_frame = frame.copy()

        # Draw semi-transparent background for caption
        overlay = display_frame.copy()
        cv2.rectangle(overlay, (10, 10), (display_frame.shape[1] - 10, 80), (0, 0, 0), -1)
        cv2.addWeighted(overlay, 0.6, display_frame, 0.4, 0, display_frame)

        # Draw caption text with word wrap
        text = caption
        font = cv2.FONT_HERSHEY_SIMPLEX
        font_scale = 0.7
        thickness = 2
        color = (0, 255, 0)  # Green

        # Get text size
        (text_width, text_height), baseline = cv2.getTextSize(
            text, font, font_scale, thickness
        )

        # Position for caption
        y = 40

        # Draw caption
        cv2.putText(display_frame, text, (20, y), font, font_scale, color, thickness)

        # Draw FPS
        fps_text = f"FPS: {fps:.1f} / {self.target_fps}"
        cv2.putText(
            display_frame,
            fps_text,
            (20, 70),
            font,
            0.5,
            (0, 255, 255),
            1,
        )

        # Draw instructions
        instr_text = "Press ESC to exit"
        cv2.putText(
            display_frame,
            instr_text,
            (display_frame.shape[1] - 200, 30),
            font,
            0.5,
            (255, 255, 255),
            1,
        )

        return display_frame

    def run(self):
        """Run webcam demo loop"""
        print("\nStarting webcam demo...")
        print("Press ESC to exit")

        frame_count = 0
        start_time = time.time()
        last_time = start_time

        try:
            while True:
                # Read frame
                ret, frame = self.cap.read()
                if not ret:
                    print("Error: Cannot read from camera")
                    break

                current_time = time.time()

                # Generate caption at target FPS
                if current_time - self.last_caption_time >= self.frame_time:
                    self.current_caption = self.generate_caption(frame)
                    self.last_caption_time = current_time

                    # Calculate FPS
                    frame_count += 1
                    elapsed = current_time - last_time
                    if elapsed >= 1.0:
                        self.fps = frame_count / elapsed
                        frame_count = 0
                        last_time = current_time

                # Draw caption overlay
                display_frame = self.draw_caption(frame, self.current_caption, self.fps)

                # Display frame
                cv2.imshow("PixelLLM Webcam Demo", display_frame)

                # Check for ESC key
                key = cv2.waitKey(1) & 0xFF
                if key == 27:  # ESC
                    print("\nExiting...")
                    break

        except KeyboardInterrupt:
            print("\nInterrupted by user")
        finally:
            self.cleanup()

    def cleanup(self):
        """Clean up resources"""
        self.cap.release()
        cv2.destroyAllWindows()
        print("Camera closed")


def main():
    """Main entry point"""
    import argparse

    parser = argparse.ArgumentParser(description="PixelLLM Webcam Demo")
    parser.add_argument(
        "--camera",
        type=int,
        default=0,
        help="Camera device index (default: 0)",
    )
    parser.add_argument(
        "--fps",
        type=int,
        default=15,
        help="Target FPS for captioning (default: 15)",
    )
    parser.add_argument(
        "--model",
        type=str,
        default=None,
        help="Path to saved model checkpoint",
    )
    parser.add_argument(
        "--device",
        type=str,
        default=None,
        choices=["cuda", "cpu"],
        help="Device to run on (default: auto)",
    )

    args = parser.parse_args()

    try:
        captioner = WebcamCaptioner(
            camera_index=args.camera,
            target_fps=args.fps,
            model_path=args.model,
            device=args.device,
        )
        captioner.run()
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()
