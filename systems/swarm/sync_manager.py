#!/usr/bin/env python3
"""
SyncManager for WordPress Swarm Remote Synchronization.

Manages synchronization of content from remote WordPress Swarm Nodes
to the local Geometry OS cluster.
"""

import asyncio
import json
import logging
import time
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Any

import aiohttp

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger("sync_manager")


@dataclass
class RemoteNode:
    """Represents a remote WordPress node for synchronization."""
    node_id: str
    url: str
    api_url: str
    enabled: bool = True
    last_sync: float = 0
    sync_count: int = 0
    error_count: int = 0
    last_error: Optional[str] = None

    def to_dict(self) -> dict:
        """Serialize to dictionary."""
        return {
            "node_id": self.node_id,
            "url": self.url,
            "api_url": self.api_url,
            "enabled": self.enabled,
            "last_sync": self.last_sync,
            "sync_count": self.sync_count,
            "error_count": self.error_count,
            "last_error": self.last_error
        }

    @classmethod
    def from_dict(cls, data: dict) -> "RemoteNode":
        """Deserialize from dictionary."""
        return cls(
            node_id=data["node_id"],
            url=data["url"],
            api_url=data["api_url"],
            enabled=data.get("enabled", True),
            last_sync=data.get("last_sync", 0),
            sync_count=data.get("sync_count", 0),
            error_count=data.get("error_count", 0),
            last_error=data.get("last_error")
        )


@dataclass
class SyncResult:
    """Result of a sync operation."""
    node_id: str
    success: bool
    posts_fetched: int
    posts_stored: int
    error: Optional[str] = None
    timestamp: float = field(default_factory=time.time)

    def to_dict(self) -> dict:
        """Serialize to dictionary."""
        return {
            "node_id": self.node_id,
            "success": self.success,
            "posts_fetched": self.posts_fetched,
            "posts_stored": self.posts_stored,
            "error": self.error,
            "timestamp": self.timestamp
        }


@dataclass
class SyncState:
    """Persistent state for sync manager."""
    last_sync_time: float = 0
    total_posts_mirrored: int = 0
    nodes_synced: int = 0
    errors: int = 0
    mirrored_posts: List[dict] = field(default_factory=list)

    def to_dict(self) -> dict:
        """Serialize to dictionary."""
        return {
            "last_sync_time": self.last_sync_time,
            "total_posts_mirrored": self.total_posts_mirrored,
            "nodes_synced": self.nodes_synced,
            "errors": self.errors,
            "mirrored_posts": self.mirrored_posts
        }

    @classmethod
    def from_dict(cls, data: dict) -> "SyncState":
        """Deserialize from dictionary."""
        return cls(
            last_sync_time=data.get("last_sync_time", 0),
            total_posts_mirrored=data.get("total_posts_mirrored", 0),
            nodes_synced=data.get("nodes_synced", 0),
            errors=data.get("errors", 0),
            mirrored_posts=data.get("mirrored_posts", [])
        )


