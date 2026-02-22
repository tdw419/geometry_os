"""Test configuration for Geometry OS tests."""
import sys
from pathlib import Path

# Add project root to path for imports
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))

# Add systems/pixel_compiler to path for imports
pixel_compiler_path = project_root / "systems" / "pixel_compiler"
sys.path.insert(0, str(pixel_compiler_path))
