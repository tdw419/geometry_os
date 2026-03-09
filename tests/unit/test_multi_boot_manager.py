"""
Tests for MultiBootManager

Tests concurrent boot orchestration, resource allocation,
container lifecycle tracking, and stop operations.
"""

import pytest
import asyncio
from pathlib import Path
from unittest.mock import Mock, patch, MagicMock, AsyncMock
from dataclasses import dataclass

from systems.pixel_compiler.boot.multi_boot_manager import (
    MultiBootManager,
    ContainerState,
    ContainerRole,
    ContainerInfo,
    MultiBootResult,
)
from systems.pixel_compiler.boot.resource_allocator import (
    ResourceAllocator,
    AllocatedResources,
    ResourceExhaustedError,
)
from systems.pixel_compiler.boot.boot_bridge import BootResult


# Fixtures

@pytest.fixture
def resource_allocator():
    """Create a fresh ResourceAllocator for each test."""
    return ResourceAllocator()


@pytest.fixture
def manager(resource_allocator):
    """Create a MultiBootManager with fresh ResourceAllocator."""
    return MultiBootManager(resource_allocator=resource_allocator)


@pytest.fixture
def allocated_resources():
    """Sample allocated resources for testing."""
    return AllocatedResources(
        vnc_port=5900,
        serial_socket=Path("/tmp/pixelrts-test-serial.sock"),
        monitor_socket=Path("/tmp/pixelrts-test-monitor.sock"),
        container_id="abc12345",
        container_name="test",
    )


@pytest.fixture
def success_boot_result():
    """Sample successful BootResult for testing."""
    return BootResult(
        success=True,
        mountpoint=Path("/mnt/test"),
        vnc_port=5900,
        serial_socket=Path("/tmp/pixelrts-test-serial.sock"),
        pid=12345,
    )


@pytest.fixture
def failure_boot_result():
    """Sample failed BootResult for testing."""
    return BootResult(
        success=False,
        error_message="Boot failed: kernel not found",
    )


# ContainerState Tests

class TestContainerState:
    """Tests for ContainerState enum."""

    def test_state_values(self):
        """Test that ContainerState has expected values."""
        assert ContainerState.IDLE.value == "idle"
        assert ContainerState.BOOTING.value == "booting"
        assert ContainerState.RUNNING.value == "running"
        assert ContainerState.STOPPED.value == "stopped"
        assert ContainerState.ERROR.value == "error"

    def test_all_states_defined(self):
        """Test that all expected states are defined."""
        states = list(ContainerState)
        assert len(states) == 5


# ContainerRole Tests

class TestContainerRole:
    """Tests for ContainerRole enum."""

    def test_role_values(self):
        """Test that ContainerRole has expected values."""
        assert ContainerRole.PRIMARY.value == "primary"
        assert ContainerRole.HELPER.value == "helper"

    def test_all_roles_defined(self):
        """Test that all expected roles are defined."""
        roles = list(ContainerRole)
        assert len(roles) == 2


# ContainerInfo Tests

class TestContainerInfo:
    """Tests for ContainerInfo dataclass."""

    def test_container_info_creation(self):
        """Test creating ContainerInfo with basic fields."""
        info = ContainerInfo(
            name="test",
            path=Path("/path/to/test.rts.png"),
        )
        assert info.name == "test"
        assert info.state == ContainerState.IDLE
        assert info.resources is None
        assert info.boot_result is None
        assert info.error_message is None

    def test_container_info_to_dict(self, allocated_resources):
        """Test ContainerInfo.to_dict() serialization."""
        info = ContainerInfo(
            name="test",
            path=Path("/path/to/test.rts.png"),
            state=ContainerState.RUNNING,
            resources=allocated_resources,
        )
        d = info.to_dict()
        assert d["name"] == "test"
        assert d["state"] == "running"
        assert d["vnc_port"] == 5900
        assert d["container_id"] == "abc12345"

    def test_container_info_to_dict_with_error(self):
        """Test ContainerInfo.to_dict() with error message."""
        info = ContainerInfo(
            name="test",
            path=Path("/path/to/test.rts.png"),
            state=ContainerState.ERROR,
            error_message="Boot failed",
        )
        d = info.to_dict()
        assert d["state"] == "error"
        assert d["error_message"] == "Boot failed"


