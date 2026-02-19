import pytest
import asyncio
import numpy as np
from systems.visual_shell.swarm.restoration_orchestrator import RestorationOrchestrator
from systems.visual_shell.swarm.scanner_swarm import ScannerSwarm
from systems.visual_shell.swarm.cognitive_clustering import CognitiveClusteringEngine
from systems.visual_shell.swarm.restoration_executor import RestorationExecutor
from systems.visual_shell.swarm.verification_agent import VerificationAgent

class TestRestorationE2E:
    """End-to-end tests for the Great Map Restoration mission."""

    @pytest.mark.asyncio
    async def test_synthetic_restoration_flow(self):
        """Verify full restoration cycle with synthetic map data."""
        orchestrator = RestorationOrchestrator()
        scanner = ScannerSwarm(node_count=1, agents_per_node=5)
        engine = CognitiveClusteringEngine()
        executor = RestorationExecutor()
        verifier = VerificationAgent()
        
        # 1. Setup Synthetic Fragmented Map
        # 100 artifacts randomly scattered
        initial_positions = {
            f"art-{i}": {
                "x": np.random.rand() * 1000, 
                "y": np.random.rand() * 1000,
                "type": "code" if i < 50 else "data"
            } for i in range(100)
        }
        
        # 2. Define Phase Execution Logic
        results = {}

        async def run_scan():
            found = [{"id": k, **v} for k, v in initial_positions.items()]
            results["found"] = scanner.consolidate_results([found])
            return True

        async def run_analysis():
            artifacts = results["found"]
            clusters = []
            for cluster_set in engine.cluster_artifacts(artifacts):
                cluster_list = list(cluster_set)
                clusters.append({
                    "ids": cluster_list,
                    "category": "code" if "art-0" in cluster_list else "db"
                })
            results["plan"] = engine.generate_plan(clusters)
            return True

        async def run_execution():
            plan = executor.create_tectonic_plan(results["plan"])
            results["migration"] = await executor.execute_tectonic_plan(plan, initial_positions=initial_positions)
            return results["migration"]["success"] > 0

        orchestrator.phases[0].execute_func = run_scan
        orchestrator.phases[1].execute_func = run_analysis
        orchestrator.phases[2].execute_func = run_execution
        
        # 3. Start Mission
        success = await orchestrator.start_mission()
        
        assert success is True
        assert orchestrator.state == "completed"
        assert len(results["found"]) == 100
        assert results["migration"]["success"] == 100
        
        # 4. Verify Improvement
        # Get final positions (mocked by executor implementation in this test scope)
        final_positions = {k: {"x": v["x"], "y": v["y"]} for k, v in results["plan"].items()}
        
        # Relationships: artifacts of same type are related
        relationships = []
        for i in range(0, 50, 5):
            relationships.append((f"art-{i}", f"art-{i+1}", 10))
            
        before_score = verifier.compute_system_score({"positions": initial_positions, "relationships": relationships})
        after_score = verifier.compute_system_score({"positions": final_positions, "relationships": relationships})
        
        assert after_score > before_score
        print(f"E2E Improvement: {(after_score - before_score)/before_score * 100:.1f}%")
