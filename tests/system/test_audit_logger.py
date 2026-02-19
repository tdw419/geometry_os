import pytest
import os
import json
from systems.visual_shell.swarm.audit_logger import AuditLogger

class TestAuditLogger:
    """Tests for the security audit logger."""

    @pytest.fixture
    def log_path(self, tmp_path):
        return str(tmp_path / "audit.log")

    @pytest.fixture
    def logger(self, log_path):
        return AuditLogger(log_path=log_path)

    @pytest.mark.asyncio
    async def test_audit_logger_initialization(self, logger, log_path):
        """AuditLogger initializes and creates log file."""
        assert logger.log_path == log_path
        assert os.path.exists(log_path)

    @pytest.mark.asyncio
    async def test_log_event(self, logger):
        """AuditLogger records events with timestamps and details."""
        await logger.log("auth_success", {"agent_id": "agent-001"})
        
        events = await logger.get_events()
        assert len(events) == 1
        assert events[0]["event_type"] == "auth_success"
        assert events[0]["details"]["agent_id"] == "agent-001"
        assert "timestamp" in events[0]

    @pytest.mark.asyncio
    async def test_hash_chaining(self, logger):
        """AuditLogger maintains a hash chain of events."""
        await logger.log("event_1", {"data": 1})
        await logger.log("event_2", {"data": 2})
        
        events = await logger.get_events()
        assert len(events) == 2
        assert "hash" in events[0]
        assert "hash" in events[1]
        assert "prev_hash" in events[1]
        assert events[1]["prev_hash"] == events[0]["hash"]

    @pytest.mark.asyncio
    async def test_log_integrity_verification(self, logger):
        """AuditLogger can verify the integrity of the log chain."""
        await logger.log("event_1", {"data": 1})
        await logger.log("event_2", {"data": 2})
        await logger.log("event_3", {"data": 3})
        
        assert await logger.verify_integrity() is True
        
        # Tamper with the log file
        with open(logger.log_path, "r") as f:
            lines = f.readlines()
        
        data = json.loads(lines[1])
        data["details"]["data"] = 999
        lines[1] = json.dumps(data) + "\n"
        
        with open(logger.log_path, "w") as f:
            f.writelines(lines)
            
        assert await logger.verify_integrity() is False

    @pytest.mark.asyncio
    async def test_query_events(self, logger):
        """AuditLogger supports querying events by type and agent."""
        await logger.log("auth", {"agent_id": "agent-1"})
        await logger.log("task", {"agent_id": "agent-1"})
        await logger.log("auth", {"agent_id": "agent-2"})
        
        auth_events = await logger.get_events(event_type="auth")
        assert len(auth_events) == 2
        
        agent_1_events = await logger.get_events(agent_id="agent-1")
        assert len(agent_1_events) == 2