# MultiBootResult Tests

class TestMultiBootResult:
    """Tests for MultiBootResult dataclass."""

    def test_multi_boot_result_creation(self):
        """Test creating MultiBootResult."""
        result = MultiBootResult(
            success=True,
            success_count=2,
            failure_count=0,
        )
        assert result.success is True
        assert result.success_count == 2
        assert result.failure_count == 0
        assert result.containers == []
        assert result.error_messages == []

    def test_multi_boot_result_to_dict(self):
        """Test MultiBootResult.to_dict() serialization."""
        info = ContainerInfo(
            name="test",
            path=Path("/test.rts.png"),
            state=ContainerState.RUNNING,
        )
        result = MultiBootResult(
            success=True,
            containers=[info],
            success_count=1,
            failure_count=0,
        )
        d = result.to_dict()
        assert d["success"] is True
        assert d["success_count"] == 1
        assert len(d["containers"]) == 1


# MultiBootManager Initialization Tests

class TestMultiBootManagerInit:
    """Tests for MultiBootManager initialization."""

    def test_init_default_allocator(self):
        """Test manager creates default ResourceAllocator."""
        manager = MultiBootManager()
        assert manager._allocator is not None

    def test_init_custom_allocator(self, resource_allocator):
        """Test manager accepts custom ResourceAllocator."""
        manager = MultiBootManager(resource_allocator=resource_allocator)
        assert manager._allocator is resource_allocator

    def test_init_empty_containers(self, manager):
        """Test manager starts with no containers."""
        assert len(manager._containers) == 0
        assert len(manager._bridges) == 0


# MultiBootManager._get_container_name Tests

class TestGetContainerName:
    """Tests for container name derivation."""

    def test_get_name_from_path(self, manager):
        """Test name derived from path stem."""
        name = manager._get_container_name("/path/to/alpine.rts.png")
        assert name == "alpine.rts"

    def test_get_name_from_pathlib(self, manager):
        """Test name derived from Path object."""
        name = manager._get_container_name(Path("/path/to/ubuntu.rts.png"))
        assert name == "ubuntu.rts"

    def test_get_name_no_extension(self, manager):
        """Test name with no extension."""
        name = manager._get_container_name("/path/to/container")
        assert name == "container"


# MultiBootManager.boot_all Tests

