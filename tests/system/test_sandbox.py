import pytest
import asyncio
import time
from systems.visual_shell.swarm.sandbox import Sandbox

class TestSandbox:
    """Tests for the agent task sandbox."""

    @pytest.fixture
    def sandbox(self):
        return Sandbox(cpu_limit=0.5, memory_limit_mb=100)

    @pytest.mark.asyncio
    async def test_sandbox_initialization(self, sandbox):
        """Sandbox initializes with resource limits."""
        assert sandbox.cpu_limit == 0.5
        assert sandbox.memory_limit_mb == 100

    @pytest.mark.asyncio
    async def test_sandbox_execution_success(self, sandbox):
        """Sandbox successfully executes a valid task."""
        async def mock_task(params):
            return {"result": params["data"].upper()}
        
        result = await sandbox.execute(mock_task, {"data": "hello"})
        
        assert result["success"] is True
        assert result["data"]["result"] == "HELLO"

    @pytest.mark.asyncio
    async def test_sandbox_execution_timeout(self, sandbox):
        """Sandbox terminates tasks that exceed the timeout."""
        async def long_task(params):
            await asyncio.sleep(2)
            return {"done": True}
        
        # Override timeout for test
        result = await sandbox.execute(long_task, {}, timeout=1)
        
        assert result["success"] is False
        assert "Timeout" in result["error"]

    @pytest.mark.asyncio
    async def test_sandbox_execution_failure_capture(self, sandbox):
        """Sandbox captures exceptions during task execution."""
        async def failing_task(params):
            raise ValueError("Something went wrong")
        
        result = await sandbox.execute(failing_task, {})
        
        assert result["success"] is False
        assert "ValueError" in result["error"]

    @pytest.mark.asyncio
    async def test_sandbox_graceful_termination(self, sandbox):
        """Sandbox gracefully terminates tasks when requested."""
        task_started = asyncio.Event()
    
        async def cancellable_task(params):
            task_started.set()
            await asyncio.sleep(10)
            return {"done": False}
    
        # Start execution
        execution_task = asyncio.create_task(sandbox.execute(cancellable_task, {}))
    
        await task_started.wait()
    
        # Terminate
        await sandbox.terminate()
    
        result = await execution_task
        assert result["success"] is False
        assert "Terminated" in result["error"]
