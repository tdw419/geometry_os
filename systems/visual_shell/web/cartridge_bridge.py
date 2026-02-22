# systems/visual_shell/web/cartridge_bridge.py
"""
Cartridge Bridge - WebSocket handler for cartridge assembly requests.

Bridges WebMCP ide_deploy tool to Python CartridgeAssembler.
"""

import json
import base64
import tempfile
from pathlib import Path
from typing import Dict, Any

try:
    from systems.pixel_compiler.cartridge_assembly import CartridgeAssembler
    ASSEMBLER_AVAILABLE = True
except ImportError:
    ASSEMBLER_AVAILABLE = False


def handle_cartridge_request(request: Dict[str, Any]) -> Dict[str, Any]:
    """
    Handle a cartridge request from WebMCP.

    Args:
        request: Request dict with action, name, files, etc.

    Returns:
        Response dict with success status and result data
    """
    action = request.get("action", "assemble")
    name = request.get("name", "unnamed")

    if action == "assemble":
        return _handle_assemble(request)
    elif action == "deploy":
        return _handle_deploy(request)
    else:
        return {
            "success": False,
            "error": f"Unknown action: {action}"
        }


def _handle_assemble(request: Dict[str, Any]) -> Dict[str, Any]:
    """Handle assemble action."""
    files = request.get("files", [])
    name = request.get("name", "unnamed")
    description = request.get("description", "")
    entry_point = request.get("entry_point", "")

    if not files:
        return {
            "success": False,
            "error": "No files provided"
        }

    if not ASSEMBLER_AVAILABLE:
        return {
            "success": False,
            "error": "CartridgeAssembler not available"
        }

    # Write files to temp directory
    with tempfile.TemporaryDirectory() as tmpdir:
        tmpdir = Path(tmpdir)
        file_paths = []

        for file_info in files:
            path = file_info.get("path", "unnamed")
            content_b64 = file_info.get("content", "")

            try:
                content = base64.b64decode(content_b64)
            except Exception:
                return {
                    "success": False,
                    "error": f"Invalid base64 content for {path}"
                }

            file_path = tmpdir / path
            file_path.parent.mkdir(parents=True, exist_ok=True)
            file_path.write_bytes(content)
            file_paths.append(file_path)

        # Assemble cartridge
        assembler = CartridgeAssembler()
        png_bytes = assembler.assemble_from_files(
            file_paths,
            name=name,
            description=description,
            entry_point=entry_point
        )

        # Return as base64
        png_b64 = base64.b64encode(png_bytes).decode('ascii')

        return {
            "success": True,
            "cartridge": {
                "format": "png",
                "data": png_b64,
                "size_bytes": len(png_bytes),
                "name": name
            }
        }


def _handle_deploy(request: Dict[str, Any]) -> Dict[str, Any]:
    """Handle deploy action (assemble + place on map)."""
    # First assemble
    assemble_result = _handle_assemble(request)

    if not assemble_result.get("success"):
        return assemble_result

    # Get location
    location = request.get("location", {"x": 0, "y": 0})

    # Add location to result
    assemble_result["location"] = location
    assemble_result["deployed"] = True

    return assemble_result
