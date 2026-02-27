#!/usr/bin/env python3
"""
File API for GeometricCodeEditor

Provides endpoints for file read/write operations.
- Read files with syntax detection
- Save files with backup
- Watch for external changes
- Directory listing

Usage:
    python3 file_api.py
"""

import os
import shutil
import hashlib
import logging
from pathlib import Path
from datetime import datetime
from typing import Dict, List, Optional
from fastapi import FastAPI, HTTPException, Query
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
import uvicorn

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [FILE-API] %(message)s'
)
logger = logging.getLogger("FileAPI")

app = FastAPI(title="File API", version="1.0.0")

# Enable CORS for web access
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Repository root
REPO_ROOT = Path(__file__).parent.parent.parent.parent

# Backup directory
BACKUP_DIR = REPO_ROOT / ".geometry" / "file_backups"
BACKUP_DIR.mkdir(parents=True, exist_ok=True)


class SaveRequest(BaseModel):
    path: str
    content: str
    create_backup: bool = True


class FileInfo(BaseModel):
    path: str
    name: str
    size: int
    modified: float
    is_dir: bool
    extension: str
    language: str


# Language detection by extension
LANGUAGE_MAP = {
    '.py': 'python',
    '.js': 'javascript',
    '.ts': 'typescript',
    '.jsx': 'javascript',
    '.tsx': 'typescript',
    '.html': 'html',
    '.css': 'css',
    '.json': 'json',
    '.yaml': 'yaml',
    '.yml': 'yaml',
    '.md': 'markdown',
    '.rs': 'rust',
    '.go': 'go',
    '.java': 'java',
    '.c': 'c',
    '.cpp': 'cpp',
    '.h': 'c',
    '.hpp': 'cpp',
    '.sh': 'bash',
    '.bash': 'bash',
    '.zsh': 'bash',
    '.wgsl': 'wgsl',
    '.glsl': 'glsl',
    '.sql': 'sql',
    '.xml': 'xml',
    '.toml': 'toml',
    '.ini': 'ini',
    '.txt': 'text',
}


def detect_language(filename: str) -> str:
    """Detect language from file extension."""
    ext = Path(filename).suffix.lower()
    return LANGUAGE_MAP.get(ext, 'text')


def get_file_hash(filepath: Path) -> str:
    """Calculate MD5 hash of file content."""
    try:
        with open(filepath, 'rb') as f:
            return hashlib.md5(f.read()).hexdigest()
    except:
        return ""


def create_backup(filepath: Path) -> Optional[Path]:
    """Create a backup of the file before saving."""
    if not filepath.exists():
        return None

    try:
        # Create backup with timestamp
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_name = f"{filepath.name}.{timestamp}.bak"
        backup_path = BACKUP_DIR / backup_name

        shutil.copy2(filepath, backup_path)
        logger.info(f"Created backup: {backup_path}")

        # Clean up old backups (keep last 10 per file)
        pattern = f"{filepath.stem}.*"
        existing_backups = sorted(BACKUP_DIR.glob(pattern))
        if len(existing_backups) > 10:
            for old_backup in existing_backups[:-10]:
                old_backup.unlink()
                logger.debug(f"Removed old backup: {old_backup}")

        return backup_path
    except Exception as e:
        logger.error(f"Backup failed: {e}")
        return None


@app.get("/health")
async def health():
    """Health check endpoint."""
    return {
        "status": "ok",
        "repo_root": str(REPO_ROOT),
        "backup_dir": str(BACKUP_DIR)
    }


@app.get("/api/file/read")
async def read_file(
    path: str = Query(..., description="File path relative to repo root")
):
    """
    Read file content.

    Returns file content with metadata.
    """
    filepath = REPO_ROOT / path

    # Security check - prevent directory traversal
    try:
        filepath = filepath.resolve()
        if not str(filepath).startswith(str(REPO_ROOT)):
            raise HTTPException(403, "Access denied")
    except:
        raise HTTPException(403, "Invalid path")

    if not filepath.exists():
        raise HTTPException(404, f"File not found: {path}")

    if not filepath.is_file():
        raise HTTPException(400, f"Not a file: {path}")

    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()

        stat = filepath.stat()

        return {
            "success": True,
            "path": path,
            "content": content,
            "size": stat.st_size,
            "modified": stat.st_mtime,
            "language": detect_language(filepath.name),
            "hash": get_file_hash(filepath)
        }
    except UnicodeDecodeError:
        raise HTTPException(400, "Binary file - cannot display as text")
    except Exception as e:
        raise HTTPException(500, f"Read error: {e}")


