"""
Tests for MultiBootManager

Tests concurrent boot orchestration, resource allocation,
container lifecycle tracking, and stop operations.
"""

from datetime import datetime
from pathlib import Path
from unittest.mock import Mock, patch

import pytest

from systems.pixel_compiler.boot.boot_bridge import BootResult
from systems.pixel_compiler.boot.multi_boot_manager import (
    ContainerInfo,
    ContainerRole,
    ContainerState,
    MultiBootManager,
    MultiBootResult,
    RestoreResult,
)
from systems.pixel_compiler.boot.resource_allocator import (
    AllocatedResources,
    ResourceAllocator,
)
from systems.pixel_compiler.boot.vm_snapshot import (
    RestoreProgress,
    RestoreState,
    SnapshotInfo,
    SnapshotResult,
    SnapshotState,
    VMSnapshotMetadata,
)

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

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_stop_all_ordered_helpers_first(
        self, mock_bridge_class, manager
    ):
        """Test that stop_all_ordered stops helpers before primary."""
        stop_order = []

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + vnc_display,
                pid=1000 + vnc_display,
            )

            # Track stop order
            def track_stop():
                # Get container name from the rts_png_path
                path = kwargs.get('rts_png_path', 'unknown')
                stop_order.append(path.stem if hasattr(path, 'stem') else str(path))
            mock.stop.side_effect = track_stop
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        # Boot with primary
        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            primary="ubuntu.rts"
        )

        assert result.success is True

        # Stop with ordered shutdown
        manager.stop_all_ordered()

        # Verify primary (ubuntu) was stopped last
        assert stop_order[-1] == "ubuntu.rts", f"Primary should be stopped last, got: {stop_order}"

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_stop_all_ordered_primary_last(
        self, mock_bridge_class, manager
    ):
        """Test that primary is stopped after all helpers."""
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

        # Boot with multiple helpers and one primary
        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png", "/fake/debian.rts.png"],
            primary="ubuntu.rts"
        )

        assert result.success is True
        assert len(result.containers) == 3

        # Stop with ordered shutdown
        results = manager.stop_all_ordered()

        # Verify all were stopped
        assert len(results) == 3
        assert all(results.values())

        # Verify all containers are stopped
        for container in manager.list_containers():
            assert container.state == ContainerState.STOPPED

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_stop_all_ordered_no_primary(
        self, mock_bridge_class, manager
    ):
        """Test stop_all_ordered when no primary is designated (all helpers)."""
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

        # Boot without primary (all helpers)
        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        assert result.success is True

        # Stop with ordered shutdown
        results = manager.stop_all_ordered()

        # Verify all were stopped
        assert len(results) == 2
        assert all(results.values())

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_stop_all_ordered_returns_results(
        self, mock_bridge_class, manager
    ):
        """Test that stop_all_ordered returns Dict[str, bool] like stop_all."""
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

        # Boot with primary
        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            primary="ubuntu.rts"
        )

        assert result.success is True

        # Stop with ordered shutdown
        results = manager.stop_all_ordered()

        # Verify return type
        assert isinstance(results, dict)
        assert all(isinstance(k, str) for k in results.keys())
        assert all(isinstance(v, bool) for v in results.values())

        # Verify all stopped successfully
        assert all(results.values())


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


# Ordered Boot Tests