class SyncManager:
    """
    Manages synchronization from remote WordPress nodes.

    Features:
    - Fetches posts from remote /sync endpoints
    - Stores mirrored posts locally
    - Tracks sync state and history
    - Supports multiple remote nodes
    """

    STATE_FILE = "sync_state.json"

    def __init__(self, state_dir: Optional[Path] = None):
        """
        Initialize SyncManager.

        Args:
            state_dir: Directory for state persistence (default: temp)
        """
        self.state_dir = state_dir or Path("/tmp/geometry_os_sync")
        self.state_dir.mkdir(parents=True, exist_ok=True)

        self._running = False
        self._session: Optional[aiohttp.ClientSession] = None
        self._nodes: Dict[str, RemoteNode] = {}
        self._state = SyncState()

        # Load existing state
        self._load_state()

    async def __aenter__(self) -> "SyncManager":
        """Async context manager entry."""
        await self.start()
        return self

    async def __aexit__(self, exc_type, exc_val, exc_tb):
        """Async context manager exit."""
        await self.stop()

    async def start(self):
        """Start the sync manager."""
        if self._running:
            return

        self._running = True
        self._session = aiohttp.ClientSession()
        logger.info("SyncManager started")

    async def stop(self):
        """Stop the sync manager."""
        self._running = False
        if self._session:
            await self._session.close()
            self._session = None
        logger.info("SyncManager stopped")

    def _load_state(self):
        """Load state from file."""
        state_file = self.state_dir / self.STATE_FILE
        if state_file.exists():
            try:
                data = json.loads(state_file.read_text())
                self._state = SyncState.from_dict(data)
                logger.info(f"Loaded state: {self._state.total_posts_mirrored} posts mirrored")
            except Exception as e:
                logger.warning(f"Failed to load state: {e}")

    async def save_state(self):
        """Save state to file."""
        state_file = self.state_dir / self.STATE_FILE
        try:
            state_file.write_text(json.dumps(self._state.to_dict(), indent=2))
            logger.debug("State saved")
        except Exception as e:
            logger.error(f"Failed to save state: {e}")

    def add_node(self, node: RemoteNode):
        """Add a remote node for synchronization."""
        self._nodes[node.node_id] = node
        logger.info(f"Added node: {node.node_id}")

    def remove_node(self, node_id: str):
        """Remove a remote node."""
        if node_id in self._nodes:
            del self._nodes[node_id]
            logger.info(f"Removed node: {node_id}")

    def get_nodes(self) -> Dict[str, RemoteNode]:
        """Get all configured nodes."""
        return self._nodes.copy()

    async def fetch_posts(
        self,
        api_url: str,
        since: float = 0,
        limit: int = 100
    ) -> tuple[List[dict], Optional[str]]:
        """
        Fetch posts from a remote WordPress sync endpoint.

        Args:
            api_url: Base API URL of the remote node
            since: Unix timestamp for incremental sync
            limit: Maximum number of posts to fetch

        Returns:
            Tuple of (posts list, error message or None)
        """
        if not self._session:
            logger.error("SyncManager not started")
            return [], "SyncManager not started"

        try:
            # Build sync endpoint URL
            # Handle both pretty permalinks (/wp-json/geoos/v1) and query params (?rest_route=/geoos/v1)
            if "rest_route=" in api_url:
                # Query parameter format: append /sync to rest_route value
                sync_url = api_url.replace("rest_route=/geoos/v1", "rest_route=/geoos/v1/sync")
            else:
                # Pretty permalink format: append /sync to path
                sync_url = f"{api_url.rstrip('/')}/sync"

            params = {
                "since": int(since),
                "limit": limit
            }

            async with self._session.get(
                sync_url,
                params=params,
                timeout=aiohttp.ClientTimeout(total=30)
            ) as resp:
                if resp.status == 200:
                    data = await resp.json()
                    posts = data.get("posts", [])
                    logger.info(f"Fetched {len(posts)} posts from {api_url}")
                    return posts, None
                else:
                    error = f"Sync endpoint returned {resp.status}"
                    logger.error(error)
                    return [], error

        except asyncio.TimeoutError:
            error = f"Timeout fetching from {api_url}"
            logger.error(error)
            return [], error
        except Exception as e:
            logger.error(f"Error fetching posts: {e}")
            return [], str(e)

    async def store_posts(
        self,
        posts: List[dict],
        source_node: str
    ) -> int:
        """
        Store mirrored posts in local storage.

        Args:
            posts: List of posts to store
            source_node: ID of the source node

        Returns:
            Number of posts stored
        """
        if not posts:
            return 0

        stored = 0
        for post in posts:
            # Add source metadata
            mirrored_post = {
                **post,
                "_source_node": source_node,
                "_mirrored_at": time.time()
            }

            # Check for duplicates by ID + source
            existing_ids = {
                p.get("id") for p in self._state.mirrored_posts
                if p.get("_source_node") == source_node
            }

            if post.get("id") not in existing_ids:
                self._state.mirrored_posts.append(mirrored_post)
                stored += 1

        self._state.total_posts_mirrored += stored
        logger.info(f"Stored {stored} posts from {source_node}")

        return stored

    async def sync_node(self, node: RemoteNode) -> SyncResult:
        """
        Synchronize a single remote node.

        Args:
            node: RemoteNode to sync

        Returns:
            SyncResult with sync details
        """
        try:
            # Fetch posts since last sync
            posts, fetch_error = await self.fetch_posts(
                api_url=node.api_url,
                since=node.last_sync,
                limit=100
            )

            # Check for fetch errors
            if fetch_error:
                node.error_count += 1
                node.last_error = fetch_error
                self._state.errors += 1
                logger.error(f"Sync failed for {node.node_id}: {fetch_error}")
                return SyncResult(
                    node_id=node.node_id,
                    success=False,
                    posts_fetched=0,
                    posts_stored=0,
                    error=fetch_error
                )

            # Store posts
            stored = await self.store_posts(posts, source_node=node.node_id)

            # Persist state
            await self.save_state()

            # Update node state
            node.last_sync = time.time()
            node.sync_count += 1
            self._state.last_sync_time = time.time()
            self._state.nodes_synced = max(self._state.nodes_synced, len(self._nodes))

            return SyncResult(
                node_id=node.node_id,
                success=True,
                posts_fetched=len(posts),
                posts_stored=stored
            )

        except Exception as e:
            node.error_count += 1
            node.last_error = str(e)
            self._state.errors += 1

            logger.error(f"Sync failed for {node.node_id}: {e}")

            return SyncResult(
                node_id=node.node_id,
                success=False,
                posts_fetched=0,
                posts_stored=0,
                error=str(e)
            )

    async def sync_all_nodes(self) -> List[SyncResult]:
        """
        Synchronize all configured nodes.

        Returns:
            List of SyncResults for each node
        """
        results = []
        for node in self._nodes.values():
            if node.enabled:
                result = await self.sync_node(node)
                results.append(result)

        # Save state after sync
        await self.save_state()

        return results

    def get_mirrored_posts(
        self,
        source_node: Optional[str] = None,
        limit: int = 1000
    ) -> List[dict]:
        """
        Get mirrored posts from storage.

        Args:
            source_node: Optional filter by source node
            limit: Maximum posts to return

        Returns:
            List of mirrored posts
        """
        posts = self._state.mirrored_posts

        if source_node:
            posts = [p for p in posts if p.get("_source_node") == source_node]

        # Sort by mirrored_at descending
        posts = sorted(
            posts,
            key=lambda p: p.get("_mirrored_at", 0),
            reverse=True
        )

        return posts[:limit]

    def get_status(self) -> dict:
        """Get sync manager status."""
        return {
            "running": self._running,
            "nodes_count": len(self._nodes),
            "nodes": {nid: node.to_dict() for nid, node in self._nodes.items()},
            "state": self._state.to_dict()
        }


# CLI for testing
async def main():
    """CLI entry point for testing."""
    import argparse

    parser = argparse.ArgumentParser(description="WordPress Sync Manager CLI")
    parser.add_argument("--sync", metavar="URL", help="Sync from a remote node URL")
    parser.add_argument("--status", action="store_true", help="Show status")
    parser.add_argument("--list", action="store_true", help="List mirrored posts")

    args = parser.parse_args()

    manager = SyncManager()
    await manager.start()

    try:
        if args.sync:
            node = RemoteNode(
                node_id="cli-node",
                url=args.sync,
                api_url=args.sync
            )
            result = await manager.sync_node(node)
            print(json.dumps(result.to_dict(), indent=2))

        elif args.list:
            posts = manager.get_mirrored_posts()
            print(f"Mirrored posts: {len(posts)}")
            for post in posts[:10]:
                print(f"  - [{post.get('_source_node')}] {post.get('title')}")

        else:
            status = manager.get_status()
            print(json.dumps(status, indent=2))

    finally:
        await manager.stop()


if __name__ == "__main__":
    asyncio.run(main())
