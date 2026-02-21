"""
Tests for HealerAgent - V16 Reaction Loop Consumer.
"""

import pytest
import asyncio
import os
import sys

sys.path.insert(0, os.path.join(os.path.dirname(__file__), '../../..'))


class TestHealerAgentInit:
    """Test HealerAgent initialization."""

    def test_healer_agent_imports(self):
        """Test that HealerAgent can be imported."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        assert HealerAgent is not None

    def test_healer_agent_has_ws_url(self):
        """Test that HealerAgent has WebSocket URL configured."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent

        agent = HealerAgent()
        assert hasattr(agent, 'ws_url')
        assert agent.ws_url == "ws://localhost:8768"

    def test_healer_agent_has_reaction_threshold(self):
        """Test that HealerAgent has reaction time threshold."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent

        agent = HealerAgent()
        assert hasattr(agent, 'reaction_threshold')
        assert agent.reaction_threshold <= 1.0  # Must react within 1s


class TestHealerAgentDecisionLogic:
    """Test HealerAgent decision logic for pattern-based actions."""

    def test_warning_status_returns_analyze(self):
        """Test that WARNING status always returns ANALYZE action."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("WARNING", "any_pattern", "any text")
        assert action == HealingAction.ANALYZE

    def test_critical_panic_returns_quarantine(self):
        """Test that CRITICAL + panic pattern returns QUARANTINE."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("CRITICAL", "Kernel panic - not syncing", "")
        assert action == HealingAction.QUARANTINE

    def test_critical_panic_not_syncing_returns_quarantine(self):
        """Test that CRITICAL + 'not syncing' pattern returns QUARANTINE."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("CRITICAL", "not syncing: VFS", "")
        assert action == HealingAction.QUARANTINE

    def test_critical_segfault_returns_analyze(self):
        """Test that CRITICAL + segfault pattern returns ANALYZE."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("CRITICAL", "segfault at 0x0", "")
        assert action == HealingAction.ANALYZE

    def test_critical_segmentation_returns_analyze(self):
        """Test that CRITICAL + segmentation pattern returns ANALYZE."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("CRITICAL", "segmentation fault", "")
        assert action == HealingAction.ANALYZE

    def test_critical_frozen_returns_quarantine_without_auto_reboot(self):
        """Test that CRITICAL + frozen returns QUARANTINE when auto_reboot=False."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent(auto_reboot=False)
        action = agent._decide_action("CRITICAL", "frozen process", "")
        assert action == HealingAction.QUARANTINE

    def test_critical_freeze_text_returns_quarantine_without_auto_reboot(self):
        """Test that CRITICAL + freeze in text returns QUARANTINE when auto_reboot=False."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent(auto_reboot=False)
        action = agent._decide_action("CRITICAL", "", "system freeze detected")
        assert action == HealingAction.QUARANTINE

    def test_critical_frozen_returns_reboot_with_auto_reboot(self):
        """Test that CRITICAL + frozen returns REBOOT when auto_reboot=True."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent(auto_reboot=True)
        action = agent._decide_action("CRITICAL", "frozen process", "")
        assert action == HealingAction.REBOOT

    def test_critical_freeze_text_returns_reboot_with_auto_reboot(self):
        """Test that CRITICAL + freeze in text returns REBOOT when auto_reboot=True."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent(auto_reboot=True)
        action = agent._decide_action("CRITICAL", "", "system freeze detected")
        assert action == HealingAction.REBOOT

    def test_critical_unknown_returns_quarantine(self):
        """Test that CRITICAL + unknown pattern returns QUARANTINE (safe default)."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("CRITICAL", "unknown error", "")
        assert action == HealingAction.QUARANTINE

    def test_critical_empty_pattern_returns_quarantine(self):
        """Test that CRITICAL + empty pattern returns QUARANTINE."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("CRITICAL", "", "")
        assert action == HealingAction.QUARANTINE

    def test_unknown_status_returns_analyze(self):
        """Test that unknown status returns ANALYZE (safe default)."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        action = agent._decide_action("UNKNOWN", "some pattern", "some text")
        assert action == HealingAction.ANALYZE

    def test_pattern_matching_case_insensitive(self):
        """Test that pattern matching is case-insensitive."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent, HealingAction

        agent = HealerAgent()
        # PANIC in uppercase should match
        action = agent._decide_action("CRITICAL", "KERNEL PANIC", "")
        assert action == HealingAction.QUARANTINE

        # SegFault mixed case should match
        action = agent._decide_action("CRITICAL", "SegFault", "")
        assert action == HealingAction.ANALYZE


