# Compositor Integration Guide

The Pixel LLM Compositor Integration provides a simple API for integrating real-time image captioning and visual understanding with the Geometry OS compositor and other applications.

## Overview

The compositor integration module (`systems/pixel_llm/compositor/`) offers:

- **Simple API**: Easy-to-use functions for quick integration
- **Async Support**: Asynchronous captioning for non-blocking operation
- **Batch Processing**: Caption multiple frames efficiently
- **Caching**: Feature caching for improved performance
- **Multiple Encoders**: Support for DINOv2, CLIP, and random encoders
- **LM Studio Integration**: Generate captions using local LLMs

## Installation

The compositor integration requires:

```bash
pip install torch torchvision pillow numpy
```

For async support, Python 3.7+ is required.

## Quick Start

### One-Line Captioning

The fastest way to get started:

```python
import asyncio
from systems.pixel_llm.compositor import quick_caption
from PIL import Image

async def main():
    # Load image
    image = Image.open("path/to/image.jpg")

    # Generate caption
    caption = await quick_caption(image)
    print(caption)  # "A red square on a white background"

asyncio.run(main())
```

### Using the Integrator Class

For more control, use the `CompositorIntegrator`:

```python
import asyncio
from systems.pixel_llm.compositor import CompositorIntegrator, CompositorConfig

async def main():
    # Configure
    config = CompositorConfig(
        encoder_type="dinov2",
        device="cuda",
        max_length=100,
    )

    # Initialize
    integrator = CompositorIntegrator(config)
    await integrator.initialize()

    # Caption a frame
    caption = await integrator.caption_frame(image)
    print(caption)

    # Clean up
    await integrator.shutdown()

asyncio.run(main())
```

## Configuration

### CompositorConfig Options

```python
@dataclass
class CompositorConfig:
    # Vision encoder settings
    encoder_type: str = "dinov2"  # dinov2, clip, or random
    device: str = "cuda"           # cuda, cpu, or mps
    image_size: int = 224

    # LM Studio settings
    lm_studio_base_url: str = "http://localhost:1234/v1"
    lm_studio_model: str = "qwen2.5-coder-7b-instruct"

    # Performance settings
    batch_size: int = 1
    max_concurrent_requests: int = 4
    cache_enabled: bool = True
    cache_size: int = 100

    # Captioning settings
    max_length: int = 100
    temperature: float = 0.7
    num_beams: int = 1
```

### Encoder Types

**DINOv2** (Recommended):
- Best for visual understanding
- Good for real-world images
- Slower than CLIP

```python
config = CompositorConfig(encoder_type="dinov2")
```

**CLIP**:
- Faster than DINOv2
- Good for general images
- Better for web-scale images

```python
config = CompositorConfig(encoder_type="clip")
```

**Random** (Testing only):
- No actual encoding
- Fastest option
- For testing only

```python
config = CompositorConfig(encoder_type="random")
```

## Usage Patterns

### Real-Time Captioning

```python
import asyncio
import cv2
from systems.pixel_llm.compositor import CompositorIntegrator, CompositorConfig

async def realtime_captioning():
    config = CompositorConfig(
        encoder_type="dinov2",
        device="cuda",
        cache_enabled=True,
    )

    integrator = CompositorIntegrator(config)
    await integrator.initialize()

    cap = cv2.VideoCapture(0)

    while True:
        ret, frame = cap.read()
        if not ret:
            break

        # Generate caption
        caption = await integrator.caption_frame(frame)
        print(f"Caption: {caption}")

        # Display with caption
        cv2.putText(frame, caption, (10, 30),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
        cv2.imshow("Captioned", frame)

        if cv2.waitKey(1) & 0xFF == 27:  # ESC
            break

    cap.release()
    cv2.destroyAllWindows()
    await integrator.shutdown()

asyncio.run(realtime_captioning())
```

### Batch Processing

```python
import asyncio
from systems.pixel_llm.compositor import CompositorIntegrator

async def batch_captioning():
    integrator = CompositorIntegrator()
    await integrator.initialize()

    # Process multiple images
    images = ["image1.jpg", "image2.jpg", "image3.jpg"]
    captions = await integrator.caption_batch(images)

    for img, caption in zip(images, captions):
        print(f"{img}: {caption}")

    await integrator.shutdown()

asyncio.run(batch_captioning())
```

### File System Watching

```python
import asyncio
from pathlib import Path
from systems.pixel_llm.compositor import CompositorIntegrator

async def watch_directory():
    integrator = CompositorIntegrator()
    await integrator.initialize()

    watch_dir = Path("./incoming_images")

    # Process existing files
    for image_file in watch_dir.glob("*.jpg"):
        caption = await integrator.caption_frame(image_file)
        print(f"{image_file.name}: {caption}")

    await integrator.shutdown()

asyncio.run(watch_directory())
```

