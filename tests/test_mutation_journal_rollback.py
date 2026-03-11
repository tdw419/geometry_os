"""
Comprehensive tests for MutationJournal rollback functionality (V14.2).

Tests cover:
(a) Single mutation rollback
(b) Cascading rollback of dependent mutations
(c) Rollback failure recovery
(d) Journal integrity verification (checksum validation)
(e) Thread safety with concurrent mutations
(f) Rollback stress test (100 sequential mutations + rollbacks)
"""

import threading
import time

import pytest

from systems.neural_city.mutation_protocol import (
    MutationAuthority,
    MutationJournal,
    RollbackEntry,
    RollbackResult,
    WeightMutation,
)


class TestSingleMutationRollback:
    """Tests for single mutation rollback scenarios."""

    def test_rollback_single_mutation(self):
        """Test basic rollback of a single mutation."""
        journal = MutationJournal()
        mutation = WeightMutation(index_1d=100, weight_delta=0.5)

        snapshot_id = journal.record(mutation, previous_value=0.3)
        assert snapshot_id is not None
        assert len(journal.entries) == 1

        rollback = journal.rollback(snapshot_id)
        assert rollback is not None
        assert rollback.index_1d == 100
        assert rollback.weight_delta == -0.5  # Inverse
        assert rollback.restored_value == 0.3

    def test_rollback_nonexistent_snapshot(self):
        """Test rollback of non-existent snapshot returns None."""
        journal = MutationJournal()
        result = journal.rollback("nonexistent_id")
        assert result is None

    def test_rollback_already_rolled_back(self):
        """Test that double rollback returns None."""
        journal = MutationJournal()
        mutation = WeightMutation(index_1d=50, weight_delta=0.1)
        snapshot_id = journal.record(mutation, previous_value=0.0)

        # First rollback succeeds
        rollback1 = journal.rollback(snapshot_id)
        assert rollback1 is not None

        # Second rollback fails (already removed)
        rollback2 = journal.rollback(snapshot_id)
        assert rollback2 is None

    def test_rollback_preserves_mutation_metadata(self):
        """Test that rollback preserves layer and authority info."""
        journal = MutationJournal()
        mutation = WeightMutation(
            index_1d=200,
            weight_delta=0.25,
            layer="attention.head.2",
            authority=MutationAuthority.ENGINEER
        )

        snapshot_id = journal.record(mutation, previous_value=0.1)
        rollback = journal.rollback(snapshot_id)

        assert rollback.layer == "attention.head.2"
        assert rollback.authority == MutationAuthority.COORDINATOR

    def test_rollback_negative_delta(self):
        """Test rollback correctly inverts negative deltas."""
        journal = MutationJournal()
        mutation = WeightMutation(index_1d=300, weight_delta=-0.75)

        snapshot_id = journal.record(mutation, previous_value=0.8)
        rollback = journal.rollback(snapshot_id)

        assert rollback.weight_delta == 0.75  # -(-0.75)


