#!/usr/bin/env python3
"""
End-to-End Integration Tests for Tectonic Mutation Flow.

Tests the complete data flow from WeightMutation creation through
MutationEmitter queuing to batch transmission and rollback scenarios.

Test Coverage:
1. Full mutation flow: WeightMutation -> queue in emitter -> verify batch structure
2. District upgrade flow: DistrictUpgrade -> queue upgrade -> verify visual feedback data
3. Rollback flow: Record mutation in journal -> call rollback -> verify inverse delta
"""

import asyncio
import pytest
from unittest.mock import AsyncMock, MagicMock, patch
from dataclasses import fields

from systems.neural_city.mutation_protocol import (
    WeightMutation,
    DistrictUpgrade,
    MutationJournal,
    MutationAuthority,
    Material,
    RollbackEntry
)
from systems.evolution_daemon.mutation_emitter import (
    MutationEmitter,
    PendingBatch,
    EmitterStats
)


class TestFullMutationFlow:
    """Test the complete mutation flow from creation to batch."""

    @pytest.mark.asyncio
    async def test_full_mutation_flow(self):
        """
        Test the complete flow:
        1. Create WeightMutation
        2. Queue in emitter
        3. Verify batch structure
        """
        # Create a mock emitter that doesn't actually connect
        emitter = MutationEmitter(
            a2a_url="ws://mock:8766",
            batch_size=10,
            agent_id="test_agent"
        )

        # Mock the WebSocket connection
        emitter.connected = True
        emitter.registered = True
        emitter.ws = AsyncMock()

        # Create a WeightMutation
        mutation = WeightMutation(
            index_1d=12345,
            weight_delta=0.025,
            layer="hidden_1",
            authority=MutationAuthority.ENGINEER
        )

        # Verify mutation properties
        assert mutation.index_1d == 12345
        assert mutation.weight_delta == 0.025
        assert mutation.layer == "hidden_1"
        assert mutation.is_authorized() is True
        assert mutation.mutation_id is not None

        # Get JSON representation
        mutation_json = mutation.to_json()
        assert mutation_json["type"] == "weight_mutation"
        assert mutation_json["index_1d"] == 12345
        assert mutation_json["weight_delta"] == 0.025
        assert mutation_json["layer"] == "hidden_1"
        assert mutation_json["authority"] == "engineer"

        # Queue the mutation
        await emitter.queue_mutation(mutation)

        # Verify it was queued
        pending_count = await emitter.get_pending_count()
        assert pending_count == 1

        # Verify stats
        stats = await emitter.get_stats()
        assert stats.mutations_queued == 1

        # Check pending batch structure
        assert len(emitter._pending.mutations) == 1
        batch_mutation = emitter._pending.mutations[0]
        assert batch_mutation["type"] == "weight_mutation"
        assert batch_mutation["index_1d"] == 12345
        assert batch_mutation["weight_delta"] == 0.025

        # Convert batch to JSON
        batch_json = emitter._pending.to_json()
        assert "batch_id" in batch_json
        assert "timestamp" in batch_json
        assert "mutations" in batch_json
        assert len(batch_json["mutations"]) == 1
        assert batch_json["count"] == 1

    @pytest.mark.asyncio
    async def test_multiple_mutations_batch_structure(self):
        """Test queuing multiple mutations creates proper batch."""
        emitter = MutationEmitter(
            a2a_url="ws://mock:8766",
            batch_size=100,
            agent_id="test_agent"
        )
        emitter.connected = True
        emitter.registered = True
        emitter.ws = AsyncMock()

        # Create and queue multiple mutations
        mutations = []
        for i in range(5):
            mutation = WeightMutation(
                index_1d=i * 1000,
                weight_delta=0.01 * (i - 2),
                layer=f"layer_{i % 3}",
                authority=MutationAuthority.ENGINEER
            )
            mutations.append(mutation)
            await emitter.queue_mutation(mutation)

        # Verify all are queued
        pending_count = await emitter.get_pending_count()
        assert pending_count == 5

        # Verify batch structure
        batch_json = emitter._pending.to_json()
        assert batch_json["count"] == 5
        assert len(batch_json["mutations"]) == 5

        # Verify each mutation is present
        for i, mutation in enumerate(mutations):
            found = any(
                m["index_1d"] == mutation.index_1d
                for m in batch_json["mutations"]
            )
            assert found, f"Mutation {i} not found in batch"

    @pytest.mark.asyncio
    async def test_auto_flush_at_batch_size(self):
        """Test that batch auto-flushes when size threshold is reached."""
        emitter = MutationEmitter(
            a2a_url="ws://mock:8766",
            batch_size=3,  # Small batch size for testing
            agent_id="test_agent"
        )
        emitter.connected = True
        emitter.registered = True
        emitter.ws = AsyncMock()

        # Queue mutations up to threshold
        for i in range(3):
            mutation = WeightMutation(
                index_1d=i,
                weight_delta=0.01,
                authority=MutationAuthority.ENGINEER
            )
            await emitter.queue_mutation(mutation)

        # Verify the batch was auto-flushed (pending should be empty or reset)
        stats = await emitter.get_stats()
        # After auto-flush, the pending batch should be reset
        assert emitter._pending.total_count() == 0 or stats.batches_sent >= 1


