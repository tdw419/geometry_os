#!/usr/bin/env python3
"""
Test script for CTRM-CVFS integration
"""

import sys
import tempfile
import shutil
sys.path.insert(0, 'src')

from vector_llm_tools.ctrm_cvfs_integration import CTRMCVFSIntegration

def test_ctrm_cvfs_integration():
    """Test CTRM-CVFS integration"""
    print("=== Testing CTRM-CVFS Integration ===")

    temp_dir = tempfile.mkdtemp()
    print(f"Using temp directory: {temp_dir}")

    try:
        # Initialize integration
        cvfs_integration = CTRMCVFSIntegration(temp_dir)

        # Store some truth vectors
        truth_vectors = {
            "truth_1": [0.8, 0.7, 0.9, 0.6],
            "truth_2": [0.7, 0.8, 0.6, 0.9],
        }

        for truth_id, vector in truth_vectors.items():
            cvfs_integration.store_truth_vector(truth_id, vector, {
                'source': 'reliable',
                'category': 'factual'
            })
            print(f"Stored truth vector {truth_id}")

        # Verify a claim
        claim_vector = [0.75, 0.75, 0.75, 0.75]
        verification = cvfs_integration.verify_truth_claim(claim_vector, "test_claim_1")

        print(f"\nTruth verification result:")
        print(f"  Status: {verification['verification']}")
        print(f"  Confidence: {verification['confidence']:.4f}")
        print(f"  Similarity: {verification['similarity']:.4f}")
        print(f"  Distance: {verification['distance']:.4f}")

        # Test CTRM VPL program
        vpl_program = """
        # CTRM truth verification VPL
        vec1 = LOAD("truth_1")
        vec2 = LOAD("truth_2")
        similarity = COSINE(vec1, vec2)
        distance = L2(vec1, vec2)
        RETURN similarity
        """

        vpl_result = cvfs_integration.run_ctrm_vpl_program(vpl_program)
        print(f"\nVPL program result: {vpl_result}")

        # Get system stats
        stats = cvfs_integration.get_ctrm_vector_stats()
        print(f"\nSystem stats: {stats}")

        # Test batch verification
        claims = [
            {"claim_id": "claim_1", "vector": [0.7, 0.7, 0.7, 0.7]},
            {"claim_id": "claim_2", "vector": [0.5, 0.5, 0.5, 0.5]},
        ]

        batch_results = cvfs_integration.batch_verify_claims(claims)
        print(f"\nBatch verification results:")
        for result in batch_results:
            print(f"  Claim {result['claim_id']}: {result['verification']['verification']}")

        print("\nCTRM-CVFS integration test completed successfully!")
        return True

    except Exception as e:
        print(f"Error in CTRM-CVFS integration test: {e}")
        import traceback
        traceback.print_exc()
        return False
    finally:
        shutil.rmtree(temp_dir)
        print(f"Cleaned up temp directory: {temp_dir}")

if __name__ == "__main__":
    success = test_ctrm_cvfs_integration()
    sys.exit(0 if success else 1)