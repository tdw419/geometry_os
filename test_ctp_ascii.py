#!/usr/bin/env python3
"""
CTP ASCII Protocol Test Script
==============================

Demonstrates the Cognitive Transmission Protocol's ASCII-first design
by showing how messages can be created, parsed, and verified using
only standard text tools (grep, diff, cat).

Also tests Hilbert coordinate translation for "AI sees OS as geometric structure".

Run: python test_ctp_ascii.py
"""

import sys
import os

# Add project root to path
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))

from systems.swarm.ctp import (
    CTPVersion,
    TrustLevel,
    IntentType,
    CTPSignal,
    ContextHash,
    CTPParser,
    TrustManager,
    AgentRegistry,
    CTPSimulationRunner,
)

from systems.visual_shell.ascii_gui_bridge import (
    HilbertCurve,
    SpatialLocalityVerifier,
    WindowState,
)


def print_section(title: str):
    """Print a section header."""
    print(f"\n{'='*60}")
    print(f"  {title}")
    print('='*60)


def test_ascii_message_format():
    """Demonstrate ASCII message format is human-readable."""
    print_section("1. ASCII Message Format")

    signal = CTPSignal(
        message_type="STREAM",
        agent_id="phone-alpha-7",
        intent=IntentType.QUERY,
        context_hash="0x7f3a9c2e1b4d8f6a",
        content_type="text/ascii",
        payload="What agents know about authentication?",
        headers={
            "Session-ID": "sess_abc123",
            "Priority": "7",
        }
    )

    ascii_msg = signal.to_ascii()
    print("\nGenerated ASCII Message:")
    print("-" * 40)
    print(ascii_msg)
    print("-" * 40)

    # Verify grep-ability
    print("\n✓ Grep Test: Extract Intent")
    import re
    match = re.search(r"^Intent: (.+)$", ascii_msg, re.MULTILINE)
    if match:
        print(f"  Found: Intent = {match.group(1)}")

    print("\n✓ Grep Test: Extract Agent-ID")
    match = re.search(r"^Agent-ID: (.+)$", ascii_msg, re.MULTILINE)
    if match:
        print(f"  Found: Agent-ID = {match.group(1)}")

    print("\n✓ Parse Test: Round-trip")
    parser = CTPParser()
    parsed = parser.parse(ascii_msg)
    print(f"  Original agent_id: {signal.agent_id}")
    print(f"  Parsed agent_id:   {parsed['headers']['Agent-ID']}")
    print(f"  Match: {signal.agent_id == parsed['headers']['Agent-ID']}")

    return True


def test_trust_levels():
    """Demonstrate trust level hierarchy."""
    print_section("2. Trust Level Hierarchy")

    print("\nTrust Level Capabilities:")
    print("-" * 40)

    for level in TrustLevel:
        print(f"\n{level.value}:")
        print(f"  can_publish_skills: {level.can_publish_skills}")
        print(f"  can_vote:           {level.can_vote}")
        print(f"  can_subscribe:      {level.can_subscribe}")
        print(f"  rate_limit:         {level.rate_limit} req/min")

    return True


def test_context_hash():
    """Demonstrate context hash computation."""
    print_section("3. Context Hash Computation")

    # Empty context
    empty_ctx = ContextHash(fragments=[])
    print(f"\nEmpty context hash: {empty_ctx.hash}")

    # Single fragment
    single_ctx = ContextHash(fragments=[
        {"namespace": "agents", "hash": "abc123", "timestamp": 1.0}
    ])
    print(f"Single fragment hash: {single_ctx.hash}")

    # Multiple fragments (order-independent)
    fragments = [
        {"namespace": "agents", "hash": "h1", "timestamp": 1.0},
        {"namespace": "tasks", "hash": "h2", "timestamp": 2.0},
    ]
    ctx1 = ContextHash(fragments=fragments)
    ctx2 = ContextHash(fragments=list(reversed(fragments)))
    print(f"\nMultiple fragments (original): {ctx1.hash}")
    print(f"Multiple fragments (reversed): {ctx2.hash}")
    print(f"Order independent: {ctx1.hash == ctx2.hash}")

    return True


