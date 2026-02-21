#!/usr/bin/env python3
"""
WordPress Swarm Node Discovery and Bridge.

Discovers WordPress instances running the Geometry OS Swarm Node plugin
and integrates them into the Python swarm cluster.
"""

import asyncio
import json
import socket
import logging
import aiohttp
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
from datetime import datetime
from pathlib import Path
import glob
import time

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger("wp_swarm_bridge")


@dataclass
class WordPressNode:
    """Represents a discovered WordPress swarm node."""
    node_id: str
    url: str
    api_url: str
    capabilities: List[str]
    last_seen: float = field(default_factory=time.time)
    posts_count: int = 0
    status: str = "active"

    def is_stale(self, max_age: int = 120) -> bool:
        """Check if node hasn't been seen recently."""
        return time.time() - self.last_seen > max_age

    def to_dict(self) -> dict:
        return {
            "node_id": self.node_id,
            "url": self.url,
            "api_url": self.api_url,
            "capabilities": self.capabilities,
            "last_seen": self.last_seen,
            "posts_count": self.posts_count,
            "status": self.status
        }


class WordPressSwarmBridge:
    """
    Bridge between Python SwarmDaemon and WordPress Swarm Nodes.

    Discovers WordPress nodes via UDP broadcast and provides
    a unified interface for dispatching tasks.
    """

    DISCOVERY_PORT = 5001
    DISCOVERY_MAGIC = b"GEOOS_SWARM"

    def __init__(self, shared_secret: str = "default-secret-change-me"):
        self.shared_secret = shared_secret
        self.nodes: Dict[str, WordPressNode] = {}
        self._running = False
        self._discovery_socket: Optional[socket.socket] = None
        self._session: Optional[aiohttp.ClientSession] = None

    async def start(self):
        """Start discovery and monitoring."""
        self._running = True
        self._session = aiohttp.ClientSession()

        # Do initial file-based discovery
        await self._file_discovery()

        # Start UDP discovery listener
        asyncio.create_task(self._discovery_loop())

        # Start file-based discovery loop (fallback)
        asyncio.create_task(self._file_discovery_loop())

        # Start health check loop
        asyncio.create_task(self._health_check_loop())

        logger.info("WordPress Swarm Bridge started")

    async def _file_discovery(self):
        """Scan for WordPress discovery files (works without UDP)."""
        # Common WordPress upload directories
        search_paths = [
            Path("/home/jericho/zion/projects/geometry_os/geometry_os/wordpress_zone/wordpress/wp-content/uploads/geoos-discovery"),
            Path.cwd() / "wordpress_zone/wordpress/wp-content/uploads/geoos-discovery",
            Path("/var/www/html/wp-content/uploads/geoos-discovery"),
        ]

        for search_path in search_paths:
            if not search_path.exists():
                continue

            for json_file in search_path.glob("node-*.json"):
                try:
                    data = json.loads(json_file.read_text())
                    if data.get("type") == "swarm_discovery" and data.get("node_type") == "wordpress":
                        node = WordPressNode(
                            node_id=data["node_id"],
                            url=data.get("url", ""),
                            api_url=data.get("api_url", ""),
                            capabilities=data.get("capabilities", []),
                            last_seen=data.get("timestamp", time.time())
                        )
                        self.nodes[node.node_id] = node
                        logger.info(f"Discovered WordPress node via file: {node.node_id}")
                except Exception as e:
                    logger.debug(f"Error reading {json_file}: {e}")

    async def _file_discovery_loop(self):
        """Periodically scan for new WordPress discovery files."""
        while self._running:
            await asyncio.sleep(30)  # Check every 30 seconds
            await self._file_discovery()

    async def stop(self):
        """Stop the bridge."""
        self._running = False
        if self._session:
            await self._session.close()

    async def _discovery_loop(self):
        """Listen for WordPress node discovery broadcasts."""
        sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
        sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
        sock.bind(("0.0.0.0", self.DISCOVERY_PORT))
        sock.setblocking(False)

        logger.info(f"Listening for WordPress nodes on UDP port {self.DISCOVERY_PORT}")

        loop = asyncio.get_event_loop()

        while self._running:
            try:
                data, addr = await loop.sock_recvfrom(sock, 4096)
                await self._handle_discovery(data, addr)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Discovery error: {e}")
                await asyncio.sleep(1)

        sock.close()

    async def _handle_discovery(self, data: bytes, addr: tuple):
        """Handle incoming discovery broadcast."""
        try:
            message = json.loads(data.decode())

            if message.get("type") != "swarm_discovery":
                return

            if message.get("node_type") != "wordpress":
                return

            node_id = message["node_id"]
            node = WordPressNode(
                node_id=node_id,
                url=message.get("url", ""),
                api_url=message.get("api_url", ""),
                capabilities=message.get("capabilities", []),
                last_seen=time.time()
            )

            self.nodes[node_id] = node
            logger.info(f"Discovered WordPress node: {node_id} at {node.url}")

        except json.JSONDecodeError:
            pass
        except Exception as e:
            logger.error(f"Error handling discovery: {e}")

    async def _health_check_loop(self):
        """Periodically check health of known nodes."""
        while self._running:
            await asyncio.sleep(60)  # Check every minute

            for node_id, node in list(self.nodes.items()):
                if node.is_stale():
                    # Try to ping the node
                    healthy = await self._ping_node(node)
                    if not healthy:
                        logger.warning(f"Node {node_id} is unresponsive, removing")
                        del self.nodes[node_id]
                    else:
                        node.last_seen = time.time()

    async def _ping_node(self, node: WordPressNode) -> bool:
        """Ping a WordPress node to check health."""
        try:
            async with self._session.get(
                f"{node.api_url}/node/",
                params={"rest_route": "/geoos/v1/node/"},
                timeout=aiohttp.ClientTimeout(total=5)
            ) as resp:
                if resp.status == 200:
                    data = await resp.json()
                    node.posts_count = data.get("posts_count", 0)
                    return True
        except Exception as e:
            logger.debug(f"Ping failed for {node.node_id}: {e}")
        return False

    async def execute_task(
        self,
        task_type: str,
        payload: dict,
        preferred_node: Optional[str] = None
    ) -> dict:
        """
        Execute a task on a WordPress node.

        Args:
            task_type: Task type (content_intelligence, semantic_storage, etc.)
            payload: Task-specific data
            preferred_node: Optional node_id to target

        Returns:
            Task result from the WordPress node
        """
        # Select node
        node = self._select_node(task_type, preferred_node)
        if not node:
            return {
                "status": "error",
                "message": f"No available node for task type: {task_type}"
            }

        # Send task
        task = {
            "type": task_type,
            "task_id": f"py-{int(time.time()*1000)}",
            "payload": payload
        }

        try:
            async with self._session.post(
                f"{node.api_url}/task/",
                params={"rest_route": "/geoos/v1/task/"},
                json=task,
                headers={
                    "Content-Type": "application/json",
                    "X-Geometry-OS-Auth": self.shared_secret
                },
                timeout=aiohttp.ClientTimeout(total=30)
            ) as resp:
                result = await resp.json()
                node.last_seen = time.time()
                return result

        except Exception as e:
            logger.error(f"Task execution failed on {node.node_id}: {e}")
            return {
                "status": "error",
                "message": str(e),
                "node_id": node.node_id
            }

    def _select_node(
        self,
        task_type: str,
        preferred_node: Optional[str] = None
    ) -> Optional[WordPressNode]:
        """Select best node for task type."""
        # Prefer specified node
        if preferred_node and preferred_node in self.nodes:
            node = self.nodes[preferred_node]
            if task_type in node.capabilities and not node.is_stale():
                return node

        # Find node with required capability
        capable_nodes = [
            n for n in self.nodes.values()
            if task_type in n.capabilities and not n.is_stale()
        ]

        if not capable_nodes:
            return None

        # Select node with most posts (most "memory")
        return max(capable_nodes, key=lambda n: n.posts_count)

    async def query_memory(
        self,
        query: str,
        limit: int = 10,
        node_id: Optional[str] = None
    ) -> dict:
        """
        Query semantic memory across WordPress nodes.

        Args:
            query: Search query
            limit: Maximum results per node
            node_id: Optional specific node to query

        Returns:
            Combined search results
        """
        nodes_to_query = (
            [self.nodes[node_id]] if node_id and node_id in self.nodes
            else [n for n in self.nodes.values() if "memory_retrieval" in n.capabilities]
        )

        results = []
        for node in nodes_to_query:
            try:
                async with self._session.post(
                    f"{node.api_url}/memory/query/",
                    params={"rest_route": "/geoos/v1/memory/query/"},
                    json={"query": query, "limit": limit},
                    headers={"X-Geometry-OS-Auth": self.shared_secret},
                    timeout=aiohttp.ClientTimeout(total=10)
                ) as resp:
                    data = await resp.json()
                    for r in data.get("results", []):
                        r["source_node"] = node.node_id
                        results.append(r)
            except Exception as e:
                logger.warning(f"Memory query failed on {node.node_id}: {e}")

        # Sort by relevance (simple: return all for now)
        return {
            "query": query,
            "total_count": len(results),
            "results": results[:limit * len(nodes_to_query)]
        }

    async def store_memory(
        self,
        title: str,
        content: str,
        meta: Optional[dict] = None,
        node_id: Optional[str] = None
    ) -> dict:
        """
        Store content as semantic memory on a WordPress node.

        Args:
            title: Memory title
            content: Memory content (HTML supported)
            meta: Optional metadata
            node_id: Optional specific node

        Returns:
            Storage result with post URL
        """
        return await self.execute_task(
            "semantic_storage",
            {
                "title": title,
                "content": content,
                "meta": meta or {}
            },
            preferred_node=node_id
        )

    def get_nodes(self) -> List[dict]:
        """Get list of all known WordPress nodes."""
        return [n.to_dict() for n in self.nodes.values()]

    def get_node(self, node_id: str) -> Optional[dict]:
        """Get specific node info."""
        node = self.nodes.get(node_id)
        return node.to_dict() if node else None


