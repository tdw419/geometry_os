"""Tests for TruthManifoldBridge class."""
import pytest
import json
import tempfile
import os
from pathlib import Path
from unittest.mock import AsyncMock, MagicMock

from systems.visual_shell.api.truth_manifold_bridge import TruthManifoldBridge


class TestTruthManifoldBridge:
    """Tests for TruthManifoldBridge class."""

    @pytest.fixture
    def valid_ctrm_data(self):
        """Sample valid CTRM data."""
        return {
            "ctrm_system_report": {
                "system_metrics": {
                    "cronbach_alpha": 0.0329,
                    "elemental_independence": True,
                    "pearson_r1": 0.0139,
                    "configurational_stability": False
                },
                "mean_scores": {
                    "E1_archaeology": 0.2307,
                    "E2_manuscript": 0.9507,
                    "E3_prophecy": 0.5
                }
            },
            "report_metadata": {
                "total_verses": 2
            },
            "verses": [
                {"reference": "Genesis 1:1", "text": "In the beginning..."},
                {"reference": "Genesis 1:2", "text": "And the earth..."}
            ]
        }

    @pytest.fixture
    def temp_report_file(self, valid_ctrm_data):
        """Create a temporary CTRM report file."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump(valid_ctrm_data, f)
            f.flush()  # Ensure data is written
            temp_path = f.name
        yield temp_path
        os.unlink(temp_path)

    def test_load_report_valid(self, temp_report_file):
        """Test loading a valid CTRM report."""
        bridge = TruthManifoldBridge(report_path=temp_report_file)
        result = bridge.load_report()

        assert "ctrm_system_report" in result
        assert result["ctrm_system_report"]["system_metrics"]["cronbach_alpha"] == 0.0329
        assert len(result["verses"]) == 2

    def test_load_report_missing_file(self):
        """Test handling of missing file - should raise FileNotFoundError."""
        bridge = TruthManifoldBridge(report_path="/nonexistent/path/report.json")

        with pytest.raises(FileNotFoundError):
            bridge.load_report()

    def test_load_report_malformed_json(self):
        """Test handling of malformed JSON - should raise JSONDecodeError."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            f.write("{ invalid json }")
            temp_path = f.name

        try:
            bridge = TruthManifoldBridge(report_path=temp_path)

            with pytest.raises(json.JSONDecodeError):
                bridge.load_report()
        finally:
            os.unlink(temp_path)

    def test_get_broadcast_payload(self, temp_report_file):
        """Test payload structure for WebSocket broadcast."""
        bridge = TruthManifoldBridge(report_path=temp_report_file)
        bridge.load_report()
        payload = bridge.get_broadcast_payload()

        assert "system_metrics" in payload
        assert "mean_scores" in payload
        assert "verse_count" in payload
        assert payload["system_metrics"]["cronbach_alpha"] == 0.0329
        assert payload["mean_scores"]["E1_archaeology"] == 0.2307
        assert payload["verse_count"] == 2

    def test_get_broadcast_payload_auto_load(self, temp_report_file):
        """Test that get_broadcast_payload auto-loads if not loaded."""
        bridge = TruthManifoldBridge(report_path=temp_report_file)

        # Don't call load_report first - get_broadcast_payload should handle it
        payload = bridge.get_broadcast_payload()

        assert "system_metrics" in payload
        assert payload["system_metrics"]["cronbach_alpha"] == 0.0329

    def test_empty_report_uses_defaults(self):
        """Test handling of empty/missing metrics - uses defaults."""
        with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as f:
            json.dump({}, f)
            temp_path = f.name

        try:
            bridge = TruthManifoldBridge(report_path=temp_path)
            bridge.load_report()

            # Should still work with defaults
            payload = bridge.get_broadcast_payload()
            assert "system_metrics" in payload
            assert payload["system_metrics"]["cronbach_alpha"] == 0.0
            assert payload["verse_count"] == 0
        finally:
            os.unlink(temp_path)

    def test_default_report_path(self):
        """Test default path is set correctly."""
        bridge = TruthManifoldBridge()
        # report_path is a Path object
        assert "genesis_pilot_report.json" in str(bridge.report_path)

    def test_is_loaded_property(self, temp_report_file):
        """Test is_loaded property."""
        bridge = TruthManifoldBridge(report_path=temp_report_file)

        assert not bridge.is_loaded
        bridge.load_report()
        assert bridge.is_loaded

    @pytest.mark.asyncio
    async def test_broadcast_update(self, temp_report_file):
        """Test broadcasting update via VisualBridge."""
        bridge = TruthManifoldBridge(report_path=temp_report_file)
        bridge.load_report()

        mock_visual_bridge = MagicMock()
        mock_visual_bridge._broadcast = AsyncMock()

        result = await bridge.broadcast_update(mock_visual_bridge)

        # Verify broadcast was called and returned True
        assert result is True
        mock_visual_bridge._broadcast.assert_called_once()
        call_args = mock_visual_bridge._broadcast.call_args[0][0]
        assert call_args["type"] == "CTRM_TRUTH_UPDATE"
        assert "data" in call_args

    @pytest.mark.asyncio
    async def test_broadcast_update_missing_file_error(self):
        """Test broadcasting error when file missing."""
        bridge = TruthManifoldBridge(report_path="/nonexistent/report.json")

        mock_visual_bridge = MagicMock()
        mock_visual_bridge._broadcast = AsyncMock()

        result = await bridge.broadcast_update(mock_visual_bridge)

        # Should return False and broadcast error
        assert result is False
        mock_visual_bridge._broadcast.assert_called_once()
        call_args = mock_visual_bridge._broadcast.call_args[0][0]
        assert call_args["type"] == "CTRM_TRUTH_UPDATE"
        assert "error" in call_args
        assert call_args["error_code"] == "FILE_NOT_FOUND"
