#!/usr/bin/env python3
"""
Test script for Substrate Bridge integration.

Tests:
1. Connection to gpu_dev_daemon
2. Memory peek operations
3. State capture
4. Fitness evaluation
5. LM Studio integration (if available)

Usage:
    python3 test_substrate_bridge.py

Prerequisites:
    - gpu_dev_daemon running on port 8769
    - (Optional) LM Studio running on port 1234
"""

import asyncio
import sys
import logging
from pathlib import Path

# Add parent to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.sisyphus.substrate_bridge import (
    SubstrateBridge,
    SubstrateAwareBrain,
    get_substrate_bridge
)
from systems.sisyphus.lm_studio_client import get_lm_studio_client

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)


async def test_daemon_connection():
    """Test connection to gpu_dev_daemon."""
    print("\n=== Test 1: Daemon Connection ===")
    
    bridge = SubstrateBridge()
    available = await bridge.is_available()
    
    if available:
        print("✓ gpu_dev_daemon is available")
    else:
        print("✗ gpu_dev_daemon not available (start with: cargo run --release --bin gpu_dev_daemon)")
    
    await bridge.close()
    return available


async def test_memory_peek():
    """Test memory peek operations."""
    print("\n=== Test 2: Memory Peek ===")
    
    bridge = SubstrateBridge()
    
    if not await bridge.is_available():
        print("✗ Skipping - daemon not available")
        await bridge.close()
        return False
    
    # Peek at address 0
    try:
        values = await bridge.peek(0x0000, 4)
        print(f"✓ Peek at 0x0000: {[f'0x{v:08x}' for v in values]}")
    except Exception as e:
        print(f"✗ Peek failed: {e}")
        await bridge.close()
        return False
    
    # Peek at PC region
    try:
        pc_data = await bridge.peek(0x14000, 4)
        print(f"✓ Peek at PC (0x14000): {[f'0x{v:08x}' for v in pc_data]}")
    except Exception as e:
        print(f"✗ PC peek failed: {e}")
    
    await bridge.close()
    return True


async def test_state_capture():
    """Test full state capture."""
    print("\n=== Test 3: State Capture ===")
    
    bridge = SubstrateBridge()
    
    if not await bridge.is_available():
        print("✗ Skipping - daemon not available")
        await bridge.close()
        return False
    
    state = await bridge.get_state()
    
    print(f"  PC: 0x{state.pc:08x}")
    print(f"  Registers: {len(state.registers)} values")
    print(f"  UART: {state.uart_output[:50] if state.uart_output else '(empty)'}")
    print(f"  Memory samples: {len(state.memory_sample)} addresses")
    print(f"✓ State captured successfully")
    
    await bridge.close()
    return True


async def test_fitness_evaluation():
    """Test fitness evaluation."""
    print("\n=== Test 4: Fitness Evaluation ===")
    
    bridge = SubstrateBridge()
    brain = SubstrateAwareBrain(substrate=bridge)
    
    if not await bridge.is_available():
        print("✗ Skipping - daemon not available")
        await bridge.close()
        return False
    
    fitness = await brain.evaluate_fitness()
    print(f"  Fitness score: {fitness:.4f}")
    print(f"✓ Fitness evaluation complete")
    
    await bridge.close()
    return True


async def test_lm_studio_integration():
    """Test LM Studio integration for reasoning."""
    print("\n=== Test 5: LM Studio Integration ===")
    
    lm_client = get_lm_studio_client()
    
    if not await lm_client.is_available():
        print("✗ LM Studio not available (start LM Studio on port 1234)")
        return False
    
    print("✓ LM Studio is available")
    
    # Test simple completion
    result = await lm_client.chat_completion(
        messages=[{"role": "user", "content": "Say 'hello' in one word."}],
        max_tokens=10,
        temperature=0.1
    )
    
    if result.success:
        print(f"  Response: {result.content.strip()}")
        print(f"  Tokens: {result.tokens_used}, Latency: {result.latency_ms:.0f}ms")
        print("✓ LM Studio chat completion works")
    else:
        print(f"✗ Chat completion failed: {result.error}")
        return False
    
    await lm_client.close()
    return True


async def test_full_evolution_step():
    """Test full evolution step with both systems."""
    print("\n=== Test 6: Full Evolution Step ===")
    
    bridge = SubstrateBridge()
    lm_client = get_lm_studio_client()
    
    bridge_ok = await bridge.is_available()
    lm_ok = await lm_client.is_available()
    
    if not bridge_ok:
        print("✗ Skipping - gpu_dev_daemon not available")
        await bridge.close()
        return False
    
    brain = SubstrateAwareBrain(substrate=bridge, lm_client=lm_client if lm_ok else None)
    
    # Evaluate fitness
    fitness = await brain.evaluate_fitness()
    print(f"  Fitness: {fitness:.4f}")
    
    # Get LLM evaluation if available
    if lm_ok:
        analysis = await brain.get_llm_evaluation()
        print(f"  LLM Analysis: {analysis.get('analysis', 'N/A')[:100]}...")
        print("✓ Full evolution step with LLM complete")
    else:
        print("  (LM Studio not available, skipping LLM analysis)")
        print("✓ Evolution step without LLM complete")
    
    await bridge.close()
    if lm_ok:
        await lm_client.close()
    return True


async def main():
    """Run all tests."""
    print("=" * 60)
    print("Substrate Bridge Integration Tests")
    print("=" * 60)
    
    results = {}
    
    results['daemon'] = await test_daemon_connection()
    results['peek'] = await test_memory_peek()
    results['state'] = await test_state_capture()
    results['fitness'] = await test_fitness_evaluation()
    results['lm_studio'] = await test_lm_studio_integration()
    results['evolution'] = await test_full_evolution_step()
    
    print("\n" + "=" * 60)
    print("Test Summary")
    print("=" * 60)
    
    for name, passed in results.items():
        status = "✓ PASS" if passed else "✗ FAIL"
        print(f"  {name}: {status}")
    
    total = len(results)
    passed = sum(1 for v in results.values() if v)
    print(f"\nTotal: {passed}/{total} tests passed")
    
    return all(results.values())


if __name__ == "__main__":
    success = asyncio.run(main())
    sys.exit(0 if success else 1)
