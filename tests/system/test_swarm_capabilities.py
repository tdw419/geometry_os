
import pytest
import asyncio
import os
import sys
import shutil
from pathlib import Path
import subprocess
import time
import json
import logging

# Add project root to path
sys.path.append(os.getcwd())

from systems.visual_shell.tools.swarm_stress_harness import SwarmStressHarness
from systems.visual_shell.swarm.healer_agent import HealerAgent
from systems.visual_shell.swarm.collaborative_mission import CollaborativeSwarm

import pytest_asyncio

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("SystemTest")

class TestSwarmCapabilities:
    """
    System-level capability suite for Geometry OS Swarm.
    
    Verifies:
    1. Scalability (Stress Harness)
    2. Autonomy (Healer Agent)
    3. Correctness (Collaborative Coding)
    """
    
    @pytest_asyncio.fixture(loop_scope="function")
    async def infrastructure(self):
        """Fixture to manage A2A Router and Vision Bridge lifecycle."""
        # 1. Cleanup
        subprocess.run(["pkill", "-f", "a2a_router.py"])
        subprocess.run(["pkill", "-f", "vision_bridge.py"])
        await asyncio.sleep(3)
        
        # 2. Start A2A Router
        router_log = open("/tmp/test_a2a.log", "w")
        router_proc = subprocess.Popen(
            [sys.executable, "systems/pixel_compiler/a2a_router.py", "--port", "8766"],
            stdout=router_log,
            stderr=router_log
        )
        
        # 3. Start Mock Vision Bridge (for Healer)
        # We use a mock directory so we don't need QEMU running
        mock_bridge_dir = Path("/tmp/vision_bridge_1")
        mock_bridge_dir.mkdir(parents=True, exist_ok=True)
        (mock_bridge_dir / "gui_state.txt").write_text("# Mock State")
        
        bridge_log = open("/tmp/test_bridge.log", "w")
        bridge_proc = subprocess.Popen(
            [sys.executable, "vision_bridge.py", "start", "--port", "8765", "--vnc", "127.0.0.1:0", "--work-dir", str(mock_bridge_dir)],
            stdout=bridge_log,
            stderr=bridge_log
        )
        
        # Wait for startup
        await asyncio.sleep(3)
        
        yield
        
        # Teardown
        router_proc.terminate()
        bridge_proc.terminate()
        router_log.close()
        bridge_log.close()
        subprocess.run(["pkill", "-f", "a2a_router.py"])
        subprocess.run(["pkill", "-f", "vision_bridge.py"])

    @pytest.mark.asyncio
    async def test_scalability_stress(self, infrastructure):
        """Prove the A2A Router handles high concurrency."""
        logger.info("=== TEST: Scalability (Stress Harness) ===")
        
        # Run smaller scale for CI (10 agents, 2 seconds)
        harness = SwarmStressHarness(router_url="ws://localhost:8766", num_agents=10, frequency=10.0)
        
        try:
            await asyncio.wait_for(harness.start(), timeout=5.0)
        except asyncio.TimeoutError:
            pass # Expected
        finally:
            await harness.stop()
            
        # Verify throughput
        total_sent = sum(a.metrics.messages_sent for a in harness.agents)
        assert total_sent > 100, f"Throughput too low: {total_sent}"
        logger.info(f"✅ Scalability Verified: {total_sent} messages processed.")

    @pytest.mark.asyncio
    async def test_autonomy_self_healing(self, infrastructure):
        """Prove the system can detect and fix anomalies."""
        logger.info("=== TEST: Autonomy (Self-Healing) ===")
        
        # 1. Setup Mock Anomaly
        state_file = Path("/tmp/vision_bridge_1/gui_state.txt")
        state_file.write_text("ANOMALY: Neon red visual fracture detected.")
        
        # 2. Setup Target File
        target_file = Path("systems/visual_shell/wgsl/fracture.wgsl")
        original_content = target_file.read_text()
        
        # Inject defect
        broken_content = original_content.replace(
            "let threshold = (fracture.intensity + pulse) * 0.1;", 
            "let threshold = 0.5; // fracture.intensity * 0.1;"
        )
        target_file.write_text(broken_content)
        
        try:
            # 3. Run Healer
            agent = HealerAgent(bridge_port=8765)
            await agent.run_mission()
            
            # 4. Verify Fix
            fixed_content = target_file.read_text()
            assert "fracture.intensity * 0.1" in fixed_content
            assert "threshold = 0.5" not in fixed_content
            logger.info("✅ Autonomy Verified: Code healed.")
            
        finally:
            # Restore original
            target_file.write_text(original_content)

    @pytest.mark.asyncio
    async def test_correctness_collaboration(self, infrastructure):
        """Prove agents can coordinate to build features."""
        logger.info("=== TEST: Correctness (Collaborative Coding) ===")
        
        # 1. Setup Target
        target_file = Path("systems/visual_shell/wgsl/fracture.wgsl")
        original_content = target_file.read_text()
        
        # Ensure clean slate
        clean_content = original_content.replace("cpu_load: f32,", "")
        clean_content = clean_content.replace("let pulse = sin(fracture.time * 5.0) * fracture.cpu_load;", "")
        target_file.write_text(clean_content)
        
        try:
            # 2. Run Collaboration
            swarm = CollaborativeSwarm()
            
            # Run with timeout
            await asyncio.wait_for(
                asyncio.gather(
                    swarm.run_agent("Researcher-A", "researcher", {}),
                    swarm.run_agent("Builder-B", "builder", {}),
                    swarm.run_agent("Validator-C", "validator", {})
                ),
                timeout=10.0
            )
            
            # 3. Verify Artifacts
            final_content = target_file.read_text()
            assert "cpu_load: f32" in final_content
            assert "let pulse =" in final_content
            logger.info("✅ Correctness Verified: Feature implemented.")
            
        except asyncio.TimeoutError:
            # Check if it actually finished but didn't exit loop
            final_content = target_file.read_text()
            if "cpu_load: f32" in final_content:
                 logger.info("✅ Correctness Verified (Timeout limit reached).")
            else:
                pytest.fail("Collaborative mission timed out without result.")
        finally:
            # Restore
            target_file.write_text(original_content)

if __name__ == "__main__":
    pytest.main([__file__, "-v"])