@app.post("/api/file/save")
async def save_file(request: SaveRequest):
    """
    Save file content.

    Creates backup before overwriting (if enabled).
    """
    filepath = REPO_ROOT / request.path

    # Security check
    try:
        filepath = filepath.resolve()
        if not str(filepath).startswith(str(REPO_ROOT)):
            raise HTTPException(403, "Access denied")
    except:
        raise HTTPException(403, "Invalid path")

    # Create parent directories if needed
    filepath.parent.mkdir(parents=True, exist_ok=True)

    # Create backup if file exists
    if request.create_backup and filepath.exists():
        create_backup(filepath)

    try:
        # Write content
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(request.content)

        stat = filepath.stat()

        logger.info(f"Saved: {request.path} ({stat.st_size} bytes)")

        return {
            "success": True,
            "path": request.path,
            "size": stat.st_size,
            "modified": stat.st_mtime,
            "hash": get_file_hash(filepath)
        }
    except Exception as e:
        logger.error(f"Save failed: {e}")
        raise HTTPException(500, f"Save error: {e}")


@app.get("/api/file/info")
async def get_file_info(
    path: str = Query(..., description="File path relative to repo root")
):
    """Get file metadata without content."""
    filepath = REPO_ROOT / path

    # Security check
    try:
        filepath = filepath.resolve()
        if not str(filepath).startswith(str(REPO_ROOT)):
            raise HTTPException(403, "Access denied")
    except:
        raise HTTPException(403, "Invalid path")

    if not filepath.exists():
        raise HTTPException(404, f"Not found: {path}")

    stat = filepath.stat()

    return {
        "path": path,
        "name": filepath.name,
        "size": stat.st_size,
        "modified": stat.st_mtime,
        "is_dir": filepath.is_dir(),
        "extension": filepath.suffix,
        "language": detect_language(filepath.name)
    }


@app.get("/api/file/list")
async def list_directory(
    path: str = Query("", description="Directory path relative to repo root"),
    ext: str = Query(None, description="Filter by extension (e.g., '.py')")
):
    """
    List directory contents.

    Returns list of files and subdirectories.
    """
    dirpath = REPO_ROOT / path if path else REPO_ROOT

    # Security check
    try:
        dirpath = dirpath.resolve()
        if not str(dirpath).startswith(str(REPO_ROOT)):
            raise HTTPException(403, "Access denied")
    except:
        raise HTTPException(403, "Invalid path")

    if not dirpath.exists():
        raise HTTPException(404, f"Directory not found: {path}")

    if not dirpath.is_dir():
        raise HTTPException(400, f"Not a directory: {path}")

    items = []
    try:
        for item in dirpath.iterdir():
            # Skip hidden files and common ignore patterns
            if item.name.startswith('.'):
                continue
            if item.name in ['node_modules', '__pycache__', 'target', 'dist', 'build']:
                continue

            # Extension filter
            if ext and item.is_file() and item.suffix != ext:
                continue

            stat = item.stat()
            items.append({
                "name": item.name,
                "path": str(item.relative_to(REPO_ROOT)),
                "size": stat.st_size if item.is_file() else 0,
                "modified": stat.st_mtime,
                "is_dir": item.is_dir(),
                "extension": item.suffix,
                "language": detect_language(item.name) if item.is_file() else None
            })

        # Sort: directories first, then by name
        items.sort(key=lambda x: (not x['is_dir'], x['name'].lower()))

        return {
            "path": path,
            "items": items,
            "count": len(items)
        }
    except Exception as e:
        raise HTTPException(500, f"List error: {e}")


