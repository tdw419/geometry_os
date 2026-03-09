"""
Network Boot Bridge Protocol.

Streaming protocol for bootable textures over WebSocket with SHA256 integrity validation.

Wire format: [seq:4][len:4][offset:8][data:N][checksum:64]
- seq: 4 bytes, uint32, frame sequence number
- len: 4 bytes, uint32, data length
- offset: 8 bytes, uint64, byte offset in total image
- data: N bytes, raw texture chunk
- checksum: 64 bytes, ASCII hex of SHA256(data)

End-of-stream marker: sequence = 0xFFFFFFFF

Task 1: Create Boot Bridge Protocol
Phase 8: Network Boot
"""

import struct
import hashlib
from dataclasses import dataclass
from typing import AsyncIterator, Optional, Callable

# Constants
DEFAULT_CHUNK_SIZE = 65536  # 64KB
END_OF_STREAM_MARKER = 0xFFFFFFFF
WIRE_FORMAT_PREFIX = '>IIQ'  # big-endian: uint32 seq, uint32 len, uint64 offset
WIRE_PREFIX_SIZE = 16
CHECKSUM_SIZE = 64


@dataclass
class BootFrame:
    """A single frame in the boot texture stream."""

    sequence: int          # Frame number (uint32)
    chunk_offset: int      # Byte offset in total image (uint64)
    chunk_data: bytes      # Raw texture bytes
    checksum: str          # SHA256 of chunk_data (64 hex chars)

    def validate_checksum(self) -> bool:
        """Verify the checksum matches the chunk data."""
        computed = hashlib.sha256(self.chunk_data).hexdigest()
        return computed == self.checksum

    def to_bytes(self) -> bytes:
        """Serialize frame to wire format."""
        data_len = len(self.chunk_data)
        # Pack: [seq:4][len:4][offset:8][data:N][checksum:64]
        header = struct.pack(
            WIRE_FORMAT_PREFIX,
            self.sequence,
            data_len,
            self.chunk_offset
        )
        return header + self.chunk_data + self.checksum.encode('ascii')

    @classmethod
    def from_bytes(cls, data: bytes) -> 'BootFrame':
        """Deserialize frame from wire format."""
        if len(data) < WIRE_PREFIX_SIZE + CHECKSUM_SIZE:
            raise ValueError(f"Frame too short: {len(data)} bytes")

        # Unpack header
        seq, data_len, offset = struct.unpack(WIRE_FORMAT_PREFIX, data[:WIRE_PREFIX_SIZE])

        # Extract chunk data and checksum
        chunk_start = WIRE_PREFIX_SIZE
        chunk_end = chunk_start + data_len
        checksum_start = chunk_end
        checksum_end = checksum_start + CHECKSUM_SIZE

        if len(data) < checksum_end:
            raise ValueError(f"Frame incomplete: expected {checksum_end} bytes, got {len(data)}")

        chunk_data = data[chunk_start:chunk_end]
        checksum = data[checksum_start:checksum_end].decode('ascii')

        return cls(
            sequence=seq,
            chunk_offset=offset,
            chunk_data=chunk_data,
            checksum=checksum
        )


async def stream_boot_texture(
    texture_data: bytes,
    chunk_size: int = DEFAULT_CHUNK_SIZE,
    total_size: Optional[int] = None
) -> AsyncIterator[BootFrame]:
    """
    Stream a texture as a series of BootFrames.

    Args:
        texture_data: The complete texture bytes to stream
        chunk_size: Size of each chunk in bytes (default 64KB)
        total_size: Total size hint (uses len(texture_data) if None)

    Yields:
        BootFrame objects with SHA256 integrity checksums
    """
    if total_size is None:
        total_size = len(texture_data)

    offset = 0
    sequence = 0

    while offset < len(texture_data):
        # Extract chunk
        chunk = texture_data[offset:offset + chunk_size]
        actual_len = len(chunk)

        # Compute checksum
        checksum = hashlib.sha256(chunk).hexdigest()

        # Create frame
        frame = BootFrame(
            sequence=sequence,
            chunk_offset=offset,
            chunk_data=chunk,
            checksum=checksum
        )

        yield frame

        # Advance
        offset += actual_len
        sequence += 1

    # Send end-of-stream marker
    eos_frame = BootFrame(
        sequence=END_OF_STREAM_MARKER,
        chunk_offset=offset,
        chunk_data=b'',
        checksum=hashlib.sha256(b'').hexdigest()  # SHA256 of empty string
    )
    yield eos_frame


class BootStreamServer:
    """WebSocket server for streaming boot textures."""

    def __init__(self, texture_source: Callable[[], bytes]):
        """
        Initialize the boot stream server.

        Args:
            texture_source: Callable that returns the texture bytes to stream
        """
        self.texture_source = texture_source

    async def handle_client(self, websocket, path):
        """
        Handle a WebSocket client connection.

        Args:
            websocket: The WebSocket connection
            path: The requested path (ignored)
        """
        try:
            # Get texture data
            texture_data = self.texture_source()

            # Stream frames to client
            async for frame in stream_boot_texture(texture_data):
                await websocket.send(frame.to_bytes())

        except Exception as e:
            # Log error and close connection
            print(f"BootStreamServer error: {e}")
            raise
