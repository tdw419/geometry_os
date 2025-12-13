"""
Test Knowledge Distillation - Holographic Transfer Protocol
Comprehensive testing of the KnowledgeDistiller implementation
"""

import asyncio
import os
import tempfile
import json
from runtime.knowledge_distiller import KnowledgeDistiller, MockLLM
from runtime.sqlite_vector_blueprint import SQLiteVectorBlueprintDB

async def test_knowledge_distiller_basic():
    """Test basic KnowledgeDistiller functionality"""
    print("🧪 Testing KnowledgeDistiller basic functionality")

    # Create temporary database
    with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as tmp:
        db_path = tmp.name

    try:
        # Initialize distiller
        distiller = KnowledgeDistiller(db_path)

        # Test distillation
        knowledge_ids = await distiller.distill_domain("Basic Math", num_concepts=3)

        assert len(knowledge_ids) == 3, f"Expected 3 knowledge vectors, got {len(knowledge_ids)}"
        print(f"✅ Created {len(knowledge_ids)} knowledge vectors")

        # Test knowledge retrieval
        for know_id in knowledge_ids:
            knowledge_vector = distiller.get_knowledge_vector(know_id)
            assert knowledge_vector is not None, f"Knowledge vector {know_id} not found"
            assert knowledge_vector.domain == "Basic Math"
            print(f"✅ Retrieved knowledge vector {know_id}: {knowledge_vector.concept}")

        # Test search functionality
        search_results = distiller.search_knowledge("What is addition?", domain="Basic Math")
        assert len(search_results) > 0, "Search should return results"
        print(f"✅ Search found {len(search_results)} relevant knowledge vectors")

        # Test domain statistics
        stats = distiller.get_domain_statistics("Basic Math")
        assert stats['concept_count'] == 3, f"Expected 3 concepts, got {stats['concept_count']}"
        print(f"✅ Domain statistics: {stats}")

        # Test knowledge relationships
        if len(knowledge_ids) >= 2:
            distiller.create_knowledge_relationship(
                knowledge_ids[0], knowledge_ids[1], "related_concept", 0.7
            )

            related = distiller.get_related_knowledge(knowledge_ids[0])
            assert len(related) == 1, f"Expected 1 relationship, got {len(related)}"
            print(f"✅ Knowledge relationships working: {related}")

        return True

    finally:
        distiller.close()
        if os.path.exists(db_path):
            os.unlink(db_path)

async def test_knowledge_distiller_advanced():
    """Test advanced KnowledgeDistiller features"""
    print("🧪 Testing KnowledgeDistiller advanced features")

    with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as tmp:
        db_path = tmp.name

    try:
        distiller = KnowledgeDistiller(db_path)

        # Test multiple domains
        math_ids = await distiller.distill_domain("Basic Math", num_concepts=2)
        physics_ids = await distiller.distill_domain("Physics", num_concepts=5)  # MockLLM generates 5 by default

        assert len(math_ids) == 2, f"Expected 2 math knowledge vectors, got {len(math_ids)}"
        assert len(physics_ids) == 2, f"Expected 2 physics knowledge vectors, got {len(physics_ids)}"
        print(f"✅ Created knowledge for multiple domains")

        # Test cross-domain search
        all_knowledge = distiller.search_knowledge("mathematical concepts", limit=10)
        math_knowledge = distiller.search_knowledge("mathematical concepts", domain="Basic Math")

        assert len(math_knowledge) <= len(all_knowledge), "Domain-filtered search should be subset"
        print(f"✅ Cross-domain search working: {len(all_knowledge)} total, {len(math_knowledge)} in math")

        # Test quality scoring
        for know_id in math_ids[:1]:  # Test with first math concept
            distiller.update_quality_score(know_id, 0.9)

            # Retrieve and check updated score
            cursor = distiller.conn.cursor()
            cursor.execute("SELECT quality_score FROM knowledge_vectors WHERE id = ?", (know_id,))
            row = cursor.fetchone()
            assert row['quality_score'] > 0.8, f"Quality score should be updated, got {row['quality_score']}"
            print(f"✅ Quality scoring updated for {know_id}")

        # Test export functionality
        export_path = "test_knowledge_export.json"
        distiller.export_knowledge_domain("Basic Math", export_path)

        assert os.path.exists(export_path), "Export file should be created"
        with open(export_path, 'r') as f:
            export_data = json.load(f)

        assert export_data['domain'] == "Basic Math"
        assert export_data['knowledge_count'] == 2
        print(f"✅ Knowledge export successful: {export_data['knowledge_count']} vectors exported")

        # Cleanup export file
        if os.path.exists(export_path):
            os.unlink(export_path)

        return True

    finally:
        distiller.close()
        if os.path.exists(db_path):
            os.unlink(db_path)