class TestHealerAgentWebSocket:
    """Test HealerAgent WebSocket methods."""

    @pytest.mark.asyncio
    async def test_start_connects_to_websocket(self):
        """Test that start() connects to WebSocket server."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        from unittest.mock import AsyncMock, patch, MagicMock
        import json

        agent = HealerAgent()

        # Create a mock websocket connection
        mock_ws = AsyncMock()
        mock_ws.send = AsyncMock()
        mock_ws.close = AsyncMock()

        # Set up async iterator for no messages
        async def no_messages():
            return
            yield  # Never executes

        mock_ws.__aiter__ = no_messages

        # Create a mock context manager for websockets.connect
        mock_context = AsyncMock()
        mock_context.__aenter__.return_value = mock_ws
        mock_context.__aexit__.return_value = None

        with patch('systems.visual_shell.swarm.healer_agent.websockets.connect') as mock_websockets_connect:
            mock_websockets_connect.return_value = mock_context

            # Start agent in background and stop it quickly
            task = asyncio.create_task(agent.start())
            await asyncio.sleep(0.1)  # Let it connect
            await agent.stop()
            await asyncio.sleep(0.1)  # Let stop complete

            # Verify connection was attempted
            mock_websockets_connect.assert_called_once_with("ws://localhost:8768")

    @pytest.mark.asyncio
    async def test_start_sends_subscription_message(self):
        """Test that start() sends SUBSCRIBE message for DIAGNOSTIC_PULSE."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        from unittest.mock import AsyncMock, patch
        import json

        agent = HealerAgent()

        # Create a mock websocket connection
        mock_ws = AsyncMock()
        mock_ws.send = AsyncMock()
        mock_ws.close = AsyncMock()

        # Set up async iterator for no messages
        async def no_messages():
            return
            yield

        mock_ws.__aiter__ = no_messages

        # Create a mock context manager for websockets.connect
        mock_context = AsyncMock()
        mock_context.__aenter__.return_value = mock_ws
        mock_context.__aexit__.return_value = None

        with patch('systems.visual_shell.swarm.healer_agent.websockets.connect') as mock_websockets_connect:
            mock_websockets_connect.return_value = mock_context

            # Start agent and let it send subscription
            task = asyncio.create_task(agent.start())
            await asyncio.sleep(0.2)  # Let it connect and send
            await agent.stop()
            await asyncio.sleep(0.1)

            # Verify subscription message was sent
            mock_ws.send.assert_called()
            sent_msg = mock_ws.send.call_args[0][0]
            parsed = json.loads(sent_msg)
            assert parsed["type"] == "SUBSCRIBE"
            assert "DIAGNOSTIC_PULSE" in parsed["events"]

    @pytest.mark.asyncio
    async def test_stop_closes_connection(self):
        """Test that stop() cleanly closes WebSocket connection."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        from unittest.mock import AsyncMock, patch

        agent = HealerAgent()

        # Create a mock websocket connection
        mock_ws = AsyncMock()
        mock_ws.send = AsyncMock()
        mock_ws.close = AsyncMock()

        # Set up async iterator for no messages
        async def no_messages():
            return
            yield

        mock_ws.__aiter__ = no_messages

        # Create a mock context manager for websockets.connect
        mock_context = AsyncMock()
        mock_context.__aenter__.return_value = mock_ws
        mock_context.__aexit__.return_value = None

        with patch('systems.visual_shell.swarm.healer_agent.websockets.connect') as mock_websockets_connect:
            mock_websockets_connect.return_value = mock_context

            # Start agent
            task = asyncio.create_task(agent.start())
            await asyncio.sleep(0.1)

            # Stop agent
            await agent.stop()
            await asyncio.sleep(0.1)

            # Verify running flag is False
            assert agent.is_running is False

    @pytest.mark.asyncio
    async def test_processes_diagnostic_pulse_messages(self):
        """Test that DIAGNOSTIC_PULSE messages are processed correctly."""
        from systems.visual_shell.swarm.healer_agent import HealerAgent
        from unittest.mock import AsyncMock, patch
        import json

        agent = HealerAgent()

        # Create test message
        test_pulse = {
            "type": "DIAGNOSTIC_PULSE",
            "status": "CRITICAL",
            "district_id": "test-district",
            "matched_pattern": "Kernel panic",
            "detected_text": "Kernel panic - not syncing"
        }
        test_message = json.dumps(test_pulse)

        # Create a mock websocket class with __aiter__ method
        class MockWebSocket:
            def __init__(self, messages):
                self.messages = messages
                self.send = AsyncMock()
                self.close = AsyncMock()

            def __aiter__(self):
                return self._message_generator()

            async def _message_generator(self):
                for msg in self.messages:
                    yield msg

        mock_ws = MockWebSocket([test_message])

        # Create a mock context manager for websockets.connect
        mock_context = AsyncMock()
        mock_context.__aenter__.return_value = mock_ws
        mock_context.__aexit__.return_value = None

        with patch('systems.visual_shell.swarm.healer_agent.websockets.connect') as mock_websockets_connect:
            mock_websockets_connect.return_value = mock_context

            # Start agent
            task = asyncio.create_task(agent.start())
            await asyncio.sleep(0.3)  # Let it process the message
            await agent.stop()

            # Verify the pulse was processed (history should have an entry)
            history = agent.history
            assert len(history) >= 1
            assert history[0].action.value == "quarantine"
            assert history[0].district_id == "test-district"