# CLI for testing
async def main():
    """CLI entry point for testing."""
    import argparse

    parser = argparse.ArgumentParser(description="WordPress Swarm Bridge CLI")
    parser.add_argument("--secret", default="default-secret-change-me", help="Shared secret")
    parser.add_argument("--discover", action="store_true", help="Run discovery only")
    parser.add_argument("--query", help="Query memory")
    parser.add_argument("--store-title", help="Store memory with title")
    parser.add_argument("--store-content", help="Store memory content")
    parser.add_argument("--node", help="Target specific node")

    args = parser.parse_args()

    bridge = WordPressSwarmBridge(shared_secret=args.secret)
    await bridge.start()

    # Wait for discovery in all modes except discovery itself
    if not args.discover:
        await asyncio.sleep(2)

    try:
        if args.discover:
            print("Listening for WordPress nodes... (Ctrl+C to stop)")
            while True:
                await asyncio.sleep(1)
                print(f"\rKnown nodes: {len(bridge.nodes)}", end="", flush=True)

        elif args.query:
            results = await bridge.query_memory(args.query)
            print(json.dumps(results, indent=2))

        elif args.store_title and args.store_content:
            result = await bridge.store_memory(
                args.store_title,
                args.store_content,
                node_id=args.node
            )
            print(json.dumps(result, indent=2))

        else:
            # Show nodes
            await asyncio.sleep(2)  # Wait for discovery
            print("Known WordPress Nodes:")
            for node in bridge.get_nodes():
                print(f"  - {node['node_id']}: {node['url']} ({node['status']})")

    except KeyboardInterrupt:
        pass
    finally:
        await bridge.stop()


if __name__ == "__main__":
    asyncio.run(main())
