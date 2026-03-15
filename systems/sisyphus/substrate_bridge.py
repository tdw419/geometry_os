"""
Substrate Bridge - Connects gpu_dev_daemon to Sisyphus brain.

This module provides the bridge between:
- gpu_dev_daemon (Rust/WGPU substrate on port 8769)
- Sisyphus daemon (Python evolution system)
- LM Studio (local LLM for reasoning)

The bridge enables:
1. Reading GPU memory state for brain fitness evaluation
2. Writing evolved bytecode back to substrate
3. Creating a feedback loop: GPU → Brain → LLM → GPU

Architecture:
┌─────────────────┐     ┌──────────────────┐     ┌─────────────────┐
│  gpu_dev_daemon │ ←─→ │ substrate_bridge │ ←─→ │   LM Studio     │
│  (GPU Memory)   │     │   (this file)    │     │  (Reasoning)    │
└─────────────────┘     └──────────────────┘     └─────────────────┘
         ↑                                                │
         └────────────────────────────────────────────────┘
                      (Evolved Bytecode)

Created: 2026-03-15 (Pi Session Analyzer)
"""

import os
import json
import logging
import asyncio
import aiohttp
from dataclasses import dataclass
from typing import Any, Dict, List, Optional, Tuple

logger = logging.getLogger(__name__)

# Configuration
DAEMON_URL = os.getenv("GEOS_DAEMON_URL", "http://127.0.0.1:8769")
DAEMON_TIMEOUT = float(os.getenv("GEOS_DAEMON_TIMEOUT", "5.0"))


@dataclass
class SubstrateState:
    """Snapshot of substrate state from GPU."""
    pc: int  # Program counter
    registers: List[int]  # Register values
    uart_output: str  # Console output
    memory_sample: Dict[int, int]  # addr -> value samples
    timestamp: float


