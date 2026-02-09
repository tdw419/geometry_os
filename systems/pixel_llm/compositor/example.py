"""
Compositor Integration Example for Pixel LLM

This example demonstrates how to integrate Pixel LLM with the Geometry OS
compositor for real-time image captioning and visual understanding.

Usage:
    python examples/compositor_example.py

Requirements:
    - LM Studio running with qwen2.5-coder-7b-instruct model
    - CUDA-capable GPU (optional, will use CPU if not available)
    - An image file or webcam for testing
"""

import asyncio
import sys
from pathlib import Path
from typing import Optional

import numpy as np
from PIL import Image

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from compositor import (
    CompositorIntegrator,
    CompositorConfig,
    quick_caption,
)


async def example_1_quick_caption():
    """
    Example 1: Quick caption using the convenience function.

    This is the simplest way to get started with Pixel LLM.
    """
    print("=" * 60)
    print("Example 1: Quick Caption")
    print("=" * 60)

    # Create a simple test image (red square on white background)
    test_image = create_test_image()

    # Generate caption in one line
    caption = await quick_caption(
        test_image,
        encoder_type="dinov2",
        device="cuda",  # Change to "cpu" if no GPU available
        lm_studio_url="http://localhost:1234/v1",
    )

    print(f"Caption: {caption}")
    print()


async def example_2_integrator_basic():
    """
    Example 2: Using the CompositorIntegrator for more control.

    This shows how to use the integrator for better resource management
    and configuration options.
    """
    print("=" * 60)
    print("Example 2: CompositorIntegrator (Basic)")
    print("=" * 60)

    # Create configuration
    config = CompositorConfig(
        encoder_type="dinov2",
        device="cuda",
        lm_studio_base_url="http://localhost:1234/v1",
        lm_studio_model="qwen2.5-coder-7b-instruct",
        max_length=100,
        temperature=0.7,
        cache_enabled=True,
    )

    # Create and initialize integrator
    integrator = CompositorIntegrator(config)
    await integrator.initialize()

    try:
        # Caption multiple frames
        test_images = [create_test_image(color=i) for i in range(3)]

        for i, img in enumerate(test_images):
            caption = await integrator.caption_frame(img)
            print(f"Frame {i + 1}: {caption}")

        # Show cache stats
        cache_stats = integrator.get_cache_stats()
        print(f"\nCache stats: {cache_stats}")

    finally:
        await integrator.shutdown()

    print()


async def example_3_batch_captioning():
    """
    Example 3: Batch captioning for multiple frames.

    This demonstrates efficient batch processing of multiple frames.
    """
    print("=" * 60)
    print("Example 3: Batch Captioning")
    print("=" * 60)

    config = CompositorConfig(
        encoder_type="dinov2",
        device="cuda",
        batch_size=4,
    )

    integrator = CompositorIntegrator(config)
    await integrator.initialize()

    try:
        # Create batch of test images
        test_images = [create_test_image(color=i) for i in range(5)]

        # Caption all frames in batch
        captions = await integrator.caption_batch(test_images)

        for i, caption in enumerate(captions):
            print(f"Frame {i + 1}: {caption}")

    finally:
        await integrator.shutdown()

    print()


