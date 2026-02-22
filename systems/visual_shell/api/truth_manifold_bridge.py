#!/usr/bin/env python3
"""
Truth Manifold Bridge - Geometry OS
===================================

Bridges CTRM (Comparative Truth Reliability Metrics) data from the
Genesis Pilot Report to the Visual Shell HUD via WebSocket broadcast.

The Truth Manifold represents the spatial projection of truth scores
across the Infinite Map, with HUD visualization of:
- Cronbach's alpha (elemental independence)
- Mean scores for E1/E2/E3 elements
- Verse count and system metrics

Port: Uses VisualBridge WebSocket (8768)
"""

import json
import os
import time
from pathlib import Path
from typing import Dict, Any, Optional


class TruthManifoldBridge:
    """
    Bridge for loading and broadcasting CTRM truth manifold data.

    Loads the Genesis Pilot Report JSON and extracts system metrics
    for HUD visualization via the Visual Bridge WebSocket.

    Usage:
        bridge = TruthManifoldBridge()
        data = bridge.load_report()
        payload = bridge.get_broadcast_payload()
        await bridge.broadcast_update(visual_bridge)
    """

    # Default path to Genesis Pilot Report
    DEFAULT_REPORT_PATH = "systems/intelligence/data/genesis_pilot_report.json"

    def __init__(self, report_path: Optional[str] = None):
        """
        Initialize the Truth Manifold Bridge.

        Args:
            report_path: Path to CTRM JSON report (defaults to genesis_pilot_report.json)
        """
        # Resolve report path relative to project root
        if report_path is None:
            report_path = self.DEFAULT_REPORT_PATH

        self.report_path = Path(report_path)

        # If relative path, resolve from project root
        if not self.report_path.is_absolute():
            project_root = Path(__file__).parent.parent.parent.parent
            self.report_path = project_root / self.report_path

        # Cached report data
        self._report_data: Optional[Dict[str, Any]] = None
        self._last_load_time: float = 0

    def load_report(self) -> Dict[str, Any]:
        """
        Load and parse the CTRM JSON report.

        Returns:
            Dict containing the full CTRM report data with:
            - report_metadata: System info, version, total verses
            - ctrm_system_report: system_metrics, mean_scores
            - verses: Array of verse analysis data

        Raises:
            FileNotFoundError: If report file does not exist
            json.JSONDecodeError: If JSON is malformed
        """
        if not self.report_path.exists():
            raise FileNotFoundError(f"CTRM report not found: {self.report_path}")

        with open(self.report_path, 'r', encoding='utf-8') as f:
            self._report_data = json.load(f)

        self._last_load_time = time.time()
        return self._report_data

    def get_broadcast_payload(self) -> Dict[str, Any]:
        """
        Extract HUD-ready payload from CTRM report.

        Returns:
            Dict with:
            - system_metrics: cronbach_alpha, elemental_independence, etc.
            - mean_scores: E1_archaeology, E2_manuscript, E3_prophecy
            - verse_count: Total verses analyzed
            - timestamp: Report load time

        Raises:
            RuntimeError: If report not loaded (call load_report() first)
        """
        if self._report_data is None:
            self.load_report()

        ctrm_report = self._report_data.get('ctrm_system_report', {})
        system_metrics = ctrm_report.get('system_metrics', {})
        mean_scores = ctrm_report.get('mean_scores', {})

        # Extract verse count from either ctrm_system_report or report_metadata
        verse_count = ctrm_report.get('total_verses_analyzed', 0)
        if verse_count == 0:
            metadata = self._report_data.get('report_metadata', {})
            verse_count = metadata.get('total_verses', 0)

        return {
            'system_metrics': {
                'cronbach_alpha': system_metrics.get('cronbach_alpha', 0.0),
                'elemental_independence': system_metrics.get('elemental_independence', False),
                'pearson_r1': system_metrics.get('pearson_r1', 0.0),
                'configurational_stability': system_metrics.get('configurational_stability', False),
                'pairwise_correlations': system_metrics.get('pairwise_correlations', {}),
            },
            'mean_scores': {
                'E1_archaeology': mean_scores.get('E1_archaeology', 0.0),
                'E2_manuscript': mean_scores.get('E2_manuscript', 0.0),
                'E3_prophecy': mean_scores.get('E3_prophecy', 0.0),
            },
            'verse_count': verse_count,
            'timestamp': self._last_load_time,
        }

    async def broadcast_update(self, visual_bridge) -> bool:
        """
        Broadcast CTRM_TRUTH_UPDATE to all connected clients.

        Args:
            visual_bridge: VisualBridge instance with _broadcast() method

        Returns:
            True if broadcast successful, False on error
        """
        try:
            payload = self.get_broadcast_payload()

            # Build CTRM_TRUTH_UPDATE message
            message = {
                'type': 'CTRM_TRUTH_UPDATE',
                'data': payload,
                'timestamp': time.time(),
            }

            # Broadcast via VisualBridge
            await visual_bridge._broadcast(message)
            return True

        except FileNotFoundError as e:
            # Broadcast error payload for graceful HUD degradation
            await visual_bridge._broadcast({
                'type': 'CTRM_TRUTH_UPDATE',
                'error': f'CTRM report not found: {self.report_path}',
                'error_code': 'FILE_NOT_FOUND',
                'timestamp': time.time(),
            })
            return False

        except json.JSONDecodeError as e:
            # Broadcast error for malformed JSON
            await visual_bridge._broadcast({
                'type': 'CTRM_TRUTH_UPDATE',
                'error': f'Invalid CTRM JSON: {str(e)}',
                'error_code': 'JSON_DECODE_ERROR',
                'timestamp': time.time(),
            })
            return False

        except Exception as e:
            # Generic error handling
            await visual_bridge._broadcast({
                'type': 'CTRM_TRUTH_UPDATE',
                'error': f'CTRM load error: {str(e)}',
                'error_code': 'UNKNOWN_ERROR',
                'timestamp': time.time(),
            })
            return False

    def get_report_path(self) -> Path:
        """Return the resolved report path."""
        return self.report_path

    @property
    def is_loaded(self) -> bool:
        """Check if report data is cached."""
        return self._report_data is not None


