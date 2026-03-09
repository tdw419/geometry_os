"""
End-to-end test for Network Boot.

Simulates: Server streams boot texture -> Client receives -> Memory reconstructed
"""

import pytest
import asyncio
import numpy as np


class TestNetworkBootE2E:
    """E2E tests for complete boot pipeline."""

    @pytest.mark.asyncio
    async def test_boot_pipeline_complete(self):
        """Test complete boot pipeline from server to client."""
        from systems.visual_shell.api.boot_bridge import stream_boot_texture
        from systems.hypervisor.holographic_flatten import flatten_texture

        # 1. Create test 3D texture (16x16x16 for fast test)
        texture_3d = np.random.randint(0, 256, (16, 16, 16), dtype=np.uint8)

        # 2. Flatten to 2D
        texture_2d = flatten_texture(texture_3d)
        texture_bytes = texture_2d.tobytes()

        # 3. Stream as boot frames
        frames = []
        async for frame in stream_boot_texture(texture_bytes, chunk_size=256):
            frames.append(frame)

        # 4. Verify all frames received
        assert len(frames) > 0, "No frames received"

        # 5. Verify all checksums valid
        for frame in frames:
            assert frame.validate_checksum(), f"Frame {frame.sequence} checksum failed"

        # 6. Reconstruct memory
        reconstructed = bytearray()
        for frame in sorted(frames, key=lambda f: f.chunk_offset):
            reconstructed.extend(frame.chunk_data)

        # 7. Verify reconstruction matches original
        assert bytes(reconstructed[:len(texture_bytes)]) == texture_bytes, \
            "Reconstructed data doesn't match original"

    @pytest.mark.asyncio
    async def test_boot_frame_ordering(self):
        """Test that frames can be reordered and still reconstruct correctly."""
        from systems.visual_shell.api.boot_bridge import stream_boot_texture

        data = bytes(range(256))
        frames = []
        async for frame in stream_boot_texture(data, chunk_size=32):
            frames.append(frame)

        # Shuffle frames
        import random
        random.shuffle(frames)

        # Reconstruct using offset
        reconstructed = bytearray(256)
        for frame in frames:
            offset = frame.chunk_offset
            reconstructed[offset:offset + len(frame.chunk_data)] = frame.chunk_data

        assert bytes(reconstructed) == data, "Out-of-order reconstruction failed"

    def test_flatten_unflatten_roundtrip_e2e(self):
        """Test that 3D texture survives flatten/unflatten roundtrip."""
        from systems.hypervisor.holographic_flatten import (
            flatten_texture,
            unflatten_coordinate,
            flatten_coordinate,
            calculate_output_size
        )

        # Create test pattern
        original = np.arange(16**3, dtype=np.uint8).reshape(16, 16, 16)

        # Flatten
        flat = flatten_texture(original)

        # Unflatten
        order = 4  # log2(16)
        recovered = np.zeros_like(original)

        for z in range(16):
            for y in range(16):
                for x in range(16):
                    x2d, y2d = flatten_coordinate(x, y, z, order)
                    recovered[z, y, x] = flat[y2d, x2d]

        # Verify
        np.testing.assert_array_equal(original, recovered,
            "Flatten/unflatten roundtrip corrupted data")


class TestBootBridgeProtocolE2E:
    """E2E tests for boot bridge protocol."""

    @pytest.mark.asyncio
    async def test_python_rust_frame_compatibility(self):
        """Test that Python BootFrame wire format matches Rust."""
        import hashlib
        import struct
        from systems.visual_shell.api.boot_bridge import BootFrame as PythonBootFrame

        # Create test data and compute correct SHA256
        chunk_data = b'\x01\x02\x03\x04\x05'
        checksum = hashlib.sha256(chunk_data).hexdigest()

        # Create frame in Python
        py_frame = PythonBootFrame(
            sequence=42,
            chunk_offset=1024,
            chunk_data=chunk_data,
            checksum=checksum
        )

        # Serialize
        wire_data = py_frame.to_bytes()

        # Verify wire format: [seq:4][len:4][offset:8][data:5][checksum:64]
        assert len(wire_data) == 4 + 4 + 8 + 5 + 64  # 85 bytes

        seq, data_len, offset = struct.unpack('>IIQ', wire_data[:16])
        assert seq == 42
        assert data_len == 5
        assert offset == 1024

        # Deserialize back
        recovered = PythonBootFrame.from_bytes(wire_data)
        assert recovered.sequence == py_frame.sequence
        assert recovered.chunk_offset == py_frame.chunk_offset
        assert recovered.chunk_data == py_frame.chunk_data


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