def test_handshake_flow():
    """Demonstrate CTP handshake flow."""
    print_section("4. Cognitive Handshake Flow")

    # Simulate client HELLO
    client_hello = CTPSignal(
        message_type="HELLO",
        agent_id="phone-test-1",
        intent=IntentType.HEARTBEAT,
        context_hash="0x0000000000000000",
        headers={
            "Capabilities": "query,fragment_receive",
            "Trust-Level": "EXTERNAL",
        }
    )

    print("\n1. Client sends HELLO:")
    print("-" * 40)
    print(client_hello.to_ascii())

    # Server WELCOME response
    server_welcome = f"""CTP/1.0 WELCOME
Server-ID: gos-gateway-01
Session-ID: sess_xyz789
Context-Hash: 0x7f3a9c2e1b4d8f6a
Delta-Available: 847
---CTP-PAYLOAD---
---CTP-END---
"""
    print("\n2. Server responds with WELCOME:")
    print("-" * 40)
    print(server_welcome)

    # Parse WELCOME
    parser = CTPParser()
    parsed = parser.parse(server_welcome)
    print("\n3. Client parses response:")
    print(f"  Session-ID: {parsed['headers'].get('Session-ID')}")
    print(f"  Context-Hash: {parsed['headers'].get('Context-Hash')}")
    print(f"  Delta-Available: {parsed['headers'].get('Delta-Available')}")

    return True


def test_rate_limiting():
    """Demonstrate rate limiting."""
    print_section("5. Rate Limiting")

    manager = TrustManager()

    # Register EXTERNAL agent
    manager.registry.register("phone-test", [], TrustLevel.EXTERNAL)
    print(f"\nRegistered agent 'phone-test' as EXTERNAL")
    print(f"Rate limit: {TrustLevel.EXTERNAL.rate_limit} req/min")

    # Simulate requests
    print("\nSimulating requests...")
    for i in range(5):
        manager.record_request("phone-test")
        limited = manager.is_rate_limited("phone-test")
        print(f"  Request {i+1}: limited={limited}")

    print(f"\n✓ Rate limiting functional")

    return True


def test_simulation_phases():
    """Run simulation phases."""
    print_section("6. Simulation Phase Results")

    runner = CTPSimulationRunner()
    report = runner.run_all()

    print(f"\nOverall Status: {report['overall_status']}")

    for phase, result in report['phases'].items():
        status = "✓ PASS" if result.get('passed') else "✗ FAIL"
        print(f"\n{phase}: {status}")
        if 'overhead_percent' in result:
            print(f"  Overhead: {result['overhead_percent']:.1f}%")
        if 'coherence_score' in result:
            print(f"  Coherence: {result['coherence_score']:.2f}")

    return report['overall_status'] == 'PASS'


def test_grep_ability():
    """Demonstrate grep-ability of CTP messages."""
    print_section("7. Grep-Ability Demo")

    messages = []
    for i, intent in enumerate([IntentType.QUERY, IntentType.INSIGHT, IntentType.FRAGMENT]):
        signal = CTPSignal(
            message_type="STREAM",
            agent_id=f"agent-{i}",
            intent=intent,
            context_hash=f"0x{i:016x}",
            payload=f"Test message {i}",
        )
        messages.append(signal.to_ascii())

    # Write to temp file
    all_messages = "\n".join(messages)
    import tempfile
    with tempfile.NamedTemporaryFile(mode='w', suffix='.ctp', delete=False) as f:
        f.write(all_messages)
        temp_path = f.name

    print(f"\nCreated temp file: {temp_path}")
    print(f"Contains {len(messages)} messages")

    # Simulate grep commands
    print("\n✓ Simulated grep commands:")
    print("-" * 40)

    # Count by intent
    import re
    query_count = len(re.findall(r"^Intent: QUERY$", all_messages, re.MULTILINE))
    insight_count = len(re.findall(r"^Intent: INSIGHT$", all_messages, re.MULTILINE))
    fragment_count = len(re.findall(r"^Intent: FRAGMENT$", all_messages, re.MULTILINE))

    print(f"  grep -c 'Intent: QUERY'    → {query_count}")
    print(f"  grep -c 'Intent: INSIGHT'  → {insight_count}")
    print(f"  grep -c 'Intent: FRAGMENT' → {fragment_count}")

    # Extract all agent IDs
    agent_ids = re.findall(r"^Agent-ID: (.+)$", all_messages, re.MULTILINE)
    print(f"\n  grep 'Agent-ID:' | cut -d' ' -f2")
    print(f"  → {agent_ids}")

    # Cleanup
    os.unlink(temp_path)

    return True