async def test_knowledge_blueprint_integration():
    """Test integration between KnowledgeDistiller and SQLiteVectorBlueprintDB"""
    print("🧪 Testing Knowledge-Blueprint integration")

    with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as tmp:
        db_path = tmp.name

    with tempfile.NamedTemporaryFile(suffix='_blueprints.db', delete=False) as tmp2:
        blueprint_db_path = tmp2.name

    try:
        # Initialize both systems
        distiller = KnowledgeDistiller(db_path)
        blueprint_db = SQLiteVectorBlueprintDB(blueprint_db_path)

        # Create some knowledge
        knowledge_ids = await distiller.distill_domain("Visual Patterns", num_concepts=2)

        # Create blueprints with knowledge integration
        blueprint_data = [255, 0, 0, 128]  # Simple pattern data
        bp_id, know_id = distiller.create_knowledge_enhanced_blueprint(
            blueprint_data, 0, "Red Gradient", "A red gradient pattern", "Visual Patterns", "Gradient Pattern"
        )

        assert bp_id is not None, "Blueprint should be created"
        assert know_id is not None, "Knowledge should be created"
        print(f"✅ Created knowledge-enhanced blueprint: {bp_id} with knowledge {know_id}")

        # Test knowledge-enhanced search
        search_results = distiller.search_knowledge_enhanced_blueprints("gradient patterns", limit=5)
        assert len(search_results) > 0, "Should find knowledge-enhanced blueprints"
        print(f"✅ Knowledge-enhanced search found {len(search_results)} blueprints")

        # Test blueprint knowledge integration
        blueprint_db.integrate_knowledge(bp_id, knowledge_ids[0], "illustrates", 0.8)

        relationships = blueprint_db.get_knowledge_relationships(bp_id)
        assert len(relationships) == 1, f"Expected 1 relationship, got {len(relationships)}"
        print(f"✅ Blueprint-knowledge integration working")

        # Test comprehensive info retrieval
        info = blueprint_db.get_knowledge_enhanced_blueprint_info(bp_id)
        assert info['knowledge_count'] == 1, f"Expected 1 knowledge relationship, got {info['knowledge_count']}"
        print(f"✅ Comprehensive blueprint info retrieval working")

        return True

    finally:
        distiller.close()
        blueprint_db.close()
        if os.path.exists(db_path):
            os.unlink(db_path)
        if os.path.exists(blueprint_db_path):
            os.unlink(blueprint_db_path)

async def test_mock_llm_functionality():
    """Test MockLLM functionality"""
    print("🧪 Testing MockLLM functionality")

    mock_llm = MockLLM()

    # Test probe generation
    probes = await mock_llm.generate_probes("Basic Math", num_probes=3)
    assert len(probes) == 3, f"Expected 3 probes, got {len(probes)}"
    assert all("Basic Math" in probe for probe in probes), "All probes should mention the domain"
    print(f"✅ MockLLM probe generation working: {probes}")

    # Test oracle interrogation
    explanation = await mock_llm.interrogate_oracle("Explain the concept of Addition in Basic Math")
    assert len(explanation) > 50, "Explanation should be detailed"
    assert "Addition" in explanation, "Explanation should mention the concept"
    print(f"✅ MockLLM oracle interrogation working: {explanation[:50]}...")

    # Test unknown concept handling
    unknown_explanation = await mock_llm.interrogate_oracle("Explain quantum entanglement")
    assert len(unknown_explanation) > 20, "Should provide fallback explanation"
    print(f"✅ MockLLM unknown concept handling working")

    return True

async def test_holographic_transfer_protocol():
    """Test the complete Holographic Transfer Protocol"""
    print("🧪 Testing complete Holographic Transfer Protocol")

    with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as tmp:
        db_path = tmp.name

    try:
        distiller = KnowledgeDistiller(db_path)

        # Phase 1: Generate probes
        domain = "Advanced Mathematics"
        probes = await distiller._generate_probes(domain, num_probes=4)
        assert len(probes) == 4, f"Expected 4 probes, got {len(probes)}"
        print(f"✅ Phase 1 - Probe generation: {len(probes)} probes created")

        # Phase 2: Interrogate oracle
        explanations = []
        for probe in probes:
            explanation = await distiller._interrogate_oracle(probe)
            explanations.append(explanation)
            print(f"   - Probe: {probe[:50]}...")
            print(f"   - Explanation: {explanation[:50]}...")

        assert len(explanations) == len(probes), "Should get explanation for each probe"
        print(f"✅ Phase 2 - Oracle interrogation: {len(explanations)} explanations received")

        # Phase 3: Crystallize knowledge
        knowledge_ids = []
        for i, (probe, explanation) in enumerate(zip(probes, explanations)):
            concept = distiller._extract_concept_from_probe(probe, domain)
            knowledge_id = await distiller._crystallize_knowledge(domain, concept, explanation)
            knowledge_ids.append(knowledge_id)
            print(f"   - Crystallized: {concept} -> {knowledge_id}")

        assert len(knowledge_ids) == len(probes), "Should create knowledge vector for each probe"
        print(f"✅ Phase 3 - Knowledge crystallization: {len(knowledge_ids)} vectors created")

        # Phase 4: Verify substrate integration
        for know_id in knowledge_ids:
            vector = distiller.get_knowledge_vector(know_id)
            assert vector is not None, f"Knowledge vector {know_id} should exist in substrate"
            assert vector.domain == domain, f"Knowledge should be in correct domain"

        print(f"✅ Phase 4 - Substrate integration: All knowledge vectors stored correctly")

        # Test end-to-end search
        search_query = "mathematical concepts and theories"
        results = distiller.search_knowledge(search_query, domain=domain)
        assert len(results) > 0, "Should find related knowledge"
        print(f"✅ End-to-end search: Found {len(results)} relevant knowledge vectors")

        return True

    finally:
        distiller.close()
        if os.path.exists(db_path):
            os.unlink(db_path)