async def example_4_real_time_webcam():
    """
    Example 4: Real-time captioning from webcam.

    This demonstrates a realistic use case for compositor integration.
    Note: Requires a webcam and OpenCV.

    Press 'q' to quit the webcam demo.
    """
    print("=" * 60)
    print("Example 4: Real-time Webcam Captioning")
    print("=" * 60)
    print("Press 'q' to quit")
    print()

    try:
        import cv2
    except ImportError:
        print("OpenCV not installed. Install with: pip install opencv-python")
        print("Skipping webcam example.")
        return

    config = CompositorConfig(
        encoder_type="dinov2",
        device="cuda",
        cache_enabled=False,  # Disable cache for real-time processing
    )

    integrator = CompositorIntegrator(config)
    await integrator.initialize()

    try:
        # Open webcam
        cap = cv2.VideoCapture(0)

        if not cap.isOpened():
            print("Error: Could not open webcam.")
            return

        print("Starting webcam... Press 'q' to quit.\n")

        frame_count = 0
        fps_counter = 0
        import time
        start_time = time.time()

        while True:
            ret, frame = cap.read()

            if not ret:
                print("Error: Failed to capture frame.")
                break

            # Caption every 5th frame to avoid overwhelming the system
            if frame_count % 5 == 0:
                # Convert BGR to RGB
                frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

                # Generate caption (non-blocking)
                caption = await integrator.caption_frame(frame_rgb)

                # Display caption on frame
                cv2.putText(
                    frame,
                    caption,
                    (10, 30),
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.7,
                    (0, 255, 0),
                    2,
                )

                # Calculate FPS
                fps_counter += 1
                elapsed = time.time() - start_time
                fps = fps_counter / elapsed if elapsed > 0 else 0

                print(f"Frame {frame_count}: {caption} (FPS: {fps:.2f})")

            # Display frame
            cv2.imshow('Pixel LLM Compositor', frame)

            frame_count += 1

            # Quit on 'q' press
            if cv2.waitKey(1) & 0xFF == ord('q'):
                break

        cap.release()
        cv2.destroyAllWindows()

    finally:
        await integrator.shutdown()

    print()


async def example_5_file_captioning():
    """
    Example 5: Caption images from files.

    This demonstrates batch processing of image files.
    """
    print("=" * 60)
    print("Example 5: File Captioning")
    print("=" * 60)

    # Path to image directory
    image_dir = Path("examples/images")

    if not image_dir.exists():
        print(f"Image directory not found: {image_dir}")
        print("Creating test images instead...")
        image_dir.mkdir(parents=True, exist_ok=True)

        # Create some test images
        for i in range(3):
            img = create_test_image(color=i)
            img_path = image_dir / f"test_image_{i}.png"
            img.save(img_path)
            print(f"Created: {img_path}")

    # Get all image files
    image_files = list(image_dir.glob("*.png")) + list(image_dir.glob("*.jpg"))

    if not image_files:
        print("No images found.")
        return

    print(f"Found {len(image_files)} images\n")

    integrator = CompositorIntegrator()
    await integrator.initialize()

    try:
        for img_path in image_files:
            # Load image
            img = Image.open(img_path)

            # Generate caption
            caption = await integrator.caption_frame(img)

            print(f"{img_path.name}: {caption}")

    finally:
        await integrator.shutdown()

    print()


def create_test_image(color: int = 0, size: int = 224) -> Image.Image:
    """
    Create a simple test image for demonstration.

    Args:
        color: Color index (0-2) to vary the test image
        size: Image size (default 224x224)

    Returns:
        PIL Image
    """
    img = Image.new('RGB', (size, size), color='white')

    from PIL import ImageDraw

    draw = ImageDraw.Draw(img)

    # Draw different colored shapes based on color index
    colors = ['red', 'blue', 'green']
    shapes = ['rectangle', 'ellipse', 'rectangle']

    color_name = colors[color % len(colors)]
    shape_type = shapes[color % len(shapes)]

    if shape_type == 'rectangle':
        draw.rectangle([50, 50, 174, 174], fill=color_name)
    else:
        draw.ellipse([50, 50, 174, 174], fill=color_name)

    return img


async def main():
    """Run all examples."""
    print("\n" + "=" * 60)
    print("Pixel LLM Compositor Integration Examples")
    print("=" * 60 + "\n")

    # Check if LM Studio is running
    import aiohttp
    try:
        async with aiohttp.ClientSession() as session:
            async with session.get("http://localhost:1234/v1/models", timeout=2) as resp:
                if resp.status != 200:
                    print("WARNING: LM Studio may not be running!")
                    print("Please start LM Studio with qwen2.5-coder-7b-instruct model.\n")
    except Exception:
        print("WARNING: Cannot connect to LM Studio!")
        print("Please start LM Studio with qwen2.5-coder-7b-instruct model.\n")
        print("Examples will fail without LM Studio running.\n")

    # Run examples
    await example_1_quick_caption()
    await example_2_integrator_basic()
    await example_3_batch_captioning()

    # Uncomment to run webcam example (requires webcam)
    # await example_4_real_time_webcam()

    # Uncomment to run file captioning example
    # await example_5_file_captioning()

    print("=" * 60)
    print("All examples completed!")
    print("=" * 60)


if __name__ == "__main__":
    asyncio.run(main())
