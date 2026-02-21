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