class SubstrateBridge:
    """
    Bridge between gpu_dev_daemon and Sisyphus brain.
    
    Provides:
    - Memory read/write via HTTP API
    - State snapshots for fitness evaluation
    - Bytecode patching for evolution
    """
    
    def __init__(self, daemon_url: str = None, timeout: float = None):
        self.daemon_url = (daemon_url or DAEMON_URL).rstrip("/")
        self.timeout = timeout or DAEMON_TIMEOUT
        self._session: Optional[aiohttp.ClientSession] = None
        self._available: Optional[bool] = None
    
    async def _get_session(self) -> aiohttp.ClientSession:
        """Get or create HTTP session."""
        if self._session is None or self._session.closed:
            self._session = aiohttp.ClientSession(
                timeout=aiohttp.ClientTimeout(total=self.timeout)
            )
        return self._session
    
    async def is_available(self) -> bool:
        """Check if gpu_dev_daemon is running."""
        if self._available is not None:
            return self._available
        
        try:
            session = await self._get_session()
            # Try a simple peek at address 0
            async with session.get(f"{self.daemon_url}/peek?addr=0&size=1") as resp:
                self._available = resp.status == 200
                return self._available
        except Exception as e:
            logger.debug(f"gpu_dev_daemon not available: {e}")
            self._available = False
            return False
    
    async def peek(self, addr: int, size: int = 1) -> List[int]:
        """
        Read memory from substrate.
        
        Args:
            addr: Hilbert address to read (0x0000 to 0xFFFFFF)
            size: Number of 32-bit words to read
        
        Returns:
            List of 32-bit values
        """
        session = await self._get_session()
        
        try:
            url = f"{self.daemon_url}/peek?addr=0x{addr:04x}&size={size}"
            async with session.get(url) as resp:
                if resp.status != 200:
                    raise RuntimeError(f"Peek failed: HTTP {resp.status}")
                
                text = await resp.text()
                # Parse hex values: "12345678 abcdef00 ..."
                values = [int(x, 16) for x in text.strip().split()]
                return values
        except Exception as e:
            logger.error(f"Peek error at 0x{addr:04x}: {e}")
            raise
    
    async def poke(self, addr: int, values: List[int]) -> bool:
        """
        Write memory to substrate (if supported by daemon).
        
        Note: gpu_dev_daemon may need /poke endpoint added.
        For now, this returns False to indicate not implemented.
        
        Args:
            addr: Hilbert address to write
            values: List of 32-bit values to write
        
        Returns:
            True if successful
        """
        # TODO: gpu_dev_daemon needs /poke endpoint
        logger.warning("Poke not implemented in gpu_dev_daemon yet")
        return False
    
    async def load_substrate(self, image_path: str) -> bool:
        """
        Load a new substrate image into GPU memory.
        
        Args:
            image_path: Path to .rts.png or .png file
        
        Returns:
            True if successful
        """
        session = await self._get_session()
        
        try:
            # POST /load with path in body
            async with session.post(
                f"{self.daemon_url}/load",
                data=image_path
            ) as resp:
                if resp.status == 200:
                    logger.info(f"Loaded substrate: {image_path}")
                    return True
                else:
                    error = await resp.text()
                    logger.error(f"Load failed: {error}")
                    return False
        except Exception as e:
            logger.error(f"Load error: {e}")
            return False
    
    async def pause_vms(self) -> bool:
        """Pause all VMs in the substrate."""
        session = await self._get_session()
        
        try:
            async with session.get(f"{self.daemon_url}/pause") as resp:
                return resp.status == 200
        except Exception as e:
            logger.error(f"Pause error: {e}")
            return False
    
    async def get_state(self) -> SubstrateState:
        """
        Get a complete state snapshot from the substrate.
        
        Reads:
        - PC and status flags (0x14000)
        - Registers (0x14100)
        - UART output (0x0200)
        - Sample memory regions
        
        Returns:
            SubstrateState with all captured data
        """
        import time
        timestamp = time.time()
        
        try:
            # Read PC region
            pc_data = await self.peek(0x14000, 16)
            pc = pc_data[0] if pc_data else 0
            
            # Read registers
            reg_data = await self.peek(0x14100, 64)
            
            # Read UART
            uart_data = await self.peek(0x0200, 64)
            uart_output = self._decode_uart(uart_data)
            
            # Sample key memory regions
            memory_sample = {}
            for addr in [0x0000, 0x1000, 0x2000, 0x4000, 0x8000]:
                try:
                    vals = await self.peek(addr, 4)
                    memory_sample[addr] = vals[0] if vals else 0
                except:
                    pass
            
            return SubstrateState(
                pc=pc,
                registers=reg_data,
                uart_output=uart_output,
                memory_sample=memory_sample,
                timestamp=timestamp
            )
        except Exception as e:
            logger.error(f"State capture error: {e}")
            return SubstrateState(
                pc=0,
                registers=[0] * 64,
                uart_output="",
                memory_sample={},
                timestamp=timestamp
            )
    
    def _decode_uart(self, values: List[int]) -> str:
        """Decode UART output from 32-bit values."""
        chars = []
        for val in values:
            if val == 0:
                continue
            # Extract bytes from 32-bit word
            for shift in [0, 8, 16, 24]:
                byte = (val >> shift) & 0xFF
                if 32 <= byte < 127 or byte in [10, 13]:  # printable or newline
                    chars.append(chr(byte))
        return "".join(chars)
    
    async def close(self):
        """Close the HTTP session."""
        if self._session and not self._session.closed:
            await self._session.close()
            self._session = None


