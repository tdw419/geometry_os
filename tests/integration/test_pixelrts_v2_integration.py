#!/usr/bin/env python3
"""
Integration tests for PixelRTS v2 and RTS Registry integration.

Tests the registration of .rts.png cartridges with the RTS registry manager.
"""

import pytest
import json
import hashlib
import tempfile
import subprocess
import sys
from pathlib import Path

# Add pixel_compiler to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent / "systems" / "pixel_compiler"))

# Test data
TEST_DATA = b"PixelRTS v2 integration test data! This is a test cartridge."


def test_register_pixelrts_v2_cartridge(tmp_path):
    """Test registering a PixelRTS v2 cartridge in the RTS registry."""
    # Create a test .rts.png file using the converter
    from pixelrts_v2_core import (
        PixelRTSMetadata,
        calculate_grid_size
    )
    from PIL import Image
    import numpy as np

    # Create test PNG with PixelRTS v2 metadata
    grid_size = calculate_grid_size(len(TEST_DATA), bytes_per_pixel=4)

    # Create simple RGBA image
    img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)

    # Pack test data into RGBA pixels (row-by-row for simplicity)
    byte_idx = 0
    for y in range(grid_size):
        for x in range(grid_size):
            if byte_idx < len(TEST_DATA):
                img_data[y, x, 0] = TEST_DATA[byte_idx] if byte_idx < len(TEST_DATA) else 0
                img_data[y, x, 1] = TEST_DATA[byte_idx + 1] if byte_idx + 1 < len(TEST_DATA) else 0
                img_data[y, x, 2] = TEST_DATA[byte_idx + 2] if byte_idx + 2 < len(TEST_DATA) else 0
                img_data[y, x, 3] = TEST_DATA[byte_idx + 3] if byte_idx + 3 < len(TEST_DATA) else 255
                byte_idx += 4
            else:
                img_data[y, x, 3] = 255  # Alpha

    # Create PNG
    from PIL import PngImagePlugin
    img = Image.fromarray(img_data, mode='RGBA')

    # Create metadata
    metadata = PixelRTSMetadata.create_metadata(
        grid_size=grid_size,
        encoding_mode="RGBA-dense",
        segments={
            "test": {
                "start": 0,
                "end": len(TEST_DATA),
                "size": len(TEST_DATA),
                "sha256": hashlib.sha256(TEST_DATA).hexdigest(),
                "type": "test",
                "name": "integration-test"
            }
        }
    )

    # Add metadata to PNG
    pnginfo = PngImagePlugin.PngInfo()
    pnginfo.add_text("PixelRTS", json.dumps(metadata))

    # Save PNG
    png_file = tmp_path / "test.rts.png"
    img.save(png_file, pnginfo=pnginfo)

    # Save sidecar metadata
    meta_file = tmp_path / "test.rts.meta.json"
    with open(meta_file, 'w') as f:
        json.dump(metadata, f, indent=2)

    # Register in RTS registry
    from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

    # Create temporary registry
    registry_path = tmp_path / "registry.json"
    manager = RTSRegistryManager(registry_path=str(registry_path))

    # Register the .rts.png cartridge
    cartridge_id = manager.register(str(png_file), metadata={"type": "test", "name": "integration-test"})

    assert cartridge_id == "integration-test"

    # Verify registration
    cartridge = manager.get(cartridge_id)
    assert cartridge is not None
    assert cartridge["id"] == "integration-test"
    assert cartridge["format"] == "pixelrts-v2"
    assert cartridge["type"] == "test"
    assert cartridge["pixelrts"]["grid_size"] == grid_size
    assert cartridge["pixelrts"]["encoding_mode"] == "RGBA-dense"


