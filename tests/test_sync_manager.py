#!/usr/bin/env python3
"""
Tests for SyncManager module.

Tests remote WordPress node synchronization with the Geometry OS cluster.
"""

import asyncio
import json
import pytest
import tempfile
import time
from pathlib import Path
from unittest.mock import AsyncMock, MagicMock, patch
from dataclasses import asdict

# Import the module under test (will fail until implemented)
from systems.swarm.sync_manager import (
    RemoteNode,
    SyncResult,
    SyncManager,
    SyncState
)


class TestRemoteNodeDataclass:
    """Tests for RemoteNode dataclass."""

    def test_remote_node_creation(self):
        """Test creating a RemoteNode with required fields."""
        node = RemoteNode(
            node_id="wp-node-001",
            url="http://example.com",
            api_url="http://example.com/wp-json"
        )
        assert node.node_id == "wp-node-001"
        assert node.url == "http://example.com"
        assert node.api_url == "http://example.com/wp-json"

    def test_remote_node_defaults(self):
        """Test RemoteNode default values."""
        node = RemoteNode(
            node_id="test",
            url="http://test.com",
            api_url="http://test.com/api"
        )
        assert node.enabled is True
        assert node.last_sync == 0
        assert node.sync_count == 0
        assert node.error_count == 0
        assert node.last_error is None

    def test_remote_node_to_dict(self):
        """Test RemoteNode serialization."""
        node = RemoteNode(
            node_id="node-1",
            url="http://example.com",
            api_url="http://example.com/api",
            last_sync=1234567890
        )
        data = node.to_dict()
        assert data["node_id"] == "node-1"
        assert data["url"] == "http://example.com"
        assert data["last_sync"] == 1234567890

    def test_remote_node_from_dict(self):
        """Test RemoteNode deserialization."""
        data = {
            "node_id": "node-2",
            "url": "http://test.com",
            "api_url": "http://test.com/api",
            "enabled": False,
            "last_sync": 1234567890
        }
        node = RemoteNode.from_dict(data)
        assert node.node_id == "node-2"
        assert node.enabled is False
        assert node.last_sync == 1234567890


class TestSyncResultDataclass:
    """Tests for SyncResult dataclass."""

    def test_sync_result_success(self):
        """Test successful SyncResult."""
        result = SyncResult(
            node_id="node-1",
            success=True,
            posts_fetched=10,
            posts_stored=10
        )
        assert result.success is True
        assert result.posts_fetched == 10
        assert result.posts_stored == 10
        assert result.error is None

    def test_sync_result_failure(self):
        """Test failed SyncResult."""
        result = SyncResult(
            node_id="node-2",
            success=False,
            posts_fetched=0,
            posts_stored=0,
            error="Connection refused"
        )
        assert result.success is False
        assert result.error == "Connection refused"

    def test_sync_result_timestamp(self):
        """Test SyncResult has timestamp."""
        before = time.time()
        result = SyncResult(
            node_id="node-3",
            success=True,
            posts_fetched=5,
            posts_stored=5
        )
        after = time.time()
        assert before <= result.timestamp <= after


class TestSyncStateDataclass:
    """Tests for SyncState dataclass."""

    def test_sync_state_creation(self):
        """Test creating SyncState."""
        state = SyncState()
        assert state.last_sync_time == 0
        assert state.total_posts_mirrored == 0
        assert state.nodes_synced == 0
        assert state.errors == 0

    def test_sync_state_to_from_dict(self):
        """Test SyncState serialization."""
        state = SyncState(
            last_sync_time=1234567890,
            total_posts_mirrored=100,
            nodes_synced=3,
            errors=2
        )
        data = state.to_dict()
        restored = SyncState.from_dict(data)
        assert restored.last_sync_time == state.last_sync_time
        assert restored.total_posts_mirrored == state.total_posts_mirrored