class SubstrateAwareBrain:
    """
    Sisyphus brain that uses substrate state for fitness evaluation.
    
    Integrates:
    - SubstrateBridge (GPU memory access)
    - LMStudioClient (reasoning)
    - SisyphusBrain (evolution logic)
    """
    
    def __init__(
        self,
        substrate: SubstrateBridge = None,
        lm_client=None  # LMStudioClient
    ):
        self.substrate = substrate or SubstrateBridge()
        self.lm_client = lm_client
        self._last_state: Optional[SubstrateState] = None
        self._fitness_history: List[float] = []
    
    async def evaluate_fitness(self) -> float:
        """
        Evaluate current substrate fitness.
        
        Metrics:
        - PC progress (is it advancing?)
        - UART activity (is there output?)
        - Memory coherence (are values reasonable?)
        
        Returns:
            Fitness score 0.0-1.0
        """
        if not await self.substrate.is_available():
            return 0.0
        
        state = await self.substrate.get_state()
        self._last_state = state
        
        score = 0.0
        
        # PC progress (0.3 weight)
        if state.pc > 0:
            score += 0.3
        
        # Register activity (0.2 weight)
        nonzero_regs = sum(1 for r in state.registers if r != 0)
        reg_ratio = nonzero_regs / max(len(state.registers), 1)
        score += 0.2 * min(reg_ratio * 2, 1.0)
        
        # UART output (0.3 weight)
        if state.uart_output:
            output_len = len(state.uart_output)
            score += 0.3 * min(output_len / 100, 1.0)
        
        # Memory coherence (0.2 weight)
        if state.memory_sample:
            # Check if memory has varied values (not all zeros or same value)
            unique_vals = len(set(state.memory_sample.values()))
            score += 0.2 * min(unique_vals / len(state.memory_sample), 1.0)
        
        self._fitness_history.append(score)
        return score
    
    async def get_llm_evaluation(self) -> Dict[str, Any]:
        """
        Get LLM evaluation of current substrate state.
        
        Returns:
            Dict with LLM's analysis and suggestions
        """
        if not self.lm_client:
            return {"error": "No LM client configured"}
        
        if not self._last_state:
            await self.evaluate_fitness()
        
        state = self._last_state
        fitness = self._fitness_history[-1] if self._fitness_history else 0.0
        
        prompt = f"""Analyze this GPU substrate state and suggest improvements.

Substrate State:
- PC: 0x{state.pc:08x}
- Active Registers: {sum(1 for r in state.registers if r != 0)}/64
- UART Output: {state.uart_output[:200] if state.uart_output else "(none)"}
- Memory Sample: {json.dumps({f"0x{k:04x}": f"0x{v:08x}" for k, v in list(state.memory_sample.items())[:5]})}
- Current Fitness: {fitness:.4f}

Provide:
1. Analysis of current state
2. Suggested improvements
3. Priority actions

Respond in JSON format:
{{"analysis": "...", "suggestions": ["..."], "priority_actions": ["..."]}}"""

        result = await self.lm_client.chat_completion(
            messages=[{"role": "user", "content": prompt}],
            max_tokens=512,
            temperature=0.5
        )
        
        if result.success:
            try:
                content = result.content.strip()
                if "```json" in content:
                    content = content.split("```json")[1].split("```")[0]
                return json.loads(content)
            except json.JSONDecodeError:
                return {"analysis": result.content, "suggestions": [], "priority_actions": []}
        
        return {"error": result.error}
    
    async def evolution_loop(self, iterations: int = 10) -> List[Dict[str, Any]]:
        """
        Run evolution loop: evaluate → analyze → improve.
        
        Args:
            iterations: Number of evolution cycles
        
        Returns:
            List of evolution step results
        """
        results = []
        
        for i in range(iterations):
            # Evaluate current state
            fitness = await self.evaluate_fitness()
            
            # Get LLM analysis
            analysis = await self.get_llm_evaluation()
            
            step_result = {
                "iteration": i,
                "fitness": fitness,
                "analysis": analysis,
                "timestamp": self._last_state.timestamp if self._last_state else 0
            }
            results.append(step_result)
            
            logger.info(f"Evolution step {i}: fitness={fitness:.4f}")
            
            # Small delay between iterations
            await asyncio.sleep(1.0)
        
        return results


# Singleton for daemon use
_bridge: Optional[SubstrateBridge] = None
_brain: Optional[SubstrateAwareBrain] = None


def get_substrate_bridge() -> SubstrateBridge:
    """Get singleton substrate bridge."""
    global _bridge
    if _bridge is None:
        _bridge = SubstrateBridge()
    return _bridge


def get_substrate_aware_brain(lm_client=None) -> SubstrateAwareBrain:
    """Get singleton substrate-aware brain."""
    global _brain
    if _brain is None:
        from systems.sisyphus.lm_studio_client import get_lm_studio_client
        _brain = SubstrateAwareBrain(
            substrate=get_substrate_bridge(),
            lm_client=lm_client or get_lm_studio_client()
        )
    return _brain
