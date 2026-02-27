#!/usr/bin/env python3
"""
Git Diff API for GeometricCodeViewer

Provides endpoints for git diff and status operations.
"""

import subprocess
import json
import os
from pathlib import Path
from fastapi import FastAPI, HTTPException, Query
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware
import uvicorn

app = FastAPI(title="Git Diff API", version="1.0.0")

# Enable CORS for web access
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Repository root (geometry_os directory)
REPO_ROOT = Path(__file__).parent.parent.parent.parent


def run_git_command(args: list, cwd: Path = None) -> tuple:
    """Run a git command and return (success, output/error)"""
    try:
        result = subprocess.run(
            ["git"] + args,
            capture_output=True,
            text=True,
            cwd=cwd or REPO_ROOT
        )
        return result.returncode == 0, result.stdout or result.stderr
    except Exception as e:
        return False, str(e)


@app.get("/api/git/diff")
async def get_diff(
    path: str = Query(..., description="File path relative to repo root"),
    base: str = Query("HEAD", description="Base ref to compare against")
):
    """
    Get git diff for a file.

    Returns diff output with additions (+) and deletions (-).
    """
    file_path = REPO_ROOT / path

    if not file_path.exists():
        raise HTTPException(404, f"File not found: {path}")

    success, output = run_git_command(["diff", base, "--", str(file_path)])

    if not success:
        return JSONResponse(
            content={"error": output, "code": 1},
            status_code=500
        )

    # Parse diff into structured format
    additions = []
    deletions = []

    for line in output.split('\n'):
        if line.startswith('+') and not line.startswith('+++'):
            additions.append(line[1:])
        elif line.startswith('-') and not line.startswith('---'):
            deletions.append(line[1:])

    return {
        "diff": output,
        "path": path,
        "base": base,
        "additions": len(additions),
        "deletions": len(deletions),
        "addition_lines": additions[:100],  # Limit for performance
        "deletion_lines": deletions[:100]
    }


@app.get("/api/git/status")
async def get_status(
    path: str = Query(..., description="File path relative to repo root")
):
    """
    Get git status for a file.

    Returns modification status and current branch.
    """
    file_path = REPO_ROOT / path

    if not file_path.exists():
        raise HTTPResponse(404, f"File not found: {path}")

    success, output = run_git_command(["status", "--porcelain", str(file_path)])

    if not success:
        raise HTTPException(500, output)

    # Get current branch
    branch_success, branch = run_git_command(["branch", "--show-current"])
    current_branch = branch.strip() if branch_success else "unknown"

    # Parse status
    status_code = output.strip()[:2] if output.strip() else ""
    is_modified = "M" in status_code
    is_new = "?" in status_code
    is_staged = status_code.startswith("M") or status_code.startswith("A")

    return {
        "path": path,
        "status": output.strip(),
        "status_code": status_code,
        "modified": is_modified,
        "new": is_new,
        "staged": is_staged,
        "branch": current_branch
    }


@app.get("/api/git/log")
async def get_log(
    path: str = Query(..., description="File path relative to repo root"),
    count: int = Query(10, description="Number of commits to return")
):
    """
    Get git log for a file.

    Returns recent commit history.
    """
    file_path = REPO_ROOT / path

    if not file_path.exists():
        raise HTTPException(404, f"File not found: {path}")

    success, output = run_git_command([
        "log",
        f"-{count}",
        "--oneline",
        "--",
        str(file_path)
    ])

    if not success:
        raise HTTPException(500, output)

    commits = []
    for line in output.strip().split('\n'):
        if line:
            parts = line.split(' ', 1)
            if len(parts) == 2:
                commits.append({
                    "hash": parts[0],
                    "message": parts[1]
                })

    return {
        "path": path,
        "commits": commits,
        "count": len(commits)
    }


@app.get("/api/git/blame")
async def get_blame(
    path: str = Query(..., description="File path relative to repo root")
):
    """
    Get git blame for a file.

    Returns line-by-line author information.
    """
    file_path = REPO_ROOT / path

    if not file_path.exists():
        raise HTTPException(404, f"File not found: {path}")

    success, output = run_git_command(["blame", "-l", str(file_path)])

    if not success:
        raise HTTPException(500, output)

    # Parse blame output (simplified)
    lines = []
    for line in output.split('\n')[:100]:  # Limit for performance
        parts = line.split('\t')
        if len(parts) >= 3:
            lines.append({
                "commit": parts[0][:8],
                "author": parts[1].strip() if len(parts) > 1 else "",
                "line": parts[-1] if len(parts) > 2 else ""
            })

    return {
        "path": path,
        "lines": lines
    }


@app.get("/api/git/branches")
async def get_branches():
    """List all branches in the repository."""
    success, output = run_git_command(["branch", "-a"])

    if not success:
        raise HTTPException(500, output)

    branches = []
    for line in output.split('\n'):
        line = line.strip()
        if line:
            is_current = line.startswith('*')
            name = line.lstrip('* ')
            branches.append({
                "name": name,
                "current": is_current
            })

    return {"branches": branches}


@app.get("/health")
async def health():
    """Health check endpoint."""
    return {"status": "ok", "repo_root": str(REPO_ROOT)}


if __name__ == "__main__":
    print(f"Starting Git Diff API server on http://0.0.0.0:8766")
    print(f"Repository root: {REPO_ROOT}")
    uvicorn.run(app, host="0.0.0.0", port=8766, log_level="info")
