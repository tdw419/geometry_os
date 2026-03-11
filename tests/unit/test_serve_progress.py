"""
Unit tests for Serve Progress Display

Tests the ServeProgress and ClientTracker classes.
"""

from unittest.mock import patch

from systems.pixel_compiler.serve.progress import (
    BootStage,
    ClientInfo,
    ClientTracker,
    ServeProgress,
    get_stage_from_name,
)


class TestProgressImport:
    """Test progress classes can be imported."""

    def test_progress_import(self):
        """Verify ServeProgress imports correctly."""
        from systems.pixel_compiler.serve.progress import ServeProgress
        assert ServeProgress is not None

    def test_client_tracker_import(self):
        """Verify ClientTracker imports correctly."""
        from systems.pixel_compiler.serve.progress import ClientTracker
        assert ClientTracker is not None

    def test_client_info_import(self):
        """Verify ClientInfo imports correctly."""
        from systems.pixel_compiler.serve.progress import ClientInfo
        assert ClientInfo is not None

    def test_boot_stage_import(self):
        """Verify BootStage imports correctly."""
        from systems.pixel_compiler.serve.progress import BootStage
        assert BootStage is not None


class TestClientTracker:
    """Test ClientTracker functionality."""

    def setup_method(self):
        """Set up test fixtures."""
        self.tracker = ClientTracker()

    def test_client_tracker_add(self):
        """Test adding a client to tracker."""
        client = self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")

        assert client is not None
        assert client.ip == "192.168.1.50"
        assert client.mac == "aa:bb:cc:dd:ee:ff"
        assert client.stage == BootStage.DHCP
        assert client.progress == 0

    def test_client_tracker_update(self):
        """Test updating client stage."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")

        updated = self.tracker.update_stage(
            "192.168.1.50",
            BootStage.TFTP,
            progress=50,
            bytes_transferred=1024
        )

        assert updated is not None
        assert updated.stage == BootStage.TFTP
        assert updated.progress == 50
        assert updated.bytes_transferred == 1024

    def test_client_tracker_update_unknown(self):
        """Test updating unknown client returns None."""
        result = self.tracker.update_stage("192.168.1.99", BootStage.TFTP)
        assert result is None

    def test_client_tracker_stages(self):
        """Test all boot stages are handled."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")

        stages = [
            (BootStage.DHCP, 10),
            (BootStage.TFTP, 30),
            (BootStage.NBD, 60),
            (BootStage.KERNEL, 90),
            (BootStage.COMPLETE, 100),
        ]

        for stage, progress in stages:
            result = self.tracker.update_stage("192.168.1.50", stage, progress)
            assert result.stage == stage
            assert result.progress == progress

    def test_client_tracker_get(self):
        """Test getting client by IP."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")

        client = self.tracker.get("192.168.1.50")
        assert client is not None
        assert client.ip == "192.168.1.50"

    def test_client_tracker_get_unknown(self):
        """Test getting unknown client returns None."""
        client = self.tracker.get("192.168.1.99")
        assert client is None

    def test_client_tracker_remove(self):
        """Test removing a client."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")

        removed = self.tracker.remove("192.168.1.50")
        assert removed is not None

        # Should no longer exist
        assert self.tracker.get("192.168.1.50") is None

    def test_client_tracker_get_all(self):
        """Test getting all clients."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")
        self.tracker.add("192.168.1.51", "aa:bb:cc:dd:ee:00")

        clients = self.tracker.get_all()
        assert len(clients) == 2

    def test_client_tracker_get_stats(self):
        """Test getting statistics."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")
        self.tracker.update_stage("192.168.1.50", BootStage.COMPLETE, 100, bytes_transferred=1000)

        self.tracker.add("192.168.1.51", "aa:bb:cc:dd:ee:00")
        self.tracker.update_stage("192.168.1.51", BootStage.FAILED, 50)

        stats = self.tracker.get_stats()

        assert stats['total_clients'] == 2
        assert stats['completed'] == 1
        assert stats['failed'] == 1
        assert stats['total_bytes'] == 1000

    def test_client_tracker_set_error(self):
        """Test setting client error."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")

        result = self.tracker.set_error("192.168.1.50", "Connection timeout")

        assert result is not None
        assert result.error == "Connection timeout"
        assert result.stage == BootStage.FAILED

    def test_client_tracker_history(self):
        """Test completed clients move to history."""
        self.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")
        self.tracker.update_stage("192.168.1.50", BootStage.COMPLETE, 100)

        # Should be in history, not active
        assert self.tracker.get("192.168.1.50") is None
        history = self.tracker.get_history()
        assert len(history) == 1
        assert history[0].ip == "192.168.1.50"


class TestClientInfo:
    """Test ClientInfo dataclass."""

    def test_client_info_defaults(self):
        """Test ClientInfo default values."""
        client = ClientInfo(ip="192.168.1.50", mac="aa:bb:cc:dd:ee:ff")

        assert client.ip == "192.168.1.50"
        assert client.mac == "aa:bb:cc:dd:ee:ff"
        assert client.stage == BootStage.DHCP
        assert client.progress == 0
        assert client.bytes_transferred == 0
        assert client.error is None

    def test_client_info_status_active(self):
        """Test ClientInfo status for active boot."""
        client = ClientInfo(ip="192.168.1.50", mac="aa:bb:cc:dd:ee:ff")
        client.stage = BootStage.TFTP
        client.progress = 50

        assert "TFTP" in client.status
        assert "50%" in client.status

    def test_client_info_status_complete(self):
        """Test ClientInfo status for complete boot."""
        client = ClientInfo(ip="192.168.1.50", mac="aa:bb:cc:dd:ee:ff")
        client.stage = BootStage.COMPLETE

        assert "complete" in client.status.lower()

    def test_client_info_status_failed(self):
        """Test ClientInfo status for failed boot."""
        client = ClientInfo(ip="192.168.1.50", mac="aa:bb:cc:dd:ee:ff")
        client.stage = BootStage.FAILED
        client.error = "Timeout"

        assert "Error" in client.status
        assert "Timeout" in client.status


class TestBootStage:
    """Test BootStage enum."""

    def test_boot_stage_values(self):
        """Test BootStage enum values."""
        assert BootStage.DHCP.value == "DHCP"
        assert BootStage.TFTP.value == "TFTP"
        assert BootStage.NBD.value == "NBD"
        assert BootStage.KERNEL.value == "KERNEL"
        assert BootStage.COMPLETE.value == "COMPLETE"
        assert BootStage.FAILED.value == "FAILED"

    def test_get_stage_from_name(self):
        """Test stage name conversion."""
        assert get_stage_from_name("dhcp") == BootStage.DHCP
        assert get_stage_from_name("TFTP") == BootStage.TFTP
        assert get_stage_from_name("Nbd") == BootStage.NBD
        assert get_stage_from_name("kernel") == BootStage.KERNEL
        assert get_stage_from_name("complete") == BootStage.COMPLETE
        assert get_stage_from_name("failed") == BootStage.FAILED

    def test_get_stage_from_name_unknown(self):
        """Test unknown stage name defaults to DHCP."""
        assert get_stage_from_name("unknown") == BootStage.DHCP


class TestServeProgress:
    """Test ServeProgress class."""

    def test_serve_progress_init(self):
        """Test ServeProgress initialization."""
        progress = ServeProgress()
        assert progress.verbose is False
        assert progress.tracker is not None

    def test_serve_progress_init_verbose(self):
        """Test ServeProgress initialization with verbose."""
        progress = ServeProgress(verbose=True)
        assert progress.verbose is True

    def test_progress_display(self):
        """Test Rich display initializes."""
        progress = ServeProgress()
        # Should not raise even without Rich
        progress.start_display()
        progress.stop_display()

    def test_progress_update_config(self):
        """Test updating server config."""
        progress = ServeProgress()
        progress.start_display()

        progress.update_config("eth0", "192.168.1.100", [4011, 69, 10809])

        assert progress._interface == "eth0"
        assert progress._ip_address == "192.168.1.100"
        assert progress._ports == [4011, 69, 10809]

        progress.stop_display()

    def test_progress_add_client(self):
        """Test adding client to progress display."""
        progress = ServeProgress()
        progress.start_display()

        progress.add_client("192.168.1.50", "aa:bb:cc:dd:ee:ff")

        client = progress.tracker.get("192.168.1.50")
        assert client is not None

        progress.stop_display()

    def test_progress_update_client_stage(self):
        """Test updating client stage."""
        progress = ServeProgress()
        progress.start_display()

        progress.add_client("192.168.1.50", "aa:bb:cc:dd:ee:ff")
        progress.update_client_stage("192.168.1.50", "TFTP", progress=50)

        client = progress.tracker.get("192.168.1.50")
        assert client is not None
        assert client.stage == BootStage.TFTP
        assert client.progress == 50

        progress.stop_display()

    def test_progress_remove_client(self):
        """Test removing client from display."""
        progress = ServeProgress()
        progress.start_display()

        progress.add_client("192.168.1.50", "aa:bb:cc:dd:ee:ff")
        progress.remove_client("192.168.1.50")

        client = progress.tracker.get("192.168.1.50")
        assert client is None

        progress.stop_display()

    def test_progress_log_message(self):
        """Test logging messages."""
        progress = ServeProgress()

        progress.log_message("Test message", "info")

        assert len(progress._logs) == 1
        assert "Test message" in progress._logs[0]
        assert "INFO" in progress._logs[0]

    def test_progress_format_bytes(self):
        """Test byte formatting."""
        progress = ServeProgress()

        assert progress._format_bytes(500) == "500.0B"
        assert progress._format_bytes(1024) == "1.0KB"
        assert progress._format_bytes(1024 * 1024) == "1.0MB"
        assert progress._format_bytes(1024 * 1024 * 1024) == "1.0GB"

    def test_progress_make_progress_bar(self):
        """Test progress bar generation."""
        progress = ServeProgress()

        bar_0 = progress._make_progress_bar(0)
        bar_50 = progress._make_progress_bar(50)
        bar_100 = progress._make_progress_bar(100)

        assert "=" not in bar_0 or bar_0.count("=") == 0
        assert bar_50.count("=") == 5  # 50% of 10
        assert bar_100.count("=") == 10  # 100% of 10


class TestServeProgressWithoutRich:
    """Test ServeProgress when Rich is not available."""

    def test_init_without_rich(self):
        """Test initialization when Rich is not installed."""
        with patch('systems.pixel_compiler.serve.progress.HAS_RICH', False):
            progress = ServeProgress()
            progress.start_display()  # Should not raise
            progress.stop_display()

    def test_print_summary_without_rich(self):
        """Test print_summary without Rich."""
        with patch('systems.pixel_compiler.serve.progress.HAS_RICH', False):
            progress = ServeProgress()
            progress.tracker.add("192.168.1.50", "aa:bb:cc:dd:ee:ff")
            progress.tracker.update_stage("192.168.1.50", BootStage.COMPLETE, 100, 1000)

            # Should not raise
            progress.print_summary()
