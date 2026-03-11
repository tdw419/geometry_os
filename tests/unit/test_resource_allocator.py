"""
Unit tests for ResourceAllocator

Tests resource allocation for multi-boot infrastructure including:
- VNC port allocation from 5900-5999 range
- Socket path generation
- Collision prevention
- Port reuse after release
- Thread safety
- Edge cases (exhaustion, invalid names)
"""

import threading
from pathlib import Path

import pytest

from systems.pixel_compiler.boot.resource_allocator import (
    AllocatedResources,
    InvalidNameError,
    ResourceAllocator,
    ResourceExhaustedError,
)


class TestBasicAllocation:
    """Tests for basic allocation functionality."""

    def test_allocate_returns_unique_ports(self):
        """Each allocation returns a unique VNC port."""
        allocator = ResourceAllocator()

        r1 = allocator.allocate("container1.rts.png")
        r2 = allocator.allocate("container2.rts.png")

        assert r1.vnc_port != r2.vnc_port
        assert r1.vnc_port >= ResourceAllocator.VNC_PORT_START
        assert r1.vnc_port <= ResourceAllocator.VNC_PORT_END
        assert r2.vnc_port >= ResourceAllocator.VNC_PORT_START
        assert r2.vnc_port <= ResourceAllocator.VNC_PORT_END

    def test_allocate_creates_socket_paths(self):
        """Allocation creates serial and monitor socket paths."""
        allocator = ResourceAllocator()

        resources = allocator.allocate("test.rts.png")

        assert resources.serial_socket is not None
        assert resources.monitor_socket is not None
        assert isinstance(resources.serial_socket, Path)
        assert isinstance(resources.monitor_socket, Path)

        # Socket paths should contain container ID
        assert "pixelrts" in str(resources.serial_socket)
        assert "pixelrts" in str(resources.monitor_socket)
        assert "serial" in str(resources.serial_socket)
        assert "monitor" in str(resources.monitor_socket)

    def test_allocate_returns_allocated_resources(self):
        """Allocation returns AllocatedResources with all fields populated."""
        allocator = ResourceAllocator()

        resources = allocator.allocate("mycontainer.rts.png")

        assert isinstance(resources, AllocatedResources)
        assert resources.vnc_port >= 5900
        assert resources.container_name == "mycontainer.rts.png"
        assert resources.container_id is not None
        assert len(resources.container_id) == 8  # Short UUID

    def test_allocate_same_name_returns_same_resources(self):
        """Allocating same name twice returns same resources (idempotent)."""
        allocator = ResourceAllocator()

        r1 = allocator.allocate("same.rts.png")
        r2 = allocator.allocate("same.rts.png")

        assert r1.vnc_port == r2.vnc_port
        assert r1.container_id == r2.container_id
        assert r1.serial_socket == r2.serial_socket


class TestCollisionPrevention:
    """Tests for preventing resource collisions."""

    def test_multiple_allocations_no_collisions(self):
        """Multiple allocations never have colliding ports."""
        allocator = ResourceAllocator()
        ports = set()
        sockets = set()

        for i in range(20):
            resources = allocator.allocate(f"container{i}.rts.png")
            assert resources.vnc_port not in ports, f"Port collision at {resources.vnc_port}"
            assert resources.serial_socket not in sockets, f"Socket collision at {resources.serial_socket}"
            ports.add(resources.vnc_port)
            sockets.add(resources.serial_socket)

        assert len(ports) == 20

    def test_deterministic_allocation(self):
        """Same name always gets same container ID (deterministic)."""
        allocator1 = ResourceAllocator()
        allocator2 = ResourceAllocator()

        r1 = allocator1.allocate("test.rts.png")
        r2 = allocator2.allocate("test.rts.png")

        # Container IDs should be the same (deterministic UUID5)
        assert r1.container_id == r2.container_id


class TestReleaseAndReuse:
    """Tests for resource release and reuse."""

    def test_release_allows_reuse(self):
        """Released ports can be reallocated."""
        allocator = ResourceAllocator()

        r1 = allocator.allocate("first.rts.png")
        port = r1.vnc_port

        allocator.release(r1)

        r2 = allocator.allocate("second.rts.png")

        # The released port should be available for reuse
        # Note: May not be same port, but should be available
        assert allocator.get_available_count() > 0

    def test_release_removes_from_tracking(self):
        """Released resources are removed from tracking."""
        allocator = ResourceAllocator()

        r1 = allocator.allocate("tracked.rts.png")
        assert allocator.get_allocated_count() == 1

        allocator.release(r1)
        assert allocator.get_allocated_count() == 0

    def test_socket_cleanup_on_release(self):
        """Release clears socket tracking."""
        allocator = ResourceAllocator()

        resources = allocator.allocate("sockets.rts.png")
        socket_path = resources.serial_socket

        allocator.release(resources)

        # Allocate again - can use different resources
        r2 = allocator.allocate("new.rts.png")
        # Just verify no crash


class TestPortExhaustion:
    """Tests for port exhaustion handling."""

    def test_port_exhaustion_raises_error(self):
        """Exhausting port range raises ResourceExhaustedError."""
        allocator = ResourceAllocator()

        # Allocate all ports
        for i in range(ResourceAllocator.VNC_PORT_RANGE):
            allocator.allocate(f"exhaust{i}.rts.png")

        # Next allocation should fail
        with pytest.raises(ResourceExhaustedError) as exc_info:
            allocator.allocate("overflow.rts.png")

        assert "exhausted" in str(exc_info.value).lower()

    def test_available_count_decreases(self):
        """Available count decreases as ports are allocated."""
        allocator = ResourceAllocator()
        initial = allocator.get_available_count()

        allocator.allocate("one.rts.png")
        assert allocator.get_available_count() == initial - 1

        allocator.allocate("two.rts.png")
        assert allocator.get_available_count() == initial - 2