class TestSyncManagerLifecycle:
    """Tests for SyncManager lifecycle methods."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.mark.asyncio
    async def test_sync_manager_start(self, temp_state_dir):
        """Test SyncManager.start() initializes resources."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()
        assert manager._running is True
        assert manager._session is not None
        await manager.stop()

    @pytest.mark.asyncio
    async def test_sync_manager_stop(self, temp_state_dir):
        """Test SyncManager.stop() cleans up resources."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()
        await manager.stop()
        assert manager._running is False
        assert manager._session is None

    @pytest.mark.asyncio
    async def test_sync_manager_context_manager(self, temp_state_dir):
        """Test SyncManager as async context manager."""
        async with SyncManager(state_dir=temp_state_dir) as manager:
            assert manager._running is True
        assert manager._running is False


class TestSyncManagerFetchPosts:
    """Tests for SyncManager.fetch_posts method."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.mark.asyncio
    async def test_fetch_posts_success(self, temp_state_dir):
        """Test fetching posts from a remote node."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        mock_response = {
            "node_id": "wp-node-001",
            "count": 2,
            "posts": [
                {"id": 1, "title": "Post 1", "content": "Content 1"},
                {"id": 2, "title": "Post 2", "content": "Content 2"}
            ]
        }

        with patch.object(manager, '_session') as mock_session:
            mock_get = AsyncMock()
            mock_get.__aenter__ = AsyncMock(return_value=MagicMock(
                status=200,
                json=AsyncMock(return_value=mock_response)
            ))
            mock_get.__aexit__ = AsyncMock(return_value=None)
            mock_session.get.return_value = mock_get

            posts, error = await manager.fetch_posts(
                api_url="http://example.com/wp-json",
                since=0,
                limit=10
            )

            assert len(posts) == 2
            assert posts[0]["title"] == "Post 1"
            assert error is None

        await manager.stop()

    @pytest.mark.asyncio
    async def test_fetch_posts_with_since_param(self, temp_state_dir):
        """Test fetch_posts filters by since timestamp."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        with patch.object(manager, '_session') as mock_session:
            mock_get = AsyncMock()
            mock_get.__aenter__ = AsyncMock(return_value=MagicMock(
                status=200,
                json=AsyncMock(return_value={"node_id": "test", "count": 0, "posts": []})
            ))
            mock_get.__aexit__ = AsyncMock(return_value=None)
            mock_session.get.return_value = mock_get

            await manager.fetch_posts(
                api_url="http://example.com/wp-json",
                since=1234567890,
                limit=10
            )

            # Verify the call included since parameter
            call_args = mock_session.get.call_args
            assert "since" in str(call_args)

        await manager.stop()

    @pytest.mark.asyncio
    async def test_fetch_posts_handles_error(self, temp_state_dir):
        """Test fetch_posts handles network errors gracefully."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        with patch.object(manager, '_session') as mock_session:
            mock_session.get.side_effect = Exception("Network error")

            posts, error = await manager.fetch_posts(
                api_url="http://example.com/wp-json",
                since=0,
                limit=10
            )

            assert posts == []
            assert error == "Network error"

        await manager.stop()


class TestSyncManagerStorePosts:
    """Tests for SyncManager.store_posts method."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.mark.asyncio
    async def test_store_posts_success(self, temp_state_dir):
        """Test storing posts to local storage."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        posts = [
            {"id": 1, "title": "Post 1", "content": "Content 1"},
            {"id": 2, "title": "Post 2", "content": "Content 2"}
        ]

        count = await manager.store_posts(posts, source_node="wp-node-001")

        assert count == 2
        # Verify posts are in mirrored storage
        mirrored = manager.get_mirrored_posts()
        assert len(mirrored) >= 2

        await manager.stop()

    @pytest.mark.asyncio
    async def test_store_posts_empty_list(self, temp_state_dir):
        """Test storing empty post list."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        count = await manager.store_posts([], source_node="wp-node-001")

        assert count == 0

        await manager.stop()

    @pytest.mark.asyncio
    async def test_store_posts_adds_source_metadata(self, temp_state_dir):
        """Test stored posts include source node metadata."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        posts = [{"id": 1, "title": "Test", "content": "Test content"}]

        await manager.store_posts(posts, source_node="wp-node-001")

        mirrored = manager.get_mirrored_posts()
        stored_post = next((p for p in mirrored if p.get("id") == 1), None)
        assert stored_post is not None
        assert stored_post.get("_source_node") == "wp-node-001"

        await manager.stop()


class TestSyncManagerSyncNode:
    """Tests for SyncManager.sync_node method."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.mark.asyncio
    async def test_sync_node_success(self, temp_state_dir):
        """Test syncing a remote node."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        node = RemoteNode(
            node_id="wp-node-001",
            url="http://example.com",
            api_url="http://example.com/wp-json"
        )

        mock_posts = [
            {"id": 1, "title": "Post 1", "content": "Content 1"}
        ]

        with patch.object(manager, '_session') as mock_session:
            mock_get = AsyncMock()
            mock_get.__aenter__ = AsyncMock(return_value=MagicMock(
                status=200,
                json=AsyncMock(return_value={
                    "node_id": "wp-node-001",
                    "count": 1,
                    "posts": mock_posts
                })
            ))
            mock_get.__aexit__ = AsyncMock(return_value=None)
            mock_session.get.return_value = mock_get

            result = await manager.sync_node(node)

            assert result.success is True
            assert result.posts_fetched == 1
            assert result.posts_stored == 1

        await manager.stop()

    @pytest.mark.asyncio
    async def test_sync_node_updates_last_sync(self, temp_state_dir):
        """Test sync_node updates node's last_sync timestamp."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        node = RemoteNode(
            node_id="wp-node-001",
            url="http://example.com",
            api_url="http://example.com/wp-json",
            last_sync=0
        )

        with patch.object(manager, '_session') as mock_session:
            mock_get = AsyncMock()
            mock_get.__aenter__ = AsyncMock(return_value=MagicMock(
                status=200,
                json=AsyncMock(return_value={"node_id": "test", "count": 0, "posts": []})
            ))
            mock_get.__aexit__ = AsyncMock(return_value=None)
            mock_session.get.return_value = mock_get

            await manager.sync_node(node)

            assert node.last_sync > 0

        await manager.stop()

    @pytest.mark.asyncio
    async def test_sync_node_handles_failure(self, temp_state_dir):
        """Test sync_node handles sync failures."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        node = RemoteNode(
            node_id="wp-node-001",
            url="http://example.com",
            api_url="http://example.com/wp-json"
        )

        with patch.object(manager, '_session') as mock_session:
            mock_session.get.side_effect = Exception("Connection refused")

            result = await manager.sync_node(node)

            assert result.success is False
            assert "Connection refused" in result.error

        await manager.stop()


class TestSyncManagerGetMirroredPosts:
    """Tests for SyncManager.get_mirrored_posts method."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.mark.asyncio
    async def test_get_mirrored_posts_empty(self, temp_state_dir):
        """Test get_mirrored_posts returns empty list initially."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        posts = manager.get_mirrored_posts()

        assert posts == []

        await manager.stop()

    @pytest.mark.asyncio
    async def test_get_mirrored_posts_after_sync(self, temp_state_dir):
        """Test get_mirrored_posts returns posts after sync."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        posts = [
            {"id": 1, "title": "Post 1", "content": "Content 1"},
            {"id": 2, "title": "Post 2", "content": "Content 2"}
        ]
        await manager.store_posts(posts, source_node="wp-node-001")

        mirrored = manager.get_mirrored_posts()

        assert len(mirrored) == 2

        await manager.stop()

    @pytest.mark.asyncio
    async def test_get_mirrored_posts_filter_by_node(self, temp_state_dir):
        """Test get_mirrored_posts can filter by source node."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        posts1 = [{"id": 1, "title": "Post 1", "content": "Content 1"}]
        posts2 = [{"id": 2, "title": "Post 2", "content": "Content 2"}]

        await manager.store_posts(posts1, source_node="node-1")
        await manager.store_posts(posts2, source_node="node-2")

        mirrored = manager.get_mirrored_posts(source_node="node-1")

        assert len(mirrored) == 1
        assert mirrored[0]["_source_node"] == "node-1"

        await manager.stop()


class TestSyncManagerStatePersistence:
    """Tests for SyncManager state persistence."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.mark.asyncio
    async def test_save_state(self, temp_state_dir):
        """Test saving state to file."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        # Add some posts
        await manager.store_posts(
            [{"id": 1, "title": "Test", "content": "Test"}],
            source_node="node-1"
        )

        # Save state
        await manager.save_state()

        # Check file exists
        state_file = temp_state_dir / "sync_state.json"
        assert state_file.exists()

        await manager.stop()

    @pytest.mark.asyncio
    async def test_load_state(self, temp_state_dir):
        """Test loading state from file."""
        # Create a state file
        state_file = temp_state_dir / "sync_state.json"
        state_data = {
            "last_sync_time": 1234567890,
            "total_posts_mirrored": 50,
            "nodes_synced": 3,
            "errors": 1,
            "mirrored_posts": [
                {"id": 1, "title": "Test", "_source_node": "node-1"}
            ]
        }
        state_file.write_text(json.dumps(state_data))

        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        # State should be loaded
        assert manager._state.total_posts_mirrored == 50
        assert len(manager.get_mirrored_posts()) == 1

        await manager.stop()

    @pytest.mark.asyncio
    async def test_state_persists_across_restarts(self, temp_state_dir):
        """Test state persists across manager restarts."""
        # First instance
        manager1 = SyncManager(state_dir=temp_state_dir)
        await manager1.start()

        await manager1.store_posts(
            [{"id": 1, "title": "Persisted", "content": "Test"}],
            source_node="node-1"
        )
        await manager1.save_state()
        await manager1.stop()

        # Second instance
        manager2 = SyncManager(state_dir=temp_state_dir)
        await manager2.start()

        posts = manager2.get_mirrored_posts()
        assert len(posts) == 1
        assert posts[0]["title"] == "Persisted"

        await manager2.stop()


class TestSyncManagerNodeManagement:
    """Tests for SyncManager node management."""

    @pytest.fixture
    def temp_state_dir(self):
        """Create a temporary directory for state files."""
        with tempfile.TemporaryDirectory() as tmpdir:
            yield Path(tmpdir)

    @pytest.mark.asyncio
    async def test_add_node(self, temp_state_dir):
        """Test adding a remote node."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        node = RemoteNode(
            node_id="new-node",
            url="http://new.com",
            api_url="http://new.com/api"
        )

        manager.add_node(node)

        assert "new-node" in manager._nodes
        assert manager._nodes["new-node"].node_id == "new-node"

        await manager.stop()

    @pytest.mark.asyncio
    async def test_remove_node(self, temp_state_dir):
        """Test removing a remote node."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        node = RemoteNode(
            node_id="to-remove",
            url="http://remove.com",
            api_url="http://remove.com/api"
        )
        manager.add_node(node)

        manager.remove_node("to-remove")

        assert "to-remove" not in manager._nodes

        await manager.stop()

    @pytest.mark.asyncio
    async def test_get_nodes(self, temp_state_dir):
        """Test getting all configured nodes."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        node1 = RemoteNode(node_id="node-1", url="http://1.com", api_url="http://1.com/api")
        node2 = RemoteNode(node_id="node-2", url="http://2.com", api_url="http://2.com/api")

        manager.add_node(node1)
        manager.add_node(node2)

        nodes = manager.get_nodes()

        assert len(nodes) == 2
        assert "node-1" in nodes
        assert "node-2" in nodes

        await manager.stop()

    @pytest.mark.asyncio
    async def test_sync_all_nodes(self, temp_state_dir):
        """Test syncing all configured nodes."""
        manager = SyncManager(state_dir=temp_state_dir)
        await manager.start()

        node1 = RemoteNode(node_id="node-1", url="http://1.com", api_url="http://1.com/api")
        node2 = RemoteNode(node_id="node-2", url="http://2.com", api_url="http://2.com/api")

        manager.add_node(node1)
        manager.add_node(node2)

        with patch.object(manager, '_session') as mock_session:
            mock_get = AsyncMock()
            mock_get.__aenter__ = AsyncMock(return_value=MagicMock(
                status=200,
                json=AsyncMock(return_value={"node_id": "test", "count": 0, "posts": []})
            ))
            mock_get.__aexit__ = AsyncMock(return_value=None)
            mock_session.get.return_value = mock_get

            results = await manager.sync_all_nodes()

            assert len(results) == 2
            assert all(r.success for r in results)

        await manager.stop()


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