class TestDistrictUpgradeFlow:
    """Test district upgrade flow with visual feedback data."""

    @pytest.mark.asyncio
    async def test_district_upgrade_flow(self):
        """
        Test the complete district upgrade flow:
        1. Create DistrictUpgrade
        2. Queue upgrade
        3. Verify visual feedback data
        """
        emitter = MutationEmitter(
            a2a_url="ws://mock:8766",
            batch_size=10,
            agent_id="test_agent"
        )
        emitter.connected = True
        emitter.registered = True
        emitter.ws = AsyncMock()

        # Create a DistrictUpgrade
        upgrade = DistrictUpgrade(
            district_id="district_42",
            from_material="steel",
            to_material="gold",
            affected_indices=[100, 101, 102, 103, 104]
        )

        # Verify upgrade properties
        assert upgrade.district_id == "district_42"
        assert upgrade.from_material == "steel"
        assert upgrade.to_material == "gold"
        assert len(upgrade.affected_indices) == 5
        assert upgrade.upgrade_id is not None

        # Get JSON representation (for visual feedback)
        upgrade_json = upgrade.to_json()
        assert upgrade_json["type"] == "district_upgrade"
        assert upgrade_json["district_id"] == "district_42"
        assert upgrade_json["from_material"] == "steel"
        assert upgrade_json["to_material"] == "gold"
        # Visual feedback: count of affected indices
        assert upgrade_json["affected_indices"] == 5

        # Queue the upgrade
        await emitter.queue_upgrade(upgrade)

        # Verify it was queued
        pending_count = await emitter.get_pending_count()
        assert pending_count == 1

        # Verify stats
        stats = await emitter.get_stats()
        assert stats.upgrades_queued == 1

        # Verify pending batch structure
        assert len(emitter._pending.upgrades) == 1
        batch_upgrade = emitter._pending.upgrades[0]
        assert batch_upgrade["type"] == "district_upgrade"
        assert batch_upgrade["district_id"] == "district_42"

        # Verify full batch structure for visual rendering
        batch_json = emitter._pending.to_json()
        assert "upgrades" in batch_json
        assert len(batch_json["upgrades"]) == 1
        assert batch_json["count"] == 1

    @pytest.mark.asyncio
    async def test_district_upgrade_visual_feedback_fields(self):
        """Test that upgrade JSON contains all fields needed for visual rendering."""
        upgrade = DistrictUpgrade(
            district_id="visual_test_district",
            from_material="rust",
            to_material="steel",
            affected_indices=list(range(100))
        )

        json_data = upgrade.to_json()

        # Required fields for visual feedback
        required_fields = [
            "type",  # Message type
            "upgrade_id",  # Unique identifier
            "district_id",  # District to update visually
            "from_material",  # Current material (for transition effect)
            "to_material",  # New material (for transition effect)
            "affected_indices",  # Count for visual intensity
            "timestamp"  # For animation timing
        ]

        for field in required_fields:
            assert field in json_data, f"Missing visual feedback field: {field}"

        # Verify material transition is valid
        assert json_data["from_material"] in ["gold", "steel", "rust", "dust"]
        assert json_data["to_material"] in ["gold", "steel", "rust", "dust"]

    @pytest.mark.asyncio
    async def test_mixed_mutations_and_upgrades_batch(self):
        """Test batch with both mutations and upgrades."""
        emitter = MutationEmitter(
            a2a_url="ws://mock:8766",
            batch_size=100,
            agent_id="test_agent"
        )
        emitter.connected = True
        emitter.registered = True
        emitter.ws = AsyncMock()

        # Queue both mutations and upgrades
        for i in range(3):
            mutation = WeightMutation(
                index_1d=i,
                weight_delta=0.01,
                authority=MutationAuthority.ENGINEER
            )
            await emitter.queue_mutation(mutation)

        for i in range(2):
            upgrade = DistrictUpgrade(
                district_id=f"district_{i}",
                from_material="rust",
                to_material="steel",
                affected_indices=[j for j in range(10)]
            )
            await emitter.queue_upgrade(upgrade)

        # Verify both are in pending batch
        batch_json = emitter._pending.to_json()
        assert batch_json["count"] == 5
        assert len(batch_json["mutations"]) == 3
        assert len(batch_json["upgrades"]) == 2