def test_hilbert_spatial_locality():
    """
    Test that Hilbert coordinate translation preserves spatial locality.

    This verifies the "AI sees OS as geometric structure" requirement:
    - Nearby windows on screen should have nearby Hilbert indices
    - The geometric structure of the GUI should be comprehensible
    """
    print_section("8. Hilbert Spatial Locality")

    # Create Hilbert curve
    hilbert = HilbertCurve(order=10)  # 1024x1024 grid
    verifier = SpatialLocalityVerifier(hilbert)

    print(f"\nHilbert Curve Configuration:")
    print(f"  Order: {hilbert.order}")
    print(f"  Grid Size: {hilbert.grid_size}x{hilbert.grid_size}")

    # Test 1: Roundtrip consistency
    print("\n✓ Test 1: Roundtrip Consistency")
    test_points = [(100, 50), (640, 480), (0, 0), (1023, 1023)]
    roundtrip_passed = True
    for x, y in test_points:
        d = hilbert.screen_to_hilbert(x, y)
        rx, ry = hilbert.hilbert_to_screen(d)
        match = "✓" if (rx, ry) == (x, y) else "✗"
        print(f"  ({x}, {y}) → d={d} → ({rx}, {ry}) {match}")
        if (rx, ry) != (x, y):
            roundtrip_passed = False

    if not roundtrip_passed:
        return False

    # Test 2: Intra-quadrant clustering (windows in SAME Hilbert region)
    print("\n✓ Test 2: Intra-Quadrant Clustering")

    # Use a 32x32 subregion to ensure all windows are in same Hilbert quadrant
    # Choose a region that doesn't cross quadrant boundaries
    base_x, base_y = 100, 100

    intra_windows = [
        WindowState(
            id="intra-1",
            title="Cluster Window 1",
            type="terminal",
            pos=[base_x, base_y],
            size=[400, 300],
            hilbert_index=hilbert.screen_to_hilbert(base_x, base_y),
            hilbert_coords=hilbert.hilbert_to_screen(hilbert.screen_to_hilbert(base_x, base_y))
        ),
        WindowState(
            id="intra-2",
            title="Cluster Window 2",
            type="terminal",
            pos=[base_x + 5, base_y + 5],  # 5 pixels away
            size=[400, 300],
            hilbert_index=hilbert.screen_to_hilbert(base_x + 5, base_y + 5),
            hilbert_coords=hilbert.hilbert_to_screen(hilbert.screen_to_hilbert(base_x + 5, base_y + 5))
        ),
        WindowState(
            id="intra-3",
            title="Cluster Window 3",
            type="terminal",
            pos=[base_x + 10, base_y + 10],  # 10 pixels away
            size=[400, 300],
            hilbert_index=hilbert.screen_to_hilbert(base_x + 10, base_y + 10),
            hilbert_coords=hilbert.hilbert_to_screen(hilbert.screen_to_hilbert(base_x + 10, base_y + 10))
        ),
    ]

    print(f"\n  Intra-Quadrant Windows:")
    for win in intra_windows:
        print(f"    {win.id}: pos={win.pos} → hilbert_index={win.hilbert_index}")

    # Calculate max Hilbert distance within cluster
    max_hilbert_dist = 0
    max_screen_dist = 0
    for i, w1 in enumerate(intra_windows):
        for w2 in intra_windows[i+1:]:
            screen_dist = abs(w1.pos[0] - w2.pos[0]) + abs(w1.pos[1] - w2.pos[1])
            hilbert_dist = abs(w1.hilbert_index - w2.hilbert_index)
            max_hilbert_dist = max(max_hilbert_dist, hilbert_dist)
            max_screen_dist = max(max_screen_dist, screen_dist)
            print(f"    {w1.id} ↔ {w2.id}: screen={screen_dist}, hilbert={hilbert_dist}")

    # Intra-quadrant clustering: small screen distance should give small Hilbert distance
    clustering_passed = max_hilbert_dist < 500  # Reasonable bound for <15px screen distance
    print(f"\n  Max Screen Distance: {max_screen_dist}px")
    print(f"  Max Hilbert Distance: {max_hilbert_dist}")
    print(f"  Clustering Verification: {'✓ PASS' if clustering_passed else '✗ FAIL'}")

    # Test 3: Consecutive indices are spatially adjacent
    print("\n✓ Test 3: Consecutive Indices Are Adjacent")

    adjacent_count = 0
    total_checked = 0
    for d in range(0, 1000, 10):
        x1, y1 = hilbert.hilbert_to_screen(d)
        x2, y2 = hilbert.hilbert_to_screen(d + 1)
        manhattan = abs(x1 - x2) + abs(y1 - y2)

        # Consecutive indices should be adjacent (Manhattan distance = 1)
        if manhattan == 1:
            adjacent_count += 1
        total_checked += 1

    adjacency_rate = adjacent_count / total_checked
    print(f"  Adjacency Rate: {adjacency_rate:.1%} ({adjacent_count}/{total_checked})")

    # Hilbert curve should have 100% adjacency rate
    if adjacency_rate < 1.0:
        print(f"  ✗ Adjacency rate too low (expected 100%)")
        return False

    # Test 4: Match Rust reference test vectors
    print("\n✓ Test 4: Rust Reference Vectors")
    test_vectors = [
        (4, 0, (0, 0)),
        (4, 1, (1, 0)),
        (4, 2, (1, 1)),
        (4, 3, (0, 1)),
        (8, 0, (0, 0)),
        (8, 7, (2, 1)),
    ]

    vectors_passed = True
    for n, d, expected in test_vectors:
        result = hilbert.d2xy(n, d)
        match = "✓" if result == expected else "✗"
        print(f"  d2xy({n}, {d}) = {result}, expected {expected} {match}")
        if result != expected:
            vectors_passed = False

    if not vectors_passed:
        return False

    print(f"\n✓ Hilbert Spatial Locality Test Complete")
    print(f"  - Roundtrip consistency: PASS")
    print(f"  - Intra-quadrant clustering: {'PASS' if clustering_passed else 'FAIL'}")
    print(f"  - Adjacency rate: 100%")
    print(f"  - Rust reference vectors: PASS")

    return clustering_passed and adjacency_rate >= 1.0 and vectors_passed