# Standalone utility functions

def load_ctrm_report(report_path: Optional[str] = None) -> Dict[str, Any]:
    """
    Convenience function to load CTRM report.

    Args:
        report_path: Optional path to report (uses default if None)

    Returns:
        Full CTRM report dict
    """
    bridge = TruthManifoldBridge(report_path)
    return bridge.load_report()


def get_ctrm_metrics(report_path: Optional[str] = None) -> Dict[str, Any]:
    """
    Convenience function to get CTRM metrics for HUD.

    Args:
        report_path: Optional path to report (uses default if None)

    Returns:
        Broadcast payload dict with system_metrics and mean_scores
    """
    bridge = TruthManifoldBridge(report_path)
    return bridge.get_broadcast_payload()


if __name__ == "__main__":
    # Test the bridge
    print("Testing TruthManifoldBridge...")

    bridge = TruthManifoldBridge()
    print(f"Report path: {bridge.get_report_path()}")

    try:
        data = bridge.load_report()
        print(f"Loaded report with {len(data.get('verses', []))} verses")

        payload = bridge.get_broadcast_payload()
        print(f"Cronbach's alpha: {payload['system_metrics']['cronbach_alpha']}")
        print(f"Elemental independence: {payload['system_metrics']['elemental_independence']}")
        print(f"Mean scores: {payload['mean_scores']}")
        print(f"Verse count: {payload['verse_count']}")

        print("\nOK - TruthManifoldBridge working correctly")
    except Exception as e:
        print(f"ERROR: {e}")
