"""
Spatial Debugger Backend
FastAPI server for texture visualization and hot-patching.
"""

import sys
from pathlib import Path
from typing import Optional

# Add geos to path
GEOS_PATH = Path(__file__).parent.parent / "geos"
sys.path.insert(0, str(GEOS_PATH.parent))

from fastapi import FastAPI, HTTPException
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse, JSONResponse
from pydantic import BaseModel
import numpy as np
from PIL import Image
import io
import base64

from geos import hilbert_d2xy, hilbert_xy2d, SpatialAllocator, TaskManager, TaskState
from geos.benchmarks import benchmark_sls
from geos.mcp import glyph_patch, geos_status
from geos.types import Opcode

app = FastAPI(title="Spatial Debugger", version="0.1.0")

# Global instances
allocator = SpatialAllocator()
task_manager = TaskManager()

# Store loaded textures
_loaded_textures: dict = {}


class PatchRequest(BaseModel):
    vm_id: int = 0
    address: str
    opcode: int
    stratum: int = 0
    p1: int = 0
    p2: int = 0


class TextureLoadRequest(BaseModel):
    path: str


class AllocateRequest(BaseModel):
    num_pages: int = 1


class RegisterTaskRequest(BaseModel):
    vm_id: int
    start_addr: int
    page_count: int
    parent_id: int = 0


@app.get("/")
async def root():
    return {"status": "Spatial Debugger v0.1.0", "endpoints": ["/texture", "/patch", "/status", "/allocator", "/tasks", "/hilbert/{d}"]}


@app.get("/tasks")
async def get_tasks():
    """Get the list of registered tasks."""
    return task_manager.get_task_list()


@app.post("/tasks/register")
async def do_register_task(req: RegisterTaskRequest):
    """Register a task in the table."""
    success = task_manager.register_task(
        vm_id=req.vm_id,
        start_addr=req.start_addr,
        page_count=req.page_count,
        parent_id=req.parent_id
    )
    if not success:
        raise HTTPException(400, "Task table full")
    return {"status": "registered", "vm_id": req.vm_id}


@app.delete("/tasks/{vm_id}")
async def do_unregister_task(vm_id: int):
    """Unregister a task."""
    task_manager.unregister_task(vm_id)
    return {"status": "unregistered", "vm_id": vm_id}


@app.get("/allocator/status")
async def get_allocator_status():
    """Get spatial allocation status."""
    return allocator.get_status()


@app.post("/allocator/allocate")
async def do_allocate(req: AllocateRequest):
    """Simulate a spatial allocation."""
    addr = allocator.allocate(req.num_pages)
    if addr is None:
        raise HTTPException(400, "Out of spatial memory")
    
    return {
        "status": "allocated",
        "base_addr": addr,
        "base_addr_hex": f"0x{addr:08X}",
        "num_pages": req.num_pages,
        "total_instructions": req.num_pages * allocator.page_size
    }


@app.get("/allocator/bitmap")
async def get_bitmap():
    """Get the free space bitmap."""
    return {"bitmap": allocator.bitmap.tolist()}


@app.post("/texture/load")
async def load_texture(req: TextureLoadRequest):
    """Load a texture file for analysis."""
    path = Path(req.path)
    if not path.exists():
        raise HTTPException(404, f"Texture not found: {req.path}")

    # Load image
    img = Image.open(path)
    pixels = np.array(img)

    # Store for later operations
    texture_id = path.stem
    _loaded_textures[texture_id] = {
        "path": str(path),
        "pixels": pixels,
        "shape": pixels.shape,
    }

    # Analyze
    result = benchmark_sls(str(path))

    return {
        "texture_id": texture_id,
        "shape": list(pixels.shape),
        "sls_score": result["sls_score"],
        "locality_ratio": result["locality_ratio"],
        "instruction_count": result["instruction_count"],
        "density": result["density"],
    }


@app.get("/texture/{texture_id}/preview")
async def preview_texture(texture_id: str, x: int = 0, y: int = 0, w: int = 64, h: int = 64):
    """Get a preview region of the texture."""
    if texture_id not in _loaded_textures:
        raise HTTPException(404, "Texture not loaded")

    pixels = _loaded_textures[texture_id]["pixels"]

    # Extract region
    region = pixels[y:y+h, x:x+w]

    # Encode as base64 PNG
    img = Image.fromarray(region, 'RGBA')
    buffer = io.BytesIO()
    img.save(buffer, format='PNG')
    buffer.seek(0)

    return FileResponse(buffer, media_type="image/png")


@app.get("/texture/{texture_id}/pixel/{x}/{y}")
async def get_pixel(texture_id: str, x: int, y: int):
    """Get instruction at pixel coordinates."""
    if texture_id not in _loaded_textures:
        raise HTTPException(404, "Texture not loaded")

    pixels = _loaded_textures[texture_id]["pixels"]

    if y >= pixels.shape[0] or x >= pixels.shape[1]:
        raise HTTPException(400, "Coordinates out of bounds")

    r, g, b, a = pixels[y, x]

    # Convert to meaning
    try:
        opcode_name = Opcode(r).name
    except ValueError:
        opcode_name = f"UNKNOWN({r})"

    return {
        "x": x,
        "y": y,
        "hilbert_d": hilbert_xy2d(pixels.shape[0], x, y),
        "rgba": {"r": int(r), "g": int(g), "b": int(b), "a": int(a)},
        "instruction": {
            "opcode": int(r),
            "opcode_name": opcode_name,
            "stratum": int(g),
            "p1": int(b),
            "p2": int(a),
        }
    }


@app.post("/patch")
async def apply_patch(req: PatchRequest):
    """Apply a hot-patch to the texture."""
    result = glyph_patch(
        vm_id=req.vm_id,
        address=req.address,
        opcode=req.opcode,
        stratum=req.stratum,
        p1=req.p1,
        p2=req.p2,
    )
    return result


@app.get("/hilbert/{grid_size}/{d}")
async def hilbert_to_xy(grid_size: int, d: int):
    """Convert Hilbert index to (x, y) coordinates."""
    x, y = hilbert_d2xy(grid_size, d)
    return {"d": d, "x": x, "y": y}


@app.get("/status")
async def status():
    """Get Geometry OS status."""
    return geos_status()


@app.get("/textures")
async def list_textures():
    """List loaded textures."""
    return {
        "count": len(_loaded_textures),
        "textures": [
            {"id": tid, "path": info["path"], "shape": list(info["shape"])}
            for tid, info in _loaded_textures.items()
        ]
    }


# Serve static files
static_path = Path(__file__).parent / "static"
if static_path.exists():
    app.mount("/static", StaticFiles(directory=static_path), name="static")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8088)
