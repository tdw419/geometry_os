#!/usr/bin/env python3
"""
WordPress Swarm Discovery Daemon.

Long-running service that:
- Discovers WordPress Swarm Nodes
- Monitors cluster health
- Provides status via HTTP API and file-based reports
"""

import asyncio
import json
import logging
import os
import signal
import sys
from pathlib import Path
from datetime import datetime
import time

# Add project root to path
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from systems.swarm.wp_node_discovery import WordPressSwarmBridge, WordPressNode
from systems.swarm.sync_manager import SyncManager, RemoteNode
from typing import Dict, Optional

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s [%(levelname)s] %(name)s: %(message)s',
    handlers=[
        logging.StreamHandler(),
        logging.FileHandler('/tmp/wp_swarm_daemon.log')
    ]
)
logger = logging.getLogger("wp_discovery_daemon")


class SwarmDiscoveryDaemon:
    """Long-running discovery and monitoring daemon."""

    STATUS_FILE = Path("/tmp/wp_swarm_status.json")
    PID_FILE = Path("/tmp/wp_swarm_daemon.pid")

    def __init__(self, shared_secret: str = "default-secret-change-me"):
        self.bridge = WordPressSwarmBridge(shared_secret=shared_secret)
        self._running = False
        self._start_time: float = 0
        self._stats = {
            "discoveries": 0,
            "health_checks": 0,
            "tasks_routed": 0,
            "errors": 0,
            "syncs": 0,
            "sync_errors": 0,
            "posts_mirrored": 0
        }
        # Sync manager for remote nodes
        self.sync_manager: Optional[SyncManager] = None
        self.sync_interval = 300  # 5 minutes
        self.remote_nodes: Dict[str, RemoteNode] = {}

    async def start(self):
        """Start the daemon."""
        # Write PID file
        self.PID_FILE.write_text(str(os.getpid()))

        self._running = True
        self._start_time = time.time()

        # Handle signals
        signal.signal(signal.SIGTERM, self._handle_shutdown)
        signal.signal(signal.SIGINT, self._handle_shutdown)

        # Start the bridge
        await self.bridge.start()

        # Start sync manager
        self.sync_manager = SyncManager(
            state_dir=Path("/tmp/geoos_sync")
        )
        await self.sync_manager.start()

        # Start monitoring loops
        asyncio.create_task(self._status_report_loop())
        asyncio.create_task(self._health_check_loop())
        asyncio.create_task(self._sync_loop())

        logger.info("=" * 60)
        logger.info("🐝 WordPress Swarm Discovery Daemon Started")
        logger.info(f"   PID: {os.getpid()}")
        logger.info(f"   Status file: {self.STATUS_FILE}")
        logger.info("=" * 60)

        # Main loop
        while self._running:
            await asyncio.sleep(1)

    def _handle_shutdown(self, signum, frame):
        """Handle shutdown signals."""
        logger.info(f"Received signal {signum}, shutting down...")
        self._running = False

    async def stop(self):
        """Stop the daemon."""
        self._running = False
        await self.bridge.stop()

        # Stop sync manager
        if self.sync_manager:
            await self.sync_manager.stop()

        # Clean up PID file
        if self.PID_FILE.exists():
            self.PID_FILE.unlink()

        # Write final status
        await self._write_status()

        logger.info("Daemon stopped")

    async def _status_report_loop(self):
        """Periodically write status to file."""
        while self._running:
            await self._write_status()
            await asyncio.sleep(10)

    async def _write_status(self):
        """Write current status to JSON file."""
        uptime = time.time() - self._start_time if self._start_time else 0

        status = {
            "running": self._running,
            "pid": os.getpid(),
            "uptime_seconds": round(uptime, 1),
            "uptime_human": self._format_uptime(uptime),
            "started_at": datetime.fromtimestamp(self._start_time).isoformat() if self._start_time else None,
            "nodes": {
                "count": len(self.bridge.nodes),
                "list": [n.to_dict() for n in self.bridge.nodes.values()]
            },
            "stats": self._stats,
            "sync": {
                "last_sync": max(
                    (n.last_sync for n in self.remote_nodes.values()),
                    default=0
                ),
                "remote_nodes_count": len(self.remote_nodes),
                "mirrored_posts": len(self.sync_manager.get_mirrored_posts()) if self.sync_manager else 0
            },
            "last_update": datetime.now().isoformat()
        }

        self.STATUS_FILE.write_text(json.dumps(status, indent=2))

    def _format_uptime(self, seconds: float) -> str:
        """Format uptime as human readable."""
        if seconds < 60:
            return f"{seconds:.0f}s"
        elif seconds < 3600:
            return f"{seconds/60:.1f}m"
        else:
            return f"{seconds/3600:.1f}h"

    async def _health_check_loop(self):
        """Periodically check node health."""
        while self._running:
            await asyncio.sleep(60)  # Check every minute

            stale_nodes = []
            for node_id, node in list(self.bridge.nodes.items()):
                if node.is_stale(max_age=120):
                    # Try to ping
                    healthy = await self.bridge._ping_node(node)
                    if healthy:
                        node.last_seen = time.time()
                        logger.debug(f"Node {node_id} responsive")
                    else:
                        stale_nodes.append(node_id)

            # Remove stale nodes
            for node_id in stale_nodes:
                logger.warning(f"Removing stale node: {node_id}")
                del self.bridge.nodes[node_id]
                self._stats["errors"] += 1

            self._stats["health_checks"] += 1

    async def _sync_loop(self):
        """Periodically sync with all known remote nodes."""
        while self._running:
            await asyncio.sleep(self.sync_interval)

            if not self.sync_manager:
                continue

            for node_id, node in list(self.bridge.nodes.items()):
                # Skip local nodes (same machine)
                if "localhost" in node.url or "0.0.0.0" in node.url or "127.0.0.1" in node.url:
                    continue

                # Create RemoteNode if not exists
                if node_id not in self.remote_nodes:
                    self.remote_nodes[node_id] = RemoteNode(
                        node_id=node_id,
                        url=node.url,
                        api_url=node.api_url
                    )

                # Perform sync
                logger.info(f"Syncing with remote node: {node_id}")
                result = await self.sync_manager.sync_node(self.remote_nodes[node_id])

                self._stats["syncs"] = self._stats.get("syncs", 0) + 1
                if result.success:
                    self._stats["posts_mirrored"] = self._stats.get("posts_mirrored", 0) + result.posts_stored
                    logger.info(f"Sync complete: {result.posts_stored} posts from {node_id}")
                else:
                    self._stats["sync_errors"] = self._stats.get("sync_errors", 0) + 1
                    logger.error(f"Sync failed for {node_id}: {result.error}")

    def get_status(self) -> dict:
        """Get current status."""
        return json.loads(self.STATUS_FILE.read_text()) if self.STATUS_FILE.exists() else {}


