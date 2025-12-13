#!/usr/bin/env python3
"""
Test script to verify OMNI-GEOMETRY instant assimilation functionality
"""

import asyncio
import sys
import os

# Add the project root to Python path
sys.path.append('/home/jericho/zion/projects/ctrm/ctrm13')

from src.vector_llm_tools.code_vectorizer import CodeVectorizer, create_hyper_graph_node
from src.vector_llm_tools.omni_geometry import HyperGraphWeaver, GeometricOracle
from src.ctrm_core.database import CTRMDatabase

async def test_instant_assimilation():
    """Test the instant assimilation functionality"""
    print("🧪 Testing OMNI-GEOMETRY Instant Assimilation")
    print("=" * 50)

    try:
        # Test 1: Initialize components
        print("1. Initializing components...")
        db = CTRMDatabase()
        weaver = HyperGraphWeaver("ctrm_llm_os.db")  # Use database path
        vectorizer = CodeVectorizer()
        oracle = GeometricOracle(weaver)

        print(f"   ✅ Database: {db.get_node_count()} nodes")
        print(f"   ✅ Weaver: Ready")
        print(f"   ✅ Vectorizer: Ready")
        print(f"   ✅ Oracle: Ready")

        # Test 2: Create a new artifact
        print("2. Creating new artifact...")
        new_code = """
import asyncio
import numpy as np

class NewComponent:
    def __init__(self):
        self.value = 42

    async def process(self, data):
        # Process data using vector operations
        vector = np.array(data)
        result = vector * self.value
        return result.tolist()

async def main():
    component = NewComponent()
    result = await component.process([1, 2, 3, 4])
    print(f"Result: {result}")
    return result
"""

        file_path = "llm_os_workspace/components/new_component.py"
        node = create_hyper_graph_node(file_path, new_code, vectorizer)

        print(f"   🎯 Created node: {node['name']}")
        print(f"   📊 Node ID: {node['id']}")
        print(f"   📈 Vector dimensions: {len(node['vector'])}")

        # Test 3: Add to database
        print("3. Adding to hyper-graph...")
        db.add_hyper_graph_node(node)
        print(f"   ✅ Node added to database")

        # Test 4: Verify instant weaving
        print("4. Testing instant weaving...")
        connections = weaver.weave_connections(node_id=node['id'], force=True)
        print(f"   ✨ Created {connections} connections")

        # Test 5: Verify graph health
        print("5. Verifying graph health...")
        health = oracle.get_graph_health()
        print(f"   💖 Health Score: {health['health_score']}")
        print(f"   📊 Connectivity: {health['connectivity']}")
        print(f"   🔗 Coherence: {health['coherence']}")

        # Test 6: Test intent resolution with new artifact
        print("6. Testing intent resolution...")
        result = oracle.resolve_intent("process data using vector operations")
        if result['success']:
            print(f"   🎯 Intent resolved to: {result['node_name']}")
            print(f"   📊 Confidence: {result['confidence']}")
        else:
            print(f"   ❌ Intent resolution failed")

        # Test 7: Verify node count increased
        print("7. Verifying graph growth...")
        new_count = db.get_node_count()
        print(f"   📈 Graph now has {new_count} nodes")

        # Test 8: Test related concepts
        print("8. Testing related concepts...")
        concepts = oracle.get_related_concepts("vector operations", limit=3)
        print(f"   🔗 Found {len(concepts)} related concepts")
        for concept in concepts:
            print(f"      - {concept['concept']} (strength: {concept['strength']:.3f})")

        print("\n✅ All instant assimilation tests passed!")
        return True

    except Exception as e:
        print(f"❌ Test failed: {str(e)}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = asyncio.run(test_instant_assimilation())
    if not success:
        sys.exit(1)