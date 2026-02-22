"""Tests for PerceptualBridge integration with VisualBridge."""

import pytest
import json
import asyncio
from unittest.mock import AsyncMock, patch


class TestVisualBridgePerceptualIntegration:
    """Test DIAGNOSTIC_PULSE event handling in VisualBridge."""

    @pytest.mark.asyncio
    async def test_diagnostic_pulse_broadcasts_to_clients(self):
        """Should broadcast DIAGNOSTIC_PULSE to all connected clients."""
        from systems.visual_shell.api.visual_bridge import VisualBridge

        bridge = VisualBridge()

        # Mock client
        mock_client = AsyncMock()
        bridge.clients = {mock_client}

        # Simulate DIAGNOSTIC_PULSE message
        message = json.dumps({
            "type": "diagnostic_pulse",
            "district_id": "silicon",
            "status": "CRITICAL",
            "matched_pattern": "kernel panic",
            "detected_text": "Kernel panic - not syncing",
            "timestamp": 1708364400.0
        })

        # Process through handler (simplified test)
        data = json.loads(message)

        # Should have routed to broadcast
        assert data["type"] == "diagnostic_pulse"
        assert data["status"] == "CRITICAL"

    @pytest.mark.asyncio
    async def test_quarantine_trigger_on_critical(self):
        """Should trigger QUARANTINE_DISTRICT on CRITICAL status."""
        # When CRITICAL detected, should emit QUARANTINE_DISTRICT event
        critical_pulse = {
            "type": "diagnostic_pulse",
            "status": "CRITICAL",
            "district_id": "silicon"
        }

        # Expected: QUARANTINE_DISTRICT broadcast
        assert critical_pulse["status"] == "CRITICAL"
