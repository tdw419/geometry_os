# systems/visual_shell/web/geoasm_bridge.py
"""
GeoASM Bridge - Bridge between WebMCP and GeoASM Python implementation.

Handles assembly, disassembly, and execution requests.
"""

import logging
from typing import Any

import numpy as np

try:
    from systems.visual_shell.geoasm import Assembler, Executor, GeoASMVisualBridge, RegisterFile
    from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
    GEOASM_AVAILABLE = True
except ImportError:
    GEOASM_AVAILABLE = False

logger = logging.getLogger("geoasm_bridge")

def handle_geoasm_request(request: dict[str, Any]) -> dict[str, Any]:
    """
    Handle a GeoASM request from WebMCP.
    
    Args:
        request: Request dict with action, source, opcodes, etc.
        
    Returns:
        Response dict with success status and result data
    """
    if not GEOASM_AVAILABLE:
        return {
            "success": False,
            "error": "GeoASM module not available on backend"
        }

    action = request.get("action", "execute")

    try:
        if action == "assemble":
            return _handle_assemble(request)
        elif action == "disassemble":
            return _handle_disassemble(request)
        elif action == "execute":
            return _handle_execute(request)
        elif action == "get_state":
            return _handle_get_state(request)
        else:
            return {
                "success": False,
                "error": f"Unknown action: {action}"
            }
    except Exception as e:
        logger.exception(f"Error handling GeoASM request: {e}")
        return {
            "success": False,
            "error": str(e)
        }

def _handle_assemble(request: dict[str, Any]) -> dict[str, Any]:
    """Assemble source to opcodes."""
    source = request.get("source", "")
    if not source:
        return {"success": False, "error": "No source provided"}

    assembler = Assembler()
    instructions = assembler.assemble(source)
    opcodes = [inst.to_bytes().hex() for inst in instructions]

    return {
        "success": True,
        "instructions": [str(inst) for inst in instructions],
        "opcodes": opcodes,
        "count": len(instructions)
    }

def _handle_disassemble(request: dict[str, Any]) -> dict[str, Any]:
    """Disassemble opcodes to source."""
    opcodes_hex = request.get("opcodes", [])
    if not opcodes_hex:
        return {"success": False, "error": "No opcodes provided"}

    data = bytearray()
    for hex_str in opcodes_hex:
        data.extend(bytes.fromhex(hex_str))

    assembler = Assembler()
    source = assembler.disassemble_binary(data)

    return {
        "success": True,
        "source": source
    }

def _handle_execute(request: dict[str, Any]) -> dict[str, Any]:
    """Execute GeoASM source or opcodes."""
    source = request.get("source", "")
    opcodes_hex = request.get("opcodes", [])

    assembler = Assembler()
    if source:
        instructions = assembler.assemble(source)
    elif opcodes_hex:
        data = bytearray()
        for hex_str in opcodes_hex:
            data.extend(bytes.fromhex(hex_str))
        instructions = assembler.disassemble_binary_to_instructions(data)
    else:
        return {"success": False, "error": "No source or opcodes provided"}

    # Setup pipeline and visual bridge
    # For now we use a mock pipeline if none provided,
    # but ideally we'd connect to the active one.
    pipeline = None
    visual = GeoASMVisualBridge()
    registers = RegisterFile()

    # Pre-set registers if provided
    initial_regs = request.get("registers", {})
    for reg_idx, value in initial_regs.items():
        reg_idx = int(reg_idx)
        if isinstance(value, list):
            registers.set_vector(reg_idx, np.array(value, dtype=np.float32))
        else:
            registers.set(reg_idx, float(value))

    executor = Executor(pipeline, registers, visual_bridge=visual)

    # Run
    results = executor.run(instructions)

    # Get final state
    final_regs = {}
    for i in range(8):
        if i in [2, 3, 4]: # Vector registers
            final_regs[f"R{i}"] = registers.get_vector(i).tolist()
        else:
            final_regs[f"R{i}"] = registers.get(i)

    return {
        "success": True,
        "results": results,
        "registers": final_regs,
        "visual_events": [asdict(evt) for evt in visual.get_events()],
        "pc": executor.position
    }

def _handle_get_state(request: dict[str, Any]) -> dict[str, Any]:
    """Get current VM state (mocked if no active executor)."""
    # This would normally query the active executor
    return {
        "success": True,
        "active": False,
        "note": "State queries require an active executor session"
    }

def asdict(obj):
    """Simple dataclass to dict helper."""
    if hasattr(obj, "__dict__"):
        return {k: asdict(v) for k, v in obj.__dict__.items()}
    elif isinstance(obj, list):
        return [asdict(i) for i in obj]
    else:
        return obj
