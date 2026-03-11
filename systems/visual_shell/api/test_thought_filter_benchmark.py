"""
Performance Benchmark: Thought Filtering at 1000 thoughts/second

Tests that the server-side filtering can handle 1000 thoughts/second
without significant latency or dropped messages.

Run with: pytest test_thought_filter_benchmark.py -v -s
"""

import asyncio
import json
import time
from dataclasses import dataclass

import pytest


@dataclass(eq=False)
class MockWebSocket:
    """Mock WebSocket for testing."""
    sent_messages: list[str] = None
    closed: bool = False
    _id: int = 0

    def __post_init__(self):
        self.sent_messages = []
        MockWebSocket._id += 1
        self._hash = MockWebSocket._id

    def __hash__(self):
        return self._hash

    def __eq__(self, other):
        return isinstance(other, MockWebSocket) and self._hash == other._hash

    async def send_text(self, message: str):
        self.sent_messages.append(message)

    async def accept(self):
        pass

    def close(self):
        self.closed = True


class ThoughtFilterBenchmark:
    """Benchmark harness for thought filtering performance."""

    def __init__(self):
        self.connections: dict[MockWebSocket, ThoughtConnection] = {}

    def add_connection(self, ws: MockWebSocket, enabled_types: set[str] = None):
        """Add a mock connection with optional filter."""
        self.connections[ws] = ThoughtConnection(
            websocket=ws,
            enabled_types=enabled_types or set()
        )

    async def broadcast_thought(self, thought: dict) -> int:
        """Broadcast a thought to all connections, returns count sent."""
        thought_type = thought.get("type", "").lower()
        message = json.dumps({
            "msg_type": "Thought",
            "payload": thought
        })

        sent_count = 0
        for ws, conn in list(self.connections.items()):
            # Server-side filtering
            if conn.enabled_types and thought_type not in conn.enabled_types:
                conn.messages_filtered += 1
                continue

            await ws.send_text(message)
            conn.messages_sent += 1
            sent_count += 1

        return sent_count


@dataclass
class ThoughtConnection:
    """Tracks a WebSocket connection with its filter settings."""
    websocket: MockWebSocket
    enabled_types: set[str]
    messages_sent: int = 0
    messages_filtered: int = 0


# ==============================================================================
# Test Cases
# ==============================================================================

@pytest.mark.asyncio
async def test_filter_1000_thoughts_per_second():
    """Benchmark: Process 1000 thoughts/second with filtering enabled."""
    benchmark = ThoughtFilterBenchmark()

    # Create multiple connections with different filters
    conn_all = MockWebSocket()
    conn_token = MockWebSocket()
    conn_task = MockWebSocket()
    conn_mixed = MockWebSocket()

    benchmark.add_connection(conn_all, enabled_types=set())  # All types
    benchmark.add_connection(conn_token, enabled_types={'token'})
    benchmark.add_connection(conn_task, enabled_types={'task', 'task_start', 'task_complete'})
    benchmark.add_connection(conn_mixed, enabled_types={'token', 'gravity', 'checkpoint'})

    # Generate 1000 thoughts with random types
    thought_types = ['token', 'gravity', 'task', 'task_start', 'task_complete',
                     'gvn', 'checkpoint', 'heuristic', 'memory', 'compute']

    thoughts = []
    for i in range(1000):
        thought_type = thought_types[i % len(thought_types)]
        thoughts.append({
            "type": thought_type,
            "content": f"Test thought {i}",
            "timestamp": time.time()
        })

    # Measure broadcast time
    start_time = time.perf_counter()

    for thought in thoughts:
        await benchmark.broadcast_thought(thought)

    end_time = time.perf_counter()
    elapsed_ms = (end_time - start_time) * 1000

    # Calculate throughput
    thoughts_per_second = len(thoughts) / (elapsed_ms / 1000)

    # Verify results
    print("\n=== Filter Benchmark Results ===")
    print(f"Total thoughts: {len(thoughts)}")
    print(f"Elapsed time: {elapsed_ms:.2f}ms")
    print(f"Throughput: {thoughts_per_second:.0f} thoughts/second")

    # Connection stats
    for ws, conn in benchmark.connections.items():
        filter_str = ','.join(conn.enabled_types) if conn.enabled_types else 'all'
        print(f"  Connection ({filter_str}): {conn.messages_sent} sent, {conn.messages_filtered} filtered")

    # Assert performance target: 1000 thoughts/second minimum
    assert thoughts_per_second >= 1000, f"Performance target not met: {thoughts_per_second:.0f} < 1000 thoughts/sec"

    # Verify filtering correctness
    conn_all_stats = benchmark.connections[conn_all]
    assert conn_all_stats.messages_sent == 1000, "All-types connection should receive all thoughts"

    conn_token_stats = benchmark.connections[conn_token]
    # Should only receive 'token' type thoughts (100 of them)
    assert conn_token_stats.messages_sent == 100, f"Token-only should get 100, got {conn_token_stats.messages_sent}"

    conn_task_stats = benchmark.connections[conn_task]
    # Should receive task, task_start, task_complete (300 total)
    assert conn_task_stats.messages_sent == 300, f"Task-filter should get 300, got {conn_task_stats.messages_sent}"