class TestOrderedBoot:
    """Tests for ordered boot behavior with primary container."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_ordered_primary_first(
        self, mock_bridge_class, manager
    ):
        """Test that primary container boots before helpers in ordered mode."""
        boot_order = []

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)

            # Track boot order
            def track_boot(*boot_args, **boot_kwargs):
                boot_order.append(kwargs.get('rts_png_path', 'unknown'))
                return BootResult(
                    success=True,
                    vnc_port=5900 + vnc_display,
                    pid=1000 + vnc_display,
                )
            mock.boot.side_effect = track_boot
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            primary="alpine.rts"
        )

        assert result.success is True
        assert len(result.containers) == 2

        # Verify primary (alpine) was booted first
        assert boot_order[0].name == "alpine.rts.png"

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_ordered_waits_for_primary(
        self, mock_bridge_class, manager
    ):
        """Test that helpers wait for primary to reach RUNNING state."""
        wait_called = [False]

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

        # Patch _wait_for_running to verify it's called
        original_wait = manager._wait_for_running

        async def mock_wait(container_info, timeout=30.0, poll_interval=0.5):
            wait_called[0] = True
            return await original_wait(container_info, timeout, poll_interval)

        with patch.object(manager, '_wait_for_running', side_effect=mock_wait):
            result = manager.boot_all(
                ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
                primary="alpine.rts"
            )

        assert result.success is True
        assert wait_called[0] is True, "_wait_for_running should be called for primary"

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_ordered_primary_failure_aborts_helpers(
        self, mock_bridge_class, manager
    ):
        """Test that helpers are NOT booted if primary fails."""
        boot_count = [0]

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            # Track boot calls
            def track_boot(*boot_args, **boot_kwargs):
                boot_count[0] += 1
                return BootResult(
                    success=False,
                    error_message="Primary boot failed",
                )
            mock.boot.side_effect = track_boot
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            primary="alpine.rts"
        )

        # Only primary should have been attempted (helpers should not boot)
        assert boot_count[0] == 1, "Only primary should be booted on failure"
        assert result.success is False
        assert len(result.containers) == 1
        # Verify only primary container exists
        assert result.containers[0].name == "alpine.rts"

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_without_primary_is_concurrent(
        self, mock_bridge_class, manager
    ):
        """Test that without primary parameter, all containers boot concurrently (existing behavior)."""
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

        # Without primary, should use concurrent boot
        result = manager.boot_all([
            "/fake/alpine.rts.png",
            "/fake/ubuntu.rts.png",
        ])

        assert result.success is True
        assert result.success_count == 2
        # All should have HELPER role (no primary designated)
        for container in result.containers:
            assert container.role == ContainerRole.HELPER

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_ordered_primary_has_primary_role(
        self, mock_bridge_class, manager
    ):
        """Test that primary container gets PRIMARY role and helpers get HELPER."""
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
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png", "/fake/debian.rts.png"],
            primary="ubuntu.rts"
        )

        assert result.success is True
        assert len(result.containers) == 3

        # Find containers by name
        alpine = next((c for c in result.containers if c.name == "alpine.rts"), None)
        ubuntu = next((c for c in result.containers if c.name == "ubuntu.rts"), None)
        debian = next((c for c in result.containers if c.name == "debian.rts"), None)

        # Verify roles
        assert alpine.role == ContainerRole.HELPER
        assert ubuntu.role == ContainerRole.PRIMARY
        assert debian.role == ContainerRole.HELPER


# Virtual Network Integration Tests

class TestVirtualNetworkIntegration:
    """Tests for virtual network integration in MultiBootManager."""

    def test_boot_all_with_socket_mcast_mode(self, manager):
        """Test that boot_all accepts network_mode='socket_mcast' parameter."""
        import inspect
        sig = inspect.signature(manager.boot_all)
        params = sig.parameters
        assert 'network_mode' in params, "boot_all should have network_mode parameter"
        assert params['network_mode'].default == "user", "network_mode default should be 'user'"

    def test_boot_all_with_custom_socket_config(self, manager):
        """Test that custom socket config can be passed to boot_all."""
        import inspect
        sig = inspect.signature(manager.boot_all)
        params = sig.parameters
        assert 'socket_config' in params, "boot_all should have socket_config parameter"

    def test_container_info_has_network_fallback_field(self):
        """Test that ContainerInfo has network_fallback field."""
        info = ContainerInfo(
            name="test",
            path=Path("/fake/test.rts.png"),
        )
        assert hasattr(info, 'network_fallback')
        assert info.network_fallback is False  # Default value

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_passes_network_mode_to_bridge(self, mock_bridge_class, manager):
        """Test that network_mode is passed through to BootBridge."""
        from systems.pixel_compiler.integration.qemu_boot import NetworkMode

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        # Boot with socket_mcast mode
        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            network_mode="socket_mcast",
        )

        # Verify BootBridge was called
        assert mock_bridge_class.called
        # Get the kwargs from the call
        call_kwargs = mock_bridge_class.call_args[1]
        assert call_kwargs.get('network_mode') == NetworkMode.SOCKET_MCAST


class TestNetworkFallback:
    """Tests for graceful network fallback behavior."""

    @patch('systems.pixel_compiler.boot.multi_boot_manager.VirtualNetwork')
    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_fallback_on_network_unavailable(
        self, mock_bridge_class, mock_vn_class, manager
    ):
        """Test that when VirtualNetwork fails, falls back to USER mode."""
        from systems.pixel_compiler.integration.qemu_boot import NetworkMode

        # Mock VirtualNetwork to be unavailable
        mock_vn = Mock()
        mock_vn.is_available.return_value = False
        mock_vn_class.return_value = mock_vn

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        # Boot with socket_mcast mode (should fall back to user)
        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            network_mode="socket_mcast",
        )

        # Boot should still succeed
        assert result.success is True
        assert result.success_count == 1

        # Verify fallback to USER mode
        call_kwargs = mock_bridge_class.call_args[1]
        assert call_kwargs.get('network_mode') == NetworkMode.USER

        # Verify network_fallback flag is set
        assert result.containers[0].network_fallback is True

    @patch('systems.pixel_compiler.boot.multi_boot_manager.VirtualNetwork')
    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_succeeds_with_network_fallback(
        self, mock_bridge_class, mock_vn_class, manager
    ):
        """Test that boot succeeds even when network setup fails."""
        from systems.pixel_compiler.boot.virtual_network import NetworkSetupError

        # Mock VirtualNetwork to raise NetworkSetupError
        mock_vn_class.side_effect = NetworkSetupError("Network setup failed")

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        # Boot should succeed despite network error
        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            network_mode="socket_mcast",
        )

        assert result.success is True
        assert result.containers[0].state == ContainerState.RUNNING

    @patch('systems.pixel_compiler.boot.multi_boot_manager.VirtualNetwork')
    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_network_fallback_flag_set(self, mock_bridge_class, mock_vn_class, manager):
        """Test that network_fallback flag is True when fallback occurs."""
        from systems.pixel_compiler.boot.virtual_network import NetworkSetupError

        # Mock VirtualNetwork to raise error
        mock_vn_class.side_effect = NetworkSetupError("Cannot create socket")

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            network_mode="socket_mcast",
        )

        # Check network_fallback flag
        assert result.containers[0].network_fallback is True

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_default_network_mode_is_user(self, mock_bridge_class, manager):
        """Test that default network mode is isolated USER mode."""
        from systems.pixel_compiler.integration.qemu_boot import NetworkMode

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        # Boot without specifying network_mode
        result = manager.boot_all(["/fake/alpine.rts.png"])

        # Verify USER mode is used
        call_kwargs = mock_bridge_class.call_args[1]
        assert call_kwargs.get('network_mode') == NetworkMode.USER

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_user_mode_never_falls_back(self, mock_bridge_class, manager):
        """Test that USER mode never sets network_fallback flag."""
        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        # Boot with explicit USER mode
        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            network_mode="user",
        )

        # network_fallback should remain False
        assert result.containers[0].network_fallback is False

    @patch('systems.pixel_compiler.boot.multi_boot_manager.VirtualNetwork')
    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_socket_mcast_available_uses_socket_mcast(
        self, mock_bridge_class, mock_vn_class, manager
    ):
        """Test that when VirtualNetwork is available, SOCKET_MCAST is used."""
        from systems.pixel_compiler.integration.qemu_boot import NetworkMode

        # Mock VirtualNetwork to be available
        mock_vn = Mock()
        mock_vn.is_available.return_value = True
        mock_vn_class.return_value = mock_vn

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            network_mode="socket_mcast",
        )

        # Verify SOCKET_MCAST mode is used
        call_kwargs = mock_bridge_class.call_args[1]
        assert call_kwargs.get('network_mode') == NetworkMode.SOCKET_MCAST

        # network_fallback should be False (no fallback occurred)
        assert result.containers[0].network_fallback is False

    @patch('systems.pixel_compiler.boot.multi_boot_manager.VirtualNetwork')
    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_fallback_with_multiple_containers(
        self, mock_bridge_class, mock_vn_class, manager
    ):
        """Test fallback works correctly with multiple containers."""
        from systems.pixel_compiler.boot.virtual_network import NetworkSetupError

        # Mock VirtualNetwork to raise error
        mock_vn_class.side_effect = NetworkSetupError("Network unavailable")

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
            network_mode="socket_mcast",
        )

        # All containers should boot successfully with fallback
        assert result.success is True
        assert result.success_count == 2

        # All containers should have network_fallback=True
        for container in result.containers:
            assert container.network_fallback is True

    @patch('systems.pixel_compiler.boot.multi_boot_manager.VirtualNetwork')
    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_network_fallback_in_to_dict(
        self, mock_bridge_class, mock_vn_class, manager
    ):
        """Test that network_fallback is included in to_dict()."""
        from systems.pixel_compiler.boot.virtual_network import NetworkSetupError

        # Mock VirtualNetwork to raise error
        mock_vn_class.side_effect = NetworkSetupError("Network error")

        def create_mock_bridge(*args, **kwargs):
            mock = Mock()
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900,
                pid=12345,
            )
            return mock

        mock_bridge_class.side_effect = create_mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            network_mode="socket_mcast",
        )

        # Check to_dict includes network_fallback
        container_dict = result.containers[0].to_dict()
        assert 'network_fallback' in container_dict
        assert container_dict['network_fallback'] is True


# ========================================
# Snapshot Tests
# ========================================


class TestContainerInfoSnapshots:
    """Tests for ContainerInfo snapshot field."""

    def test_container_info_has_snapshots_field(self):
        """Test ContainerInfo has snapshots field."""
        info = ContainerInfo(
            name="test",
            path=Path("/path/to/test.rts.png"),
        )
        assert hasattr(info, 'snapshots')
        assert info.snapshots == []

    def test_container_info_to_dict_includes_snapshots(self):
        """Test ContainerInfo.to_dict() includes snapshots."""
        metadata = VMSnapshotMetadata(
            snapshot_id="vmsnap_test_pre-update_20240101_120000",
            tag="pre-update",
            container_name="test",
            created_at=datetime(2024, 1, 1, 12, 0, 0),
            state=SnapshotState.COMPLETE,
            vm_memory="2G",
            description="Before update",
        )
        info = ContainerInfo(
            name="test",
            path=Path("/path/to/test.rts.png"),
            snapshots=[metadata],
        )
        d = info.to_dict()
        assert 'snapshots' in d
        assert len(d['snapshots']) == 1
        assert d['snapshots'][0]['tag'] == "pre-update"

    def test_container_info_snapshots_default_empty(self):
        """Test ContainerInfo snapshots default to empty list."""
        info = ContainerInfo(
            name="test",
            path=Path("/path/to/test.rts.png"),
        )
        assert info.snapshots == []


class TestContainerInfoEphemeral:
    """Tests for ContainerInfo is_ephemeral field."""

    def test_container_info_ephemeral_default_false(self):
        """Test ContainerInfo has is_ephemeral=False by default."""
        info = ContainerInfo(
            name="test",
            path=Path("/path/to/test.rts.png"),
        )
        assert info.is_ephemeral is False

    def test_container_info_ephemeral_to_dict(self):
        """Test to_dict() includes is_ephemeral field."""
        info = ContainerInfo(
            name="ephemeral-test",
            path=Path("/path/to/test.rts.png"),
            is_ephemeral=True,
        )
        d = info.to_dict()
        assert 'is_ephemeral' in d
        assert d['is_ephemeral'] is True

    def test_container_info_ephemeral_round_trip(self):
        """Test is_ephemeral preserved through serialization round-trip."""
        # Create ContainerInfo with is_ephemeral=True
        original = ContainerInfo(
            name="ephemeral-rt",
            path=Path("/path/to/test.rts.png"),
            state=ContainerState.RUNNING,
            is_ephemeral=True,
        )

        # Serialize to dict
        d = original.to_dict()

        # Create new ContainerInfo from dict values
        restored = ContainerInfo(
            name=d['name'],
            path=Path(d['path']),
            state=ContainerState(d['state']),
            is_ephemeral=d['is_ephemeral'],
        )

        # Verify is_ephemeral preserved
        assert restored.is_ephemeral is True

    def test_load_state_with_ephemeral_flag(self, tmp_path):
        """Test state file with is_ephemeral=True loads correctly."""
        import json

        from systems.pixel_compiler.boot.multi_boot_manager import MultiBootManager

        # Create a mock state file with ephemeral container
        state_data = [{
            'name': 'eph-test',
            'path': '/tmp/test.rts.png',
            'state': 'running',
            'role': 'primary',
            'is_ephemeral': True
        }]
        state_file = tmp_path / "containers.json"
        state_file.write_text(json.dumps(state_data))

        # Create manager with custom state file
        manager = MultiBootManager(state_file=state_file)
        containers = manager.list_containers()

        assert len(containers) == 1
        assert containers[0].is_ephemeral is True


class TestMultiBootManagerSnapshotMethods:
    """Tests for MultiBootManager snapshot methods."""

    def test_create_snapshot_raises_for_nonexistent_container(self, manager):
        """Test create_snapshot raises for nonexistent container."""
        with pytest.raises(ValueError, match="does not exist"):
            manager.create_snapshot("nonexistent", "snap1")

    def test_create_snapshot_raises_for_non_running_container(self, manager):
        """Test create_snapshot raises for non-running container."""
        # Create a container in IDLE state
        info = ContainerInfo(
            name="idle-container",
            path=Path("/fake/idle.rts.png"),
            state=ContainerState.IDLE,
        )
        manager._containers["idle-container"] = info

        with pytest.raises(ValueError, match="is not running"):
            manager.create_snapshot("idle-container", "snap1")

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_create_snapshot_delegates_to_manager(self, mock_get_manager, manager):
        """Test create_snapshot delegates to VMSnapshotManager."""
        # Setup running container
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        expected_result = SnapshotResult(
            success=True,
            tag="snap1",
            metadata=VMSnapshotMetadata(
                snapshot_id="test-id",
                tag="snap1",
                container_name="running-container",
                created_at=datetime.now(),
                state=SnapshotState.COMPLETE,
                vm_memory="2G",
            )
        )
        mock_snapshot_manager.create_snapshot.return_value = expected_result
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.create_snapshot("running-container", "snap1", "test snapshot")

        assert result.success is True
        assert result.tag == "snap1"
        mock_snapshot_manager.create_snapshot.assert_called_once_with(
            "snap1", description="test snapshot"
        )

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_create_snapshot_appends_metadata_on_success(self, mock_get_manager, manager):
        """Test create_snapshot appends metadata to container info on success."""
        # Setup running container
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        metadata = VMSnapshotMetadata(
            snapshot_id="test-id",
            tag="snap1",
            container_name="running-container",
            created_at=datetime.now(),
            state=SnapshotState.COMPLETE,
            vm_memory="2G",
        )
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.create_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
            metadata=metadata,
        )
        mock_get_manager.return_value = mock_snapshot_manager

        manager.create_snapshot("running-container", "snap1")

        assert len(info.snapshots) == 1
        assert info.snapshots[0].tag == "snap1"

    def test_list_container_snapshots_raises_for_nonexistent(self, manager):
        """Test list_container_snapshots raises for nonexistent container."""
        with pytest.raises(ValueError, match="does not exist"):
            manager.list_container_snapshots("nonexistent")

    def test_list_container_snapshots_raises_for_non_running(self, manager):
        """Test list_container_snapshots raises for non-running container."""
        info = ContainerInfo(
            name="stopped-container",
            path=Path("/fake/stopped.rts.png"),
            state=ContainerState.STOPPED,
        )
        manager._containers["stopped-container"] = info

        with pytest.raises(ValueError, match="is not running"):
            manager.list_container_snapshots("stopped-container")

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_list_container_snapshots_delegates_to_manager(self, mock_get_manager, manager):
        """Test list_container_snapshots delegates to VMSnapshotManager."""
        # Setup running container
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        expected_snapshots = [
            SnapshotInfo(id=1, tag="snap1", size="1.5 GB", date="2024-01-01 12:00:00", vm_clock="00:01:00.000"),
            SnapshotInfo(id=2, tag="snap2", size="2.0 GB", date="2024-01-02 12:00:00", vm_clock="00:02:00.000"),
        ]
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.list_snapshots.return_value = expected_snapshots
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.list_container_snapshots("running-container")

        assert len(result) == 2
        assert result[0].tag == "snap1"
        assert result[1].tag == "snap2"

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_snapshot_delegates_to_manager(self, mock_get_manager, manager):
        """Test restore_snapshot delegates to VMSnapshotManager."""
        # Setup running container
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.success is True
        mock_snapshot_manager.restore_snapshot.assert_called_once_with("snap1")

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_delete_snapshot_removes_from_tracking(self, mock_get_manager, manager):
        """Test delete_snapshot removes snapshot from tracking on success."""
        # Setup running container with snapshot
        metadata = VMSnapshotMetadata(
            snapshot_id="test-id",
            tag="snap1",
            container_name="running-container",
            created_at=datetime.now(),
            state=SnapshotState.COMPLETE,
            vm_memory="2G",
        )
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            snapshots=[metadata],
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.delete_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.delete_snapshot("running-container", "snap1")

        assert result.success is True
        assert len(info.snapshots) == 0


# ========================================
# RestoreResult Tests
# ========================================

class TestRestoreResult:
    """Tests for RestoreResult dataclass."""

    def test_restore_result_creation(self):
        """Test creating RestoreResult with required fields."""
        result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="snap1",
        )

        assert result.success is True
        assert result.container_name == "test-container"
        assert result.snapshot_tag == "snap1"
        assert result.identity_preserved is True  # default
        assert result.network_reconnected is None  # default
        assert result.pre_restore_state is None  # default
        assert result.post_restore_state is None  # default
        assert result.error_message is None  # default
        assert result.restore_progress is None  # default

    def test_restore_result_to_dict(self):
        """Test RestoreResult serialization to dict."""
        result = RestoreResult(
            success=True,
            container_name="test-container",
            snapshot_tag="snap1",
            identity_preserved=True,
            network_reconnected=True,
            pre_restore_state=ContainerState.RUNNING,
            post_restore_state=ContainerState.RUNNING,
            error_message=None,
        )

        data = result.to_dict()

        assert data["success"] is True
        assert data["container_name"] == "test-container"
        assert data["snapshot_tag"] == "snap1"
        assert data["identity_preserved"] is True
        assert data["network_reconnected"] is True
        assert data["pre_restore_state"] == "running"
        assert data["post_restore_state"] == "running"
        assert data["error_message"] is None

    def test_restore_result_optional_fields(self):
        """Test RestoreResult with optional fields set."""
        progress = RestoreProgress(
            state=RestoreState.COMPLETE,
            tag="snap1",
            started_at=datetime.now(),
        )

        result = RestoreResult(
            success=False,
            container_name="test-container",
            snapshot_tag="snap1",
            identity_preserved=False,
            network_reconnected=None,
            pre_restore_state=ContainerState.RUNNING,
            post_restore_state=ContainerState.RUNNING,
            error_message="Restore failed",
            restore_progress=progress,
        )

        assert result.success is False
        assert result.identity_preserved is False
        assert result.network_reconnected is None
        assert result.pre_restore_state == ContainerState.RUNNING
        assert result.post_restore_state == ContainerState.RUNNING
        assert result.error_message == "Restore failed"
        assert result.restore_progress is progress


# ========================================
# Enhanced Restore Snapshot Tests
# ========================================

class TestRestoreSnapshotEnhanced:
    """Tests for enhanced restore_snapshot with identity preservation."""

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_returns_restore_result(self, mock_get_manager, manager):
        """Test restore_snapshot returns RestoreResult type."""
        # Setup running container with resources
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert isinstance(result, RestoreResult)
        assert result.success is True
        assert result.container_name == "running-container"
        assert result.snapshot_tag == "snap1"

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_preserves_identity(self, mock_get_manager, manager):
        """Test container identity (name, VNC port) is preserved after restore."""
        # Setup running container with resources
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5901,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.identity_preserved is True
        assert result.container_name == "running-container"
        # VNC port should still be 5901 after restore
        assert info.resources.vnc_port == 5901

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_tracks_pre_post_state(self, mock_get_manager, manager):
        """Test pre/post restore states are tracked."""
        # Setup running container with resources
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.pre_restore_state == ContainerState.RUNNING
        assert result.post_restore_state == ContainerState.RUNNING

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_handles_failure_gracefully(self, mock_get_manager, manager):
        """Test failed restore doesn't corrupt state."""
        # Setup running container with resources
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager with failed restore
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=False,
            tag="snap1",
            error_message="Snapshot not found",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        # Container should still be RUNNING (QEMU process alive)
        assert result.success is False
        assert result.error_message == "Snapshot not found"
        assert result.post_restore_state == ContainerState.RUNNING
        # Identity should still be preserved
        assert result.identity_preserved is True

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_includes_progress(self, mock_get_manager, manager):
        """Test RestoreProgress is included in result."""
        # Setup running container with resources
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Create progress object
        progress = RestoreProgress(
            state=RestoreState.COMPLETE,
            tag="snap1",
            started_at=datetime.now(),
            completed_at=datetime.now(),
            pre_restore_vm_state="running",
        )

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
            restore_progress=progress,
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.restore_progress is progress
        assert result.restore_progress.state == RestoreState.COMPLETE


