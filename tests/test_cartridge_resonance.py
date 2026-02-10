"""
Test CARTRIDGE_CREATED resonance emission
"""
import pytest
import json
import time
import os
from unittest.mock import Mock, patch

def test_cartridge_created_emits_resonance():
    """Creating a cartridge should emit CARTRIDGE_CREATED resonance"""
    # Use mocking to avoid full daemon initialization
    from semantic_intent_bus import SemanticIntentBus

    # Create a minimal mock daemon with just the needed components
    mock_daemon = Mock()
    mock_daemon.intent_bus = SemanticIntentBus()

    # Import the method and bind it to our mock
    from evolution_daemon_v8 import EvolutionDaemonV8
    process_method = EvolutionDaemonV8._process_evolved_genome

    # Process a genome with spawn coordinates
    genome = {
        'id': 'test-cartridge-1',
        'data': bytes([0xCA, 0xFE]),
        'generation': 1,
        'fitness': 0.95,
        'metadata': {
            'spawn_x': 100.0,
            'spawn_y': 200.0,
            'cartridge_path': '/tmp/test_cartridge.rts.png'
        }
    }

    # Call the method on our mock daemon
    process_method(mock_daemon, genome)

    # Check shared intent bus for CARTRIDGE_CREATED resonance
    time.sleep(0.1)  # Allow file write

    # Check if file was created
    sib_path = '/tmp/geometry_os_sib.json'
    if not os.path.exists(sib_path):
        # Force save the registry to create the file
        mock_daemon.intent_bus._save_registry()
        time.sleep(0.1)

    if not os.path.exists(sib_path):
        pytest.fail("SIB file was not created - no resonance emitted")

    with open(sib_path, 'r') as f:
        data = json.load(f)

    intents = data.get('registry', {})
    cartridge_intents = [
        v for v in intents.values()
        if v.get('explicit') == 'CARTRIDGE_CREATED'
    ]

    assert len(cartridge_intents) > 0, "Should have CARTRIDGE_CREATED resonance"

    intent = cartridge_intents[0]
    assert intent['implicit']['cartridge_id'] == 'test-cartridge-1'
    assert intent['implicit']['spawn_x'] == 100.0
    assert intent['implicit']['spawn_y'] == 200.0