### API Endpoint

```python
from fastapi import FastAPI, UploadFile
from systems.pixel_llm.compositor import CompositorIntegrator

app = FastAPI()
integrator = CompositorIntegrator()

@app.on_event("startup")
async def startup():
    await integrator.initialize()

@app.post("/caption")
async def caption_image(file: UploadFile):
    from PIL import Image
    import io

    contents = await file.read()
    image = Image.open(io.BytesIO(contents))

    caption = await integrator.caption_frame(image)
    return {"caption": caption}

@app.on_event("shutdown")
async def shutdown():
    await integrator.shutdown()
```

## Caching

The integrator includes automatic feature caching:

```python
config = CompositorConfig(
    cache_enabled=True,
    cache_size=100,  # Number of cached features
)

integrator = CompositorIntegrator(config)
await integrator.initialize()

# First call computes and caches features
caption1 = await integrator.caption_frame(image)

# Second identical frame uses cache (much faster)
caption2 = await integrator.caption_frame(image)

# Check cache stats
stats = integrator.get_cache_stats()
print(f"Cache size: {stats['size']}/{stats['max_size']}")

# Clear cache if needed
integrator.clear_cache()
```

## Performance Tips

1. **Enable Caching**: For repetitive frames or scenes
2. **Use CLIP**: When speed is more important than accuracy
3. **Batch Processing**: Process multiple frames together
4. **GPU Acceleration**: Use CUDA when available
5. **Reduce Max Length**: Shorter captions are faster

```python
# Fast mode
config = CompositorConfig(
    encoder_type="clip",      # Faster encoder
    device="cuda",            # GPU acceleration
    max_length=30,            # Shorter captions
    cache_enabled=True,       # Enable caching
)
```

## LM Studio Integration

The compositor uses LM Studio for caption generation. To set up:

1. Install [LM Studio](https://lmstudio.ai/)
2. Download a model (e.g., Qwen2.5-Coder-7B-Instruct)
3. Start the LM Studio server
4. Configure the base URL:

```python
config = CompositorConfig(
    lm_studio_base_url="http://localhost:1234/v1",
    lm_studio_model="qwen2.5-coder-7b-instruct",
)
```

### Alternative LLM Endpoints

You can use any OpenAI-compatible endpoint:

```python
# OpenAI API
config = CompositorConfig(
    lm_studio_base_url="https://api.openai.com/v1",
    lm_studio_model="gpt-4-vision-preview",
)

# Local vLLM
config = CompositorConfig(
    lm_studio_base_url="http://localhost:8000/v1",
    lm_studio_model="your-model",
)
```

## Examples

See `systems/pixel_llm/compositor/example.py` for complete examples:

- Quick caption usage
- Integrator basic usage
- Batch captioning
- Webcam integration
- File processing

Run examples:
```bash
python3 systems/pixel_llm/compositor/example.py
```

## Error Handling

```python
import asyncio
from systems.pixel_llm.compositor import CompositorIntegrator

async def safe_captioning():
    integrator = CompositorIntegrator()

    try:
        await integrator.initialize()

        # Handle captioning errors
        try:
            caption = await integrator.caption_frame(image)
        except Exception as e:
            print(f"Captioning failed: {e}")
            caption = "Caption unavailable"

    finally:
        await integrator.shutdown()

asyncio.run(safe_captioning())
```

## Related Documentation

- [Webcam Demo Guide](./webcam_demo_guide.md)
- [Custom Training Guide](./custom_training_guide.md)
- [Pixel LLM README](../README.md)

## API Reference

### quick_caption(frame, encoder_type="dinov2", device="cuda", lm_studio_url="http://localhost:1234/v1")

Generate a caption without managing the integrator lifecycle.

**Parameters:**
- `frame`: numpy array, PIL Image, or path to image
- `encoder_type`: Vision encoder type
- `device`: Device to run on
- `lm_studio_url`: LM Studio API URL

**Returns:** Caption string

### CompositorIntegrator(config=None, model=None)

Main integrator class for advanced usage.

**Methods:**
- `initialize()`: Initialize the integrator
- `caption_frame(frame, use_cache=True)`: Caption a single frame
- `caption_batch(frames, use_cache=True)`: Caption multiple frames
- `clear_cache()`: Clear the feature cache
- `get_cache_stats()`: Get cache statistics
- `shutdown()`: Release resources
