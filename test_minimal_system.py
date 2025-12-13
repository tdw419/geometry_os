#!/usr/bin/env python3

"""
Minimal test to verify the CTRM LLM OS system works with fixes
"""

import asyncio
import sys
import os

# Add src to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from main import CTRMLLMOSDaemon

async def test_minimal_system():
    """Test minimal system initialization"""
    print("🚀 Testing minimal CTRM LLM OS system...")

    try:
        # Create daemon
        daemon = CTRMLLMOSDaemon()

        # Initialize system
        await daemon.initialize()

        print("✅ System initialized successfully")

        # Test vector operations
        test_vector = [0.1] * 768
        test_metadata = {"source": "test", "description": "Test vector"}

        vector_result = await daemon.vector_interface.llm_store_vector(test_vector, test_metadata)
        print(f"✅ Vector storage successful: {vector_result['status']}")

        # Test similarity search
        similar_vectors = await daemon.vector_interface.llm_find_similar_vectors(test_vector, min_similarity=0.5, limit=5)
        print(f"✅ Similarity search successful: found {similar_vectors['found_count']} vectors")

        print("🎉 Minimal system test passed!")
        return True

    except Exception as e:
        print(f"❌ Minimal system test failed: {e}")
        import traceback
        traceback.print_exc()
        return False

if __name__ == "__main__":
    success = asyncio.run(test_minimal_system())
    sys.exit(0 if success else 1)