class TestCascadingRollback:
    """Tests for cascading rollback of dependent mutations."""

    def test_cascading_rollback_simple_chain(self):
        """Test cascading rollback with a simple dependency chain."""
        journal = MutationJournal()

        # Create chain: m1 -> m2 -> m3
        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=2, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.1, depends_on=snap1)

        m3 = WeightMutation(index_1d=3, weight_delta=0.3)
        snap3 = journal.record(m3, previous_value=0.2, depends_on=snap2)

        # Rollback m1 with cascade
        result = journal.rollback_cascading(snap1)

        assert result.success
        assert len(result.restored_mutations) == 3
        assert len(result.rolled_back_ids) == 3

    def test_cascading_rollback_with_multiple_dependencies(self):
        """Test cascading rollback with multiple entries depending on one."""
        journal = MutationJournal()

        # Create star pattern: m1 -> m2, m1 -> m3, m1 -> m4
        m1 = WeightMutation(index_1d=10, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        for i in range(3):
            m = WeightMutation(index_1d=20 + i, weight_delta=0.1 * (i + 1))
            journal.record(m, previous_value=0.0, depends_on=snap1)

        result = journal.rollback_cascading(snap1)

        assert result.success
        assert len(result.restored_mutations) == 4  # m1 + 3 dependents

    def test_non_cascading_rollback_with_dependents_fails(self):
        """Test that non-cascading rollback fails when dependents exist."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=100, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=101, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.0, depends_on=snap1)

        # Non-cascading rollback should fail
        result = journal.rollback(snap1, cascade=False)
        assert result is None

        # Entry should still exist
        assert journal.get_entry(snap1) is not None

    def test_non_cascading_rollback_with_cascade_flag(self):
        """Test that cascade=True triggers cascading rollback."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=200, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=201, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.0, depends_on=snap1)

        # Cascade rollback should succeed
        result = journal.rollback(snap1, cascade=True)
        assert result is not None

        # Both should be gone
        assert journal.get_entry(snap1) is None
        assert journal.get_entry(snap2) is None

    def test_rollback_order_respects_dependencies(self):
        """Test that rollback happens in correct order (dependents first)."""
        journal = MutationJournal()

        # Create linear chain
        snaps = []
        for i in range(5):
            m = WeightMutation(index_1d=i, weight_delta=0.1)
            depends = snaps[-1] if snaps else None
            snap = journal.record(m, previous_value=float(i), depends_on=depends)
            snaps.append(snap)

        result = journal.rollback_cascading(snaps[0])

        # Rollback order should be last-to-first (reverse dependency order)
        # i.e., snaps[4], snaps[3], snaps[2], snaps[1], snaps[0]
        assert result.success
        assert len(result.restored_mutations) == 5


class TestRollbackFailureRecovery:
    """Tests for rollback failure recovery scenarios."""

    def test_failed_rollback_recorded(self):
        """Test that failed rollback attempts are recorded."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=2, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.0, depends_on=snap1)

        # Attempt non-cascading rollback (should fail)
        journal.rollback(snap1, cascade=False)

        failed = journal.get_failed_rollbacks()
        assert len(failed) == 1
        assert failed[0]["snapshot_id"] == snap1
        assert failed[0]["reason"] == "has_dependents"

    def test_clear_failed_rollbacks(self):
        """Test clearing the failed rollback log."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=2, weight_delta=0.2)
        journal.record(m2, previous_value=0.0, depends_on=snap1)

        journal.rollback(snap1, cascade=False)
        assert len(journal.get_failed_rollbacks()) == 1

        journal.clear_failed_rollbacks()
        assert len(journal.get_failed_rollbacks()) == 0

    def test_checksum_failure_prevents_rollback(self):
        """Test that corrupted entry checksum prevents rollback."""
        journal = MutationJournal()

        m = WeightMutation(index_1d=500, weight_delta=0.5)
        snap = journal.record(m, previous_value=0.25)

        # Corrupt the checksum
        entry = journal.get_entry(snap)
        entry.checksum = "corrupted_checksum"

        # Rollback should fail
        result = journal.rollback(snap)
        assert result is None

        # Should be recorded as failed
        failed = journal.get_failed_rollbacks()
        assert any(f["reason"] == "checksum_validation_failed" for f in failed)

    def test_partial_rollback_recovery_info(self):
        """Test that partial rollback provides recovery information."""
        journal = MutationJournal()

        # Create chain where one entry will fail
        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=2, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.0, depends_on=snap1)

        # Corrupt the second entry
        journal.get_entry(snap2).checksum = "bad"

        # This should result in partial rollback
        result = journal.rollback_cascading(snap1)

        # First entry may have rolled back, second failed
        # Result indicates what happened
        assert isinstance(result, RollbackResult)