def test_register_legacy_rts_cartridge(tmp_path):
    """Test registering a legacy .rts cartridge still works."""
    # Create a test .rts file
    rts_file = tmp_path / "test.rts"
    test_data = b"Legacy RTS test data"
    rts_file.write_bytes(test_data)

    from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

    # Create temporary registry
    registry_path = tmp_path / "registry.json"
    manager = RTSRegistryManager(registry_path=str(registry_path))

    # Register the legacy .rts cartridge
    cartridge_id = manager.register(str(rts_file), metadata={"type": "tool", "name": "legacy-test"})

    assert cartridge_id == "legacy-test"

    # Verify registration
    cartridge = manager.get(cartridge_id)
    assert cartridge is not None
    assert cartridge["id"] == "legacy-test"
    assert cartridge["format"] == "rts-legacy"
    assert cartridge["type"] == "tool"


def test_list_cartridges_with_pixelrts_v2(tmp_path):
    """Test listing cartridges with PixelRTS v2 format information."""
    from geometry_os.systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata, calculate_grid_size
    from PIL import Image
    from PIL import PngImagePlugin
    import numpy as np

    # Create test PNG with PixelRTS v2 metadata
    grid_size = calculate_grid_size(len(TEST_DATA), bytes_per_pixel=4)
    img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
    img_data[:, :, 3] = 255  # Alpha

    img = Image.fromarray(img_data, mode='RGBA')

    metadata = PixelRTSMetadata.create_metadata(
        grid_size=grid_size,
        encoding_mode="RGBA-dense",
        segments={}
    )

    pnginfo = PngImagePlugin.PngInfo()
    pnginfo.add_text("PixelRTS", json.dumps(metadata))

    png_file = tmp_path / "test.rts.png"
    img.save(png_file, pnginfo=pnginfo)

    from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

    registry_path = tmp_path / "registry.json"
    manager = RTSRegistryManager(registry_path=str(registry_path))

    # Register cartridge
    manager.register(str(png_file), metadata={"type": "test", "name": "list-test"})

    # List all cartridges
    cartridges = manager.list()

    assert len(cartridges) == 1
    assert cartridges[0]["id"] == "list-test"
    assert cartridges[0]["format"] == "pixelrts-v2"


def test_find_cartridge_by_type(tmp_path):
    """Test finding cartridges by type with PixelRTS v2 support."""
    from geometry_os.systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata, calculate_grid_size
    from PIL import Image
    from PIL import PngImagePlugin
    import numpy as np

    # Create two test PNGs with different types
    for i, cart_type in enumerate(["kernel", "tool"]):
        grid_size = calculate_grid_size(len(TEST_DATA), bytes_per_pixel=4)
        img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
        img_data[:, :, 3] = 255

        img = Image.fromarray(img_data, mode='RGBA')

        metadata = PixelRTSMetadata.create_metadata(
            grid_size=grid_size,
            encoding_mode="RGBA-dense",
            segments={}
        )

        pnginfo = PngImagePlugin.PngInfo()
        pnginfo.add_text("PixelRTS", json.dumps(metadata))

        png_file = tmp_path / f"test_{i}.rts.png"
        img.save(png_file, pnginfo=pnginfo)

        from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

        registry_path = tmp_path / "registry.json"
        manager = RTSRegistryManager(registry_path=str(registry_path))

        # Register cartridge
        manager.register(str(png_file), metadata={"type": cart_type, "name": f"test-{cart_type}"})

    # Find by type
    from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

    manager = RTSRegistryManager(registry_path=str(registry_path))
    kernel_cartridges = manager.list(cartridge_type="kernel")

    assert len(kernel_cartridges) == 1
    assert kernel_cartridges[0]["type"] == "kernel"


