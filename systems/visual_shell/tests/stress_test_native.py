"""
Stress Test for Native Visual Shell API
Tests the performance of entity management and state synchronization.
"""

import time
import sys
import os
from pathlib import Path

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent.parent))

from systems.visual_shell.api.native_api import NativeVisualShellAPI, UIEntity

def run_stress_test(count: int = 10000):
    print(f"--- Native Visual Shell Stress Test ({count} entities) ---")
    
    api = NativeVisualShellAPI()
    
    # 1. Add Test
    start = time.perf_counter()
    for i in range(count):
        api.add_entity(UIEntity(
            id=f"orb_{i}",
            type="orb",
            x=(i * 17) % 1024,
            y=(i * 23) % 1024,
            color=(i % 256, (i*2) % 256, (i*3) % 256, 255)
        ))
    end = time.perf_counter()
    add_time = end - start
    print(f"ADD: {add_time:.4f}s ({count/add_time:.0f} ops/sec)")
    
    # 2. Update Test
    start = time.perf_counter()
    for i in range(count):
        api.update_entity(f"orb_{i}", x=(i * 18) % 1024)
    end = time.perf_counter()
    update_time = end - start
    print(f"UPDATE: {update_time:.4f}s ({count/update_time:.0f} ops/sec)")
    
    # 3. State Export Test (JSON-like list)
    start = time.perf_counter()
    state = api.get_render_state()
    end = time.perf_counter()
    export_time = end - start
    print(f"EXPORT: {export_time:.4f}s ({len(state)} entities)")
    
    print(f"Total time: {add_time + update_time + export_time:.4f}s")
    
    if add_time + update_time + export_time < 1.0:
        print("✓ SUCCESS: Performance within limits (< 1s for 10k entities)")
    else:
        print("⚠ WARNING: Performance slow (> 1s)")

if __name__ == "__main__":
    count = 10000
    if len(sys.argv) > 1:
        count = int(sys.argv[1])
    run_stress_test(count)