async def run_all_tests():
    """Run all knowledge distillation tests"""
    print("🚀 Starting Knowledge Distillation Test Suite")
    print("=" * 50)

    tests = [
        ("Basic Functionality", test_knowledge_distiller_basic),
        ("Advanced Features", test_knowledge_distiller_advanced),
        ("Blueprint Integration", test_knowledge_blueprint_integration),
        ("Mock LLM", test_mock_llm_functionality),
        ("Holographic Transfer Protocol", test_holographic_transfer_protocol)
    ]

    passed = 0
    failed = 0

    for test_name, test_func in tests:
        print(f"\n📋 Running {test_name}...")
        try:
            result = await test_func()
            if result:
                print(f"✅ {test_name}: PASSED")
                passed += 1
            else:
                print(f"❌ {test_name}: FAILED")
                failed += 1
        except Exception as e:
            print(f"❌ {test_name}: FAILED with exception: {e}")
            failed += 1

    print(f"\n📊 Test Results: {passed} passed, {failed} failed")
    print("=" * 50)

    if failed == 0:
        print("🎉 All tests passed! Holographic Transfer Protocol is working correctly.")
        return True
    else:
        print("⚠️  Some tests failed. Please review the implementation.")
        return False

async def demo_basic_math_distillation():
    """Demonstrate the Basic Math distillation as specified in the task"""
    print("🎯 Demonstrating Basic Math Knowledge Distillation")
    print("=" * 50)

    # Use a persistent database for demo
    demo_db = "basic_math_knowledge.db"

    try:
        # Initialize distiller
        distiller = KnowledgeDistiller(demo_db)

        # Clean up existing data for fresh demo
        cursor = distiller.conn.cursor()
        cursor.execute("DELETE FROM knowledge_vectors WHERE domain = ?", ("Basic Math",))
        cursor.execute("DELETE FROM domain_index WHERE domain = ?", ("Basic Math",))
        distiller.conn.commit()

        # Perform distillation as specified in task
        print("🔮 Initiating Holographic Transfer for Basic Math...")
        knowledge_ids = await distiller.distill_domain("Basic Math", num_concepts=5)

        print(f"✅ Distillation complete! Created {len(knowledge_ids)} knowledge vectors:")
        for i, know_id in enumerate(knowledge_ids, 1):
            vector = distiller.get_knowledge_vector(know_id)
            print(f"   {i}. {vector.concept}: {vector.explanation[:60]}...")

        # Demonstrate search capabilities
        print("\n🔍 Testing knowledge retrieval...")
        test_queries = [
            "What is addition?",
            "Explain subtraction",
            "How does multiplication work?"
        ]

        for query in test_queries:
            results = distiller.search_knowledge(query, domain="Basic Math", limit=2)
            print(f"\n   Query: '{query}'")
            for result in results:
                print(f"      - {result['concept']} (similarity: {result['similarity']:.3f})")
                print(f"        {result['explanation'][:80]}...")

        # Show domain statistics
        stats = distiller.get_domain_statistics("Basic Math")
        print(f"\n📊 Basic Math Domain Statistics:")
        print(f"   Concepts: {stats['concept_count']}")
        print(f"   Average Quality: {stats['avg_quality_score']:.2f}")
        print(f"   Total Usage: {stats['total_usage']}")

        # Export for inspection
        export_path = "basic_math_knowledge_export.json"
        distiller.export_knowledge_domain("Basic Math", export_path)
        print(f"💾 Exported knowledge to {export_path}")

        print(f"\n🎉 Basic Math distillation demonstration complete!")
        print(f"   Database: {demo_db}")
        print(f"   Knowledge vectors: {len(knowledge_ids)}")
        print(f"   Export file: {export_path}")

        return knowledge_ids

    except Exception as e:
        print(f"❌ Demo failed: {e}")
        return []

    finally:
        distiller.close()

if __name__ == "__main__":
    # Run comprehensive tests
    test_result = asyncio.run(run_all_tests())

    if test_result:
        print("\n🚀 Running Basic Math distillation demo...")
        demo_result = asyncio.run(demo_basic_math_distillation())

        if demo_result:
            print(f"\n🎊 Holographic Transfer Protocol successfully demonstrated!")
            print(f"   Created {len(demo_result)} knowledge vectors for Basic Math")
        else:
            print("❌ Demo failed to run")
    else:
        print("❌ Tests failed - not running demo")