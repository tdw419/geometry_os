#!/usr/bin/env python3
"""
Test script for Neural Pattern Transpiler integration with SQLite Vector Blueprint DB
"""

import asyncio
import os
import tempfile
from runtime.sqlite_vector_blueprint import SQLiteVectorBlueprintDB
from runtime.neural_transpiler import NeuralPatternTranspiler

async def test_neural_integration():
    """Test the integration between NeuralPatternTranspiler and SQLiteVectorBlueprintDB"""

    print("🧪 Testing Neural Pattern Transpiler Integration")
    print("=" * 50)

    # Create a temporary database for testing
    with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as tmp_file:
        db_path = tmp_file.name

    try:
        # Initialize the neural transpiler
        print("🧠 Initializing Neural Pattern Transpiler...")
        neural_transpiler = NeuralPatternTranspiler()

        # Initialize the blueprint database with neural transpiler
        print("🗃️  Initializing SQLite Vector Blueprint DB...")
        blueprint_db = SQLiteVectorBlueprintDB(db_path=db_path, neural_transpiler=neural_transpiler)

        # Test 1: Dream a simple fractal pattern
        print("\n🌈 Test 1: Dreaming a fractal pattern...")
        description1 = "a chaotic neon fractal"
        blueprint_id1, code1 = await blueprint_db.dream_blueprint(description1)

        print(f"✅ Created blueprint: {blueprint_id1}")
        print(f"📜 Generated code length: {len(code1)} characters")
        print(f"🔗 Code preview: {code1[:100]}...")

        # Test 2: Dream a noise pattern
        print("\n🌈 Test 2: Dreaming a noise pattern...")
        description2 = "smooth gradient noise with blue tones"
        blueprint_id2, code2 = await blueprint_db.dream_blueprint(description2)

        print(f"✅ Created blueprint: {blueprint_id2}")
        print(f"📜 Generated code length: {len(code2)} characters")

        # Test 3: Dream a grid pattern
        print("\n🌈 Test 3: Dreaming a grid pattern...")
        description3 = "geometric grid with red lines"
        blueprint_id3, code3 = await blueprint_db.dream_blueprint(description3)

        print(f"✅ Created blueprint: {blueprint_id3}")
        print(f"📜 Generated code length: {len(code3)} characters")

        # Test 4: Retrieve dream metadata
        print("\n📊 Test 4: Retrieving dream metadata...")
        metadata = blueprint_db.get_dream_metadata(blueprint_id1)
        if metadata:
            print(f"✅ Retrieved metadata for {blueprint_id1}")
            print(f"📝 Prompt: {metadata.get('prompt')}")
            print(f"🎯 Source: {metadata.get('source')}")
            print(f"📅 Created: {metadata.get('created_at')}")
        else:
            print("❌ Failed to retrieve metadata")

        # Test 5: List all dream blueprints
        print("\n📋 Test 5: Listing all dream blueprints...")
        dreams = blueprint_db.list_dream_blueprints()
        print(f"✅ Found {len(dreams)} dream blueprints:")
        for dream in dreams:
            print(f"  - {dream['id']}: {dream['description']} (quality: {dream['quality_score']})")

        # Test 6: Search for similar patterns
        print("\n🔍 Test 6: Searching for similar patterns...")
        similar = blueprint_db.search_similar(text_query="fractal patterns", limit=3)
        print(f"✅ Found {len(similar)} similar patterns:")
        for item in similar:
            print(f"  - {item['id']}: {item['name']} (similarity: {item['similarity']:.3f})")

        # Test 7: Verify blueprint data retrieval
        print("\n📥 Test 7: Retrieving blueprint data...")
        blueprint_data = blueprint_db.get_blueprint_data(blueprint_id1)
        print(f"✅ Retrieved {len(blueprint_data)} bytes of blueprint data")

        # Test 8: Test statistics
        print("\n📈 Test 8: Getting database statistics...")
        stats = blueprint_db.get_statistics()
        print(f"✅ Total blueprints: {stats['total_blueprints']}")
        print(f"🎯 Average quality: {stats['avg_quality']:.2f}")

        print("\n" + "=" * 50)
        print("🎉 All neural integration tests completed successfully!")
        print(f"🧠 Created {len(dreams)} dream blueprints")
        print(f"💾 Database stored at: {db_path}")

        return True

    except Exception as e:
        print(f"❌ Test failed with error: {e}")
        import traceback
        traceback.print_exc()
        return False

    finally:
        # Clean up
        blueprint_db.close()
        if os.path.exists(db_path):
            os.unlink(db_path)
            print(f"🗑️  Cleaned up test database: {db_path}")

if __name__ == "__main__":
    # Run the test
    success = asyncio.run(test_neural_integration())

    if success:
        print("\n✅ Neural Pattern Transpiler integration is working correctly!")
    else:
        print("\n❌ Neural Pattern Transpiler integration test failed!")
        exit(1)