class TestRollbackFlow:
    """Test mutation journal rollback functionality."""

    def test_rollback_restores_value(self):
        """
        Test rollback flow:
        1. Record mutation in journal
        2. Call rollback
        3. Verify inverse delta
        """
        # Create a journal
        journal = MutationJournal(max_entries=100)

        # Create a mutation
        mutation = WeightMutation(
            index_1d=5000,
            weight_delta=0.15,  # Changed by +0.15
            layer="attention_head_3",
            authority=MutationAuthority.ENGINEER
        )

        # Record with previous value
        previous_value = 0.42
        snapshot_id = journal.record(mutation, previous_value)

        # Verify snapshot was created
        assert snapshot_id is not None
        assert snapshot_id.startswith("snap_")
        assert mutation.mutation_id in snapshot_id

        # Verify entry is in journal
        recent = journal.get_recent(count=1)
        assert len(recent) == 1
        assert recent[0].mutation.index_1d == 5000
        assert recent[0].previous_value == 0.42

        # Perform rollback
        restore_mutation = journal.rollback(snapshot_id)

        # Verify rollback mutation
        assert restore_mutation is not None
        assert restore_mutation.index_1d == 5000
        # Inverse delta should be -0.15 (to restore original)
        assert restore_mutation.weight_delta == -0.15
        assert restore_mutation.layer == "attention_head_3"
        # Rollback should be at COORDINATOR level
        assert restore_mutation.authority == MutationAuthority.COORDINATOR
        # Should have restored_value attribute
        assert hasattr(restore_mutation, "restored_value")
        assert restore_mutation.restored_value == previous_value

        # Verify snapshot was removed
        assert snapshot_id not in journal.snapshot_index

    def test_rollback_invalid_snapshot(self):
        """Test rollback with invalid snapshot ID returns None."""
        journal = MutationJournal()

        # Try to rollback non-existent snapshot
        result = journal.rollback("invalid_snapshot_id")
        assert result is None

    def test_multiple_rollbacks(self):
        """Test multiple mutations can be rolled back independently."""
        journal = MutationJournal(max_entries=100)

        # Record multiple mutations
        snapshot_ids = []
        for i in range(3):
            mutation = WeightMutation(
                index_1d=i * 1000,
                weight_delta=0.1 * (i + 1),
                layer=f"layer_{i}",
                authority=MutationAuthority.ENGINEER
            )
            snapshot_id = journal.record(mutation, previous_value=0.5)
            snapshot_ids.append(snapshot_id)

        # Verify all recorded
        assert len(journal.entries) == 3

        # Rollback middle one
        restore = journal.rollback(snapshot_ids[1])
        assert restore is not None
        assert restore.index_1d == 1000
        assert restore.weight_delta == -0.2  # Inverse of +0.2

        # Verify only that one was removed
        assert snapshot_ids[1] not in journal.snapshot_index
        assert snapshot_ids[0] in journal.snapshot_index
        assert snapshot_ids[2] in journal.snapshot_index

    def test_journal_max_entries(self):
        """Test journal respects max_entries limit."""
        journal = MutationJournal(max_entries=5)

        # Add more entries than max
        for i in range(10):
            mutation = WeightMutation(
                index_1d=i,
                weight_delta=0.01,
                authority=MutationAuthority.ENGINEER
            )
            journal.record(mutation, previous_value=0.0)

        # Should only have 5 entries (oldest evicted)
        assert len(journal.entries) == 5

        # Most recent should be there
        recent = journal.get_recent(5)
        assert recent[-1].mutation.index_1d == 9

    def test_journal_clear(self):
        """Test journal can be cleared."""
        journal = MutationJournal()

        # Add entries
        for i in range(5):
            mutation = WeightMutation(
                index_1d=i,
                weight_delta=0.01,
                authority=MutationAuthority.ENGINEER
            )
            journal.record(mutation, previous_value=0.0)

        # Clear
        journal.clear()

        # Verify empty
        assert len(journal.entries) == 0
        assert len(journal.snapshot_index) == 0


