from unittest.mock import patch

import pytest

from systems.evolution_daemon.safety.data_structures import ASCIIFrame, EvolutionProposal
from systems.evolution_daemon.safety.dream_engine import DreamEngine
from systems.evolution_daemon.safety.fracture_detector import FractureDetector
from systems.evolution_daemon.safety.sandbox_manager import SandboxManager
from systems.evolution_daemon.safety.trauma_log import GeneticTrauma, TraumaLog


@pytest.fixture
def temp_project_root(tmp_path):
    # Setup necessary directories
    (tmp_path / ".geometry/ascii_scene").mkdir(parents=True)
    (tmp_path / ".loop").mkdir(parents=True)

    # Create a dummy shell_fragments.ascii
    fragments = tmp_path / ".geometry/ascii_scene/shell_fragments.ascii"
    fragments.write_text("- id: win1\nx: 10\ny: 10\nwidth: 100\nheight: 100\n")

    return tmp_path

@pytest.mark.asyncio
async def test_dream_simulation_preempts_fracture(temp_project_root):
    # 1. Setup components
    sandbox_manager = SandboxManager(sandbox_base=str(temp_project_root / "sandboxes"))

    # Need to point FD to the temp project root
    fd = FractureDetector()
    fd._project_root = temp_project_root

    dream_engine = DreamEngine(sandbox_manager, project_root=temp_project_root)
    trauma_log = TraumaLog(project_root=temp_project_root)

    # 2. Create a proposal that would cause a fracture (large drift)
    proposal = EvolutionProposal(
        proposal_id="test-fracture-001",
        goal="Test fracture detection",
        target_files=["dummy.py"],
        diff_content="+ # Some change"
    )

    # 3. Mock run_dream_frame to return a frame with large drift
    # Baseline has x: 10, y: 10. Dream has x: 600, y: 600.
    dream_frame = ASCIIFrame(
        timestamp=1000.0,
        window_count=1,
        windows=[{"id": "win1", "x": 600, "y": 600, "width": 100, "height": 100}]
    )

    # We also need to patch FractureDetector within DreamEngine because it imports it
    # But since DreamEngine imports it locally, we need to be careful.

    with patch('systems.evolution_daemon.safety.sandbox_manager.SandboxManager.apply_diff', return_value=True):
        with patch('systems.evolution_daemon.safety.sandbox_manager.SandboxManager.run_dream_frame', return_value=dream_frame):
            with patch('systems.evolution_daemon.safety.fracture_detector.FractureDetector.predict_fracture') as mock_predict:
                # Calculate actual drift for expectations (or just mock the score)
                # Baseline: (10, 10). Dream: (600, 600). dx=590, dy=590. distance=834.3.
                # MAX_POSITION_DELTA=500. drift = 1.0.
                mock_predict.return_value = 1.0

                # 4. Simulate dream
                # Note: DreamEngine.simulate_dream creates its own FractureDetector instance
                # So we MUST patch the class.

                frame, reflex_score = await dream_engine.simulate_dream(proposal)

                # 5. Verify fracture was predicted
                assert reflex_score == 1.0
                assert frame == dream_frame

                # 6. Record trauma if score is high
                if reflex_score > 0.3:
                    trauma = GeneticTrauma(
                        proposal_id=proposal.proposal_id,
                        timestamp=1000.0,
                        reflex_score=reflex_score,
                        target_files=proposal.target_files,
                        diff_summary="Large window teleport",
                        fracture_signal="window_teleport"
                    )
                    trauma_log.record_trauma(trauma)

    # 7. Verify trauma was recorded
    recent_trauma = trauma_log.get_recent_trauma()
    assert len(recent_trauma) == 1
    assert recent_trauma[0].proposal_id == "test-fracture-001"
    assert recent_trauma[0].reflex_score == 1.0
