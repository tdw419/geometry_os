import pytest
import json
import struct
import os
import sys
from unittest.mock import MagicMock, patch

# Add project root to path
sys.path.insert(0, os.path.abspath(os.path.dirname(os.path.dirname(__file__))))

from systems.sisyphus.thought_serializer import ThoughtSerializer, ThoughtGlyph
from systems.sisyphus.compositor_bridge import CompositorBridge
from systems.sisyphus.native_hilbert import NativeHilbertLUT

class TestThoughtSerializer:
    def setup_method(self):
        self.serializer = ThoughtSerializer()

    def test_serialize_task_start(self):
        thought = {"type": "task_start", "task_name": "Test Task"}
        glyph = self.serializer.serialize(thought)
        assert glyph.thought_type == "task_start"
        assert glyph.color == (0.0, 1.0, 1.0, 1.0) # Cyan
        assert 0 <= glyph.hilbert_index < (256 * 256)

    def test_serialize_gvn(self):
        thought = {"type": "gvn", "content": "GVN optimized loop"}
        glyph = self.serializer.serialize(thought)
        assert glyph.thought_type == "gvn"
        assert glyph.color == (1.0, 1.0, 0.0, 1.0) # Yellow

    def test_to_glyph_command(self):
        glyph = ThoughtGlyph(
            thought_type="test",
            content="test",
            hilbert_index=123,
            color=(1.0, 0.0, 0.0, 1.0), # Red
            timestamp=123456789.0
        )
        cmd = self.serializer.to_glyph_command(glyph)
        assert len(cmd) == 16
        assert cmd[0] == 0xCE # Opcode
        # Unpack color (bytes 5-8)
        r, g, b, a = struct.unpack('BBBB', cmd[5:9])
        assert r == 255
        assert g == 0
        assert b == 0
        assert a == 255

class TestCompositorBridge:
    @patch('socket.socket')
    def test_connection(self, mock_socket):
        bridge = CompositorBridge("/tmp/test.sock")
        assert bridge.connect() == True
        mock_socket.return_value.connect.assert_called_with("/tmp/test.sock")

    @patch('socket.socket')
    def test_send_thought(self, mock_socket):
        bridge = CompositorBridge("/tmp/test.sock")
        bridge.connected = True
        bridge.socket = mock_socket.return_value

        thought = {"type": "gvn", "content": "test"}
        assert bridge.send_thought(thought) == True

        # Verify socket.sendall was called with [length][json][glyph_cmd]
        args, _ = mock_socket.return_value.sendall.call_args
        total_data = args[0]
        length = struct.unpack('>I', total_data[:4])[0]
        assert length == len(total_data) - 4

    @patch('urllib.request.urlopen')
    def test_send_thought_http(self, mock_urlopen):
        """Test HTTP broadcast fallback."""
        bridge = CompositorBridge()

        # Mock successful HTTP response
        mock_response = MagicMock()
        mock_response.status = 200
        mock_response.__enter__ = MagicMock(return_value=None)
        mock_response.__exit__ = MagicMock(return_value=None)
        mock_urlopen.return_value.__enter__.return_value = mock_response

        thought = {"type": "task_start", "task_name": "Test Task"}
        result = bridge.send_thought_http(thought)
        assert result == True

    @patch('urllib.request.urlopen')
    def test_broadcast_thought_fallback(self, mock_urlopen):
        """Test broadcast_thought falls back to HTTP when socket unavailable."""
        bridge = CompositorBridge()
        bridge.connected = False
        bridge.socket = None

        # Mock successful HTTP response
        mock_response = MagicMock()
        mock_response.status = 200
        mock_response.__enter__ = MagicMock(return_value=None)
        mock_response.__exit__ = MagicMock(return_value=None)
        mock_urlopen.return_value.__enter__.return_value = mock_response

        thought = {"type": "gvn", "content": "optimization"}
        result = bridge.broadcast_thought(thought)
        assert result == True

if __name__ == "__main__":
    pytest.main([__file__])
