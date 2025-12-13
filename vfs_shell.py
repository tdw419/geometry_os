#!/usr/bin/env python3
"""
ghost_vfs_shell.py - Semantic Shell for Ghost VFS
Implements vls, vcp, vgrep using VectorFileSystemCVFS
"""

import asyncio
import os
import sys
import argparse
import json
from typing import List, Dict, Any

# Ensure project root is in path
current_dir = os.path.dirname(os.path.abspath(__file__))
if current_dir not in sys.path:
    sys.path.append(current_dir)
sys.path.append(os.path.join(current_dir, "src"))

try:
    from src.vfs.vector_file_system_cvfs import VectorFileSystemCVFS
    from src.lm_studio.integration import LMStudioIntegration
    from src.ctrm_core.truth_manager import CTRMTruthManager
    from src.ctrm_core.database import CTRMDatabase
    # Mocks/Stubs for dependencies not strictly needed for basic shell
    class MockVectorInterface:
        pass
except ImportError as e:
    print(f"Error importing modules: {e}")
    print("Ensure you are running from the project root and requirements are installed.")
    sys.exit(1)

class GhostVFSShell:
    def __init__(self):
        self.lm_studio = LMStudioIntegration()
        # Minimal CTRM setup (may not be used by VFS fully yet but required by init)
        self.db = CTRMDatabase("data/ctrm_llm_os.db")
        # We might need to init db if strict
        # self.db.initialize() 
        self.ctrm = CTRMTruthManager(self.db, self.lm_studio) # passing lm_studio as embedder mock
        self.vector_interface = MockVectorInterface()
        
        self.vfs = VectorFileSystemCVFS(
            ctrm=self.ctrm,
            vector_interface=self.vector_interface,
            lm_studio=self.lm_studio,
            data_dir="data/cvfs_storage"
        )
        
    async def run_command(self, args):
        if args.command == "vls":
            await self.cmd_vls(args.path, args.query, args.limit)
        elif args.command == "vcp":
            await self.cmd_vcp(args.source, args.target)
        elif args.command == "vgrep":
            await self.cmd_vgrep(args.concept, args.path)
        elif args.command == "write":
            await self.cmd_write(args.path, args.content)
        elif args.command == "cat":
            await self.cmd_cat(args.path)
        else:
            print(f"Unknown command: {args.command}")

    async def cmd_vls(self, path, query, limit):
        print(f"📂 Listing files (Path: {path or 'ALL'}, Query: '{query or ''}')")
        results = await self.vfs.vfs_list(path=path, semantic_query=query, limit=limit)
        
        if not results:
            print("No files found.")
            return

        print(f"Found {len(results)} files:")
        for res in results:
            # Result is metadata dict
            fpath = res.get('path', 'unknown')
            fname = res.get('name', os.path.basename(fpath))
            score = res.get('_similarity', 0.0) # If from search
            
            if query:
                print(f"  [{score:.4f}] {fpath}")
            else:
                print(f"  - {fpath}")

    async def cmd_vcp(self, source, target):
        print(f"📋 Copying '{source}' to '{target}' (Semantic Copy)")
        # For now, just read and write. Real vcp might follow semantic links.
        read_res = await self.vfs.vfs_read(source)
        if "error" in read_res:
            print(f"Error reading source: {read_res['error']}")
            return
            
        content = read_res.get("content", "")
        metadata = read_res.get("metadata", {})
        
        # Write to target
        write_res = await self.vfs.vfs_write(target, content, metadata=metadata)
        if write_res.get("success"):
            print(f"✅ Copied to {target}")
        else:
            print(f"❌ Copy failed: {write_res.get('error')}")

    async def cmd_vgrep(self, concept, path):
        print(f"🔍 Searching for concept '{concept}' in {path or 'ALL'}")
        # This is essentially vls with a query, but maybe focused on content
        results = await self.vfs.vfs_list(path=path, semantic_query=concept, limit=10)
        
        print(f"Found {len(results)} matches for concept '{concept}':")
        for res in results:
             print(f"  Rank {res.get('_rank', '?')}: {res.get('path')} (Score: {res.get('_similarity', 0):.4f})")

    async def cmd_write(self, path, content):
        if not content:
            # Read from stdin if no content provided
            if not sys.stdin.isatty():
                content = sys.stdin.read()
            else:
                print("Error: No content provided and not reading from pipe.")
                return

        print(f"✍️ Writing to {path}...")
        res = await self.vfs.vfs_write(path, content)
        if res.get("success"):
            print(f"✅ Wrote {len(content)} bytes to {path}")
        else:
            print(f"❌ Write failed: {res.get('error')}")
            
    async def cmd_cat(self, path):
         res = await self.vfs.vfs_read(path)
         if "error" in res:
             print(f"❌ Error: {res['error']}")
         else:
             print(f"--- {res['path']} ---")
             print(res['content'])

def main():
    parser = argparse.ArgumentParser(description="Ghost Semantic Shell")
    subparsers = parser.add_subparsers(dest="command", help="Command to execute")

    # vls
    vls_parser = subparsers.add_parser("vls", help="List files semantically")
    vls_parser.add_argument("query", nargs="?", help="Semantic query string")
    vls_parser.add_argument("--path", "-p", help="Filter by path prefix")
    vls_parser.add_argument("--limit", "-n", type=int, default=10, help="Max results")

    # vcp
    vcp_parser = subparsers.add_parser("vcp", help="Semantic copy")
    vcp_parser.add_argument("source", help="Source file path")
    vcp_parser.add_argument("target", help="Target file path")

    # vgrep
    vgrep_parser = subparsers.add_parser("vgrep", help="Search for concepts")
    vgrep_parser.add_argument("concept", help="Concept to search for")
    vgrep_parser.add_argument("--path", "-p", help="Scope to path")
    
    # write (helper)
    write_parser = subparsers.add_parser("write", help="Write content to VFS")
    write_parser.add_argument("path", help="File path")
    write_parser.add_argument("content", nargs="?", help="Content string (or stdin)")
    
    # cat (helper)
    cat_parser = subparsers.add_parser("cat", help="Read file content")
    cat_parser.add_argument("path", help="File path")

    args = parser.parse_args()
    
    if not args.command:
        parser.print_help()
        return

    shell = GhostVFSShell()
    asyncio.run(shell.run_command(args))

if __name__ == "__main__":
    main()