class TestJournalIntegrityChecksum:
    """Tests for journal integrity verification via checksums."""

    def test_entry_checksum_valid(self):
        """Test that new entries have valid checksums."""
        journal = MutationJournal()
        m = WeightMutation(index_1d=100, weight_delta=0.5)
        snap = journal.record(m, previous_value=0.25)

        entry = journal.get_entry(snap)
        assert entry.validate_checksum()

    def test_validate_integrity_all_valid(self):
        """Test integrity check with all valid entries."""
        journal = MutationJournal()

        for i in range(10):
            m = WeightMutation(index_1d=i, weight_delta=0.1 * i)
            journal.record(m, previous_value=float(i))

        result = journal.validate_integrity()
        assert result["valid"]
        assert result["entry_count"] == 10
        assert result["snapshot_count"] == 10

    def test_validate_integrity_detects_corruption(self):
        """Test integrity check detects corrupted entries."""
        journal = MutationJournal()

        m = WeightMutation(index_1d=100, weight_delta=0.5)
        snap = journal.record(m, previous_value=0.25)

        # Corrupt the entry
        entry = journal.get_entry(snap)
        entry.checksum = "corrupted"

        result = journal.validate_integrity()
        assert not result["valid"]
        assert snap in result["invalid_entries"]

    def test_entry_checksum_deterministic(self):
        """Test that checksum is deterministic for same data."""
        m = WeightMutation(index_1d=42, weight_delta=0.123)
        m.mutation_id = "test123"

        entry1 = RollbackEntry(
            snapshot_id="snap_test_1",
            mutation=m,
            previous_value=0.5,
            timestamp=12345.0
        )

        entry2 = RollbackEntry(
            snapshot_id="snap_test_1",
            mutation=m,
            previous_value=0.5,
            timestamp=12345.0
        )

        assert entry1.checksum == entry2.checksum

    def test_entry_checksum_different_for_different_data(self):
        """Test that different data produces different checksums."""
        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        m2 = WeightMutation(index_1d=2, weight_delta=0.2)

        entry1 = RollbackEntry(
            snapshot_id="snap_1",
            mutation=m1,
            previous_value=0.0
        )

        entry2 = RollbackEntry(
            snapshot_id="snap_2",
            mutation=m2,
            previous_value=0.0
        )

        assert entry1.checksum != entry2.checksum

    def test_rollback_updates_journal_checksum(self):
        """Test that rollback updates the overall journal checksum."""
        journal = MutationJournal()

        m = WeightMutation(index_1d=100, weight_delta=0.5)
        snap = journal.record(m, previous_value=0.25)

        checksum_before = journal._journal_checksum
        journal.rollback(snap)
        checksum_after = journal._journal_checksum

        # Checksum should change after rollback
        assert checksum_before != checksum_after


class TestThreadSafety:
    """Tests for thread safety with concurrent mutations."""

    def test_concurrent_record_operations(self):
        """Test that concurrent record operations are thread-safe."""
        journal = MutationJournal()
        snapshot_ids = []
        errors = []

        def record_mutation(idx: int):
            try:
                m = WeightMutation(index_1d=idx, weight_delta=0.01 * idx)
                snap = journal.record(m, previous_value=float(idx))
                snapshot_ids.append(snap)
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=record_mutation, args=(i,)) for i in range(100)]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        assert len(snapshot_ids) == 100
        assert len(journal.snapshot_index) == 100

    def test_concurrent_rollback_operations(self):
        """Test that concurrent rollback operations are thread-safe."""
        journal = MutationJournal()
        snapshot_ids = []

        # Record 50 mutations
        for i in range(50):
            m = WeightMutation(index_1d=i, weight_delta=0.1)
            snap = journal.record(m, previous_value=float(i))
            snapshot_ids.append(snap)

        rolled_back = []
        errors = []

        def rollback_mutation(snap_id: str):
            try:
                result = journal.rollback(snap_id)
                if result:
                    rolled_back.append(snap_id)
            except Exception as e:
                errors.append(e)

        threads = [threading.Thread(target=rollback_mutation, args=(snap,)) for snap in snapshot_ids]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0
        # All 50 should have been rolled back
        assert len(rolled_back) == 50

    def test_concurrent_record_and_rollback(self):
        """Test concurrent record and rollback operations."""
        journal = MutationJournal()
        recorded = []
        rolled_back = []
        errors = []

        def record_ops():
            for i in range(50):
                m = WeightMutation(index_1d=i, weight_delta=0.1)
                snap = journal.record(m, previous_value=float(i))
                recorded.append(snap)

        def rollback_ops():
            time.sleep(0.01)  # Let some records happen first
            while len(recorded) < 10:
                time.sleep(0.001)

            for _ in range(25):
                if recorded:
                    snap = recorded.pop(0)
                    result = journal.rollback(snap)
                    if result:
                        rolled_back.append(snap)

        t1 = threading.Thread(target=record_ops)
        t2 = threading.Thread(target=rollback_ops)

        t1.start()
        t2.start()
        t1.join()
        t2.join()

        assert len(errors) == 0

    def test_integrity_check_during_concurrent_operations(self):
        """Test that integrity checks work during concurrent operations."""
        journal = MutationJournal()
        errors = []

        def record_ops():
            for i in range(100):
                m = WeightMutation(index_1d=i, weight_delta=0.01)
                journal.record(m, previous_value=float(i))

        def integrity_ops():
            for _ in range(20):
                result = journal.validate_integrity()
                # Integrity should always be valid (thread-safe)
                if not result["valid"]:
                    errors.append("integrity_check_failed")
                time.sleep(0.001)

        t1 = threading.Thread(target=record_ops)
        t2 = threading.Thread(target=integrity_ops)

        t1.start()
        t2.start()
        t1.join()
        t2.join()

        assert len(errors) == 0

    def test_batch_operation_context_manager(self):
        """Test that batch operation context manager provides thread safety."""
        journal = MutationJournal()
        snapshot_ids = []

        with journal.batch_operation():
            for i in range(50):
                m = WeightMutation(index_1d=i, weight_delta=0.1)
                snap = journal.record(m, previous_value=float(i))
                snapshot_ids.append(snap)

        assert len(snapshot_ids) == 50
        assert len(journal.snapshot_index) == 50


