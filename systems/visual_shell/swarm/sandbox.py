"""
Sandbox - Provides isolated execution environment for swarm tasks.
"""

import asyncio
import logging
import time
import traceback
from typing import Dict, Any, Callable, Optional

logger = logging.getLogger(__name__)

class Sandbox:
    """
    Executes tasks in a controlled environment with timeouts and error handling.
    """

    def __init__(self, cpu_limit: float = 1.0, memory_limit_mb: int = 512):
        self.cpu_limit = cpu_limit
        self.memory_limit_mb = memory_limit_mb
        self.active_tasks: Dict[str, asyncio.Task] = {}

        logger.info(f"Sandbox initialized: CPU={cpu_limit}, MEM={memory_limit_mb}MB")

    async def execute(self, task_func: Callable, params: Dict[str, Any], 
                      timeout: float = 30.0) -> Dict[str, Any]:
        """
        Executes a task function with a timeout and returns the result.
        """
        task_id = f"exec-{int(time.time() * 1000)}"
        
        async def wrapped_task():
            try:
                return await task_func(params)
            except Exception as e:
                logger.error(f"Task execution failed: {e}")
                raise

        exec_task = asyncio.create_task(wrapped_task())
        self.active_tasks[task_id] = exec_task

        try:
            result = await asyncio.wait_for(exec_task, timeout=timeout)
            return {
                "success": True,
                "data": result
            }
        except asyncio.TimeoutError:
            logger.warning(f"Task {task_id} timed out after {timeout}s")
            exec_task.cancel()
            return {
                "success": False,
                "error": f"TimeoutError: Task exceeded {timeout}s limit"
            }
        except asyncio.CancelledError:
            logger.info(f"Task {task_id} was cancelled")
            return {
                "success": False,
                "error": "Terminated: Task was cancelled by sandbox"
            }
        except Exception as e:
            return {
                "success": False,
                "error": f"{type(e).__name__}: {str(e)}",
                "traceback": traceback.format_exc()
            }
        finally:
            if task_id in self.active_tasks:
                del self.active_tasks[task_id]

    async def terminate(self):
        """
        Cancels all active tasks in the sandbox.
        """
        logger.info(f"Terminating {len(self.active_tasks)} active tasks")
        for task in self.active_tasks.values():
            task.cancel()
        
        if self.active_tasks:
            await asyncio.gather(*self.active_tasks.values(), return_exceptions=True)
            self.active_tasks.clear()
