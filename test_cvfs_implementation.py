#!/usr/bin/env python3
"""
Test script for CTRM Vector File System (CVFS) implementation
"""

import os
import sys
import tempfile
import shutil
from datetime import datetime

# Add src to path
sys.path.insert(0, 'src')

from vector_llm_tools.cvfs_engine import CVFSEngine
from vector_llm_tools.vpl_compiler import VPLTextCompiler
from vector_llm_tools.cvfs_daemon import CTRMVectorDaemon

def test_cvfs_engine():
    """Test the CVFSEngine with basic vector operations"""
    print("=== Testing CVFSEngine ===")

    # Create temporary directory
    temp_dir = tempfile.mkdtemp()
    print(f"Using temp directory: {temp_dir}")

    try:
        # Initialize engine
        engine = CVFSEngine(base_path=temp_dir)

        # Test vector storage
        test_vectors = {
            "doc_1": [0.1, 0.2, 0.3, 0.4, 0.5],
            "doc_2": [0.2, 0.3, 0.4, 0.5, 0.6],
            "doc_3": [0.5, 0.4, 0.3, 0.2, 0.1],
        }

        # Save vectors
        for vec_id, vector in test_vectors.items():
            engine.save_vector_to_file(vec_id, vector)
            print(f"Saved vector {vec_id}: {vector}")

        # Test cosine similarity
        similarity = engine.v_fma_cosine("result_cos", "doc_1", "doc_2")
        print(f"Cosine similarity between doc_1 and doc_2: {similarity:.4f}")

        # Test L2 distance
        distance = engine.v_l2_reduce("result_l2", "doc_1", "doc_3")
        print(f"L2 distance between doc_1 and doc_3: {distance:.4f}")

        # Test HNSW step
        neighbors = engine.v_hnsw_step("hnsw_result", "doc_1", 0, m=2)
        print(f"HNSW neighbors for doc_1: {neighbors}")

        # Test PQ lookup
        pq_dist = engine.v_pq_lookup("pq_result", "doc_1", "test_codebook", subspace_count=2)
        print(f"PQ distance for doc_1: {pq_dist:.4f}")

        # Verify files were created
        files_created = os.listdir(temp_dir)
        print(f"Files created: {files_created}")

        # Check vector file content
        with open(f"{temp_dir}/vectors.txt", 'r') as f:
            vector_content = f.read()
            print(f"Vector file content:\n{vector_content}")

        return True

    except Exception as e:
        print(f"Error in CVFSEngine test: {e}")
        import traceback
        traceback.print_exc()
        return False
    finally:
        # Clean up
        shutil.rmtree(temp_dir)
        print(f"Cleaned up temp directory: {temp_dir}")

def test_vpl_compiler():
    """Test the VPL compiler"""
    print("\n=== Testing VPL Compiler ===")

    temp_dir = tempfile.mkdtemp()
    try:
        engine = CVFSEngine(base_path=temp_dir)
        compiler = VPLTextCompiler(engine)

        # Save test vectors
        test_vectors = {
            "vec_a": [1.0, 2.0, 3.0],
            "vec_b": [2.0, 3.0, 4.0],
        }

        for vec_id, vector in test_vectors.items():
            engine.save_vector_to_file(vec_id, vector)

        # Test VPL program
        vpl_code = """
        # Simple VPL program
        a = LOAD("vec_a")
        b = LOAD("vec_b")
        similarity = COSINE(a, b)
        distance = L2(a, b)
        RETURN similarity
        """

        results = compiler.compile_and_run(vpl_code)
        print(f"VPL results: {results}")

        return True

    except Exception as e:
        print(f"Error in VPL compiler test: {e}")
        import traceback
        traceback.print_exc()
        return False
    finally:
        shutil.rmtree(temp_dir)

