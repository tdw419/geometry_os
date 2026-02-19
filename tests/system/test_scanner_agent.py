# tests/system/test_scanner_agent.py
import pytest
import tempfile
from pathlib import Path
from systems.visual_shell.swarm.scanner_agent import ScannerAgent

class TestScannerAgent:
    """Tests for the catalog scanner agent."""

    def test_scanner_initialization(self):
        """Scanner initializes with region assignment."""
        scanner = ScannerAgent(
            agent_id="scanner-001",
            region={"x": 0, "y": 0, "width": 100, "height": 100}
        )

        assert scanner.region["x"] == 0
        assert scanner.scanned_count == 0

    @pytest.mark.asyncio
    async def test_scanner_processes_region(self):
        """Scanner can process a region and report results."""
        scanner = ScannerAgent(
            agent_id="scanner-001",
            region={"x": 0, "y": 0, "width": 10, "height": 10}
        )

        result = await scanner.scan_region()

        assert result.scanned_at > 0
        assert "artifacts_found" in result.__dict__
        assert scanner.scanned_count == 1

    @pytest.mark.asyncio
    async def test_scanner_finds_artifacts(self):
        """Scanner finds .rts.png files in catalog."""
        with tempfile.TemporaryDirectory() as tmpdir:
            # Create test artifacts
            for i in range(3):
                test_file = Path(tmpdir) / f"artifact_{i}.rts.png"
                test_file.write_bytes(b"fake png data " * 100)

            scanner = ScannerAgent(
                agent_id="scanner-001",
                region={"x": 0, "y": 0, "width": 100, "height": 100},
                catalog_path=tmpdir
            )

            result = await scanner.scan_region()

            assert len(result.artifacts_found) == 3
            assert all("sha256" in a for a in result.artifacts_found)

    @pytest.mark.asyncio
    async def test_scanner_computes_hash(self):
        """Scanner computes SHA256 hash of artifacts."""
        with tempfile.TemporaryDirectory() as tmpdir:
            test_file = Path(tmpdir) / "test.rts.png"
            test_file.write_bytes(b"known content for hashing")

            scanner = ScannerAgent(
                agent_id="scanner-001",
                region={"x": 0, "y": 0, "width": 100, "height": 100},
                catalog_path=tmpdir
            )

            result = await scanner.scan_region()

            assert len(result.artifacts_found) == 1
            assert len(result.artifacts_found[0]["sha256"]) == 64  # SHA256 hex length