class TestBootAll:
    """Tests for boot_all concurrent boot operation."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_single_success(
        self, mock_bridge_class, manager, allocated_resources, success_boot_result
    ):
        """Test booting single container successfully."""
        # Mock BootBridge
        mock_bridge = Mock()
        mock_bridge.boot.return_value = success_boot_result
        mock_bridge_class.return_value = mock_bridge

        result = manager.boot_all(["/fake/alpine.rts.png"])

        assert result.success is True
        assert result.success_count == 1
        assert result.failure_count == 0
        assert len(result.containers) == 1

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_multiple_success(
        self, mock_bridge_class, manager
    ):
        """Test booting multiple containers successfully with different VNC ports."""
        # Create mock bridges for each container
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + vnc_display,
                pid=1000 + vnc_display,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        assert result.success is True
        assert result.success_count == 2
        assert result.failure_count == 0

        # Verify each container has different VNC port
        containers = result.containers
        vnc_ports = [c.resources.vnc_port for c in containers]
        assert len(set(vnc_ports)) == 2, "Each container should have different VNC port"

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_partial_failure(
        self, mock_bridge_class, manager
    ):
        """Test booting with some containers failing - successful containers are cleaned up."""
        call_count = [0]

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            call_count[0] += 1
            # First succeeds, second fails
            if call_count[0] == 1:
                mock.boot.return_value = BootResult(
                    success=True,
                    vnc_port=5900,
                    pid=12345,
                )
            else:
                mock.boot.return_value = BootResult(
                    success=False,
                    error_message="Kernel not found",
                )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        assert result.success is False  # Not all succeeded
        # After cleanup, success_count should be 0 (cleanup was performed)
        assert result.success_count == 0
        assert result.failure_count == 1
        assert len(result.error_messages) == 1
        # Verify cleanup was performed
        assert result.cleanup_performed is True
        # Verify the successful container was stopped
        assert all(c.state == ContainerState.STOPPED or c.state == ContainerState.ERROR
                   for c in result.containers)

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_assigns_unique_resources(
        self, mock_bridge_class, manager
    ):
        """Test that each container gets unique resources."""
        created_bridges = []

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + len(created_bridges),
                pid=1000 + len(created_bridges),
            )
            created_bridges.append((mock, kwargs))
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
            "/fake/debian.rts.png",
        ])

        # Check each has different VNC port
        vnc_ports = [c.resources.vnc_port for c in result.containers]
        assert len(set(vnc_ports)) == 3

        # Check container IDs are different
        container_ids = [c.resources.container_id for c in result.containers]
        assert len(set(container_ids)) == 3

    def test_boot_all_empty_list(self, manager):
        """Test boot_all with empty list."""
        result = manager.boot_all([])
        assert result.success is False  # No containers to boot
        assert result.success_count == 0

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_with_primary(
        self, mock_bridge_class, manager
    ):
        """Test boot_all with primary parameter sets role correctly."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge_class.return_value = mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            primary="alpine.rts"
        )

        assert result.success is True
        assert len(result.containers) == 1
        # Verify primary container has PRIMARY role
        assert result.containers[0].role == ContainerRole.PRIMARY

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_primary_sets_role(
        self, mock_bridge_class, manager
    ):
        """Test that primary container has PRIMARY role and others have HELPER."""
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + vnc_display,
                pid=1000 + vnc_display,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            primary="ubuntu.rts"
        )

        assert result.success is True
        assert len(result.containers) == 2

        # Find containers by name
        alpine = next(c for c in result.containers if c.name == "alpine.rts")
        ubuntu = next(c for c in result.containers if c.name == "ubuntu.rts")

        # Verify roles
        assert alpine.role == ContainerRole.HELPER
        assert ubuntu.role == ContainerRole.PRIMARY

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_without_primary_all_helpers(
        self, mock_bridge_class, manager
    ):
        """Test that without primary parameter, all containers are HELPER."""
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + vnc_display,
                pid=1000 + vnc_display,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        assert result.success is True
        # Verify all containers have HELPER role
        for container in result.containers:
            assert container.role == ContainerRole.HELPER


# MultiBootManager.list_containers Tests

