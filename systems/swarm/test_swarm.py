import asyncio
import json
import time
import aiohttp
import logging
import argparse
from dataclasses import dataclass
from pathlib import Path
from typing import List, Optional
from wp_node_discovery import WordPressSwarmBridge

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger("swarm_test_runner")


@dataclass
class TestResult:
    """Result of a single test."""
    name: str
    passed: bool
    duration_ms: int
    message: str

    def to_dict(self) -> dict:
        return {
            "name": self.name,
            "status": "PASS" if self.passed else "FAIL",
            "duration_ms": self.duration_ms,
            "message": self.message
        }

class Level2Tests:
    """Multi-node sync tests for Level 2."""

    def __init__(self, bridge: WordPressSwarmBridge):
        self.bridge = bridge

    async def test_2_1_second_node_discovery(self) -> tuple[bool, str]:
        """2.1: Verify 2+ nodes are discovered."""
        logger.info("Running test: 2.1 Second Node Discovery...")

        if not self.bridge.nodes:
            return False, "No nodes discovered."

        node_count = len(self.bridge.nodes)
        if node_count < 2:
            return False, f"Only {node_count} node(s) found. Need 2+ for Level 2."

        node_ids = list(self.bridge.nodes.keys())
        return True, f"Found {node_count} nodes: {', '.join(node_ids)}"

    async def test_2_2_distributed_query(self) -> tuple[bool, str]:
        """2.2: Query returns results from multiple nodes."""
        logger.info("Running test: 2.2 Distributed Query...")

        # Query for common term
        result = await self.bridge.query_memory("the", limit=20)

        results = result.get("results", [])
        if not results:
            return False, "No results returned from query."

        sources = set(r.get("source_node") for r in results if r.get("source_node"))

        if len(sources) >= 2:
            return True, f"Results from {len(sources)} nodes: {sources}"

        return False, f"Results only from {len(sources)} node(s): {sources}"

    async def test_2_3_sync_manager(self) -> tuple[bool, str]:
        """2.3: SyncManager can fetch from remote nodes."""
        logger.info("Running test: 2.3 Sync Manager...")

        from sync_manager import SyncManager

        if not self.bridge.nodes:
            return False, "No nodes available for sync test."

        manager = SyncManager()
        await manager.start()

        try:
            # Try to fetch from first discovered node
            node = list(self.bridge.nodes.values())[0]
            posts, error = await manager.fetch_posts(node.api_url, since=0, limit=5)

            if error:
                return False, f"Fetch error: {error}"

            return True, f"Fetched {len(posts)} posts from {node.node_id}"

        except Exception as e:
            return False, f"Error: {e}"
        finally:
            await manager.stop()


class SwarmTestRunner:
    def __init__(self, secret="default-secret-change-me"):
        self.bridge = WordPressSwarmBridge(shared_secret=secret)
        self.results = {"passed": 0, "failed": 0, "tests": []}

    async def run_test(self, name, coro):
        logger.info(f"🧪 Running test: {name}...")
        start_time = time.time()
        try:
            success, message = await coro
            duration = time.time() - start_time
            result = {
                "name": name,
                "status": "PASS" if success else "FAIL",
                "message": message,
                "duration": f"{duration:.2f}s"
            }
            if success:
                self.results["passed"] += 1
                logger.info(f"✅ {name} passed.")
            else:
                self.results["failed"] += 1
                logger.error(f"❌ {name} failed: {message}")
            self.results["tests"].append(result)
            return success
        except Exception as e:
            logger.error(f"💥 {name} crashed: {e}")
            self.results["failed"] += 1
            self.results["tests"].append({
                "name": name,
                "status": "CRASH",
                "message": str(e),
                "duration": f"{time.time() - start_time:.2f}s"
            })
            return False

    async def test_api_health(self):
        """1.1 API Health: GET /geoos/v1/node returns node info"""
        if not self.bridge.nodes:
            return False, "No nodes discovered."
        
        node = list(self.bridge.nodes.values())[0]
        try:
            async with self.bridge._session.get(
                f"{node.api_url}/node/",
                params={"rest_route": "/geoos/v1/node/"},
                timeout=5
            ) as resp:
                if resp.status == 200:
                    data = await resp.json()
                    if "node_id" in data:
                        return True, f"Node {data['node_id']} is healthy."
                return False, f"API returned status {resp.status}"
        except Exception as e:
            return False, str(e)

    async def test_memory_storage(self):
        """1.2 Memory Storage: Store a memory, get back post ID"""
        title = f"Test Memory {int(time.time())}"
        content = "This is a test memory for Swarm validation."
        result = await self.bridge.store_memory(title, content)
        
        if result.get("status") == "success" and "post_id" in result:
            return True, f"Stored memory as post #{result['post_id']}"
        return False, result.get("message", "Unknown error")

    async def test_memory_query(self):
        """1.3 Memory Query: Search returns stored memories"""
        # Search for something known to exist
        query = "manual"
        result = await self.bridge.query_memory(query)
        
        if result.get("total_count", 0) > 0:
            return True, f"Found {result['total_count']} results for '{query}'"
        return False, f"No results found for query '{query}'."

    async def test_daemon_status(self):
        """1.4 Daemon Status: Check if discovery daemon is running"""
        status_file = Path("/tmp/wp_swarm_status.json")
        if status_file.exists():
            try:
                data = json.loads(status_file.read_text())
                if data.get("running"):
                    return True, f"Daemon running (PID: {data.get('pid')}, Uptime: {data.get('uptime_human')})"
            except Exception as e:
                return False, f"Error reading status file: {e}"
        return False, "Daemon status file not found."

    async def run_suite(self, level=1):
        await self.bridge.start()
        # Wait for discovery
        await asyncio.sleep(2)

        # Level 1: Single node tests (default)
        if level >= 1:
            await self.run_test("1.1 API Health", self.test_api_health())
            await self.run_test("1.2 Memory Storage", self.test_memory_storage())
            await self.run_test("1.3 Memory Query", self.test_memory_query())
            await self.run_test("1.4 Daemon Status", self.test_daemon_status())

        # Level 2: Multi-node sync tests
        if level >= 2:
            level2 = Level2Tests(self.bridge)
            await self.run_test("2.1 Second Node Discovery", level2.test_2_1_second_node_discovery())
            await self.run_test("2.2 Distributed Query", level2.test_2_2_distributed_query())
            await self.run_test("2.3 Sync Manager", level2.test_2_3_sync_manager())

        await self.bridge.stop()

        print("\n" + "="*50)
        print(f"       SWARM TEST RESULTS (Level {level})")
        print("="*50)
        for t in self.results["tests"]:
            print(f"[{t['status']}] {t['name']:<20} ({t['duration']}) - {t['message']}")
        print("-" * 50)
        print(f"Passed: {self.results['passed']} | Failed: {self.results['failed']}")
        print("="*50)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Swarm Integration Test Runner")
    parser.add_argument("--level", type=int, default=1, help="Test level to run")
    parser.add_argument("--secret", default="default-secret-change-me", help="Shared secret")
    args = parser.parse_args()

    runner = SwarmTestRunner(secret=args.secret)
    try:
        asyncio.run(runner.run_suite(level=args.level))
    except KeyboardInterrupt:
        print("\nTest run aborted.")
