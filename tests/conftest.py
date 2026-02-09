"""Test configuration for PixelRTS v2 tests."""
import sys
from pathlib import Path

# Add systems/pixel_compiler to path for imports
pixel_compiler_path = Path(__file__).parent.parent / "systems" / "pixel_compiler"
sys.path.insert(0, str(pixel_compiler_path))
