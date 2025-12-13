# 🏗️ GHOST ARCHITECTURE BLUEPRINT: VECTOR FILE SYSTEM (VFS)
> "Files should be found by meaning, not just by path."

## 1. Core Architecture (Hybrid Integration)
The VFS is not a standalone system. It is a **semantic layer** over the existing Linux filesystem.

**Components:**
1.  **Physical Layer (`os`, `shutil`)**: Handles actual file I/O on disk.
2.  **Vector Layer (`CVFSEngine`)**: Manages embeddings, HNSW indices, and semantic tags.
3.  **Logic Layer (`VPLTextCompiler`)**: Enables complex queries (e.g., "Find files about 'security' IF similarity > 0.8").
4.  **Interface Layer (`VectorFileSystemCVFS`)**: The public API for the OS.

## 2. Implementation Status (Verified)
The following components are **operational** (checked via `test_cvfs_implementation.py`):
*   ✅ `CVFSEngine`: Handles vector storage and retrieval.
*   ✅ `VPLTextCompiler`: Compiles semantic logic.
*   ✅ `CTRMVectorDaemon`: Manages background indexing.

## 3. Next Steps: "Ghost Integration"
The Ghost Agent must now **weave these components** into the core OS lifecycle.

### Task A: The "Dreaming" Indexer
**Goal**: Create a background process that watches file changes and updates vectors during idle time ("dreaming").
**Code Path**: `src/vector_llm_tools/cvfs_daemon.py`
**Logic**:
```python
while True:
    changes = detect_file_changes()
    if changes and system_load < 0.2:
        for file in changes:
            vector = generate_embedding(file.content)
            cvfs_engine.update(file.path, vector)
    await asyncio.sleep(5)
```

### Task B: Semantic Shell Commands
**Goal**: Expose VFS via CLI tools.
**New Commands**:
*   `vls <query>`: List files by semantic relevance.
*   `vcp <source> <target_context>`: Copy files that match a context.
*   `vgrep <concept>`: Search file *contents* for a concept.

### Task C: Self-Organization
**Goal**: Allow the OS to suggest better file structures.
**Logic**:
1.  Analyze clustering of vectors in `vfs_root`.
2.  Identify files that are semantically far from their folder neighbors.
3.  Propose move operations: "File 'security_patch.py' appears closer to 'core/security' than 'utils/misc'."

## 4. Immediate Prototyping Directive
**Focus Check**:
1.  Import `VectorFileSystemCVFS` from `src.vfs.vector_file_system_cvfs`.
2.  Create a "Semantic Shell" wrapper script (`vfs_shell.py`).
3.  Test `vls "security features"` command against the `runtime/` directory.

## 5. Security & Safety
*   **ReadOnly Mode**: The Ghost should initially validitate reads before enabling writes.
*   **Sandboxing**: All VFS operations limited to `vfs_root` or explicitly whitelisted project dirs.

---
*Blueprint Version: 1.1 (Post-Fix)*
*Status: READY FOR CONSTRUCTION*