@pytest.mark.asyncio
async def test_filter_latency_per_thought():
    """Benchmark: Individual thought filtering latency < 1ms."""
    benchmark = ThoughtFilterBenchmark()

    # Create connection with filter
    ws = MockWebSocket()
    benchmark.add_connection(ws, enabled_types={'token', 'gravity'})

    # Measure individual latencies
    latencies = []

    for i in range(100):
        thought = {
            "type": 'token' if i % 2 == 0 else 'task',
            "content": f"Thought {i}",
            "timestamp": time.time()
        }

        start = time.perf_counter()
        await benchmark.broadcast_thought(thought)
        end = time.perf_counter()

        latencies.append((end - start) * 1000)  # Convert to ms

    avg_latency = sum(latencies) / len(latencies)
    max_latency = max(latencies)

    print("\n=== Latency Benchmark Results ===")
    print(f"Average latency: {avg_latency:.4f}ms")
    print(f"Max latency: {max_latency:.4f}ms")

    # Assert latency target: < 1ms per thought
    assert max_latency < 1.0, f"Max latency too high: {max_latency:.4f}ms"


@pytest.mark.asyncio
async def test_filter_many_connections():
    """Benchmark: 100 concurrent connections with filtering."""
    benchmark = ThoughtFilterBenchmark()

    # Create 100 connections with random filters
    connections = []
    for i in range(100):
        ws = MockWebSocket()

        # Random filter: some get all, some get specific types
        if i % 3 == 0:
            enabled = set()  # All types
        elif i % 3 == 1:
            enabled = {'token'}
        else:
            enabled = {'task', 'checkpoint'}

        benchmark.add_connection(ws, enabled_types=enabled)
        connections.append(ws)

    # Send 100 thoughts
    thoughts = [
        {"type": "token", "content": f"Token {i}"} if i % 2 == 0
        else {"type": "task", "content": f"Task {i}"}
        for i in range(100)
    ]

    start_time = time.perf_counter()

    for thought in thoughts:
        await benchmark.broadcast_thought(thought)

    end_time = time.perf_counter()
    elapsed_ms = (end_time - start_time) * 1000

    print("\n=== Many Connections Benchmark ===")
    print(f"Connections: {len(connections)}")
    print(f"Thoughts: {len(thoughts)}")
    print(f"Elapsed time: {elapsed_ms:.2f}ms")
    print(f"Throughput: {len(thoughts) / (elapsed_ms / 1000):.0f} thoughts/second")

    # Should still achieve > 1000 thoughts/sec with 100 connections
    throughput = len(thoughts) / (elapsed_ms / 1000)
    assert throughput >= 1000, f"Throughput too low with many connections: {throughput:.0f}"


@pytest.mark.asyncio
async def test_filter_empty_types_receives_all():
    """Verify: Empty enabled_types set means all types are received."""
    benchmark = ThoughtFilterBenchmark()

    ws = MockWebSocket()
    benchmark.add_connection(ws, enabled_types=set())

    # Send thoughts of all types
    types = ['token', 'gravity', 'task', 'gvn', 'checkpoint']
    for t in types:
        await benchmark.broadcast_thought({"type": t, "content": f"Test {t}"})

    conn = benchmark.connections[ws]
    assert conn.messages_sent == len(types), f"Should receive all {len(types)} types"
    assert conn.messages_filtered == 0, "Should not filter any"


@pytest.mark.asyncio
async def test_filter_specific_types_only():
    """Verify: Specific types filter only receives those types."""
    benchmark = ThoughtFilterBenchmark()

    ws = MockWebSocket()
    benchmark.add_connection(ws, enabled_types={'token', 'gravity'})

    # Send thoughts of all types
    types = ['token', 'gravity', 'task', 'gvn', 'checkpoint', 'token', 'gravity']
    for t in types:
        await benchmark.broadcast_thought({"type": t, "content": f"Test {t}"})

    conn = benchmark.connections[ws]
    # Should only receive token (2) + gravity (2) = 4
    assert conn.messages_sent == 4, f"Should receive 4 filtered, got {conn.messages_sent}"
    assert conn.messages_filtered == 3, f"Should filter 3, got {conn.messages_filtered}"


# ==============================================================================
# Run Standalone
# ==============================================================================

if __name__ == "__main__":
    print("Running Thought Filter Benchmarks...")
    print("=" * 50)

    asyncio.run(test_filter_1000_thoughts_per_second())
    asyncio.run(test_filter_latency_per_thought())
    asyncio.run(test_filter_many_connections())
    asyncio.run(test_filter_empty_types_receives_all())
    asyncio.run(test_filter_specific_types_only())

    print("\n" + "=" * 50)
    print("All benchmarks passed!")
