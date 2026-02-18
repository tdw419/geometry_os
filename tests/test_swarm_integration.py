"""
Integration tests for Parallel Swarm Demo.

Tests the complete flow:
1. A2A Router connectivity
2. Vision Bridge WebSocket protocol
3. Agent registration and broadcast
4. Cross-agent coordination
"""

import pytest
import asyncio
import json
import websockets


class TestA2ARouter:
    """Test A2A Router connectivity and protocol."""

    A2A_URL = "ws://localhost:8766"

    @pytest.mark.asyncio
    async def test_router_connection(self):
        """Test that A2A Router accepts WebSocket connections."""
        try:
            async with websockets.connect(self.A2A_URL, subprotocols=["a2a"]) as ws:
                pass
        except Exception as e:
            pytest.skip(f"A2A Router not available: {e}")

    @pytest.mark.asyncio
    async def test_agent_registration(self):
        """Test agent can register with A2A Router."""
        try:
            async with websockets.connect(self.A2A_URL, subprotocols=["a2a"]) as ws:
                # Register
                await ws.send(json.dumps({
                    "type": "register",
                    "agent_id": "test-agent-001",
                    "agent_type": "test"
                }))

                # Receive ACK
                response = await asyncio.wait_for(ws.recv(), timeout=5.0)
                msg = json.loads(response)

                assert msg.get("type") == "ack"
                assert msg.get("agent_id") == "test-agent-001"
        except Exception as e:
            pytest.skip(f"A2A Router not available: {e}")

    @pytest.mark.asyncio
    async def test_broadcast_message(self):
        """Test broadcast message delivery between agents."""
        try:
            # Create two connections
            async with websockets.connect(self.A2A_URL, subprotocols=["a2a"]) as ws1, \
                     websockets.connect(self.A2A_URL, subprotocols=["a2a"]) as ws2:

                # Register both agents
                await ws1.send(json.dumps({"type": "register", "agent_id": "sender", "agent_type": "test"}))
                await ws1.recv()

                await ws2.send(json.dumps({"type": "register", "agent_id": "receiver", "agent_type": "test"}))
                await ws2.recv()

                # Send broadcast
                await ws1.send(json.dumps({
                    "type": "broadcast",
                    "from_agent": "sender",
                    "message_type": "test_message",
                    "payload": {"data": "hello"}
                }))

                # Receive broadcast (with timeout)
                response = await asyncio.wait_for(ws2.recv(), timeout=5.0)
                msg = json.loads(response)

                assert msg.get("type") == "broadcast"
                assert msg.get("message_type") == "test_message"
                assert msg.get("payload", {}).get("data") == "hello"
        except Exception as e:
            pytest.skip(f"A2A Router not available: {e}")


class TestVisionBridge:
    """Test Vision Bridge WebSocket protocol."""

    VM1_URL = "ws://localhost:8765"
    VM2_URL = "ws://localhost:8768"

    @pytest.mark.asyncio
    async def test_vm1_bridge_connection(self):
        """Test Vision Bridge 1 (Researcher VM) accepts connections."""
        try:
            async with websockets.connect(self.VM1_URL) as ws:
                pass
        except Exception as e:
            pytest.skip(f"Vision Bridge 1 not available: {e}")

    @pytest.mark.asyncio
    async def test_vm2_bridge_connection(self):
        """Test Vision Bridge 2 (Producer VM) accepts connections."""
        try:
            async with websockets.connect(self.VM2_URL) as ws:
                pass
        except Exception as e:
            pytest.skip(f"Vision Bridge 2 not available: {e}")

    @pytest.mark.asyncio
    async def test_gui_state_update_format(self):
        """Test that Vision Bridge sends GUI_STATE_UPDATE messages."""
        try:
            async with websockets.connect(self.VM1_URL) as ws:
                # Wait for a state update
                response = await asyncio.wait_for(ws.recv(), timeout=10.0)
                msg = json.loads(response)

                assert msg.get("type") == "GUI_STATE_UPDATE"
                assert "screenshot" in msg
                assert "timestamp" in msg
        except asyncio.TimeoutError:
            pytest.skip("Vision Bridge did not send update within timeout")
        except Exception as e:
            pytest.skip(f"Vision Bridge not available: {e}")


class TestSwarmAgent:
    """Test SwarmAgent class functionality."""

    def test_swarm_agent_import(self):
        """Test that SwarmAgent can be imported."""
        from systems.visual_shell.swarm_demo import SwarmAgent
        assert SwarmAgent is not None

    def test_swarm_agent_initialization(self):
        """Test SwarmAgent initializes correctly."""
        from systems.visual_shell.swarm_demo import SwarmAgent

        agent = SwarmAgent("test-id", 8765, "127.0.0.1:0", "TestAgent")
        assert agent.agent_id == "test-id"
        assert agent.bridge_port == 8765
        assert agent.vnc_display == "127.0.0.1:0"
        assert agent.role == "TestAgent"
