"""
GlassBoxBridge - Shared Memory Bridge for Daemon Thought Visualization.
Maps Sisyphus DNA and GVN optimizations to Hilbert-indexed VRAM.
"""

import os
import json
import time
from multiprocessing import shared_memory
import numpy as np

class GlassBoxBridge:
    def __init__(self, name="glass_box_shm", size=1024*1024): # 1MB buffer
        self.name = name
        self.size = size
        self.shm = None
        try:
            self.shm = shared_memory.SharedMemory(name=name, create=True, size=size)
            print(f"Created Shared Memory: {name}")
        except FileExistsError:
            self.shm = shared_memory.SharedMemory(name=name)
            print(f"Connected to existing Shared Memory: {name}")
            
        self.buffer = np.ndarray((size,), dtype=np.uint8, buffer=self.shm.buf)

    def stream_thought(self, session_id, task_name, gvn_stats):
        """Write current daemon state to SHM for the Native Shell to pick up."""
        data = {
            "session": session_id,
            "task": task_name,
            "gvn": gvn_stats,
            "timestamp": time.time()
        }
        encoded = json.dumps(data).encode('utf-8')
        
        # Format: [length (4 bytes)] [json data]
        length = len(encoded)
        self.buffer[0:4] = np.frombuffer(length.to_bytes(4, 'little'), dtype=np.uint8)
        self.buffer[4:4+length] = np.frombuffer(encoded, dtype=np.uint8)

    def close(self):
        if self.shm:
            self.shm.close()
            try:
                self.shm.unlink()
            except:
                pass

if __name__ == "__main__":
    # Test streaming
    bridge = GlassBoxBridge()
    bridge.stream_thought("2026-03-08", "GVN Optimization", {"eliminated": 45, "reduction": 0.38})
    print("Streamed GVN thought to Glass Box.")
    time.sleep(1)
    bridge.close()
