#!/usr/bin/env python3
"""
Test Florence-2 model with real inference.

This script tests the vision system with the actual Florence-2 model.
It will download the model on first run (~0.5GB).

Usage:
    python test_florence_real.py

Requirements:
    pip install torch transformers Pillow
"""

import asyncio
import sys
import time
from io import BytesIO
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent))

from PIL import Image, ImageDraw, ImageFont

from systems.vision.florence_model import FlorenceModel
from systems.vision.pipeline_executor import PipelineExecutor


def create_test_image() -> Image.Image:
    """Create a test image with UI-like elements."""
    # Create a 800x600 white image
    img = Image.new("RGB", (800, 600), color="white")
    draw = ImageDraw.Draw(img)

    # Draw some buttons
    button_style = {"fill": "#0078d4", "outline": "#005a9e"}

    # Export button
    draw.rectangle([50, 50, 150, 90], **button_style)
    draw.text((70, 58), "Export", fill="white")

    # Cancel button
    draw.rectangle([170, 50, 270, 90], **button_style)
    draw.text((190, 58), "Cancel", fill="white")

    # Save button
    draw.rectangle([290, 50, 390, 90], **button_style)
    draw.text((320, 58), "Save", fill="white")

    # Input field with label
    draw.rectangle([50, 150, 400, 180], outline="#666666", width=1)
    draw.text((55, 125), "Filename:", fill="black")
    draw.text((55, 155), "document.pdf", fill="#333333")

    # Dropdown
    draw.rectangle([50, 220, 250, 250], outline="#666666", width=1)
    draw.text((55, 225), "Format: PDF", fill="#333333")
    draw.polygon([(230, 230), (240, 240), (220, 240)], fill="#333333")

    # Panel with options
    draw.rectangle([450, 100, 750, 400], outline="#cccccc", width=1)
    draw.text((460, 110), "Options", fill="black")

    for i, label in enumerate(["Quality: High", "Resolution: 1080p", "Compression: Auto"]):
        y = 150 + i * 40
        draw.rectangle([460, y, 480, y + 20], outline="#666666", width=1)
        draw.text((490, y + 2), label, fill="black")

    # Status bar
    draw.rectangle([0, 560, 800, 600], fill="#f0f0f0")
    draw.text((10, 572), "Ready", fill="#666666")
    draw.text((700, 572), "100%", fill="#666666")

    return img


async def test_florence_model():
    """Test the real Florence-2 model."""
    print("=" * 60)
    print("Florence-2 Real Model Test")
    print("=" * 60)

    # Create test image
    print("\n1. Creating test image...")
    image = create_test_image()

    # Save for inspection
    test_image_path = Path(__file__).parent / "test_florence_output.png"
    image.save(test_image_path)
    print(f"   Saved test image to: {test_image_path}")

    # Initialize model
    print("\n2. Loading Florence-2 model...")
    print("   (This may take a moment on first run - downloading ~0.5GB)")

    model = FlorenceModel(model_size="base")

    start = time.time()
    model.load()
    load_time = time.time() - start
    print(f"   Model loaded in {load_time:.1f}s")
    print(f"   Device: {model._device}")

    # Create executor
    executor = PipelineExecutor(model)

    # Test 1: OCR
    print("\n3. Testing OCR...")
    start = time.time()
    result = await executor.execute(image, [
        {"op": "ocr", "assign_to": "text"}
    ])
    ocr_time = (time.time() - start) * 1000
    print(f"   Latency: {ocr_time:.0f}ms")
    if result.success:
        text_results = result.results.get("text", [])
        print(f"   Found {len(text_results)} text regions:")
        for t in text_results[:5]:
            print(f"     - '{t.get('text', '')}' at {t.get('bbox')}")
        if len(text_results) > 5:
            print(f"     ... and {len(text_results) - 5} more")
    else:
        print(f"   Error: {result.error}")

    # Test 2: Object Detection
    print("\n4. Testing Detection...")
    start = time.time()
    result = await executor.execute(image, [
        {"op": "detect", "classes": ["button", "input"], "assign_to": "elements"}
    ])
    detect_time = (time.time() - start) * 1000
    print(f"   Latency: {detect_time:.0f}ms")
    if result.success:
        elements = result.results.get("elements", [])
        print(f"   Found {len(elements)} UI elements:")
        for e in elements[:5]:
            print(f"     - {e.get('class')}: {e.get('bbox')} (conf: {e.get('confidence', 0):.2f})")
    else:
        print(f"   Error: {result.error}")

    # Test 3: Phrase Grounding
    print("\n5. Testing Phrase Grounding...")
    start = time.time()
    result = await executor.execute(image, [
        {"op": "ground", "text": "Export", "assign_to": "export_btn"}
    ])
    ground_time = (time.time() - start) * 1000
    print(f"   Latency: {ground_time:.0f}ms")
    if result.success:
        btn = result.results.get("export_btn", {})
        # Handle list or dict result
        if isinstance(btn, list):
            if btn:
                print(f"   Found {len(btn)} matches:")
                for i, b in enumerate(btn[:3]):
                    print(f"     [{i}] bbox: {b.get('bbox')}, text: {b.get('text')}")
            else:
                print("   No matches found")
        else:
            print(f"   Found: {btn}")
    else:
        print(f"   Error: {result.error}")

    # Test 4: Full Pipeline
    print("\n6. Testing Full Pipeline (3 steps)...")
    start = time.time()
    result = await executor.execute(image, [
        {"op": "detect", "classes": ["button"], "assign_to": "buttons"},
        {"op": "ground", "text": "Export", "assign_to": "export_btn"},
        {"op": "click_point", "source": "$export_btn", "assign_to": "click"}
    ])
    pipeline_time = (time.time() - start) * 1000
    print(f"   Latency: {pipeline_time:.0f}ms")
    if result.success:
        print(f"   Results:")
        print(f"     - buttons: {len(result.results.get('buttons', []))} found")
        export_btn = result.results.get("export_btn", {})
        if isinstance(export_btn, list) and export_btn:
            export_btn = export_btn[0]
        print(f"     - export_btn: {export_btn.get('bbox') if isinstance(export_btn, dict) else export_btn}")
        print(f"     - click: {result.results.get('click')}")
    else:
        print(f"   Error: {result.error}")

    # Summary
    print("\n" + "=" * 60)
    print("PERFORMANCE SUMMARY")
    print("=" * 60)
    print(f"OCR:          {ocr_time:>8.0f}ms  (target: <50ms)")
    print(f"Detection:    {detect_time:>8.0f}ms  (target: <50ms)")
    print(f"Grounding:    {ground_time:>8.0f}ms  (target: <50ms)")
    print(f"3-step pipe:  {pipeline_time:>8.0f}ms  (target: <100ms)")
    print("=" * 60)

    # Check if targets met
    print("\nTARGET CHECKS:")
    for name, latency, target in [
        ("OCR", ocr_time, 50),
        ("Detection", detect_time, 50),
        ("Grounding", ground_time, 50),
        ("3-step pipeline", pipeline_time, 100)
    ]:
        status = "✅" if latency < target else "⚠️"
        print(f"  {status} {name}: {latency:.0f}ms (target <{target}ms)")

    if model._device.type == "cpu":
        print("\nNOTE: Running on CPU. GPU would be ~10-50x faster.")


if __name__ == "__main__":
    asyncio.run(test_florence_model())
