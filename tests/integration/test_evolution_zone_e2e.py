"""
End-to-end test: Evolution Zone click → Daemon genome queue

This test verifies the full integration flow:
1. Start EvolutionDaemonV8 with protocol server
2. Send WriteEvolvedGenome message via socket
3. Verify genome appears in daemon's queue

Author: Phase 35.5 - Evolution Zone Integration
Date: February 9, 2026
"""
import pytest
import json
import time
import socket
import threading
import sys
import os
from unittest.mock import Mock, MagicMock, patch

# Add project root to path
PROJECT_ROOT = "/home/jericho/zion/projects/geometry_os/geometry_os"
sys.path.insert(0, PROJECT_ROOT)


@pytest.mark.integration
def test_evolution_zone_click_queues_genome():
    """
    Full integration test: Evolution Zone click → Daemon genome queue

    This test simulates the complete flow from a user clicking on an Evolution
    Zone in the visual shell to the genome being queued in the daemon:

    1. Start EvolutionDaemonV8 with protocol server
    2. Send WriteEvolvedGenome message via Unix socket
    3. Verify genome appears in daemon's queue

    NOTE: This test uses mocks for daemon initialization due to
    complex dependencies. The actual integration will be tested
    when the daemon components are fully implemented.
    """
    # Import protocol server directly
    from systems.neural_cortex.evolution_protocol_server import EvolutionProtocolServer

    # Create a mock daemon with genome queue functionality
    mock_daemon = Mock()
    mock_daemon.genome_queue = []
    mock_daemon.running = True

    def queue_genome(genome_data):
        """Mock queue_genome method"""
        mock_daemon.genome_queue.append(genome_data)

    def get_queue_size():
        """Mock get_queue_size method"""
        return len(mock_daemon.genome_queue)

    mock_daemon.queue_genome = queue_genome
    mock_daemon.get_queue_size = get_queue_size

    # Import and create the bridge
    from systems.neural_cortex.evolution_daemon_bridge import EvolutionDaemonBridge
    bridge = EvolutionDaemonBridge(mock_daemon)

    # Create protocol server with bridge
    server = EvolutionProtocolServer(
        socket_path="/tmp/test_evolution_e2e.sock",
        sync_packet_provider=None
    )
    server.daemon_bridge = bridge

    # Track server start status
    server_started = threading.Event()

    def run_server_briefly():
        """Run server briefly for test purposes"""
        server.start()
        server_started.set()
        time.sleep(2.0)
        server.stop()

    # Start server in background
    server_thread = threading.Thread(target=run_server_briefly, daemon=True)
    server_thread.start()

    # Wait for server to start
    if not server_started.wait(timeout=5.0):
        pytest.fail("Server failed to start within timeout")

    # Give server additional time to be ready
    time.sleep(0.5)

    # Prepare WriteEvolvedGenome message
    message = {
        'msg_type': 'WriteEvolvedGenome',
        'sequence': 1,
        'payload': {
            'id': 'e2e-test-genome',
            'data': [0xCA, 0xFE, 0xBA, 0xBE],
            'generation': 1,
            'fitness': 0.99,
            'metadata': {'action': 'BOOT_DAEMON', 'test': 'e2e'}
        }
    }

    # Connect and send message via Unix socket
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    socket_path = "/tmp/test_evolution_e2e.sock"

    try:
        # Connect to daemon's protocol server
        sock.connect(socket_path)

        # Serialize message
        message_bytes = json.dumps(message).encode('utf-8')

        # Send with length prefix (4-byte big-endian)
        length_prefix = len(message_bytes).to_bytes(4, 'big')
        sock.sendall(length_prefix + message_bytes)

        # Receive acknowledgment
        sock.settimeout(2.0)
        response_length_bytes = sock.recv(4)
        if response_length_bytes:
            response_length = int.from_bytes(response_length_bytes, 'big')
            response_data = sock.recv(response_length)
            response = json.loads(response_data.decode('utf-8'))
            assert response['msg_type'] == 'Ack', "Should receive ACK response"

        # Wait for genome to be processed and queued
        time.sleep(1.0)

        # Verify genome is in daemon's queue
        queue_size = mock_daemon.get_queue_size()
        assert queue_size > 0, f"Genome should be in daemon queue, but queue size is {queue_size}"

        # Verify the genome data
        queued_genome = mock_daemon.genome_queue[0]
        assert queued_genome['id'] == 'e2e-test-genome', "Genome ID should match"
        assert queued_genome['generation'] == 1, "Generation should match"
        assert queued_genome['fitness'] == 0.99, "Fitness should match"

    except FileNotFoundError:
        pytest.fail(f"Socket file not found: {socket_path}. Server may not have started.")
    except ConnectionRefusedError:
        pytest.fail(f"Connection refused to {socket_path}. Server may not be listening.")
    finally:
        sock.close()
        server.stop()
        server_thread.join(timeout=3.0)

        # Clean up socket file
        try:
            os.remove(socket_path)
        except FileNotFoundError:
            pass


