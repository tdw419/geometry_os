#!/usr/bin/env python3
"""
Test script for Neural Heatmap Python API

This script tests all the main API features to ensure they work correctly.
Run with: python test_api.py
"""

import asyncio
import sys
from pathlib import Path

# Add the python_api directory to the path
sys.path.insert(0, str(Path(__file__).parent))

from neural_heatmap import (
    NeuralHeatmapClient,
    connect,
    FilterConfig,
    VisualizationTheme,
    ExportFormat,
    CorrelationMatrix,
    TemporalPattern,
    Anomaly
)


class TestResult:
    """Simple test result tracker"""
    def __init__(self):
        self.passed = 0
        self.failed = 0
        self.tests = []

    def add_result(self, test_name, passed, error=None):
        self.tests.append((test_name, passed, error))
        if passed:
            self.passed += 1
            print(f"✓ {test_name}")
        else:
            self.failed += 1
            print(f"✗ {test_name}: {error}")

    def print_summary(self):
        total = self.passed + self.failed
        print(f"\n{'='*60}")
        print(f"Test Results: {self.passed}/{total} passed")
        if self.failed > 0:
            print(f"Failed tests:")
            for name, passed, error in self.tests:
                if not passed:
                    print(f"  - {name}: {error}")
        print(f"{'='*60}")
        return self.failed == 0


async def test_imports():
    """Test that all imports work correctly"""
    results = TestResult()

    # Test basic imports
    try:
        from neural_heatmap import NeuralHeatmapClient
        results.add_result("Import NeuralHeatmapClient", True)
    except ImportError as e:
        results.add_result("Import NeuralHeatmapClient", False, e)

    try:
        from neural_heatmap import connect
        results.add_result("Import connect function", True)
    except ImportError as e:
        results.add_result("Import connect function", False, e)

    try:
        from neural_heatmap import VisualizationTheme
        results.add_result("Import VisualizationTheme", True)
    except ImportError as e:
        results.add_result("Import VisualizationTheme", False, e)

    try:
        from neural_heatmap import FilterConfig
        results.add_result("Import FilterConfig", True)
    except ImportError as e:
        results.add_result("Import FilterConfig", False, e)

    try:
        from neural_heatmap.python_websocket_client import (
            NeuralHeatmapWebSocketClient,
            HeatmapUpdate,
            CorrelationUpdate,
            TemporalUpdate,
            AnomalyUpdate
        )
        results.add_result("Import WebSocket classes", True)
    except ImportError as e:
        results.add_result("Import WebSocket classes", False, e)

    return results


async def test_client_creation():
    """Test client creation and initialization"""
    results = TestResult()

    try:
        # Test client creation
        client = NeuralHeatmapClient(url="http://localhost:8080")
        results.add_result("Create NeuralHeatmapClient", True)

        # Test WebSocket client creation
        ws_client = NeuralHeatmapWebSocketClient(url="ws://localhost:8080/ws")
        results.add_result("Create WebSocketClient", True)

        # Test filter config creation
        filter_config = FilterConfig(
            model_ids=["model1", "model2"],
            layer_ids=["layer1"],
            intensity_range=(0.5, 1.0)
        )
        results.add_result("Create FilterConfig", True)

        # Test layout config creation
        from neural_heatmap import LayoutConfig
        layout = LayoutConfig(
            panel_positions={"heatmap": {"x": 0, "y": 0}},
            visibility={"heatmap": True}
        )
        results.add_result("Create LayoutConfig", True)

    except Exception as e:
        results.add_result("Client creation", False, e)

    return results


async def test_data_types():
    """Test data type creation and conversion"""
    results = TestResult()

    try:
        # Test CorrelationMatrix
        matrix = CorrelationMatrix(
            matrix=[[1.0, 0.5], [0.5, 1.0]],
            labels=["layer1", "layer2"],
            timestamp=1234567890.0,
            metadata={"source": "test"}
        )
        results.add_result("Create CorrelationMatrix", True)

        # Test TemporalPattern
        pattern = TemporalPattern(
            pattern_type="periodic",
            frequency=10.0,
            amplitude=0.8,
            phase=0.5,
            confidence=0.95
        )
        results.add_result("Create TemporalPattern", True)

        # Test Anomaly
        anomaly = Anomaly(
            anomaly_type="spike",
            severity="high",
            timestamp=1234567890.0,
            score=0.9,
            description="Test anomaly"
        )
        results.add_result("Create Anomaly", True)

    except Exception as e:
        results.add_result("Data type creation", False, e)

    return results


async def test_websocket_message_types():
    """Test WebSocket message type enum"""
    results = TestResult()

    try:
        from neural_heatmap.python_websocket_client import MessageType

        # Test message type enum values
        assert MessageType.SUBSCRIBE_HEATMAP.value == "subscribe_heatmap"
        assert MessageType.HEATMAP_UPDATE.value == "heatmap_update"
        assert MessageType.GET_CORRELATION_MATRIX.value == "get_correlation_matrix"
        results.add_result("MessageType enum values", True)

    except Exception as e:
        results.add_result("MessageType enum", False, e)

    return results


async def test_enum_values():
    """Test enum values"""
    results = TestResult()

    try:
        # Test ExportFormat
        assert ExportFormat.CSV.value == "csv"
        assert ExportFormat.JSON.value == "json"
        results.add_result("ExportFormat enum", True)

        # Test VisualizationTheme
        assert VisualizationTheme.THERMAL.value == "thermal"
        assert VisualizationTheme.PLASMA.value == "plasma"
        results.add_result("VisualizationTheme enum", True)

    except Exception as e:
        results.add_result("Enum values", False, e)

    return results


async def main():
    """Run all tests"""
    print(f"{'='*60}")
    print("Neural Heatmap Python API Test Suite")
    print(f"{'='*60}\n")

    all_results = []

    # Test imports
    print("Testing imports...")
    results = await test_imports()
    all_results.append(results)
    print()

    # Test client creation
    print("Testing client creation...")
    results = await test_client_creation()
    all_results.append(results)
    print()

    # Test data types
    print("Testing data types...")
    results = await test_data_types()
    all_results.append(results)
    print()

    # Test WebSocket message types
    print("Testing WebSocket message types...")
    results = await test_websocket_message_types()
    all_results.append(results)
    print()

    # Test enum values
    print("Testing enum values...")
    results = await test_enum_values()
    all_results.append(results)
    print()

    # Print overall summary
    total_passed = sum(r.passed for r in all_results)
    total_failed = sum(r.failed for r in all_results)
    total_tests = total_passed + total_failed

    print(f"\n{'='*60}")
    print(f"OVERALL RESULTS: {total_passed}/{total_tests} tests passed")
    print(f"{'='*60}")

    if total_failed == 0:
        print("\n✓ All tests passed!")
        return 0
    else:
        print(f"\n✗ {total_failed} test(s) failed")
        return 1


if __name__ == "__main__":
    exit_code = asyncio.run(main())
    sys.exit(exit_code)
