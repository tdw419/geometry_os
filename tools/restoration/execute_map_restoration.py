"""
execute_map_restoration.py - Production Execution of "The Great Map Restoration"
Runs the distributed swarm to reorganize the Geometry OS infinite map.
"""

import asyncio
import logging
import sys
import os
from systems.visual_shell.swarm.restoration_orchestrator import RestorationOrchestrator
from systems.visual_shell.swarm.restoration_substrate import RestorationSubstrate
from systems.visual_shell.swarm.scanner_swarm import ScannerSwarm
from systems.visual_shell.swarm.cognitive_clustering import CognitiveClusteringEngine
from systems.visual_shell.swarm.restoration_executor import RestorationExecutor
from systems.visual_shell.swarm.verification_agent import VerificationAgent

# Configure logging
if not os.path.exists('logs'):
    os.makedirs('logs')

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(name)s: %(message)s',
    handlers=[
        logging.StreamHandler(sys.stdout),
        logging.FileHandler('logs/restoration_mission.log')
    ]
)
logger = logging.getLogger("RestorationMission")

async def run_mission():
    print("\n" + "="*60)
    print("🌍 THE GREAT MAP RESTORATION - PRODUCTION EXECUTION")
    print("="*60 + "\n")

    # 1. Initialize Substrate and Components
    substrate = RestorationSubstrate()
    orchestrator = RestorationOrchestrator()
    scanner = ScannerSwarm(node_count=1, agents_per_node=10) # Using local nodes for this execution
    engine = CognitiveClusteringEngine()
    executor = RestorationExecutor(substrate=substrate)
    verifier = VerificationAgent()

    # 2. Mission Setup
    results = {}

    # Phase 1: Distributed Scan
    async def run_scan():
        logger.info("📡 Phase 1: Scanning Map Substrate...")
        substrate.load()
        found = substrate.get_artifacts()
        results["found"] = scanner.consolidate_results([found])
        logger.info(f"✅ Found {len(results['found'])} artifacts on the map.")
        return True

    # Phase 2: Cognitive Analysis
    async def run_analysis():
        logger.info("🧠 Phase 2: Cognitive Clustering via Collective Consciousness...")
        artifacts = results["found"]
        
        # Determine clusters
        cluster_sets = engine.cluster_artifacts(artifacts)
        clusters = []
        for c_set in cluster_sets:
            c_list = list(c_set)
            # In production, we'd use the Consciousness Engine to determine categories
            # For this execution, we'll use metadata-based defaults
            category = "code" if any("rts.png" in a for a in c_list) else "system"
            clusters.append({"ids": c_list, "category": category})
            
        results["plan"] = engine.generate_plan(clusters)
        logger.info(f"✅ Generated ClusterPlan for {len(results['plan'])} artifacts.")
        return True

    # Phase 3: Tectonic Execution
    async def run_execution():
        logger.info("🏗️ Phase 3: Executing Tectonic Migrations...")
        
        # 1. Backup current state
        if not substrate.backup():
            logger.error("Failed to backup manifest. Aborting execution for safety.")
            return False
            
        # 2. Execute moves
        plan = executor.create_tectonic_plan(results["plan"])
        initial_positions = {a["id"]: {"x": a["x"], "y": a["y"]} for a in results["found"]}
        
        results["migration"] = await executor.execute_tectonic_plan(
            plan, 
            batch_size=2, # Slow and steady for production
            initial_positions=initial_positions
        )
        
        logger.info(f"✅ Migration Result: {results['migration']}")
        return results["migration"]["failure"] == 0

    # Phase 4: Visual Oversight
    async def run_oversight():
        logger.info("🔭 Phase 4: Visual Verification & Reporting...")
        
        # Compute final score
        final_positions = {k: {"x": v["x"], "y": v["y"]} for k, v in results["plan"].items()}
        
        # Relationships (same type = related)
        relationships = []
        artifacts = results["found"]
        for i in range(len(artifacts)):
            for j in range(i+1, len(artifacts)):
                # Simple relation: if they have the same extension or prefix
                type_i = artifacts[i]["id"].split('.')[-1]
                type_j = artifacts[j]["id"].split('.')[-1]
                if type_i == type_j:
                    relationships.append((artifacts[i]["id"], artifacts[j]["id"], 5))
        
        initial_pos_map = {a["id"]: {"x": a["x"], "y": a["y"]} for a in artifacts}
        
        score_before = verifier.compute_system_score({"positions": initial_pos_map, "relationships": relationships})
        score_after = verifier.compute_system_score({"positions": final_positions, "relationships": relationships})
        
        improvement = (score_after - score_before) / score_before if score_before > 0 else 0
        
        verifier.record_optimization("production-restoration-1", score_before, score_after)
        
        print("\n" + "-"*40)
        print(f"📊 RESTORATION REPORT")
        print(f"Initial Locality: {score_before:.3f}")
        print(f"Final Locality:   {score_after:.3f}")
        print(f"IMPROVEMENT:      {improvement*100:.1f}%")
        print("-"*40 + "\n")
        
        return True

    # Assign functions to orchestrator
    orchestrator.phases[0].execute_func = run_scan
    orchestrator.phases[1].execute_func = run_analysis
    orchestrator.phases[2].execute_func = run_execution
    orchestrator.phases[3].execute_func = run_oversight

    # 3. Execution
    success = await orchestrator.start_mission()
    
    if success:
        print("🎉 THE GREAT MAP RESTORATION WAS SUCCESSFUL!")
    else:
        print("❌ MISSION FAILED. Check logs/restoration_mission.log")
        print("   Run 'python3 execute_map_restoration.py --rollback' to undo.")

if __name__ == "__main__":
    if "--rollback" in sys.argv:
        sub = RestorationSubstrate()
        if sub.restore_from_backup():
            print("✅ Successfully rolled back map to previous state.")
        else:
            print("❌ Rollback failed. No backup found.")
    else:
        asyncio.run(run_mission())
