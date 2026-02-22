#!/usr/bin/env python3
"""
Performance Benchmark Tests for DirectiveAgent.

Measures:
- Poll latency: Time to poll WordPress
- Processing time: Time from directive to response
- Heartbeat overhead: Time to write heartbeat file
- Memory efficiency: Agent memory footprint

Run: pytest tests/test_directive_performance.py -v --benchmark-only
"""

import pytest
import time
import json
import tempfile
from pathlib import Path
from unittest.mock import patch, MagicMock

from systems.intelligence.directive_agent import (
    DirectiveAgent,
    Directive,
    DirectiveScope,
    DirectiveStatus,
)


class TestPollingPerformance:
    """Performance tests for directive polling."""

    @pytest.fixture
    def agent(self, tmp_path):
        """Create agent with mocked WordPress."""
        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test", "description": "Test"}}, f)

        return DirectiveAgent(substrate_map_path=str(substrate_file))

    def test_single_poll_latency_under_100ms(self, agent):
        """Single poll should complete in under 100ms."""
        with patch.object(agent, '_api_call') as mock_api:
            mock_api.return_value = {"success": True, "directives": []}

            start = time.perf_counter()
            agent.poll_directives()
            elapsed = time.perf_counter() - start

            assert elapsed < 0.1, f"Poll took {elapsed:.3f}s, expected < 0.1s"

    def test_process_directive_latency_under_50ms(self, agent):
        """Processing a single directive should be under 50ms."""
        directive = Directive(
            id=1,
            title="Explain the test component",
            content="What is test?",
            date="2026-01-01",
            author="user"
        )

        start = time.perf_counter()
        status, response = agent.execute_directive(directive)
        elapsed = time.perf_counter() - start

        assert elapsed < 0.05, f"Execution took {elapsed:.3f}s, expected < 0.05s"

    def test_heartbeat_write_latency_under_10ms(self, agent, tmp_path):
        """Heartbeat write should be under 10ms."""
        heartbeat_file = tmp_path / "heartbeat.json"
        agent.heartbeat_path = str(heartbeat_file)

        start = time.perf_counter()
        agent.write_heartbeat()
        elapsed = time.perf_counter() - start

        assert elapsed < 0.01, f"Heartbeat took {elapsed:.3f}s, expected < 0.01s"

    def test_process_100_directives_under_5_seconds(self, agent):
        """Processing 100 directives should be under 5 seconds."""
        directives = [
            Directive(
                id=i,
                title=f"Explain component {i}",
                content="What is test?",
                date="2026-01-01",
                author="user"
            )
            for i in range(100)
        ]

        start = time.perf_counter()
        for directive in directives:
            agent.execute_directive(directive)
        elapsed = time.perf_counter() - start

        assert elapsed < 5.0, f"100 directives took {elapsed:.1f}s, expected < 5s"


class TestHeartbeatPerformance:
    """Performance tests for heartbeat mechanism."""

    def test_heartbeat_file_size_under_1kb(self, tmp_path):
        """Heartbeat file should be under 1KB."""
        from systems.intelligence.directive_agent import DirectiveAgent

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({}, f)

        heartbeat_file = tmp_path / "heartbeat.json"
        agent = DirectiveAgent(
            substrate_map_path=str(substrate_file),
            heartbeat_path=str(heartbeat_file)
        )

        agent.write_heartbeat()

        size = heartbeat_file.stat().st_size
        assert size < 1024, f"Heartbeat file is {size} bytes, expected < 1024"

    def test_heartbeat_overhead_is_negligible(self, tmp_path):
        """Heartbeat should add minimal overhead to processing."""
        from systems.intelligence.directive_agent import DirectiveAgent

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump({"test": {"name": "Test"}}, f)

        heartbeat_file = tmp_path / "heartbeat.json"

        # Measure just heartbeat writes (isolated from directive processing)
        agent = DirectiveAgent(
            substrate_map_path=str(substrate_file),
            heartbeat_path=str(heartbeat_file)
        )

        # Baseline: just the loop overhead
        start = time.perf_counter()
        for _ in range(100):
            pass
        loop_time = time.perf_counter() - start

        # With heartbeat
        start = time.perf_counter()
        for _ in range(100):
            agent.write_heartbeat()
        heartbeat_time = time.perf_counter() - start

        # Each heartbeat should be under 1ms on average
        avg_heartbeat_time = (heartbeat_time - loop_time) / 100
        assert avg_heartbeat_time < 0.001, f"Heartbeat avg time is {avg_heartbeat_time*1000:.2f}ms, expected < 1ms"


class TestMemoryEfficiency:
    """Memory efficiency tests."""

    def test_substrate_cache_size_reasonable(self, tmp_path):
        """Substrate cache with 1000 components should be under 10MB."""
        import sys

        # Create large substrate map
        substrate = {}
        for i in range(1000):
            substrate[f"component_{i}"] = {
                "name": f"Component {i}",
                "path": f"systems/component_{i}",
                "description": f"Description for component {i}" * 10,
                "metadata": {
                    "language": "Python",
                    "files": i % 100,
                    "entry_points": ["main.py"]
                }
            }

        substrate_file = tmp_path / "substrate.json"
        with open(substrate_file, 'w') as f:
            json.dump(substrate, f)

        agent = DirectiveAgent(substrate_map_path=str(substrate_file))

        # Rough memory estimate
        cache_size = sys.getsizeof(agent._substrate_cache)
        for value in agent._substrate_cache.values():
            cache_size += sys.getsizeof(value)

        # Should be under 10MB for 1000 components
        assert cache_size < 10 * 1024 * 1024, f"Cache is {cache_size / 1024 / 1024:.1f}MB"
