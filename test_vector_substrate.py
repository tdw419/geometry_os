import asyncio
from substrate.vector_db import VectorSubstrate, VectorType
from llm_os_builder.substrate_builder import SubstrateLLMOSBuilder
import numpy as np

async def test_vector_substrate():
    """Test the complete vector substrate system"""
    print("🧪 Testing Vector Substrate System")

    # Test 1: Basic vector storage and retrieval
    print("\n1. Testing basic vector storage...")
    substrate = VectorSubstrate("test_substrate.db")

    # Create test vector
    test_vector = [0.1, 0.2, 0.3] * 512  # 1536 dimensions

    # Store vector
    vector_id = await substrate.store_vector(
        test_vector,
        VectorType.CODE_VECTOR,
        metadata={"test": "basic_storage", "language": "python"}
    )
    print(f"   ✓ Stored vector: {vector_id}")

    # Retrieve vector
    retrieved = await substrate.get_vector(vector_id)
    assert retrieved is not None
    assert retrieved.vector == test_vector
    print("   ✓ Retrieved vector successfully")

    # Test 2: Similarity search
    print("\n2. Testing similarity search...")
    similar_vector = [0.11, 0.21, 0.31] * 512
    different_vector = [0.9, 0.8, 0.7] * 512

    # Store similar and different vectors
    similar_id = await substrate.store_vector(similar_vector, VectorType.CODE_VECTOR)
    different_id = await substrate.store_vector(different_vector, VectorType.CODE_VECTOR)

    # Find similar vectors
    results = await substrate.find_similar_vectors(test_vector, VectorType.CODE_VECTOR, top_k=2)
    assert len(results) >= 1
    assert results[0]['id'] == vector_id  # Should be most similar to itself
    print(f"   ✓ Found {len(results)} similar vectors")

    # Test 3: Relations
    print("\n3. Testing vector relations...")
    await substrate.create_relation(vector_id, similar_id, "similar_to", 0.9)
    relations = await substrate.get_related_vectors(vector_id)
    assert len(relations) == 1
    assert relations[0]['vector'].id == similar_id
    print("   ✓ Created and retrieved relations successfully")

    # Test 4: Substrate LLM OS Builder
    print("\n4. Testing Substrate LLM OS Builder...")
    builder = SubstrateLLMOSBuilder("test_os_substrate.db")

    # Build a component
    component_result = await builder.build_component("Create a vector memory system")
    assert 'component_id' in component_result
    print(f"   ✓ Built component: {component_result['component_id']}")

    # Find similar components
    similar_components = await builder.find_similar_components("vector memory", top_k=3)
    assert len(similar_components) >= 1
    print(f"   ✓ Found {len(similar_components)} similar components")

    # Test 5: Statistics
    print("\n5. Testing statistics...")
    stats = await substrate.get_statistics()
    assert stats['total_vectors'] >= 3
    print(f"   ✓ Substrate contains {stats['total_vectors']} vectors")

    # Test 6: Clustering
    print("\n6. Testing clustering...")
    clusters = await substrate.compute_clusters(n_clusters=2)
    assert 'clusters' in clusters
    print(f"   ✓ Created {len(clusters['clusters'])} clusters")

    print("\n✅ All tests passed! Vector substrate system is working correctly.")

    # Cleanup
    substrate.close()

if __name__ == "__main__":
    asyncio.run(test_vector_substrate())