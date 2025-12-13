#!/usr/bin/env python3
"""
Test script to verify OMNI-GEOMETRY daemon integration
"""

import asyncio
import sys
import os

# Add the project root to Python path
sys.path.append('/home/jericho/zion/projects/ctrm/ctrm13')

from src.vector_llm_tools.omni_geometry import HyperGraphWeaver, GeometricOracle

async def test_daemon_integration():
    """Test the daemon integration"""
    print("🧪 Testing OMNI-GEOMETRY Daemon Integration")
    print("=" * 50)

    try:
        # Test 1: Initialize weaver and oracle
        print("1. Initializing HyperGraphWeaver...")
        weaver = HyperGraphWeaver()
        print(f"   ✅ Weaver initialized with {weaver.get_node_count()} nodes")

        print("2. Initializing GeometricOracle...")
        oracle = GeometricOracle(weaver)
        print("   ✅ Oracle initialized")

        # Test 2: Test intent resolution
        print("3. Testing intent resolution...")
        test_intents = [
            "analyze security vulnerabilities",
            "optimize token management",
            "process truth verification",
            "handle vector operations"
        ]

        for intent in test_intents:
            result = oracle.resolve_intent(intent)
            if result['success']:
                print(f"   🎯 {intent} -> {result['node_name']} (confidence: {result['confidence']})")
            else:
                print(f"   ❌ {intent} -> No match found")

        # Test 3: Test graph health
        print("4. Testing graph health...")
        health = oracle.get_graph_health()
        print(f"   💖 Health Score: {health['health_score']}")
        print(f"   📊 Connectivity: {health['connectivity']}")
        print(f"   🔗 Coherence: {health['coherence']}")
        print(f"   📈 Status: {health['status']}")

        # Test 4: Test related concepts
        print("5. Testing related concepts...")
        concepts = oracle.get_related_concepts("CTRM", limit=3)
        print(f"   🔗 Found {len(concepts)} concepts related to 'CTRM'")
        for concept in concepts:
            print(f"      - {concept['concept']} (strength: {concept['strength']:.3f})")

        # Test 5: Test weaver statistics
        print("6. Testing weaver statistics...")
        stats = weaver.get_graph_summary()
        print(f"   📊 Nodes: {stats['nodes']}")
        print(f"   🔗 Edges: {stats['edges']}")
        print(f"   📈 Avg Connection Strength: {stats['connection_stats']['average_strength']:.3f}")

        weaver.close()
        print("\n✅ All daemon integration tests passed!")
        return True

    except Exception as e:
        print(f"❌ Test failed: {str(e)}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = asyncio.run(test_daemon_integration())
    if not success:
        sys.exit(1)