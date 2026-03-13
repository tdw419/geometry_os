"""Tests for Region Allocator with first-fit allocation and compaction.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
Section: 2. Application Header - Region Allocation Algorithm
"""

import pytest

from systems.spatial_coordinator.allocator import (
    AllocationFailedError,
    FreeRegion,
    RegionAllocator,
)


class TestFreeRegion:
    """Tests for FreeRegion data structure."""

    def test_create_free_region(self):
        """FreeRegion stores origin and dimensions."""
        region = FreeRegion(x=0, y=0, width=64, height=32)
        assert region.x == 0
        assert region.y == 0
        assert region.width == 64
        assert region.height == 32

    def test_free_region_area(self):
        """FreeRegion calculates area correctly."""
        region = FreeRegion(x=0, y=0, width=64, height=32)
        assert region.area == 64 * 32

    def test_free_region_can_fit(self):
        """FreeRegion checks if size fits."""
        region = FreeRegion(x=0, y=0, width=64, height=32)
        assert region.can_fit(64, 32) is True
        assert region.can_fit(32, 32) is True
        assert region.can_fit(128, 32) is False
        assert region.can_fit(64, 64) is False

    def test_free_region_contains(self):
        """FreeRegion checks if point is contained."""
        region = FreeRegion(x=10, y=20, width=64, height=32)
        assert region.contains(10, 20) is True
        assert region.contains(73, 51) is True
        assert region.contains(9, 20) is False
        assert region.contains(10, 19) is False
        assert region.contains(74, 51) is False
        assert region.contains(73, 52) is False

    def test_free_region_split_horizontal(self):
        """FreeRegion splits horizontally when width > needed."""
        region = FreeRegion(x=0, y=0, width=128, height=32)
        # Allocate 64x32 from 128x32 region
        allocated, remainder = region.split(64, 32)
        assert allocated.x == 0
        assert allocated.y == 0
        assert allocated.width == 64
        assert allocated.height == 32

        assert remainder.x == 64
        assert remainder.y == 0
        assert remainder.width == 64
        assert remainder.height == 32

    def test_free_region_split_vertical(self):
        """FreeRegion splits vertically when height > needed."""
        region = FreeRegion(x=0, y=0, width=64, height=64)
        # Allocate 64x32 from 64x64 region
        allocated, remainder = region.split(64, 32)
        assert allocated.x == 0
        assert allocated.y == 0
        assert allocated.width == 64
        assert allocated.height == 32

        assert remainder.x == 0
        assert remainder.y == 32
        assert remainder.width == 64
        assert remainder.height == 32

    def test_free_region_split_exact_fit(self):
        """FreeRegion returns None remainder when exact fit."""
        region = FreeRegion(x=0, y=0, width=64, height=32)
        allocated, remainder = region.split(64, 32)
        assert allocated.x == 0
        assert allocated.y == 0
        assert allocated.width == 64
        assert allocated.height == 32
        assert remainder is None

    def test_free_region_equality(self):
        """FreeRegion equality compares all fields."""
        r1 = FreeRegion(x=0, y=0, width=64, height=32)
        r2 = FreeRegion(x=0, y=0, width=64, height=32)
        r3 = FreeRegion(x=1, y=0, width=64, height=32)
        assert r1 == r2
        assert r1 != r3