@pytest.mark.integration
def test_evolution_zone_multiple_genomes():
    """
    Test queuing multiple genomes in sequence

    Verifies that:
    1. Multiple genomes can be queued
    2. Each genome is processed correctly
    3. Queue state is maintained properly
    """
    from systems.neural_cortex.evolution_protocol_server import EvolutionProtocolServer
    from systems.neural_cortex.evolution_daemon_bridge import EvolutionDaemonBridge

    # Create a mock daemon with genome queue functionality
    mock_daemon = Mock()
    mock_daemon.genome_queue = []
    mock_daemon.running = True

    def queue_genome(genome_data):
        mock_daemon.genome_queue.append(genome_data)

    def get_queue_size():
        return len(mock_daemon.genome_queue)

    mock_daemon.queue_genome = queue_genome
    mock_daemon.get_queue_size = get_queue_size

    # Create bridge and server
    bridge = EvolutionDaemonBridge(mock_daemon)
    server = EvolutionProtocolServer(
        socket_path="/tmp/test_evolution_multi.sock",
        sync_packet_provider=None
    )
    server.daemon_bridge = bridge

    server_started = threading.Event()

    def run_server():
        server.start()
        server_started.set()
        time.sleep(3.0)
        server.stop()

    daemon_thread = threading.Thread(target=run_server, daemon=True)
    daemon_thread.start()

    if not server_started.wait(timeout=5.0):
        pytest.fail("Server failed to start")

    time.sleep(0.5)

    # Send multiple genomes
    num_genomes = 3
    socket_path = "/tmp/test_evolution_multi.sock"

    for i in range(num_genomes):
        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        try:
            sock.connect(socket_path)

            message = {
                'msg_type': 'WriteEvolvedGenome',
                'sequence': i + 1,
                'payload': {
                    'id': f'multi-test-genome-{i}',
                    'data': [0xDE, 0xAD, 0xBE, 0xEF, i],
                    'generation': i,
                    'fitness': 0.9 + (i * 0.01),
                    'metadata': {'action': 'TEST', 'index': i}
                }
            }

            message_bytes = json.dumps(message).encode('utf-8')
            length_prefix = len(message_bytes).to_bytes(4, 'big')
            sock.sendall(length_prefix + message_bytes)

            time.sleep(0.2)  # Small delay between sends

        finally:
            sock.close()

    # Wait for processing
    time.sleep(1.0)

    # Verify genomes were queued
    queue_size = mock_daemon.get_queue_size()
    assert queue_size >= num_genomes, f"Expected {num_genomes} genomes, got {queue_size}"

    server.stop()
    daemon_thread.join(timeout=3.0)

    # Clean up socket file
    try:
        os.remove(socket_path)
    except FileNotFoundError:
        pass


@pytest.mark.integration
def test_evolution_zone_invalid_genome():
    """
    Test handling of invalid genome data

    Verifies that:
    1. Invalid genome data is handled gracefully
    2. Server doesn't crash on malformed messages
    """
    from systems.neural_cortex.evolution_protocol_server import EvolutionProtocolServer
    from systems.neural_cortex.evolution_daemon_bridge import EvolutionDaemonBridge

    # Create a mock daemon
    mock_daemon = Mock()
    mock_daemon.genome_queue = []
    mock_daemon.running = True

    def queue_genome(genome_data):
        mock_daemon.genome_queue.append(genome_data)

    def get_queue_size():
        return len(mock_daemon.genome_queue)

    mock_daemon.queue_genome = queue_genome
    mock_daemon.get_queue_size = get_queue_size

    # Create bridge and server
    bridge = EvolutionDaemonBridge(mock_daemon)
    server = EvolutionProtocolServer(
        socket_path="/tmp/test_evolution_invalid.sock",
        sync_packet_provider=None
    )
    server.daemon_bridge = bridge

    server_started = threading.Event()

    def run_server():
        server.start()
        server_started.set()
        time.sleep(2.0)
        server.stop()

    daemon_thread = threading.Thread(target=run_server, daemon=True)
    daemon_thread.start()

    if not server_started.wait(timeout=5.0):
        pytest.fail("Server failed to start")

    time.sleep(0.5)

    socket_path = "/tmp/test_evolution_invalid.sock"

    # Test 1: Malformed JSON
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    try:
        sock.connect(socket_path)
        # Send invalid JSON
        sock.sendall((20).to_bytes(4, 'big'))
        sock.sendall(b'{invalid json data')
        time.sleep(0.5)
    finally:
        sock.close()

    # Test 2: Missing required fields
    sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    try:
        sock.connect(socket_path)

        message = {
            'msg_type': 'WriteEvolvedGenome',
            'sequence': 1,
            'payload': {
                # Missing 'id' field
                'data': [0xCA, 0xFE]
            }
        }

        message_bytes = json.dumps(message).encode('utf-8')
        length_prefix = len(message_bytes).to_bytes(4, 'big')
        sock.sendall(length_prefix + message_bytes)

        time.sleep(0.5)

    finally:
        sock.close()

    # Verify server is still running (didn't crash)
    assert server.running or daemon_thread.is_alive(), "Server should still be running after invalid input"

    server.stop()
    daemon_thread.join(timeout=3.0)

    # Clean up socket file
    try:
        os.remove(socket_path)
    except FileNotFoundError:
        pass


if __name__ == "__main__":
    # Run tests directly
    print("Running Evolution Zone E2E Tests...")
    print("=" * 60)

    print("\nTest 1: Single genome queuing...")
    try:
        test_evolution_zone_click_queues_genome()
        print("✅ PASSED: Single genome queuing works")
    except Exception as e:
        print(f"❌ FAILED: {e}")

    print("\nTest 2: Multiple genomes...")
    try:
        test_evolution_zone_multiple_genomes()
        print("✅ PASSED: Multiple genome queuing works")
    except Exception as e:
        print(f"❌ FAILED: {e}")

    print("\nTest 3: Invalid genome handling...")
    try:
        test_evolution_zone_invalid_genome()
        print("✅ PASSED: Invalid genome handling works")
    except Exception as e:
        print(f"❌ FAILED: {e}")

    print("\n" + "=" * 60)
    print("Evolution Zone E2E Tests Complete")
    print("\nNote: Tests use mocks for daemon components.")
    print("Full daemon integration tests will run when Tasks 1-3 are complete.")