# ========================================
# Restore Network Reconnection Tests
# ========================================

class TestRestoreNetworkReconnection:
    """Tests for network reconnection tracking during restore."""

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_network_reconnected_on_success(self, mock_get_manager, manager):
        """Test network_reconnected=True on successful restore with virtual network."""
        # Setup running container with virtual network (not fallback)
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            network_fallback=False,  # Using virtual network
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.success is True
        assert result.network_reconnected is True

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_network_none_on_fallback(self, mock_get_manager, manager):
        """Test network_reconnected=None when using fallback (USER mode)."""
        # Setup running container with network fallback
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            network_fallback=True,  # Using fallback (USER mode)
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.success is True
        assert result.network_reconnected is None

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_tracks_network_fallback_containers(self, mock_get_manager, manager):
        """Test restore handles containers that fell back to USER mode."""
        # Setup running container with network fallback and failed restore
        info = ContainerInfo(
            name="fallback-container",
            path=Path("/fake/fallback.rts.png"),
            state=ContainerState.RUNNING,
            network_fallback=True,  # Fell back to USER mode
            resources=AllocatedResources(
                vnc_port=5902,
                container_id="fallback-id",
                serial_socket=Path("/tmp/serial-fb.sock"),
                monitor_socket=Path("/tmp/monitor-fb.sock"),
                container_name="fallback-container",
            ),
        )
        manager._containers["fallback-container"] = info

        # Mock snapshot manager with failed restore
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=False,
            tag="snap1",
            error_message="Snapshot corrupted",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("fallback-container", "snap1")

        # Even on failure, network_reconnected is None for fallback containers
        assert result.success is False
        assert result.network_reconnected is None
        assert result.error_message == "Snapshot corrupted"
        # Identity should still be preserved
        assert result.identity_preserved is True

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_network_false_on_failure_with_virtual_network(self, mock_get_manager, manager):
        """Test network_reconnected=False on failed restore with virtual network."""
        # Setup running container with virtual network (not fallback)
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            network_fallback=False,  # Using virtual network
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager with failed restore
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.restore_snapshot.return_value = SnapshotResult(
            success=False,
            tag="snap1",
            error_message="Restore failed",
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.success is False
        assert result.network_reconnected is False

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_restore_snapshot_manager_none(self, mock_get_manager, manager):
        """Test restore when snapshot manager is None."""
        # Setup running container
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager returning None
        mock_get_manager.return_value = None

        result = manager.restore_snapshot("running-container", "snap1")

        assert result.success is False
        assert result.identity_preserved is False
        assert result.error_message == "Could not get snapshot manager for container"
        assert result.pre_restore_state == ContainerState.RUNNING


# Snapshot Storage Integration Tests

class TestSnapshotStorageIntegration:
    """Tests for SnapshotStorage integration with MultiBootManager."""

    def test_manager_has_snapshot_storage(self, manager):
        """Test that manager has a snapshot_storage property."""
        from systems.pixel_compiler.boot.snapshot_storage import SnapshotStorage
        assert hasattr(manager, 'snapshot_storage')
        assert isinstance(manager.snapshot_storage, SnapshotStorage)

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_create_snapshot_persists_metadata(self, mock_get_manager, manager, tmp_path):
        """Test that create_snapshot persists metadata to storage."""
        from systems.pixel_compiler.boot.snapshot_storage import SnapshotStorage

        # Use tmp_path for isolated storage
        manager._snapshot_storage = SnapshotStorage(snapshot_dir=tmp_path / "snapshots")

        # Setup running container
        info = ContainerInfo(
            name="test-container",
            path=Path("/fake/test.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="test-container",
            ),
        )
        manager._containers["test-container"] = info

        # Mock snapshot manager with successful snapshot creation
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.create_snapshot.return_value = SnapshotResult(
            success=True,
            tag="snap1",
            metadata=SnapshotInfo(
                id=1,
                tag="snap1",
                date="2024-01-15T10:00:00",
                size="1.5 GB",
                vm_clock="00:05:30"
            )
        )
        mock_get_manager.return_value = mock_snapshot_manager

        result = manager.create_snapshot("test-container", "snap1", "test snapshot")

        assert result.success is True

        # Verify metadata was persisted
        stored = manager.snapshot_storage.get_metadata("test-container", "snap1")
        assert stored is not None
        assert stored.tag == "snap1"
        assert stored.container_name == "test-container"

    def test_list_snapshots_returns_stored_when_vm_stopped(self, manager, tmp_path):
        """Test list_container_snapshots returns stored metadata when VM is stopped."""
        from systems.pixel_compiler.boot.snapshot_storage import SnapshotMetadata, SnapshotStorage

        # Use tmp_path for isolated storage
        manager._snapshot_storage = SnapshotStorage(snapshot_dir=tmp_path / "snapshots")

        # Setup stopped container
        info = ContainerInfo(
            name="stopped-container",
            path=Path("/fake/stopped.rts.png"),
            state=ContainerState.STOPPED,
        )
        manager._containers["stopped-container"] = info

        # Pre-populate storage with snapshot metadata
        metadata = SnapshotMetadata(
            tag="saved-snap",
            container_name="stopped-container",
            created_at="2024-01-15T10:00:00",
            size="2.0 GB",
            description="Saved while running"
        )
        manager.snapshot_storage.save_metadata("stopped-container", metadata)

        # List snapshots should return stored data
        snapshots = manager.list_container_snapshots("stopped-container")

        assert len(snapshots) == 1
        assert snapshots[0].tag == "saved-snap"
        assert snapshots[0].size == "2.0 GB"

    def test_delete_snapshot_clears_metadata(self, manager, tmp_path):
        """Test delete_snapshot clears metadata from storage."""
        from systems.pixel_compiler.boot.snapshot_storage import SnapshotMetadata, SnapshotStorage

        # Use tmp_path for isolated storage
        manager._snapshot_storage = SnapshotStorage(snapshot_dir=tmp_path / "snapshots")

        # Setup stopped container (no VM to delete from)
        info = ContainerInfo(
            name="stopped-container",
            path=Path("/fake/stopped.rts.png"),
            state=ContainerState.STOPPED,
            snapshots=[]  # Will be populated from storage
        )
        manager._containers["stopped-container"] = info

        # Pre-populate storage with snapshot metadata
        metadata = SnapshotMetadata(
            tag="to-delete",
            container_name="stopped-container",
            created_at="2024-01-15T10:00:00",
            size="1.0 GB"
        )
        manager.snapshot_storage.save_metadata("stopped-container", metadata)

        # Delete the snapshot
        result = manager.delete_snapshot("stopped-container", "to-delete")

        assert result.success is True

        # Verify metadata was cleared from storage
        stored = manager.snapshot_storage.get_metadata("stopped-container", "to-delete")
        assert stored is None

    @patch.object(MultiBootManager, '_get_snapshot_manager')
    def test_list_snapshots_updates_storage_when_vm_running(self, mock_get_manager, manager, tmp_path):
        """Test list_container_snapshots updates storage when VM is running."""
        from systems.pixel_compiler.boot.snapshot_storage import SnapshotStorage

        # Use tmp_path for isolated storage
        manager._snapshot_storage = SnapshotStorage(snapshot_dir=tmp_path / "snapshots")

        # Setup running container
        info = ContainerInfo(
            name="running-container",
            path=Path("/fake/running.rts.png"),
            state=ContainerState.RUNNING,
            resources=AllocatedResources(
                vnc_port=5900,
                container_id="test-id",
                serial_socket=Path("/tmp/serial.sock"),
                monitor_socket=Path("/tmp/monitor.sock"),
                container_name="running-container",
            ),
        )
        manager._containers["running-container"] = info

        # Mock snapshot manager with live snapshots
        mock_snapshot_manager = Mock()
        mock_snapshot_manager.list_snapshots.return_value = [
            SnapshotInfo(id=1, tag="live-snap", date="2024-01-15T12:00:00", size="1.5 GB", vm_clock="00:10:00")
        ]
        mock_get_manager.return_value = mock_snapshot_manager

        # List snapshots
        snapshots = manager.list_container_snapshots("running-container")

        assert len(snapshots) == 1
        assert snapshots[0].tag == "live-snap"

        # Verify storage was updated with live data
        stored = manager.snapshot_storage.get_metadata("running-container", "live-snap")
        assert stored is not None
        assert stored.tag == "live-snap"


# ========================================
# Ephemeral Multi-Boot Tests
# ========================================

class TestEphemeralMultiBoot:
    """Tests for ephemeral multi-boot functionality."""

    def test_boot_all_ephemeral_parameter(self, manager):
        """Test boot_all accepts ephemeral parameter."""
        import inspect
        sig = inspect.signature(manager.boot_all)
        params = list(sig.parameters.keys())
        assert 'ephemeral' in params, f'ephemeral not in {params}'
        # Check default is False
        assert sig.parameters['ephemeral'].default is False

    @patch('systems.pixel_compiler.boot.multi_boot_manager.EphemeralBooter')
    def test_boot_all_ephemeral_creates_ephemeral_booter(self, mock_ephemeral_class, manager):
        """Test EphemeralBooter is used when ephemeral=True."""
        # Mock EphemeralBooter
        mock_booter = Mock()
        mock_booter.boot.return_value = BootResult(
            success=True,
            vnc_port=5900,
            pid=12345,
        )
        mock_ephemeral_class.return_value = mock_booter

        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            ephemeral=True,
        )

        # Verify EphemeralBooter was created
        assert mock_ephemeral_class.called
        assert result.success is True

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_non_ephemeral_uses_boot_bridge(self, mock_bridge_class, manager):
        """Test BootBridge is used when ephemeral=False (default)."""
        mock_bridge = Mock()
        mock_bridge.boot.return_value = BootResult(
            success=True,
            vnc_port=5900,
            pid=12345,
        )
        mock_bridge_class.return_value = mock_bridge

        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            ephemeral=False,
        )

        # Verify BootBridge was created
        assert mock_bridge_class.called
        assert result.success is True

    @patch('systems.pixel_compiler.boot.multi_boot_manager.EphemeralBooter')
    def test_boot_all_ephemeral_container_info_tracking(self, mock_ephemeral_class, manager):
        """Test ContainerInfo.is_ephemeral is set correctly for ephemeral containers."""
        mock_booter = Mock()
        mock_booter.boot.return_value = BootResult(
            success=True,
            vnc_port=5900,
            pid=12345,
        )
        mock_ephemeral_class.return_value = mock_booter

        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            ephemeral=True,
        )

        assert result.success is True
        assert len(result.containers) == 2

        # All containers should have is_ephemeral=True
        for container in result.containers:
            assert container.is_ephemeral is True, \
                f"Container {container.name} should have is_ephemeral=True"

    @patch('systems.pixel_compiler.boot.multi_boot_manager.BootBridge')
    def test_boot_all_non_ephemeral_container_info_tracking(self, mock_bridge_class, manager):
        """Test ContainerInfo.is_ephemeral is False for non-ephemeral containers."""
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
            ephemeral=False,
        )

        assert result.success is True
        assert len(result.containers) == 2

        # All containers should have is_ephemeral=False
        for container in result.containers:
            assert container.is_ephemeral is False, \
                f"Container {container.name} should have is_ephemeral=False"

    @patch('systems.pixel_compiler.boot.multi_boot_manager.EphemeralBooter')
    def test_boot_all_ephemeral_with_primary(self, mock_ephemeral_class, manager):
        """Test ephemeral boot works with primary parameter."""
        def create_mock_booter(*args, **kwargs):
            mock = Mock()
            vnc_display = kwargs.get('vnc_display', 0)
            mock.boot.return_value = BootResult(
                success=True,
                vnc_port=5900 + vnc_display,
                pid=1000 + vnc_display,
            )
            return mock

        mock_ephemeral_class.side_effect = create_mock_booter

        result = manager.boot_all(
            ["/fake/alpine.rts.png", "/fake/ubuntu.rts.png"],
            primary="alpine.rts",
            ephemeral=True,
        )

        assert result.success is True
        assert len(result.containers) == 2

        # All should be ephemeral
        for container in result.containers:
            assert container.is_ephemeral is True

        # Primary should have PRIMARY role
        alpine = next(c for c in result.containers if c.name == "alpine.rts")
        assert alpine.role == ContainerRole.PRIMARY

    @patch('systems.pixel_compiler.boot.multi_boot_manager.EphemeralBooter')
    def test_boot_all_ephemeral_to_dict_includes_flag(self, mock_ephemeral_class, manager):
        """Test ContainerInfo.to_dict() includes is_ephemeral for ephemeral containers."""
        mock_booter = Mock()
        mock_booter.boot.return_value = BootResult(
            success=True,
            vnc_port=5900,
            pid=12345,
        )
        mock_ephemeral_class.return_value = mock_booter

        result = manager.boot_all(
            ["/fake/alpine.rts.png"],
            ephemeral=True,
        )

        assert result.success is True
        container_dict = result.containers[0].to_dict()
        assert 'is_ephemeral' in container_dict
        assert container_dict['is_ephemeral'] is True


