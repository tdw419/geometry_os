"""
Tests for Network Boot Bridge Protocol.

Task 1: Create Boot Bridge Protocol
Phase 8: Network Boot
"""

import hashlib

import pytest


class TestBootBridgeProtocol:
    """Tests for boot stream protocol."""

    def test_boot_bridge_module_exists(self):
        """Test that boot_bridge module can be imported."""
        from systems.visual_shell.api import boot_bridge
        assert boot_bridge is not None

    def test_boot_bridge_has_stream_function(self):
        """Test that boot_bridge has stream_boot_texture function."""
        from systems.visual_shell.api.boot_bridge import stream_boot_texture
        assert callable(stream_boot_texture)

    def test_boot_frame_structure(self):
        """Test that BootFrame has required fields."""
        from systems.visual_shell.api.boot_bridge import BootFrame

        chunk_data = b'\x00\x01\x02\x03'
        checksum = hashlib.sha256(chunk_data).hexdigest()

        frame = BootFrame(
            sequence=0,
            chunk_offset=0,
            chunk_data=chunk_data,
            checksum=checksum
        )

        assert frame.sequence == 0
        assert frame.chunk_offset == 0
        assert len(frame.chunk_data) == 4
        assert len(frame.checksum) == 64  # SHA256 hex

    def test_chunk_data_checksum_validation(self):
        """Test that checksum is correctly computed."""
        from systems.visual_shell.api.boot_bridge import BootFrame

        data = b'hello world'
        expected_sha = hashlib.sha256(data).hexdigest()

        frame = BootFrame(
            sequence=1,
            chunk_offset=0,
            chunk_data=data,
            checksum=expected_sha
        )

        assert frame.validate_checksum() == True

        # Corrupted data should fail
        frame.chunk_data = b'hello worlX'
        assert frame.validate_checksum() == False

    def test_boot_frame_serialization(self):
        """Test that BootFrame can be serialized and deserialized."""
        from systems.visual_shell.api.boot_bridge import BootFrame

        original_data = b'test serialization data'
        checksum = hashlib.sha256(original_data).hexdigest()

        frame = BootFrame(
            sequence=42,
            chunk_offset=1024,
            chunk_data=original_data,
            checksum=checksum
        )

        # Serialize to bytes
        wire_data = frame.to_bytes()

        # Deserialize back
        restored = BootFrame.from_bytes(wire_data)

        assert restored.sequence == 42
        assert restored.chunk_offset == 1024
        assert restored.chunk_data == original_data
        assert restored.checksum == checksum
        assert restored.validate_checksum() == True


class TestBootStreamEndpoint:
    """Tests for WebSocket boot stream endpoint."""

    @pytest.mark.asyncio
    async def test_boot_stream_yields_frames(self):
        """Test that stream_boot_texture yields BootFrames."""
        from systems.visual_shell.api.boot_bridge import BootFrame, stream_boot_texture

        texture_data = bytes(range(256))

        frames = []
        async for frame in stream_boot_texture(texture_data, chunk_size=64):
            frames.append(frame)
            if len(frames) >= 3:
                break

        assert len(frames) >= 1
        assert all(isinstance(f, BootFrame) for f in frames)
        assert frames[0].sequence == 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