def test_cvfs_daemon():
    """Test the CTRMVectorDaemon"""
    print("\n=== Testing CTRMVectorDaemon ===")

    temp_dir = tempfile.mkdtemp()
    try:
        daemon = CTRMVectorDaemon(data_dir=temp_dir)

        # Test vector operations
        vectors = {
            "test_doc_1": [0.1, 0.2, 0.3, 0.4, 0.5],
            "test_doc_2": [0.2, 0.3, 0.4, 0.5, 0.6],
            "test_doc_3": [0.5, 0.4, 0.3, 0.2, 0.1],
        }

        # Build indexes
        print("Building HNSW index...")
        index_result = daemon.build_hnsw_index(vectors)
        print(f"Index result: {index_result}")

        print("Building IVF partitions...")
        ivf_result = daemon.build_ivf_partitions(k=2)
        print(f"IVF result: {ivf_result}")

        print("Building PQ codebooks...")
        pq_result = daemon.build_pq_codebooks("test_codebook")
        print(f"PQ result: {pq_result}")

        # Test semantic search
        query_vector = [0.15, 0.25, 0.35, 0.45, 0.55]
        search_result = daemon.semantic_search(query_vector, top_k=2)
        print(f"Semantic search result: {search_result}")

        # Test VPL program execution
        vpl_code = """
        # Test program
        query = LOAD("$query_id")
        doc1 = LOAD("test_doc_1")
        similarity = COSINE(query, doc1)
        RETURN similarity
        """

        # Save query vector first
        query_id = "test_query_1"
        daemon.engine.save_vector_to_file(query_id, query_vector)

        # Run with parameters
        results = daemon.compiler.compile_and_run(vpl_code, {"$query_id": query_id})
        print(f"VPL program results: {results}")

        return True

    except Exception as e:
        print(f"Error in CVFS daemon test: {e}")
        import traceback
        traceback.print_exc()
        return False
    finally:
        shutil.rmtree(temp_dir)

def test_integration_with_ctrm():
    """Test integration with existing CTRM system"""
    print("\n=== Testing CTRM Integration ===")

    try:
        # Test that our CVFS can work alongside existing vector tools
        temp_dir = tempfile.mkdtemp()
        cvfs_engine = CVFSEngine(base_path=temp_dir)

        # Create some test vectors for CTRM truth verification
        test_vectors = {
            "ctrm_vec_1": [0.1, 0.2, 0.3, 0.4],
            "ctrm_vec_2": [0.2, 0.3, 0.4, 0.5],
        }

        for vec_id, vector in test_vectors.items():
            cvfs_engine.save_vector_to_file(vec_id, vector)

        # Test cosine similarity (CTRM truth verification use case)
        similarity = cvfs_engine.v_fma_cosine("ctrm_sim", "ctrm_vec_1", "ctrm_vec_2")
        print(f"CTRM vector similarity: {similarity:.4f}")

        # Test L2 distance for truth verification
        distance = cvfs_engine.v_l2_reduce("ctrm_dist", "ctrm_vec_1", "ctrm_vec_2")
        print(f"CTRM vector distance: {distance:.4f}")

        # Test that we can use both systems
        print("CVFS can work alongside existing CTRM vector tools")

        # Test VPL for CTRM truth management
        compiler = VPLTextCompiler(cvfs_engine)
        vpl_code = """
        # CTRM truth verification VPL
        vec1 = LOAD("ctrm_vec_1")
        vec2 = LOAD("ctrm_vec_2")
        similarity = COSINE(vec1, vec2)
        distance = L2(vec1, vec2)
        IF similarity > 0.9:
            RETURN "TRUTH_CONFIRMED"
        ELSE:
            RETURN "NEEDS_VERIFICATION"
        """

        vpl_results = compiler.compile_and_run(vpl_code)
        print(f"CTRM VPL truth verification: {vpl_results}")

        # Test integration with CTRM confidence scoring
        confidence_score = similarity * 100  # Convert to percentage
        print(f"CTRM confidence score: {confidence_score:.2f}%")

        return True

    except Exception as e:
        print(f"Error in CTRM integration test: {e}")
        import traceback
        traceback.print_exc()
        return False

def main():
    """Run all tests"""
    print("CTRM Vector File System (CVFS) Implementation Test")
    print("=" * 50)
    print(f"Test started: {datetime.now().isoformat()}")

    tests = [
        ("CVFSEngine", test_cvfs_engine),
        ("VPL Compiler", test_vpl_compiler),
        ("CVFS Daemon", test_cvfs_daemon),
        ("CTRM Integration", test_integration_with_ctrm),
    ]

    results = []
    for test_name, test_func in tests:
        try:
            result = test_func()
            results.append((test_name, result))
        except Exception as e:
            print(f"Test {test_name} failed with exception: {e}")
            results.append((test_name, False))

    # Print summary
    print("\n" + "=" * 50)
    print("TEST SUMMARY")
    print("=" * 50)

    all_passed = True
    for test_name, result in results:
        status = "PASSED" if result else "FAILED"
        print(f"{test_name}: {status}")
        if not result:
            all_passed = False

    print(f"\nOverall result: {'ALL TESTS PASSED' if all_passed else 'SOME TESTS FAILED'}")
    print(f"Test completed: {datetime.now().isoformat()}")

    return all_passed

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)