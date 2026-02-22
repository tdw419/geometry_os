
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
from systems.visual_shell.swarm.coordinator_agent import CoordinatorAgent
from systems.visual_shell.swarm.health_dashboard import HealthDashboard, HealthStatus
from cryptography.hazmat.primitives.asymmetric import ed25519

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


# === Production Hardening Tests ===

class TestSwarmProduction:
    """Production hardening tests for the swarm."""

    @pytest.mark.asyncio
    async def test_coordinator_task_lifecycle(self):
        """Coordinator manages full task lifecycle."""
        coordinator = CoordinatorAgent(a2a_url="ws://localhost:8766")

        # Submit
        task_id = await coordinator.submit_task(
            task_type="scan_region",
            params={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        # Assign
        await coordinator.register_agent("agent-001", {"type": "scanner"})
        await coordinator.assign_task(task_id, "agent-001")

        # Complete
        await coordinator.complete_task(
            task_id, "agent-001",
            result={"artifacts_found": 5},
            success=True
        )

        # Verify
        assert len(coordinator.task_history) == 1
        assert coordinator.task_history[0].status == "completed"

    @pytest.mark.asyncio
    async def test_health_dashboard_stale_detection(self):
        """Dashboard detects stale agents."""
        import time as t
        dashboard = HealthDashboard(stale_threshold_seconds=1)

        dashboard.register_agent("agent-001", {"type": "scanner"})

        # Wait for stale threshold
        await asyncio.sleep(1.5)

        stale = dashboard.get_stale_agents()

        assert len(stale) == 1
        assert stale[0].agent_id == "agent-001"

    @pytest.mark.asyncio
    async def test_agent_disconnect_reassignment(self):
        """Tasks are reassigned when agents disconnect."""
        coordinator = CoordinatorAgent(a2a_url="ws://localhost:8766")

        # Setup
        task_id = await coordinator.submit_task("scan", {"x": 0})
        await coordinator.register_agent("agent-001", {})
        await coordinator.assign_task(task_id, "agent-001")

        # Disconnect
        await coordinator.unregister_agent("agent-001")

        # Task should be pending again
        assert len(coordinator.pending_tasks) == 1
        assert coordinator.pending_tasks[0].task_id == task_id

# === Security Layer Tests ===

from systems.visual_shell.swarm.auth_manager import AuthManager
from systems.visual_shell.swarm.task_signer import TaskSigner
from systems.visual_shell.swarm.sandbox import Sandbox
from systems.visual_shell.swarm.audit_logger import AuditLogger
from systems.visual_shell.swarm.security_middleware import SecurityMiddleware

class TestSwarmSecurity:
    """Security capability tests for the swarm."""

    @pytest.mark.asyncio
    async def test_security_auth_and_signing(self):
        """Verify auth and signing workflow."""
        auth = AuthManager(shared_secret="swarm-secret")
        signer = TaskSigner(private_key=ed25519.Ed25519PrivateKey.generate())
        
        # 1. Register
        token = await auth.register_agent("agent-001", "swarm-secret")
        assert token is not None
        
        # 2. Sign
        payload = {"type": "task", "action": "scan", "token": token}
        signed = await signer.sign_payload(payload)
        
        # 3. Verify
        assert await signer.verify_signature(signed, signer.public_key) is True
        assert await auth.validate_token("agent-001", token) is True

    @pytest.mark.asyncio
    async def test_security_sandbox_isolation(self):
        """Verify task isolation in sandbox."""
        sandbox = Sandbox()
        
        async def mock_task(params):
            return "ok"
            
        result = await sandbox.execute(mock_task, {})
        assert result["success"] is True
        assert result["data"] == "ok"

    @pytest.mark.asyncio
    async def test_security_audit_logging(self, tmp_path):
        """Verify security event logging."""
        log_path = str(tmp_path / "test_audit.log")
        audit = AuditLogger(log_path=log_path)
        
        await audit.log("test_event", {"data": "verified"})
        
        assert await audit.verify_integrity() is True
        events = await audit.get_events(event_type="test_event")
        assert len(events) == 1

# === Multi-Node Distribution Tests ===

from systems.visual_shell.swarm.node_registry import NodeRegistry
from systems.visual_shell.swarm.distributed_coordinator import DistributedCoordinator
from systems.visual_shell.swarm.node_health_monitor import NodeHealthMonitor
from systems.visual_shell.swarm.task_migrator import TaskMigrator

class TestSwarmDistribution:
    """Distribution capability tests for the swarm."""

    @pytest.mark.asyncio
    async def test_distribution_node_discovery(self):
        """Verify nodes can discover each other via registry."""
        registry = NodeRegistry()
        await registry.register_node("node-1", {"url": "ws://node-1"})
        await registry.register_node("node-2", {"url": "ws://node-2"})
        
        status = registry.get_cluster_status()
        assert status["total_nodes"] == 2
        assert "node-1" in status["nodes"]
        assert "node-2" in status["nodes"]

    @pytest.mark.asyncio
    async def test_distribution_load_balancing(self):
        """Verify tasks are load balanced across nodes."""
        registry = NodeRegistry()
        await registry.register_node("node-1", {"load": 10})
        await registry.register_node("node-2", {"load": 5})
        
        coord = DistributedCoordinator(node_id="leader", registry=registry)
        task_id = await coord.submit_task("task", {})
        
        target = coord.select_target_node(task_id)
        assert target == "node-2" # Lower load

    @pytest.mark.asyncio
    async def test_distribution_failover(self):
        """Verify tasks are migrated on node failure."""
        registry = NodeRegistry(heartbeat_timeout=1)
        coord = DistributedCoordinator(node_id="leader", registry=registry)
        migrator = TaskMigrator(coordinator=coord, registry=registry)
        
        await registry.register_node("node-1", {})
        task_id = await coord.submit_task("task", {})
        coord.task_node_assignments[task_id] = "node-1"
        coord.active_tasks[task_id].status = "assigned"
        
        # Simulate failure
        await registry.unregister_node("node-1")
        
        # Migrate
        await migrator.migrate_orphans()
        
        assert coord.active_tasks[task_id].status == "pending"

# === Tectonic Optimization Tests ===

from systems.visual_shell.swarm.access_analyzer import AccessAnalyzer
from systems.visual_shell.swarm.tectonic_heatmap_generator import HeatMapGenerator
from systems.visual_shell.swarm.fragmentation_detector import FragmentationDetector
from systems.visual_shell.swarm.placement_calculator import PlacementCalculator
from systems.visual_shell.swarm.migration_coordinator import MigrationCoordinator
from systems.visual_shell.swarm.verification_agent import VerificationAgent

class TestSwarmTectonic:
    """Tectonic optimization capability tests for the swarm."""

    @pytest.mark.asyncio
    async def test_tectonic_analysis_to_placement(self):
        """Verify the analysis and placement pipeline."""
        analyzer = AccessAnalyzer()
        detector = FragmentationDetector()
        calculator = PlacementCalculator()
        
        # 1. Analysis
        analyzer.record_access("file_1")
        analyzer.record_access("file_2")
        state = analyzer.get_state()
        relationships = [("file_1", "file_2", 10)]
        
        # 2. Detector
        detector.update_positions({"file_1": {"x": 0, "y": 0}, "file_2": {"x": 500, "y": 500}})
        targets = detector.get_optimization_targets(relationships)
        assert len(targets) > 0
        
        # 3. Placement
        plan = calculator.generate_plan(detector.file_positions, relationships, iterations=5)
        assert len(plan) > 0
        assert plan[0]["file_id"] in ["file_1", "file_2"]

    @pytest.mark.asyncio
    async def test_tectonic_migration_and_verification(self):
        """Verify the migration and verification pipeline."""
        coordinator = MigrationCoordinator()
        verifier = VerificationAgent()
        
        before = {"positions": {"a": {"x": 0}, "b": {"x": 100}}, "relationships": [("a", "b", 1)]}
        after = {"positions": {"a": {"x": 0}, "b": {"x": 10}}, "relationships": [("a", "b", 1)]}
        
        improvement = verifier.compare_states(before, after)
        assert improvement > 0
        
        # Simulation migration
        plan = [{"file_id": "b", "target_x": 10, "target_y": 0}]
        results = await coordinator.execute_plan(plan)
        assert results["success_count"] == 1