class TestMutationEmitterStats:
    """Test emitter statistics tracking."""

    @pytest.mark.asyncio
    async def test_stats_tracking(self):
        """Test that stats are properly tracked through the flow."""
        emitter = MutationEmitter(
            a2a_url="ws://mock:8766",
            batch_size=100,
            agent_id="test_agent"
        )
        emitter.connected = True
        emitter.registered = True
        emitter.ws = AsyncMock()

        # Initial stats
        stats = await emitter.get_stats()
        assert stats.mutations_queued == 0
        assert stats.upgrades_queued == 0
        assert stats.mutations_sent == 0
        assert stats.upgrades_sent == 0
        assert stats.batches_sent == 0

        # Queue some items
        for i in range(5):
            mutation = WeightMutation(
                index_1d=i,
                weight_delta=0.01,
                authority=MutationAuthority.ENGINEER
            )
            await emitter.queue_mutation(mutation)

        for i in range(3):
            upgrade = DistrictUpgrade(
                district_id=f"d{i}",
                from_material="rust",
                to_material="steel",
                affected_indices=[]
            )
            await emitter.queue_upgrade(upgrade)

        stats = await emitter.get_stats()
        assert stats.mutations_queued == 5
        assert stats.upgrades_queued == 3

    @pytest.mark.asyncio
    async def test_flush_updates_stats(self):
        """Test that flush updates sent statistics."""
        emitter = MutationEmitter(
            a2a_url="ws://mock:8766",
            batch_size=100,
            agent_id="test_agent"
        )
        emitter.connected = True
        emitter.registered = True
        emitter.ws = AsyncMock()

        # Queue and flush
        for i in range(3):
            mutation = WeightMutation(
                index_1d=i,
                weight_delta=0.01,
                authority=MutationAuthority.ENGINEER
            )
            await emitter.queue_mutation(mutation)

        await emitter.flush()

        stats = await emitter.get_stats()
        assert stats.mutations_sent == 3
        assert stats.batches_sent == 1
        assert stats.last_flush_count == 3
        assert stats.last_flush_time is not None


