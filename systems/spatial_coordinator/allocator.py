"""Region Allocator with first-fit allocation and compaction.

Implements the Region Allocation Algorithm from the Spatial Program Coordinator spec.

Spec: docs/superpowers/specs/2026-03-12-spatial-program-coordinator-design.md
Section: 2. Application Header - Region Allocation Algorithm

Algorithm:
    ALLOCATE(width, height):
      1. Scan free list for first region >= (width * height)
      2. If found:
         - Split region if larger than needed
         - Mark as allocated
         - Return origin
      3. If not found:
         - Trigger compaction (move apps to eliminate gaps)
         - Retry allocation
      4. If still fails:
         - Return ALLOCATION_FAILED
         - App load rejected
"""

from dataclasses import dataclass
from typing import Dict, List, Optional


class AllocationFailedError(Exception):
    """Raised when allocation fails even after compaction."""

    pass


@dataclass
class FreeRegion:
    """A contiguous free region on the Infinite Map.

    Free List Entry Format (per spec):
    | Offset | Size | Field    |
    |--------|------|----------|
    | 0-1    | 2    | origin_x |
    | 2-3    | 2    | origin_y |
    | 4-5    | 2    | width    |
    | 6-7    | 2    | height   |
    """

    x: int
    y: int
    width: int
    height: int

    @property
    def area(self) -> int:
        """Calculate the area of this region."""
        return self.width * self.height

    def can_fit(self, width: int, height: int) -> bool:
        """Check if a region of given dimensions fits within this free region.

        Args:
            width: Required width
            height: Required height

        Returns:
            True if the region can fit
        """
        return self.width >= width and self.height >= height

    def contains(self, x: int, y: int) -> bool:
        """Check if a point is contained within this region.

        Args:
            x: X coordinate
            y: Y coordinate

        Returns:
            True if the point is within the region
        """
        return (self.x <= x < self.x + self.width) and (
            self.y <= y < self.y + self.height
        )

    def split(
        self, width: int, height: int
    ) -> tuple["FreeRegion", Optional["FreeRegion"]]:
        """Split this region into an allocated portion and remainder.

        First-fit strategy: allocate from the left/top, remainder on right/bottom.

        Args:
            width: Width of the region to allocate
            height: Height of the region to allocate

        Returns:
            Tuple of (allocated_region, remainder_region or None)
        """
        allocated = FreeRegion(x=self.x, y=self.y, width=width, height=height)

        # Determine split direction based on remaining space
        remaining_width = self.width - width
        remaining_height = self.height - height

        if remaining_width > 0 and remaining_height > 0:
            # Both dimensions have remainder - prefer horizontal split
            # This creates a single contiguous remainder on the right
            remainder = FreeRegion(
                x=self.x + width, y=self.y, width=remaining_width, height=self.height
            )
        elif remaining_width > 0:
            # Only horizontal remainder
            remainder = FreeRegion(
                x=self.x + width, y=self.y, width=remaining_width, height=self.height
            )
        elif remaining_height > 0:
            # Only vertical remainder
            remainder = FreeRegion(
                x=self.x, y=self.y + height, width=self.width, height=remaining_height
            )
        else:
            # Exact fit - no remainder
            remainder = None

        return allocated, remainder

    def __eq__(self, other: object) -> bool:
        """Equality check comparing all fields."""
        if not isinstance(other, FreeRegion):
            return NotImplemented
        return (
            self.x == other.x
            and self.y == other.y
            and self.width == other.width
            and self.height == other.height
        )


@dataclass
class AllocatedRegion:
    """A region allocated to a specific application."""

    app_id: int
    x: int
    y: int
    width: int
    height: int

    @property
    def area(self) -> int:
        """Calculate the area of this region."""
        return self.width * self.height


