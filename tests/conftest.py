"""Test configuration for Geometry OS tests."""
import sys
from pathlib import Path

# Directory structure:
#   /home/jericho/zion/projects/geometry_os/         <- repo root (contains geometry_os package)
#   /home/jericho/zion/projects/geometry_os/geometry_os/  <- geometry_os package
#   /home/jericho/zion/projects/geometry_os/geometry_os/tests/  <- this file
#
# Tests import using 'geometry_os.systems.pixel_compiler' which needs:
#   sys.path to include /home/jericho/zion/projects/geometry_os/
#   geometry_os/__init__.py to exist

# Add the repo root (parent of geometry_os package)
# This enables 'from geometry_os.systems.pixel_compiler import ...'
repo_root = Path(__file__).parent.parent.parent
sys.path.insert(0, str(repo_root))

# Also add the geometry_os directory for direct imports like 'from systems.visual_shell import ...'
geometry_os_dir = Path(__file__).parent.parent
sys.path.insert(0, str(geometry_os_dir))

# Add geoasm-cli for GeoASM imports
geoasm_cli = geometry_os_dir / "geoasm-cli"
if geoasm_cli.exists():
    sys.path.insert(0, str(geoasm_cli))

# Add visual-vm for FFI bridge imports
visual_vm = geometry_os_dir / "visual-vm"
if visual_vm.exists():
    sys.path.insert(0, str(visual_vm))

# Add systems directory for direct 'from systems.*' imports
systems_dir = geometry_os_dir / "systems"
if systems_dir.exists():
    sys.path.insert(0, str(systems_dir))