class TestListContainers:
    """Tests for list_containers method."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_list_containers_after_boot(
        self, mock_bridge_class, manager
    ):
        """Test listing containers after boot."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge_class.return_value = mock_bridge

        manager.boot_all(["/fake/alpine.rts.png"])

        containers = manager.list_containers()
        assert len(containers) == 1
        assert containers[0].name == "alpine.rts"
        assert containers[0].state == ContainerState.RUNNING

    def test_list_containers_empty(self, manager):
        """Test listing containers when none exist."""
        containers = manager.list_containers()
        assert containers == []

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_list_containers_shows_running_state(
        self, mock_bridge_class, manager
    ):
        """Test that list_containers shows RUNNING state for booted containers."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge_class.return_value = mock_bridge

        manager.boot_all(["/fake/alpine.rts.png"])

        containers = manager.list_containers()
        assert containers[0].state == ContainerState.RUNNING


# MultiBootManager.stop Tests

class TestStop:
    """Tests for stop and stop_all methods."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_stop_single_container(
        self, mock_bridge_class, manager
    ):
        """Test stopping a single container."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge.stop.return_value = None
        mock_bridge_class.return_value = mock_bridge

        manager.boot_all(["/fake/alpine.rts.png"])
        result = manager.stop("alpine.rts")

        assert result is True
        mock_bridge.stop.assert_called_once()

        # Verify state changed
        container = manager.get_container("alpine.rts")
        assert container.state == ContainerState.STOPPED

    def test_stop_nonexistent_container(self, manager):
        """Test stopping container that doesn't exist."""
        result = manager.stop("nonexistent")
        assert result is False

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_stop_all_containers(
        self, mock_bridge_class, manager
    ):
        """Test stopping all containers."""
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
            mock.stop.return_value = None
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        results = manager.stop_all()

        assert len(results) == 2
        assert all(results.values())  # All should be True

        # Verify both stopped
        containers = manager.list_containers()
        for c in containers:
            assert c.state == ContainerState.STOPPED

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_stop_releases_resources(
        self, mock_bridge_class, manager, resource_allocator
    ):
        """Test that stop releases allocated resources."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge.stop.return_value = None
        mock_bridge_class.return_value = mock_bridge

        initial_available = resource_allocator.get_available_count()
        manager.boot_all(["/fake/alpine.rts.png"])

        # After boot, one less available
        assert resource_allocator.get_available_count() == initial_available - 1

        manager.stop("alpine.rts")

        # After stop, should be released
        assert resource_allocator.get_available_count() == initial_available


# MultiBootManager Utility Method Tests

class TestUtilityMethods:
    """Tests for utility methods."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_get_running_count(
        self, mock_bridge_class, manager
    ):
        """Test get_running_count method."""
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        assert manager.get_running_count() == 0

        manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        assert manager.get_running_count() == 2

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_get_container(
        self, mock_bridge_class, manager
    ):
        """Test get_container method."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge_class.return_value = mock_bridge

        manager.boot_all(["/fake/alpine.rts.png"])

        container = manager.get_container("alpine.rts")
        assert container is not None
        assert container.name == "alpine.rts"

        # Nonexistent returns None
        assert manager.get_container("nonexistent") is None

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_clear_stopped(
        self, mock_bridge_class, manager
    ):
        """Test clear_stopped removes stopped containers."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge.stop.return_value = None
        mock_bridge_class.return_value = mock_bridge

        manager.boot_all(["/fake/alpine.rts.png"])
        manager.stop("alpine.rts")

        assert len(manager.list_containers()) == 1

        cleared = manager.clear_stopped()
        assert cleared == 1
        assert len(manager.list_containers()) == 0

    def test_repr(self, manager):
        """Test string representation."""
        repr_str = repr(manager)
        assert "MultiBootManager" in repr_str
        assert "running=0" in repr_str


# Resource Exhaustion Tests

