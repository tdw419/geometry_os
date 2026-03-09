"""GeoASM - Neural Assembly Language for Geometry OS.

GeoASM provides fine-grained control over PixelBrain inference stages
through a register-based virtual machine with opcodes 0xD0-0xD6.
"""

from .register_file import (
    RegisterFile,
    R0, R1, R2, R3, R4, R5, R6, R7,
    HIDDEN_DIM,
    SCALAR_OFFSET, SCALAR_COUNT,
    VECTOR_OFFSET, VECTOR_SIZE, VECTOR_COUNT,
    TOTAL_FLOATS,
)

__all__ = [
    'RegisterFile',
    'R0', 'R1', 'R2', 'R3', 'R4', 'R5', 'R6', 'R7',
    'HIDDEN_DIM',
    'SCALAR_OFFSET', 'SCALAR_COUNT',
    'VECTOR_OFFSET', 'VECTOR_SIZE', 'VECTOR_COUNT',
    'TOTAL_FLOATS',
]