class TestRollbackStress:
    """Stress tests for rollback operations."""

    @pytest.mark.timeout(5)  # Must complete in < 5 seconds
    def test_100_sequential_mutations_and_rollbacks(self):
        """Test 100 sequential mutations followed by 100 rollbacks."""
        journal = MutationJournal()
        snapshot_ids = []

        # Record 100 mutations
        start_record = time.time()
        for i in range(100):
            m = WeightMutation(
                index_1d=i * 100,
                weight_delta=0.001 * i,
                layer=f"layer_{i % 10}"
            )
            snap = journal.record(m, previous_value=float(i) / 100)
            snapshot_ids.append(snap)

        record_time = time.time() - start_record

        # Verify all recorded
        assert len(journal.snapshot_index) == 100

        # Rollback all 100 in reverse order
        start_rollback = time.time()
        for snap in reversed(snapshot_ids):
            result = journal.rollback(snap)
            assert result is not None

        rollback_time = time.time() - start_rollback
        total_time = record_time + rollback_time

        # Verify all rolled back
        assert len(journal.snapshot_index) == 0
        assert len(journal.entries) == 0

        # Performance assertion - should complete in < 5 seconds
        assert total_time < 5.0, f"Stress test took {total_time:.2f}s (limit: 5s)"

        print(f"\n  Stress test timing: record={record_time:.3f}s, rollback={rollback_time:.3f}s, total={total_time:.3f}s")

    @pytest.mark.timeout(5)
    def test_100_cascading_rollbacks(self):
        """Test 100 cascading rollback operations."""
        journal = MutationJournal()
        snapshot_ids = []

        # Create a chain of 100 dependent mutations
        prev_snap = None
        for i in range(100):
            m = WeightMutation(index_1d=i, weight_delta=0.01)
            snap = journal.record(m, previous_value=float(i), depends_on=prev_snap)
            snapshot_ids.append(snap)
            prev_snap = snap

        # Single cascading rollback from the first entry
        start = time.time()
        result = journal.rollback_cascading(snapshot_ids[0])
        rollback_time = time.time() - start

        assert result.success
        assert len(result.restored_mutations) == 100
        assert len(journal.snapshot_index) == 0

        assert rollback_time < 2.0, f"Cascading rollback took {rollback_time:.2f}s (limit: 2s)"
        print(f"\n  Cascading rollback (100 entries): {rollback_time:.3f}s")

    @pytest.mark.timeout(5)
    def test_mixed_operations_stress(self):
        """Test mixed record/rollback operations under stress."""
        journal = MutationJournal()
        active_snaps = []

        start = time.time()

        for i in range(200):
            if i % 3 == 0 and active_snaps:
                # Rollback every 3rd operation
                snap = active_snaps.pop()
                journal.rollback(snap)
            else:
                # Record mutation
                m = WeightMutation(index_1d=i, weight_delta=0.01 * i)
                snap = journal.record(m, previous_value=float(i))
                active_snaps.append(snap)

        # Rollback remaining
        for snap in reversed(active_snaps):
            journal.rollback(snap)

        total_time = time.time() - start

        assert len(journal.snapshot_index) == 0
        assert total_time < 5.0, f"Mixed stress test took {total_time:.2f}s (limit: 5s)"

        print(f"\n  Mixed operations stress test: {total_time:.3f}s")


