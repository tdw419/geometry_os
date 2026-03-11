"""Unit tests for SnapshotStorage."""

from datetime import datetime

import pytest

from systems.pixel_compiler.boot.snapshot_storage import (
    SnapshotMetadata,
    SnapshotStorage,
)


class TestSnapshotMetadata:
    """Tests for SnapshotMetadata dataclass."""

    def test_metadata_creation(self):
        """Test creating SnapshotMetadata."""
        metadata = SnapshotMetadata(
            tag="test-snap",
            container_name="alpine",
            created_at="2024-01-15T14:30:00",
            size="2.5 GB",
            description="Test snapshot"
        )
        assert metadata.tag == "test-snap"
        assert metadata.container_name == "alpine"
        assert metadata.size == "2.5 GB"

    def test_metadata_to_dict(self):
        """Test to_dict serialization."""
        metadata = SnapshotMetadata(
            tag="snap1",
            container_name="ubuntu",
            created_at="2024-01-15T14:30:00",
            size="1.0 GB"
        )
        data = metadata.to_dict()
        assert data["tag"] == "snap1"
        assert data["container_name"] == "ubuntu"
        assert data["description"] is None

    def test_metadata_from_dict(self):
        """Test from_dict deserialization."""
        data = {
            "tag": "snap2",
            "container_name": "debian",
            "created_at": "2024-01-15T14:30:00",
            "size": "512 MB",
            "description": "Before update"
        }
        metadata = SnapshotMetadata.from_dict(data)
        assert metadata.tag == "snap2"
        assert metadata.description == "Before update"


class TestSnapshotStorage:
    """Tests for SnapshotStorage class."""

    @pytest.fixture
    def temp_storage(self, tmp_path):
        """Create a temporary storage instance."""
        return SnapshotStorage(snapshot_dir=tmp_path / "snapshots")

    def test_storage_initialization(self, temp_storage):
        """Test storage directory is created."""
        assert temp_storage.snapshot_dir.exists()

    def test_save_and_load_metadata(self, temp_storage):
        """Test saving and loading metadata."""
        metadata = SnapshotMetadata(
            tag="test-snap",
            container_name="alpine",
            created_at=datetime.now().isoformat(),
            size="2.5 GB"
        )

        temp_storage.save_metadata("alpine", metadata)
        loaded = temp_storage.list_snapshots("alpine")

        assert len(loaded) == 1
        assert loaded[0].tag == "test-snap"

    def test_update_metadata(self, temp_storage):
        """Test updating existing metadata."""
        metadata = SnapshotMetadata(
            tag="snap1",
            container_name="alpine",
            created_at=datetime.now().isoformat(),
            size="2.0 GB",
            description="Original"
        )

        temp_storage.save_metadata("alpine", metadata)

        # Update with same tag
        updated = SnapshotMetadata(
            tag="snap1",
            container_name="alpine",
            created_at=datetime.now().isoformat(),
            size="2.0 GB",
            description="Updated description"
        )

        temp_storage.save_metadata("alpine", updated)
        loaded = temp_storage.list_snapshots("alpine")

        assert len(loaded) == 1
        assert loaded[0].description == "Updated description"

    def test_list_all_snapshots(self, temp_storage):
        """Test listing all snapshots across containers."""
        for container in ["alpine", "ubuntu"]:
            for i in range(2):
                metadata = SnapshotMetadata(
                    tag=f"snap-{i}",
                    container_name=container,
                    created_at=datetime.now().isoformat(),
                    size="1.0 GB"
                )
                temp_storage.save_metadata(container, metadata)

        all_snaps = temp_storage.list_snapshots()
        assert len(all_snaps) == 4

    def test_get_metadata(self, temp_storage):
        """Test getting specific snapshot metadata."""
        metadata = SnapshotMetadata(
            tag="specific-snap",
            container_name="alpine",
            created_at=datetime.now().isoformat(),
            size="3.0 GB"
        )
        temp_storage.save_metadata("alpine", metadata)

        result = temp_storage.get_metadata("alpine", "specific-snap")
        assert result is not None
        assert result.tag == "specific-snap"

        # Non-existent snapshot
        result = temp_storage.get_metadata("alpine", "nonexistent")
        assert result is None

    def test_delete_metadata(self, temp_storage):
        """Test deleting metadata."""
        metadata = SnapshotMetadata(
            tag="to-delete",
            container_name="alpine",
            created_at=datetime.now().isoformat(),
            size="1.0 GB"
        )
        temp_storage.save_metadata("alpine", metadata)

        # Delete
        result = temp_storage.delete_metadata("alpine", "to-delete")
        assert result is True

        # Verify deleted
        loaded = temp_storage.list_snapshots("alpine")
        assert len(loaded) == 0

        # Delete non-existent
        result = temp_storage.delete_metadata("alpine", "nonexistent")
        assert result is False

    def test_list_containers(self, temp_storage):
        """Test listing containers with snapshots."""
        for container in ["alpine", "ubuntu", "debian"]:
            metadata = SnapshotMetadata(
                tag="snap",
                container_name=container,
                created_at=datetime.now().isoformat(),
                size="1.0 GB"
            )
            temp_storage.save_metadata(container, metadata)

        containers = temp_storage.list_containers()
        assert set(containers) == {"alpine", "ubuntu", "debian"}

    def test_handles_corrupted_metadata(self, temp_storage):
        """Test handling corrupted metadata file."""
        container_dir = temp_storage.snapshot_dir / "corrupted"
        container_dir.mkdir(parents=True)
        metadata_file = container_dir / "metadata.json"

        # Write invalid JSON
        metadata_file.write_text("not valid json {")

        # Should return empty list instead of crashing
        loaded = temp_storage.list_snapshots("corrupted")
        assert loaded == []