def test_verify_pixelrts_v2_cartridge(tmp_path):
    """Test verifying a PixelRTS v2 cartridge checksum."""
    from geometry_os.systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata, calculate_grid_size
    from PIL import Image
    from PIL import PngImagePlugin
    import numpy as np

    # Create test PNG
    grid_size = calculate_grid_size(len(TEST_DATA), bytes_per_pixel=4)
    img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
    img_data[:, :, 3] = 255

    img = Image.fromarray(img_data, mode='RGBA')

    metadata = PixelRTSMetadata.create_metadata(
        grid_size=grid_size,
        encoding_mode="RGBA-dense",
        segments={}
    )

    pnginfo = PngImagePlugin.PngInfo()
    pnginfo.add_text("PixelRTS", json.dumps(metadata))

    png_file = tmp_path / "test.rts.png"
    img.save(png_file, pnginfo=pnginfo)

    from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

    registry_path = tmp_path / "registry.json"
    manager = RTSRegistryManager(registry_path=str(registry_path))

    # Register cartridge
    cartridge_id = manager.register(str(png_file), metadata={"type": "test"})

    # Verify cartridge
    verified = manager.verify(cartridge_id)

    assert verified is True


def test_unregister_pixelrts_v2_cartridge(tmp_path):
    """Test unregistering a PixelRTS v2 cartridge."""
    from geometry_os.systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata, calculate_grid_size
    from PIL import Image
    from PIL import PngImagePlugin
    import numpy as np

    # Create test PNG
    grid_size = calculate_grid_size(len(TEST_DATA), bytes_per_pixel=4)
    img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
    img_data[:, :, 3] = 255

    img = Image.fromarray(img_data, mode='RGBA')

    metadata = PixelRTSMetadata.create_metadata(
        grid_size=grid_size,
        encoding_mode="RGBA-dense",
        segments={}
    )

    pnginfo = PngImagePlugin.PngInfo()
    pnginfo.add_text("PixelRTS", json.dumps(metadata))

    png_file = tmp_path / "test.rts.png"
    img.save(png_file, pnginfo=pnginfo)

    from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

    registry_path = tmp_path / "registry.json"
    manager = RTSRegistryManager(registry_path=str(registry_path))

    # Register cartridge
    cartridge_id = manager.register(str(png_file), metadata={"type": "test"})

    # Verify it's registered
    assert manager.get(cartridge_id) is not None

    # Unregister
    result = manager.unregister(cartridge_id)

    assert result is True

    # Verify it's gone
    assert manager.get(cartridge_id) is None


def test_update_existing_cartridge(tmp_path):
    """Test updating an existing cartridge registration."""
    from geometry_os.systems.pixel_compiler.pixelrts_v2_core import PixelRTSMetadata, calculate_grid_size
    from PIL import Image
    from PIL import PngImagePlugin
    import numpy as np

    # Create test PNG
    grid_size = calculate_grid_size(len(TEST_DATA), bytes_per_pixel=4)
    img_data = np.zeros((grid_size, grid_size, 4), dtype=np.uint8)
    img_data[:, :, 3] = 255

    img = Image.fromarray(img_data, mode='RGBA')

    metadata = PixelRTSMetadata.create_metadata(
        grid_size=grid_size,
        encoding_mode="RGBA-dense",
        segments={}
    )

    pnginfo = PngImagePlugin.PngInfo()
    pnginfo.add_text("PixelRTS", json.dumps(metadata))

    png_file = tmp_path / "test.rts.png"
    img.save(png_file, pnginfo=pnginfo)

    from geometry_os.systems.pixel_compiler.rts_registry_manager import RTSRegistryManager

    registry_path = tmp_path / "registry.json"
    manager = RTSRegistryManager(registry_path=str(registry_path))

    # Register cartridge
    manager.register(str(png_file), metadata={"type": "test", "name": "original"})

    # Update with new metadata - note: the name in metadata determines the ID
    # So we need to use the same name to update the same cartridge
    manager.register(str(png_file), metadata={"type": "test", "name": "original", "description": "Updated cartridge"})

    # Verify update - the ID is still "original"
    cartridge = manager.get("original")
    assert cartridge is not None
    assert cartridge["metadata"]["description"] == "Updated cartridge"
    assert cartridge["name"] == "original"


if __name__ == "__main__":
    # Run tests when executed directly
    import sys
    pytest.main([__file__, "-v"] + sys.argv[1:])