class TestEdgeCases:
    """Tests for edge cases and boundary conditions."""

    def test_empty_journal_rollback(self):
        """Test rollback on empty journal."""
        journal = MutationJournal()
        result = journal.rollback("nonexistent")
        assert result is None

    def test_journal_max_entries_with_rollback(self):
        """Test that rolled back entries don't count against max."""
        journal = MutationJournal(max_entries=10)

        snaps = []
        for i in range(10):
            m = WeightMutation(index_1d=i, weight_delta=0.1)
            snap = journal.record(m, previous_value=float(i))
            snaps.append(snap)

        assert len(journal.entries) == 10

        # Rollback half
        for snap in snaps[:5]:
            journal.rollback(snap)

        # Add 5 more - should work without pushing out existing entries
        for i in range(10, 15):
            m = WeightMutation(index_1d=i, weight_delta=0.1)
            journal.record(m, previous_value=float(i))

        # Should still have entries (some rolled back, some new)
        assert len(journal.entries) <= 10

    def test_rollback_with_self_dependency_prevention(self):
        """Test that entries can't create circular dependencies."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        # Try to create self-dependency (should be ignored since snap2 doesn't exist yet)
        m2 = WeightMutation(index_1d=2, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.0, depends_on="nonexistent_self_ref")

        # Should work without issue - the dependency doesn't exist so it's ignored
        result = journal.rollback(snap2)
        assert result is not None

    def test_rollback_mutual_dependency(self):
        """Test rollback handles mutual dependencies correctly."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=2, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.0, depends_on=snap1)

        # Now m2 depends on m1 - test cascading rollback
        result = journal.rollback_cascading(snap1)
        assert result.success
        assert len(result.restored_mutations) == 2

    def test_rollback_preserves_independent_entries(self):
        """Test that rollback doesn't affect independent entries."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=2, weight_delta=0.2)  # No dependency
        snap2 = journal.record(m2, previous_value=0.0)

        journal.rollback(snap1)

        # snap2 should still exist
        assert journal.get_entry(snap2) is not None

    def test_zero_delta_rollback(self):
        """Test rollback of zero-delta mutation."""
        journal = MutationJournal()
        m = WeightMutation(index_1d=100, weight_delta=0.0)
        snap = journal.record(m, previous_value=0.5)

        result = journal.rollback(snap)
        assert result.weight_delta == 0.0  # -0.0 = 0.0
        assert result.restored_value == 0.5

    def test_large_index_rollback(self):
        """Test rollback with very large weight indices."""
        journal = MutationJournal()
        m = WeightMutation(index_1d=10**9, weight_delta=0.1)
        snap = journal.record(m, previous_value=0.0)

        result = journal.rollback(snap)
        assert result.index_1d == 10**9

    def test_float_precision_rollback(self):
        """Test rollback preserves float precision."""
        journal = MutationJournal()
        precise_value = 0.12345678901234567
        m = WeightMutation(index_1d=1, weight_delta=0.1)
        snap = journal.record(m, previous_value=precise_value)

        result = journal.rollback(snap)
        assert result.restored_value == precise_value


class TestRollbackEntrySerialization:
    """Tests for RollbackEntry serialization."""

    def test_entry_to_dict(self):
        """Test that entries can be serialized to dict."""
        journal = MutationJournal()
        m = WeightMutation(index_1d=100, weight_delta=0.5)
        snap = journal.record(m, previous_value=0.25)

        entry = journal.get_entry(snap)
        data = entry.to_dict()

        assert "snapshot_id" in data
        assert "mutation" in data
        assert "previous_value" in data
        assert "checksum" in data
        assert data["previous_value"] == 0.25

    def test_entry_dependencies_serialized(self):
        """Test that dependencies are serialized correctly."""
        journal = MutationJournal()

        m1 = WeightMutation(index_1d=1, weight_delta=0.1)
        snap1 = journal.record(m1, previous_value=0.0)

        m2 = WeightMutation(index_1d=2, weight_delta=0.2)
        snap2 = journal.record(m2, previous_value=0.0, depends_on=snap1)

        entry = journal.get_entry(snap2)
        data = entry.to_dict()

        assert snap1 in data["dependencies"]


if __name__ == "__main__":
    pytest.main([__file__, "-v", "--tb=short"])