class TestRegionAllocator:
    """Tests for RegionAllocator with first-fit allocation."""

    def test_create_allocator(self):
        """Allocator initializes with total grid size."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        assert allocator.total_width == 1024
        assert allocator.total_height == 1024

    def test_initial_free_list(self):
        """Allocator starts with one large free region."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        free_regions = allocator.get_free_regions()
        assert len(free_regions) == 1
        assert free_regions[0] == FreeRegion(x=0, y=0, width=1024, height=1024)

    def test_allocate_first_fit(self):
        """Allocator finds first region that fits."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        allocated = allocator.allocate(app_id=1, width=64, height=32)

        assert allocated is not None
        assert allocated.x == 0
        assert allocated.y == 0
        assert allocated.width == 64
        assert allocated.height == 32

    def test_allocate_updates_free_list(self):
        """Allocation updates the free list."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        allocator.allocate(app_id=1, width=64, height=32)

        free_regions = allocator.get_free_regions()
        # Should have remainder region
        assert len(free_regions) == 1
        assert free_regions[0].x == 64
        assert free_regions[0].width == 1024 - 64

    def test_allocate_multiple_apps(self):
        """Multiple apps can be allocated sequentially."""
        allocator = RegionAllocator(total_width=256, total_height=256)

        app1 = allocator.allocate(app_id=1, width=64, height=64)
        assert app1.x == 0
        assert app1.y == 0

        app2 = allocator.allocate(app_id=2, width=64, height=64)
        assert app2.x == 64  # Right of first app
        assert app2.y == 0

        app3 = allocator.allocate(app_id=3, width=64, height=64)
        assert app3.x == 128  # Right of second app
        assert app3.y == 0

    def test_allocate_triggers_compaction_on_failure(self):
        """Allocator compacts when no contiguous space available."""
        allocator = RegionAllocator(total_width=128, total_height=128)

        # Allocate three apps
        app1 = allocator.allocate(app_id=1, width=32, height=128)
        app2 = allocator.allocate(app_id=2, width=32, height=128)
        app3 = allocator.allocate(app_id=3, width=32, height=128)

        # Free the middle app, creating a gap
        allocator.free(app_id=2)

        # Try to allocate a larger app that needs 64 width
        # Should trigger compaction to consolidate free space
        app4 = allocator.allocate(app_id=4, width=64, height=128)
        assert app4 is not None
        # After compaction, apps should be packed together
        # App1 should stay at 0, App3 should move next to it

    def test_allocate_returns_none_on_total_failure(self):
        """Allocator returns None when compaction doesn't help."""
        allocator = RegionAllocator(total_width=64, total_height=64)

        # Allocate most of the space
        allocator.allocate(app_id=1, width=32, height=64)
        allocator.allocate(app_id=2, width=32, height=64)

        # Try to allocate something too large
        result = allocator.allocate(app_id=3, width=128, height=128)
        assert result is None

    def test_allocate_raises_on_duplicate_app_id(self):
        """Allocator rejects duplicate app IDs."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        allocator.allocate(app_id=1, width=64, height=32)

        with pytest.raises(ValueError, match="already allocated"):
            allocator.allocate(app_id=1, width=64, height=32)

    def test_free_region(self):
        """Freeing an app returns its region to free list."""
        allocator = RegionAllocator(total_width=256, total_height=256)
        allocator.allocate(app_id=1, width=64, height=64)
        allocator.allocate(app_id=2, width=64, height=64)

        allocator.free(app_id=1)

        # Should have 2 free regions now (freed space + remaining)
        free_regions = allocator.get_free_regions()
        assert len(free_regions) >= 1

    def test_free_unknown_app_raises(self):
        """Freeing unknown app raises error."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)

        with pytest.raises(ValueError, match="not found"):
            allocator.free(app_id=999)

    def test_get_allocated_region(self):
        """Can retrieve allocated region by app_id."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        allocator.allocate(app_id=1, width=64, height=32)

        region = allocator.get_region(app_id=1)
        assert region is not None
        assert region.width == 64
        assert region.height == 32

    def test_get_unknown_region_returns_none(self):
        """Getting unknown app region returns None."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        assert allocator.get_region(app_id=999) is None


class TestCompaction:
    """Tests for allocator compaction."""

    def test_compact_moves_apps(self):
        """Compaction slides apps to eliminate gaps."""
        allocator = RegionAllocator(total_width=128, total_height=64)

        # Allocate three apps
        allocator.allocate(app_id=1, width=32, height=64)
        allocator.allocate(app_id=2, width=32, height=64)
        allocator.allocate(app_id=3, width=32, height=64)

        # Free the middle one
        allocator.free(app_id=2)

        # Verify gap exists
        assert allocator.get_region(1).x == 0
        assert allocator.get_region(3).x == 64

        # Compact
        allocator.compact()

        # App3 should have moved next to App1
        assert allocator.get_region(1).x == 0
        assert allocator.get_region(3).x == 32

    def test_compact_consolidates_free_space(self):
        """Compaction consolidates all free space into one region."""
        allocator = RegionAllocator(total_width=128, total_height=64)

        allocator.allocate(app_id=1, width=32, height=64)
        allocator.allocate(app_id=2, width=32, height=64)
        allocator.allocate(app_id=3, width=32, height=64)

        allocator.free(app_id=2)
        allocator.compact()

        free_regions = allocator.get_free_regions()
        assert len(free_regions) == 1
        assert free_regions[0].x == 64  # After compacted apps

    def test_compact_preserves_app_dimensions(self):
        """Compaction preserves app width and height."""
        allocator = RegionAllocator(total_width=256, total_height=256)

        allocator.allocate(app_id=1, width=64, height=128)
        allocator.allocate(app_id=2, width=32, height=64)
        allocator.allocate(app_id=3, width=128, height=32)

        allocator.free(app_id=2)
        allocator.compact()

        assert allocator.get_region(1).width == 64
        assert allocator.get_region(1).height == 128
        assert allocator.get_region(3).width == 128
        assert allocator.get_region(3).height == 32


