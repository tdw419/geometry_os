"""
Test genome queue functionality for EvolutionDaemonV8
"""
import pytest
import time
import threading

def test_genome_queue_exists():
    """EvolutionDaemonV8 should have a genome queue"""
    from evolution_daemon_v8 import EvolutionDaemonV8
    daemon = EvolutionDaemonV8()
    assert hasattr(daemon, 'genome_queue'), "Daemon should have genome_queue attribute"

def test_genome_can_be_queued():
    """Genomes should be queuable from external sources"""
    from evolution_daemon_v8 import EvolutionDaemonV8
    daemon = EvolutionDaemonV8()

    test_genome = {
        'id': 'test-genome-1',
        'data': bytes([0xCA, 0xFE, 0xBA, 0xBE]),
        'generation': 1,
        'fitness': 0.95,
        'metadata': {'action': 'BOOT_DAEMON'}
    }

    daemon.queue_genome(test_genome)
    assert daemon.get_queue_size() > 0, "Queue should have items after enqueue"

def test_daemon_has_protocol_server_with_bridge():
    """EvolutionDaemonV8 should initialize protocol server with bridge"""
    from evolution_daemon_v8 import EvolutionDaemonV8
    daemon = EvolutionDaemonV8()

    assert hasattr(daemon, 'protocol_server'), "Should have protocol_server"
    assert hasattr(daemon.protocol_server, 'daemon_bridge'), "Protocol server should have bridge"
    assert daemon.protocol_server.daemon_bridge.daemon is daemon, "Bridge should reference daemon"