@app.get("/api/file/search")
async def search_files(
    query: str = Query(..., description="Search query"),
    ext: str = Query(None, description="Filter by extension")
):
    """
    Search for files by name.

    Returns matching files in the repository.
    """
    matches = []
    query_lower = query.lower()

    try:
        for root, dirs, files in os.walk(REPO_ROOT):
            # Skip hidden and ignored directories
            dirs[:] = [d for d in dirs if not d.startswith('.') and d not in
                       ['node_modules', '__pycache__', 'target', 'dist', 'build', '.git']]

            for filename in files:
                if query_lower in filename.lower():
                    if ext and not filename.endswith(ext):
                        continue

                    filepath = Path(root) / filename
                    rel_path = str(filepath.relative_to(REPO_ROOT))

                    try:
                        stat = filepath.stat()
                        matches.append({
                            "name": filename,
                            "path": rel_path,
                            "size": stat.st_size,
                            "modified": stat.st_mtime,
                            "extension": filepath.suffix,
                            "language": detect_language(filename)
                        })
                    except:
                        continue

                    if len(matches) >= 50:  # Limit results
                        break

            if len(matches) >= 50:
                break

        return {
            "query": query,
            "matches": matches,
            "count": len(matches)
        }
    except Exception as e:
        raise HTTPException(500, f"Search error: {e}")


@app.get("/api/file/hash")
async def get_hash(
    path: str = Query(..., description="File path relative to repo root")
):
    """Get file hash for change detection."""
    filepath = REPO_ROOT / path

    # Security check
    try:
        filepath = filepath.resolve()
        if not str(filepath).startswith(str(REPO_ROOT)):
            raise HTTPException(403, "Access denied")
    except:
        raise HTTPException(403, "Invalid path")

    if not filepath.exists():
        raise HTTPException(404, f"File not found: {path}")

    return {
        "path": path,
        "hash": get_file_hash(filepath),
        "modified": filepath.stat().st_mtime
    }


@app.post("/api/file/create")
async def create_file(
    path: str = Query(..., description="File path relative to repo root"),
    content: str = Query("", description="Initial content")
):
    """Create a new file."""
    filepath = REPO_ROOT / path

    # Security check
    try:
        filepath = filepath.resolve()
        if not str(filepath).startswith(str(REPO_ROOT)):
            raise HTTPException(403, "Access denied")
    except:
        raise HTTPException(403, "Invalid path")

    if filepath.exists():
        raise HTTPException(409, f"File already exists: {path}")

    try:
        filepath.parent.mkdir(parents=True, exist_ok=True)
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)

        logger.info(f"Created: {path}")

        return {
            "success": True,
            "path": path,
            "created": True
        }
    except Exception as e:
        raise HTTPException(500, f"Create error: {e}")


@app.delete("/api/file/delete")
async def delete_file(
    path: str = Query(..., description="File path relative to repo root")
):
    """Delete a file (with backup)."""
    filepath = REPO_ROOT / path

    # Security check
    try:
        filepath = filepath.resolve()
        if not str(filepath).startswith(str(REPO_ROOT)):
            raise HTTPException(403, "Access denied")
    except:
        raise HTTPException(403, "Invalid path")

    if not filepath.exists():
        raise HTTPException(404, f"File not found: {path}")

    # Create backup before deletion
    create_backup(filepath)

    try:
        filepath.unlink()
        logger.info(f"Deleted: {path}")

        return {
            "success": True,
            "path": path,
            "deleted": True
        }
    except Exception as e:
        raise HTTPException(500, f"Delete error: {e}")


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="File API for GeometricCodeEditor")
    parser.add_argument("--port", type=int, default=8768, help="Port to listen on")
    parser.add_argument("--host", default="0.0.0.0", help="Host to bind to")
    args = parser.parse_args()

    print(f"""
╔══════════════════════════════════════════════════════════════╗
║               FILE API - GeometricCodeEditor                 ║
╠══════════════════════════════════════════════════════════════╣
║  Base URL:  http://{args.host}:{args.port}/api/file/             ║
║  Health:    http://{args.host}:{args.port}/health                ║
║  Repo:      {REPO_ROOT.name:<47} ║
║  Backups:   {BACKUP_DIR.name:<47} ║
╚══════════════════════════════════════════════════════════════╝
    """)

    uvicorn.run(app, host=args.host, port=args.port, log_level="info")