class TestPendingBatch:
    """Test PendingBatch data structure."""

    def test_empty_batch(self):
        """Test empty batch has count 0."""
        batch = PendingBatch()
        assert batch.total_count() == 0
        assert len(batch.mutations) == 0
        assert len(batch.upgrades) == 0

    def test_batch_count(self):
        """Test batch counts mutations and upgrades correctly."""
        batch = PendingBatch()
        batch.mutations = [{"id": 1}, {"id": 2}]
        batch.upgrades = [{"id": "a"}, {"id": "b"}, {"id": "c"}]

        assert batch.total_count() == 5

    def test_batch_to_json(self):
        """Test batch serialization to JSON."""
        batch = PendingBatch()
        batch.mutations = [{"index": 1, "delta": 0.1}]
        batch.upgrades = [{"district": "d1"}]

        json_data = batch.to_json()

        assert "batch_id" in json_data
        assert "timestamp" in json_data
        assert "mutations" in json_data
        assert "upgrades" in json_data
        assert json_data["count"] == 2
        assert len(json_data["mutations"]) == 1
        assert len(json_data["upgrades"]) == 1


class TestWeightMutationProtocol:
    """Test WeightMutation serialization and deserialization."""

    def test_to_json_and_from_json(self):
        """Test round-trip serialization."""
        original = WeightMutation(
            index_1d=9999,
            weight_delta=-0.05,
            layer="output",
            authority=MutationAuthority.COORDINATOR
        )

        json_data = original.to_json()
        restored = WeightMutation.from_json(json_data)

        assert restored.index_1d == original.index_1d
        assert restored.weight_delta == original.weight_delta
        assert restored.layer == original.layer
        assert restored.authority == original.authority

    def test_authorization_levels(self):
        """Test authorization level checks."""
        # ENGINEER can initiate
        engineer_mutation = WeightMutation(
            index_1d=0,
            weight_delta=0.1,
            authority=MutationAuthority.ENGINEER
        )
        assert engineer_mutation.is_authorized() is True

        # COORDINATOR can initiate
        coordinator_mutation = WeightMutation(
            index_1d=0,
            weight_delta=0.1,
            authority=MutationAuthority.COORDINATOR
        )
        assert coordinator_mutation.is_authorized() is True

        # GUARDIAN cannot initiate (veto only)
        guardian_mutation = WeightMutation(
            index_1d=0,
            weight_delta=0.1,
            authority=MutationAuthority.GUARDIAN
        )
        assert guardian_mutation.is_authorized() is False


class TestDistrictUpgradeProtocol:
    """Test DistrictUpgrade serialization and deserialization."""

    def test_to_json_and_from_json(self):
        """Test round-trip serialization with explicit indices in JSON."""
        original = DistrictUpgrade(
            district_id="test_district",
            from_material="dust",
            to_material="gold",
            affected_indices=[1, 2, 3, 4, 5]
        )

        json_data = original.to_json()

        # Note: to_json() returns count, from_json() needs list for full round-trip
        # So we need to restore the full indices for from_json
        json_data_with_indices = {
            **json_data,
            "affected_indices": original.affected_indices
        }
        restored = DistrictUpgrade.from_json(json_data_with_indices)

        assert restored.district_id == original.district_id
        assert restored.from_material == original.from_material
        assert restored.to_material == original.to_material
        assert len(restored.affected_indices) == 5

    def test_to_json_uses_count_not_list(self):
        """Test that to_json() returns count for efficiency, not full list."""
        upgrade = DistrictUpgrade(
            district_id="efficient_district",
            from_material="rust",
            to_material="steel",
            affected_indices=list(range(10000))
        )

        json_data = upgrade.to_json()

        # to_json returns count (int), not full list
        assert isinstance(json_data["affected_indices"], int)
        assert json_data["affected_indices"] == 10000


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