class TestCleanupOnPartialFailure:
    """Tests for cleanup behavior on partial boot failure."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_cleanup_on_partial_failure(self, mock_bridge_class, manager):
        """Test that successful containers are cleaned up when any container fails."""
        call_count = [0]
        stop_calls = []

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            call_count[0] += 1
            # First succeeds, second fails
            if call_count[0] == 1:
                mock.boot.return_value = BootResult(
                    success=True,
                    vnc_port=5900,
                    pid=12345,
                )
                mock.stop = Mock()
            else:
                mock.boot.return_value = BootResult(
                    success=False,
                    error_message="Kernel not found",
                )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        # Verify cleanup was performed
        assert result.cleanup_performed is True
        # Verify no containers are running after cleanup
        assert manager.get_running_count() == 0
        # Verify the successful container was stopped
        alpine = manager.get_container("alpine.rts")
        assert alpine.state == ContainerState.STOPPED

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_no_cleanup_when_all_succeed(self, mock_bridge_class, manager):
        """Test that cleanup is not performed when all containers boot successfully."""
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + vnc_display,
                pid=1000 + vnc_display,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        # Verify cleanup was NOT performed
        assert result.cleanup_performed is False
        # Verify both containers are still running
        assert result.success_count == 2
        assert manager.get_running_count() == 2

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_no_cleanup_when_disabled(self, mock_bridge_class, manager):
        """Test that cleanup can be disabled with cleanup_on_failure=False."""
        call_count = [0]

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            call_count[0] += 1
            # First succeeds, second fails
            if call_count[0] == 1:
                mock.boot.return_value = BootResult(
                    success=True,
                    vnc_port=5900,
                    pid=12345,
                )
            else:
                mock.boot.return_value = BootResult(
                    success=False,
                    error_message="Kernel not found",
                )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            cleanup_on_failure=False,
        )

        # Verify cleanup was NOT performed
        assert result.cleanup_performed is False
        # Verify the successful container is still running
        assert result.success_count == 1
        assert manager.get_running_count() == 1
        alpine = manager.get_container("alpine.rts")
        assert alpine.state == ContainerState.RUNNING

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_cleanup_releases_resources(self, mock_bridge_class, manager, resource_allocator):
        """Test that cleanup releases allocated resources back to the pool."""
        call_count = [0]

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            call_count[0] += 1
            # First succeeds, second fails
            if call_count[0] == 1:
                mock.boot.return_value = BootResult(
                    success=True,
                    vnc_port=5900,
                    pid=12345,
                )
            else:
                mock.boot.return_value = BootResult(
                    success=False,
                    error_message="Kernel not found",
                )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        initial_available = resource_allocator.get_available_count()

        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        # Verify cleanup was performed
        assert result.cleanup_performed is True
        # Verify resources were released back to the pool
        assert resource_allocator.get_available_count() == initial_available


class TestResourceExhaustion:
    """Tests for resource exhaustion handling."""

    def test_resource_exhaustion(self):
        """Test handling when resources are exhausted."""
        # Create allocator with very limited ports
        allocator = ResourceAllocator()
        allocator.VNC_PORT_END = allocator.VNC_PORT_START + 1  # Only 2 ports

        manager = MultiBootManager(resource_allocator=allocator)

        with patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge') as mock_bridge_class:
            mock_bridge = Mock()
            mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
            mock_bridge_class.return_value = mock_bridge

            # Boot 2 containers (should work)
            result = manager.boot_all([
                "/fake/a.rts.png",
                "/fake/b.rts.png",
            ])
            assert result.success_count == 2

            # Reset manager for third boot attempt
            # Try to boot a third (should fail due to exhaustion)
            result2 = manager.boot_all(["/fake/c.rts.png"])

            # Should have an error
            assert result2.failure_count >= 1


# Integration-like Tests

class TestIntegrationScenarios:
    """Tests that simulate real usage scenarios."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_list_stop_workflow(
        self, mock_bridge_class, manager
    ):
        """Test typical boot -> list -> stop workflow."""
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + vnc_display,
                pid=1000 + vnc_display,
            )
            mock.stop.return_value = None
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        # Boot
        paths = ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"]
        boot_result = manager.boot_all(paths)

        assert boot_result.success is True
        assert boot_result.success_count == 2

        # List
        containers = manager.list_containers()
        assert len(containers) == 2
        for c in containers:
            assert c.state == ContainerState.RUNNING
            assert c.resources is not None

        # Verify different VNC ports
        vnc_ports = [c.resources.vnc_port for c in containers]
        assert vnc_ports[0] != vnc_ports[1]

        # Stop
        stop_results = manager.stop_all()
        assert all(stop_results.values())

        # Verify stopped state
        containers = manager.list_containers()
        for c in containers:
            assert c.state == ContainerState.STOPPED

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_with_custom_memory_cpus(
        self, mock_bridge_class, manager
    ):
        """Test boot_all with custom memory and CPU settings."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(success=True, vnc_port=5900, pid=12345)
        mock_bridge_class.return_value = mock_bridge

        manager.boot_all(
            ["/fake/alpine.rts.png"],
            memory="4G",
            cpus=4,
        )

        # Verify BootBridge was created with custom settings
        call_kwargs = mock_bridge_class.call_args[1]
        assert call_kwargs['memory'] == "4G"
        assert call_kwargs['cpus'] == 4