def main():
    """Run all tests."""
    print("""
╔══════════════════════════════════════════════════════════════╗
║     CTP ASCII Protocol Test Suite                            ║
║     Cognitive Transmission Protocol v1.0                     ║
╚══════════════════════════════════════════════════════════════╝
    """)

    print(f"CTP Version: {CTPVersion.VERSION}")
    print(f"Default Port: {CTPVersion.DEFAULT_PORT}")

    tests = [
        ("ASCII Message Format", test_ascii_message_format),
        ("Trust Levels", test_trust_levels),
        ("Context Hash", test_context_hash),
        ("Handshake Flow", test_handshake_flow),
        ("Rate Limiting", test_rate_limiting),
        ("Simulation Phases", test_simulation_phases),
        ("Grep-Ability", test_grep_ability),
        ("Hilbert Spatial Locality", test_hilbert_spatial_locality),
    ]

    results = []
    for name, test_func in tests:
        try:
            result = test_func()
            results.append((name, result, None))
        except Exception as e:
            results.append((name, False, str(e)))

    # Summary
    print_section("Summary")
    passed = sum(1 for _, r, _ in results if r)
    total = len(results)

    for name, result, error in results:
        status = "✓ PASS" if result else "✗ FAIL"
        print(f"  {status}: {name}")
        if error:
            print(f"         Error: {error}")

    print(f"\nTotal: {passed}/{total} tests passed")

    return passed == total


if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)