def get_status():
    """Get daemon status from file."""
    status_file = Path("/tmp/wp_swarm_status.json")
    if status_file.exists():
        return json.loads(status_file.read_text())
    return {"running": False, "error": "Status file not found"}


def is_running() -> bool:
    """Check if daemon is running."""
    pid_file = Path("/tmp/wp_swarm_daemon.pid")
    if not pid_file.exists():
        return False

    try:
        pid = int(pid_file.read_text())
        # Check if process exists
        os.kill(pid, 0)
        return True
    except (OSError, ValueError):
        return False


async def main():
    """Main entry point."""
    import argparse

    parser = argparse.ArgumentParser(description="WordPress Swarm Discovery Daemon")
    parser.add_argument("--start", action="store_true", help="Start the daemon")
    parser.add_argument("--stop", action="store_true", help="Stop the daemon")
    parser.add_argument("--status", action="store_true", help="Show status")
    parser.add_argument("--secret", default="default-secret-change-me", help="Shared secret")
    parser.add_argument("--foreground", "-f", action="store_true", help="Run in foreground")

    args = parser.parse_args()

    if args.status:
        status = get_status()
        print(json.dumps(status, indent=2))
        return

    if args.stop:
        pid_file = Path("/tmp/wp_swarm_daemon.pid")
        if pid_file.exists():
            pid = int(pid_file.read_text())
            try:
                os.kill(pid, signal.SIGTERM)
                print(f"Sent SIGTERM to daemon (PID {pid})")
            except ProcessLookupError:
                print("Daemon not running")
                pid_file.unlink()
        else:
            print("Daemon not running (no PID file)")
        return

    if args.start or args.foreground:
        if is_running():
            print("Daemon already running")
            status = get_status()
            print(json.dumps(status, indent=2))
            return

        daemon = SwarmDiscoveryDaemon(shared_secret=args.secret)

        try:
            await daemon.start()
        except KeyboardInterrupt:
            logger.info("Interrupted")
        finally:
            await daemon.stop()
        return

    # Default: show status
    status = get_status()
    print(json.dumps(status, indent=2))


if __name__ == "__main__":
    asyncio.run(main())
