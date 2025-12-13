import numpy as np # Import numpy
import os
import sqlite3
import unittest
import json
from unittest.mock import patch, MagicMock

# Assuming KnowledgeDistiller and VectorStateMachine are in runtime/
# and the UDFs are registered via KnowledgeDistiller
from runtime.knowledge_distiller import KnowledgeDistiller
from runtime.vector_state_machine import VectorStateMachine
from substrate.vector_db import VectorSubstrate

class TestGhostInTheShellTrifecta(unittest.TestCase):
    def setUp(self):
        self.db_path = ":memory:" # Use in-memory database for testing
        self.kdb_path = ":memory:" # Use in-memory database for testing
        self.k_distiller = KnowledgeDistiller(db_path=self.kdb_path)
        self.vsm = VectorStateMachine(db_path=self.db_path, knowledge_distiller=self.k_distiller)
        
        # Integrate KnowledgeDistiller UDFs with VSM's connection
        self.vsm.integrate_with_knowledge_distiller(self.k_distiller)

    def tearDown(self):
        self.k_distiller.close()
        self.vsm.close()

    def test_cogito_ergo_sum_learning_loop(self):
        """
        Tests the entire cognitive loop: VSM sets a goal, uses SQL UDFs for learning
        (probing, oracle interrogation, crystallization), and verifies knowledge.
        """
        concept_to_learn = "The Concept of Zero"
        domain = "Mathematics"

        # Enable SQL-driven distillation on k_distiller to register UDFs
        self.k_distiller.enable_sql_driven_distillation()

        # Mock LLM calls to prevent actual external API calls during testing
        # Mocking generate_probes_sync on the MockLLM client within k_distiller
        mock_probes_json = json.dumps(["What is zero?", "History of zero?", "Importance of zero?"])
        with patch.object(self.k_distiller.llm_client, 'generate_probes_sync', return_value=json.loads(mock_probes_json)):
            # Mocking interrogate_oracle_sync on the MockLLM client within k_distiller
            with patch.object(self.k_distiller.llm_client, 'interrogate_oracle_sync', side_effect=[
                "Zero is a number representing an empty quantity.",
                "The concept of zero originated independently in various cultures.",
                "Zero is fundamental for place-value systems and calculus."
            ]):
                # Mocking _create_embedding directly on k_distiller
                with patch.object(self.k_distiller, '_create_embedding', return_value=np.array([0.1]*128, dtype=np.float32)): # Dummy embedding as numpy array
                    # Mocking VSM state transitions
                    # For simplicity, we'll manually drive the VSM states
                    # In a real scenario, the VSM would transition based on SQL similarity
                    
                    # self.vsm.set_goal(f"Learn about '{concept_to_learn}' in the domain '{domain}'") # Removed as VSM does not have set_goal
                    
                    # 1. Probe Generation (VSM would trigger this via a state)
                    # Simulate VSM state calling LLM_GENERATE_PROBES UDF
                    probes_result = self.vsm.conn.execute("SELECT LLM_GENERATE_PROBES(?, ?)", (concept_to_learn, 3)).fetchone()[0]
                    probes = json.loads(probes_result)
                    self.assertIsInstance(probes, list)
                    self.assertGreater(len(probes), 0)
                    print(f"Generated Probes: {probes}")

                    # 2. Oracle Interrogation & Knowledge Distillation
                    # Simulate VSM iterating through probes and distilling knowledge
                    for probe in probes:
                        # Call LLM_GENERATE UDF
                        llm_response = self.vsm.conn.execute("SELECT LLM_GENERATE(?)", (probe,)).fetchone()[0]
                        self.assertIsInstance(llm_response, str)
                        self.assertGreater(len(llm_response), 0)
                        print(f"LLM Response for '{probe}': {llm_response[:50]}...")

                        # Call DISTILL_KNOWLEDGE UDF to crystallize
                        distill_result = self.vsm.conn.execute(
                            "SELECT DISTILL_KNOWLEDGE(?, ?, ?)",
                            (domain, concept_to_learn, llm_response)
                        ).fetchone()[0]
                        self.assertIsNotNone(distill_result)
                        print(f"Distillation Result: {distill_result}")

        # 3. Verification: Check if the knowledge was crystallized in the knowledge_distiller's DB
        # This checks the internal state of k_distiller's DB, as the UDF writes to it.
        knowledge_exists_query = """
            SELECT COUNT(*) FROM knowledge_vectors
            WHERE domain = ? AND concept = ?
        """
        cursor = self.k_distiller.conn.execute(knowledge_exists_query, (domain, concept_to_learn))
        count = cursor.fetchone()[0]
        self.assertGreater(count, 0, f"Knowledge for '{concept_to_learn}' should exist in the database.")
        print(f"Successfully verified that '{concept_to_learn}' has been crystallized.")

if __name__ == '__main__':
    unittest.main()
