# Pixel LLM Webcam Demo Guide

The Pixel LLM Webcam Demo provides real-time image captioning using your webcam. This guide will help you set up and run the demo.

## Features

- Real-time caption generation from webcam feed
- Caption overlay on video display
- Configurable target FPS for performance tuning
- ESC key exit for clean shutdown
- Support for multiple camera devices
- GPU acceleration (CUDA) support

## Requirements

### System Requirements

- Python 3.8+
- Webcam device
- 4GB+ RAM recommended
- CUDA-capable GPU (optional, for acceleration)

### Python Dependencies

```bash
pip install opencv-python torch torchvision pillow numpy
```

Or use the system packages flag:
```bash
pip install opencv-python --break-system-packages
```

## Installation

1. Ensure the Pixel LLM module is in your Python path:
```python
import sys
sys.path.append('/path/to/geometry_os')
```

2. Verify webcam access:
```bash
# Test webcam with OpenCV
python3 -c "import cv2; print(cv2.VideoCapture(0).isOpened())"
```

## Usage

### Basic Usage

Run the demo with default settings:
```bash
python3 systems/pixel_llm/examples/webcam_demo.py
```

### Command Line Options

```bash
python3 systems/pixel_llm/examples/webcam_demo.py [OPTIONS]
```

**Options:**
- `--camera INDEX`: Camera device index (default: 0)
- `--fps N`: Target FPS for captioning (default: 15)
- `--model PATH`: Path to saved model checkpoint
- `--device {cuda,cpu}`: Device to run on (default: auto-detect)

### Examples

**Use specific camera:**
```bash
python3 systems/pixel_llm/examples/webcam_demo.py --camera 1
```

**Run at 30 FPS:**
```bash
python3 systems/pixel_llm/examples/webcam_demo.py --fps 30
```

**Use CPU instead of GPU:**
```bash
python3 systems/pixel_llm/examples/webcam_demo.py --device cpu
```

**Load trained model:**
```bash
python3 systems/pixel_llm/examples/webcam_demo.py --model ./checkpoints/best.pt
```

## Programmatic Usage

You can also use the `WebcamCaptioner` class in your own code:

```python
from systems.pixel_llm.examples.webcam_demo import WebcamCaptioner

# Initialize captioner
captioner = WebcamCaptioner(
    camera_index=0,
    target_fps=15,
    model_path=None,  # Use default model
    device='cuda'     # or 'cpu'
)

# Run the demo
captioner.run()

# Clean up when done
captioner.cleanup()
```

## How It Works

1. **Frame Capture**: Captures frames from your webcam using OpenCV
2. **Preprocessing**: Converts frames to RGB, resizes to 224x224, normalizes with ImageNet stats
3. **Caption Generation**: Uses PixelLLM model to generate image captions
4. **Display**: Shows video feed with caption overlay and FPS counter

## Performance Tuning

### Target FPS

Lower FPS = less CPU/GPU usage but choppier captions:
```bash
# For slower machines
python3 systems/pixel_llm/examples/webcam_demo.py --fps 10

# For smoother experience
python3 systems/pixel_llm/examples/webcam_demo.py --fps 30
```

### Model Settings

The demo uses these generation settings by default:
```python
GenerationConfig(
    max_length=30,      # Short captions for speed
    temperature=0.8,    # Balanced creativity
    do_sample=False,    # Greedy decoding for speed
    num_beams=1,        # No beam search for speed
)
```

Modify these in the source code for different trade-offs.

## Troubleshooting

### Camera Not Opening

**Error**: `Cannot open camera 0`

**Solutions:**
- Try different camera indices: `--camera 1`, `--camera 2`
- Check camera permissions: `ls -l /dev/video*`
- Verify no other app is using the camera

### Low FPS

**Symptoms**: FPS < 5, laggy video

**Solutions:**
- Lower target FPS: `--fps 10`
- Use CPU if GPU is slower: `--device cpu`
- Reduce camera resolution in code
- Close other applications

### Poor Captions

**Symptoms**: Captions don't match video content

**Solutions:**
- Train model on relevant dataset
- Use a pre-trained model: `--model path/to/checkpoint.pt`
- Adjust generation parameters (temperature, num_beams)

### ImportError

**Error**: `No module named 'cv2'`

**Solution**:
```bash
pip install opencv-python --break-system-packages
```

## Advanced Usage

### Custom Processing

Modify the `WebcamCaptioner` class for custom behavior:

```python
class MyCaptioner(WebcamCaptioner):
    def preprocess_frame(self, frame):
        # Add custom preprocessing
        frame = super().preprocess_frame(frame)
        # ... your custom logic
        return frame

    def draw_caption(self, frame, caption, fps):
        # Custom overlay drawing
        # ... your custom logic
        return frame
```

### Integration with Other Systems

The demo can be integrated into larger applications:

```python
import asyncio
from systems.pixel_llm.examples.webcam_demo import WebcamCaptioner

async def main():
    captioner = WebcamCaptioner(camera_index=0, target_fps=15)

    # Process single frames
    ret, frame = captioner.cap.read()
    caption = captioner.generate_caption(frame)
    print(f"Caption: {caption}")

    captioner.cleanup()
```

## Related Documentation

- [Compositor Integration Guide](./compositor_integration_guide.md)
- [Custom Training Guide](./custom_training_guide.md)
- [Pixel LLM README](../README.md)

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Review the source code: `systems/pixel_llm/examples/webcam_demo.py`
3. Open an issue on the project repository