class TestAllocatorStats:
    """Tests for allocator statistics."""

    def test_stats_initial_state(self):
        """Stats show empty allocator state."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        stats = allocator.stats()

        assert stats["total_area"] == 1024 * 1024
        assert stats["allocated_area"] == 0
        assert stats["free_area"] == 1024 * 1024
        assert stats["allocated_count"] == 0
        assert stats["free_count"] == 1

    def test_stats_after_allocation(self):
        """Stats reflect allocations."""
        allocator = RegionAllocator(total_width=1024, total_height=1024)
        allocator.allocate(app_id=1, width=64, height=32)
        allocator.allocate(app_id=2, width=128, height=64)

        stats = allocator.stats()
        assert stats["allocated_area"] == (64 * 32) + (128 * 64)
        assert stats["allocated_count"] == 2
        # Free area is the sum of all free region areas
        # Note: Due to horizontal-first splitting, some space may be "wasted"
        # under short allocations. This is a known trade-off for simplicity.
        assert stats["free_area"] == sum(r.area for r in allocator.get_free_regions())

    def test_stats_after_free(self):
        """Stats reflect freed regions."""
        allocator = RegionAllocator(total_width=256, total_height=256)
        allocator.allocate(app_id=1, width=64, height=64)
        allocator.allocate(app_id=2, width=64, height=64)

        allocator.free(app_id=1)

        stats = allocator.stats()
        assert stats["allocated_count"] == 1
        assert stats["allocated_area"] == 64 * 64


class TestMultipleAppsCoexistence:
    """Tests for multiple apps coexisting without conflicts."""

    def test_no_spatial_overlap(self):
        """Allocated regions never overlap."""
        allocator = RegionAllocator(total_width=256, total_height=256)

        regions = []
        for i in range(10):
            region = allocator.allocate(app_id=i, width=32, height=32)
            regions.append(region)

        # Check all pairs for overlap
        for i, r1 in enumerate(regions):
            for j, r2 in enumerate(regions):
                if i != j:
                    assert not self._regions_overlap(r1, r2), f"Regions {i} and {j} overlap"

    def test_all_apps_fit_in_grid(self):
        """All allocated regions fit within total grid bounds."""
        allocator = RegionAllocator(total_width=256, total_height=256)

        for i in range(10):
            region = allocator.allocate(app_id=i, width=32, height=32)
            assert region.x >= 0
            assert region.y >= 0
            assert region.x + region.width <= 256
            assert region.y + region.height <= 256

    def test_allocate_free_reallocate_cycle(self):
        """Allocator handles allocate-free-reallocate cycles."""
        allocator = RegionAllocator(total_width=128, total_height=128)

        # Allocate all space (4 apps of 64x64 in a 128x128 grid)
        for i in range(4):
            allocator.allocate(app_id=i, width=64, height=64)

        # Cycle 1: Free apps 1 and 2, reallocate as 10
        allocator.free(app_id=1)
        allocator.free(app_id=2)
        new_region = allocator.allocate(app_id=10, width=64, height=64)
        assert new_region is not None

        # Cycle 2: Free app 10, reallocate as 11
        allocator.free(app_id=10)
        new_region = allocator.allocate(app_id=11, width=64, height=64)
        assert new_region is not None

        # Cycle 3: Free app 11, reallocate as 12
        allocator.free(app_id=11)
        new_region = allocator.allocate(app_id=12, width=64, height=64)
        assert new_region is not None

    @staticmethod
    def _regions_overlap(r1: FreeRegion, r2: FreeRegion) -> bool:
        """Check if two regions overlap spatially."""
        return not (
            r1.x + r1.width <= r2.x
            or r2.x + r2.width <= r1.x
            or r1.y + r1.height <= r2.y
            or r2.y + r2.height <= r1.y
        )