class RegionAllocator:
    """Manages region allocation with first-fit strategy and compaction.

    The allocator maintains:
    - A free list of available regions
    - A map of allocated regions by app_id
    - Statistics for monitoring

    When allocation fails, compaction is triggered to consolidate free space.
    """

    def __init__(self, total_width: int, total_height: int):
        """Initialize the allocator with total grid dimensions.

        Args:
            total_width: Total width of the coordinate space
            total_height: Total height of the coordinate space
        """
        self.total_width = total_width
        self.total_height = total_height

        # Start with one large free region covering the entire grid
        self._free_regions: List[FreeRegion] = [
            FreeRegion(x=0, y=0, width=total_width, height=total_height)
        ]

        # Map app_id -> AllocatedRegion
        self._allocated: Dict[int, AllocatedRegion] = {}

    def allocate(
        self, app_id: int, width: int, height: int, retry_after_compact: bool = True
    ) -> Optional[FreeRegion]:
        """Allocate a region for an application using first-fit strategy.

        Args:
            app_id: Unique application identifier
            width: Required region width
            height: Required region height
            retry_after_compact: If True, try compaction on failure (internal use)

        Returns:
            Allocated FreeRegion with origin set, or None if allocation failed

        Raises:
            ValueError: If app_id is already allocated
        """
        if app_id in self._allocated:
            raise ValueError(f"App ID {app_id} already allocated")

        # Find first free region that can fit
        for i, free_region in enumerate(self._free_regions):
            if free_region.can_fit(width, height):
                # Found a fit - split and allocate
                allocated, remainder = free_region.split(width, height)

                # Replace the free region with the remainder (if any)
                if remainder:
                    self._free_regions[i] = remainder
                else:
                    # Remove the free region entirely
                    self._free_regions.pop(i)

                # Track the allocation
                self._allocated[app_id] = AllocatedRegion(
                    app_id=app_id,
                    x=allocated.x,
                    y=allocated.y,
                    width=allocated.width,
                    height=allocated.height,
                )

                return allocated

        # No suitable region found
        if retry_after_compact:
            # Try compaction and retry
            self.compact()
            return self.allocate(app_id, width, height, retry_after_compact=False)

        # Still failed after compaction
        return None

    def free(self, app_id: int) -> None:
        """Free a previously allocated region.

        Args:
            app_id: Application identifier to free

        Raises:
            ValueError: If app_id is not found
        """
        if app_id not in self._allocated:
            raise ValueError(f"App ID {app_id} not found")

        region = self._allocated.pop(app_id)

        # Add the freed region back to the free list
        self._free_regions.append(
            FreeRegion(x=region.x, y=region.y, width=region.width, height=region.height)
        )

    def get_region(self, app_id: int) -> Optional[AllocatedRegion]:
        """Get the allocated region for an application.

        Args:
            app_id: Application identifier

        Returns:
            AllocatedRegion if found, None otherwise
        """
        return self._allocated.get(app_id)

    def get_free_regions(self) -> List[FreeRegion]:
        """Get a copy of the current free regions list.

        Returns:
            List of free regions
        """
        return list(self._free_regions)

    def compact(self) -> None:
        """Compact allocated regions to eliminate gaps.

        Algorithm:
        1. Sort apps by origin coordinate
        2. Slide each app to eliminate gaps
        3. Update all registered origins
        4. Rebuild free list
        """
        if not self._allocated:
            # Nothing allocated - reset to single free region
            self._free_regions = [
                FreeRegion(x=0, y=0, width=self.total_width, height=self.total_height)
            ]
            return

        # Sort allocated regions by position (row-major order)
        sorted_regions = sorted(
            self._allocated.values(), key=lambda r: (r.y, r.x)
        )

        # Slide each region to eliminate gaps (simple row packing)
        current_x = 0
        current_y = 0
        row_height = 0  # Track the max height in current row

        for region in sorted_regions:
            # Check if we need to wrap to next row
            if current_x + region.width > self.total_width:
                # Move to next row
                current_x = 0
                current_y += row_height
                row_height = 0

            # Place this region at current position
            new_x = current_x
            new_y = current_y

            # Update the region position
            self._allocated[region.app_id] = AllocatedRegion(
                app_id=region.app_id,
                x=new_x,
                y=new_y,
                width=region.width,
                height=region.height,
            )

            # Advance position
            current_x = new_x + region.width
            row_height = max(row_height, region.height)

        # Rebuild free list as single region after all allocated regions
        self._rebuild_free_list()

    def _rebuild_free_list(self) -> None:
        """Rebuild the free list after compaction.

        Creates a single free region after all allocated regions.
        """
        if not self._allocated:
            self._free_regions = [
                FreeRegion(x=0, y=0, width=self.total_width, height=self.total_height)
            ]
            return

        # Find the extent of all allocated regions
        # We need to find the bottom-right corner of the used space
        max_x = 0
        max_y = 0

        for region in self._allocated.values():
            region_right = region.x + region.width
            region_bottom = region.y + region.height
            if region_right > max_x:
                max_x = region_right
            if region_bottom > max_y:
                max_y = region_bottom

        # Create free region starting after all allocations
        # For simplicity, we create a single region starting from (0, max_y)
        # This represents all space below the packed regions
        free_regions = []

        if max_y < self.total_height:
            # Free space below all allocations
            free_regions.append(
                FreeRegion(
                    x=0,
                    y=max_y,
                    width=self.total_width,
                    height=self.total_height - max_y,
                )
            )

        # Also check for remaining space in the last row (right of last region)
        # But only if there's still room in that row and no full rows below
        if max_x < self.total_width and max_y > 0:
            # There might be space to the right of the last region in its row
            # Find the lowest Y that has a region extending to max_x
            lowest_y_with_max_x = max_y
            for region in self._allocated.values():
                if region.x + region.width == max_x and region.y < lowest_y_with_max_x:
                    lowest_y_with_max_x = region.y

            # Add free region to the right if there's meaningful space
            if max_x < self.total_width and lowest_y_with_max_x < max_y:
                free_regions.append(
                    FreeRegion(
                        x=max_x,
                        y=lowest_y_with_max_x,
                        width=self.total_width - max_x,
                        height=max_y - lowest_y_with_max_x,
                    )
                )

        self._free_regions = free_regions

    def pack_free_regions(self) -> None:
        """Pack adjacent free regions together.

        This is a lighter-weight operation than full compaction.
        Called after freeing to merge adjacent free regions.
        """
        if len(self._free_regions) <= 1:
            return

        # Sort free regions by position
        self._free_regions.sort(key=lambda r: (r.y, r.x))

        # Try to merge adjacent regions
        merged = []
        current = self._free_regions[0]

        for next_region in self._free_regions[1:]:
            # Check if regions are horizontally adjacent
            if (
                current.y == next_region.y
                and current.x + current.width == next_region.x
                and current.height == next_region.height
            ):
                # Merge horizontally
                current = FreeRegion(
                    x=current.x,
                    y=current.y,
                    width=current.width + next_region.width,
                    height=current.height,
                )
            # Check if regions are vertically adjacent
            elif (
                current.x == next_region.x
                and current.y + current.height == next_region.y
                and current.width == next_region.width
            ):
                # Merge vertically
                current = FreeRegion(
                    x=current.x,
                    y=current.y,
                    width=current.width,
                    height=current.height + next_region.height,
                )
            else:
                # Cannot merge - save current and move to next
                merged.append(current)
                current = next_region

        merged.append(current)
        self._free_regions = merged

    def stats(self) -> dict:
        """Get allocator statistics.

        Returns:
            Dictionary with allocation statistics:
            - total_area: Total grid area
            - allocated_area: Sum of all allocated region areas
            - free_area: Sum of all free region areas
            - allocated_count: Number of allocated regions
            - free_count: Number of free regions
        """
        allocated_area = sum(r.area for r in self._allocated.values())
        free_area = sum(r.area for r in self._free_regions)

        return {
            "total_area": self.total_width * self.total_height,
            "allocated_area": allocated_area,
            "free_area": free_area,
            "allocated_count": len(self._allocated),
            "free_count": len(self._free_regions),
        }
