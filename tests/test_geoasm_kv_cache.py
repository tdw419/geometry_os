"""
Tests for GeoASM KV-Cache Integration.
"""

import pytest
import numpy as np
from systems.visual_shell.geoasm.executor import Executor
from systems.visual_shell.geoasm.instruction import Instruction, Opcode, KV_APPEND, LAYER
from systems.visual_shell.geoasm.register_file import RegisterFile, R2

class MockPipeline:
    def __init__(self):
        self.kv_updates = []
        self._wgpu_initialized = True

    def kv_append_gpu(self, layer, position, hidden, kv_type):
        self.kv_updates.append({
            'layer': layer,
            'position': position,
            'hidden': hidden,
            'kv_type': kv_type
        })

def test_kv_append_execution():
    pipeline = MockPipeline()
    registers = RegisterFile()
    executor = Executor(pipeline, registers)
    
    # Set a vector in R2
    test_vector = np.random.rand(64).astype(np.float32)
    registers.set_vector(R2, test_vector)
    
    # Execute KV_APPEND R2, #0 (K)
    executor.execute(LAYER(3))
    executor.position = 10
    executor.execute(KV_APPEND(R2, 0))
    
    assert len(pipeline.kv_updates) == 1
    update = pipeline.kv_updates[0]
    assert update['layer'] == 3
    assert update['position'] == 10
    assert update['kv_type'] == 0
    assert np.allclose(update['hidden'], test_vector)
    
    # Execute KV_APPEND R2, #1 (V)
    executor.execute(KV_APPEND(R2, 1))
    assert len(pipeline.kv_updates) == 2
    update = pipeline.kv_updates[1]
    assert update['kv_type'] == 1
    assert np.allclose(update['hidden'], test_vector)

if __name__ == "__main__":
    test_kv_append_execution()
    print("KV-Cache execution test passed!")