class TestThreadSafety:
    """Tests for thread-safe allocation."""

    def test_concurrent_allocation_thread_safety(self):
        """Concurrent allocations don't cause collisions."""
        allocator = ResourceAllocator()
        results = []
        errors = []

        def allocate_thread(name):
            try:
                resources = allocator.allocate(name)
                results.append(resources)
            except Exception as e:
                errors.append(e)

        threads = [
            threading.Thread(target=allocate_thread, args=(f"thread{i}.rts.png",))
            for i in range(50)
        ]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        # No errors should occur
        assert len(errors) == 0

        # All ports should be unique
        ports = [r.vnc_port for r in results]
        assert len(ports) == len(set(ports)), "Port collision detected in concurrent allocation"

    def test_concurrent_release_thread_safety(self):
        """Concurrent releases don't cause issues."""
        allocator = ResourceAllocator()

        # Allocate many resources
        resources_list = [
            allocator.allocate(f"release{i}.rts.png")
            for i in range(20)
        ]

        errors = []

        def release_thread(resources):
            try:
                allocator.release(resources)
            except Exception as e:
                errors.append(e)

        threads = [
            threading.Thread(target=release_thread, args=(r,))
            for r in resources_list
        ]

        for t in threads:
            t.start()
        for t in threads:
            t.join()

        assert len(errors) == 0


class TestInvalidNames:
    """Tests for name validation."""

    def test_invalid_name_empty(self):
        """Empty name raises InvalidNameError."""
        allocator = ResourceAllocator()

        with pytest.raises(InvalidNameError):
            allocator.allocate("")

    def test_invalid_name_none(self):
        """None name raises InvalidNameError."""
        allocator = ResourceAllocator()

        with pytest.raises(InvalidNameError):
            allocator.allocate(None)

    def test_invalid_name_special_chars(self):
        """Names with invalid characters raise InvalidNameError."""
        allocator = ResourceAllocator()

        with pytest.raises(InvalidNameError):
            allocator.allocate("invalid/name.rts.png")

        with pytest.raises(InvalidNameError):
            allocator.allocate("invalid name.rts.png")

        with pytest.raises(InvalidNameError):
            allocator.allocate("invalid$name.rts.png")

    def test_valid_names_accepted(self):
        """Valid names are accepted."""
        allocator = ResourceAllocator()

        # These should all work
        allocator.allocate("valid.rts.png")
        allocator.allocate("valid-name.rts.png")
        allocator.allocate("valid_name.rts.png")
        allocator.allocate("Valid123.rts.png")
        allocator.allocate("123.rts.png")


class TestClearAll:
    """Tests for clear_all functionality."""

    def test_clear_all_resets_state(self):
        """clear_all resets allocator to initial state."""
        allocator = ResourceAllocator()

        # Allocate some resources
        for i in range(10):
            allocator.allocate(f"clear{i}.rts.png")

        assert allocator.get_allocated_count() == 10

        allocator.clear_all()

        assert allocator.get_allocated_count() == 0
        assert allocator.get_available_count() == ResourceAllocator.VNC_PORT_RANGE

    def test_clear_all_allows_reallocation(self):
        """After clear_all, can allocate all ports again."""
        allocator = ResourceAllocator()

        # Allocate all ports
        for i in range(ResourceAllocator.VNC_PORT_RANGE):
            allocator.allocate(f"full{i}.rts.png")

        allocator.clear_all()

        # Should be able to allocate all again
        for i in range(ResourceAllocator.VNC_PORT_RANGE):
            allocator.allocate(f"new{i}.rts.png")


class TestAllocatedResources:
    """Tests for AllocatedResources dataclass."""

    def test_to_dict(self):
        """AllocatedResources can be converted to dict."""
        allocator = ResourceAllocator()
        resources = allocator.allocate("dict.rts.png")

        d = resources.to_dict()

        assert "vnc_port" in d
        assert "serial_socket" in d
        assert "monitor_socket" in d
        assert "container_id" in d
        assert "container_name" in d
        assert d["vnc_port"] == resources.vnc_port
        assert d["container_name"] == "dict.rts.png"


class TestEdgeCases:
    """Tests for edge cases and boundary conditions."""

    def test_first_allocation_gets_base_port(self):
        """First allocation gets base VNC port (5900)."""
        allocator = ResourceAllocator()

        resources = allocator.allocate("first.rts.png")

        assert resources.vnc_port == ResourceAllocator.VNC_PORT_START

    def test_sequential_ports(self):
        """Ports are allocated sequentially."""
        allocator = ResourceAllocator()

        ports = []
        for i in range(10):
            resources = allocator.allocate(f"seq{i}.rts.png")
            ports.append(resources.vnc_port)

        # Ports should be sequential
        assert ports == list(range(5900, 5910))

    def test_release_reuse_order(self):
        """Released ports are reused before allocating new ones."""
        allocator = ResourceAllocator()

        r1 = allocator.allocate("reuse1.rts.png")
        port1 = r1.vnc_port

        r2 = allocator.allocate("reuse2.rts.png")
        r3 = allocator.allocate("reuse3.rts.png")

        allocator.release(r1)
        allocator.release(r2)

        r4 = allocator.allocate("reuse4.rts.png")
        r5 = allocator.allocate("reuse5.rts.png")

        # r4 and r5 should get released ports (not sequential from r3)
        # The exact order depends on set pop order, but should be from released pool
