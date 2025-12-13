
import asyncio
import json
import os
import sys

# Ensure src is in path
sys.path.append(os.path.abspath("./src"))

from vector_llm_tools.cvfs_daemon import CTRMVectorDaemon
from vector_llm_tools.vpl_compiler import VPLTextCompiler

async def test_deep_reasoning():
    print("🧠 Initializing CTRM Vector Daemon...")
    daemon = CTRMVectorDaemon()
    
    # Mock vector for testing
    mock_query_vector = [0.1] * 768
    
    # Manually inject the program if not loaded yet (for robustness)
    if 'deep_reasoning' not in daemon.programs:
        print("📥 Loading deep_reasoning.vpl manually...")
        with open('cvfs_data/programs/deep_reasoning.vpl', 'r') as f:
            daemon.programs['deep_reasoning'] = f.read()

    print("⚡ Executing 'deep_reasoning' on Vector Substrate...")
    try:
        # Note: In a real run, HNSW_STEP/QUALITY_CHECK might fail if the DB is empty or mocking isn't 100%
        # The VPL Compiler handles mocks for some operations, but we'll see.
        result = daemon.process_vector_query(
            query_vector=mock_query_vector,
            query_type='deep_reasoning'
        )
        
        print("\n✅ Execution Successful!")
        print(f"Query ID: {result['query_id']}")
        print(f"Execution Time: {result['execution_time']:.4f}s")
        print("Log Output:", json.dumps(result['operations_log'], indent=2))
        
    except Exception as e:
        print(f"\n❌ Execution Failed: {e}")
        # If it fails due to missing operations (QUALITY_CHECK isn't in standard compiler maybe?),
        # this test is valuable to show what we need to 'teach' the compiler next.

if __name__ == "__main__":
    asyncio.run(test_deep_reasoning())
