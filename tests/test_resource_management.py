#!/usr/bin/env python3
"""
Resource Management Verification Tests

These tests verify that resources are properly managed during extended operation.
Run with: pytest tests/test_resource_management.py -v
"""

import gc
import os
import sys
import tempfile
import threading
import time
from pathlib import Path

import pytest

# Add project root to path
project_root = Path(__file__).parent.parent
sys.path.insert(0, str(project_root))


class TestMemoryManagement:
    """Test memory management patterns."""

    def test_no_memory_leak_in_loop(self):
        """Verify no memory leak in repeated operations."""
        import tracemalloc

        tracemalloc.start()
        
        # Take baseline snapshot
        baseline = tracemalloc.take_snapshot()
        
        # Perform repeated operations
        for _ in range(100):
            # Simulate typical operations
            data = [i for i in range(1000)]
            _ = sum(data)
            del data
        
        # Force garbage collection
        gc.collect()
        
        # Take final snapshot
        final = tracemalloc.take_snapshot()
        
        # Calculate memory growth
        baseline_size = sum(stat.size for stat in baseline.statistics('lineno'))
        final_size = sum(stat.size for stat in final.statistics('lineno'))
        growth_mb = (final_size - baseline_size) / 1024 / 1024
        
        tracemalloc.stop()
        
        # Allow small growth due to caching, but not large leaks
        assert growth_mb < 5.0, f"Memory grew by {growth_mb:.2f} MB in loop"

    def test_large_object_cleanup(self):
        """Verify large objects are properly cleaned up."""
        import tracemalloc

        tracemalloc.start()
        
        initial_mem = tracemalloc.get_traced_memory()[0]
        
        # Create and delete large objects
        for _ in range(10):
            large_list = [0] * 1_000_000  # ~8 MB
            del large_list
        
        gc.collect()
        
        final_mem = tracemalloc.get_traced_memory()[0]
        growth = (final_mem - initial_mem) / 1024 / 1024
        
        tracemalloc.stop()
        
        # Should not have grown significantly
        assert growth < 1.0, f"Memory grew by {growth:.2f} MB after cleanup"


class TestFileHandling:
    """Test file handling patterns."""

    def test_context_manager_cleanup(self):
        """Verify files are closed with context managers."""
        # Get initial file descriptor count
        initial_fds = len(os.listdir('/proc/self/fd'))
        
        # Open and close files properly
        for _ in range(100):
            with tempfile.NamedTemporaryFile(mode='w', delete=False) as f:
                f.write("test")
                temp_path = f.name
            
            with open(temp_path) as f:
                _ = f.read()
            
            os.unlink(temp_path)
        
        final_fds = len(os.listdir('/proc/self/fd'))
        leaked = final_fds - initial_fds
        
        # Allow for small variation, but not significant leaks
        assert leaked < 5, f"Leaked {leaked} file descriptors"

    def test_temporary_file_cleanup(self):
        """Verify temporary files are cleaned up."""
        with tempfile.TemporaryDirectory() as tmpdir:
            tmp_path = Path(tmpdir)
            
            # Create files
            for i in range(10):
                (tmp_path / f"file_{i}.txt").write_text(f"content {i}")
            
            # Verify they exist
            assert len(list(tmp_path.iterdir())) == 10
        
        # Directory should be cleaned up
        assert not tmp_path.exists()


class TestThreadManagement:
    """Test thread management patterns."""

    def test_thread_cleanup(self):
        """Verify threads are properly cleaned up."""
        initial_threads = threading.active_count()
        
        # Create and join threads
        threads = []
        for _ in range(10):
            t = threading.Thread(target=lambda: time.sleep(0.01))
            t.start()
            threads.append(t)
        
        for t in threads:
            t.join(timeout=1.0)
        
        final_threads = threading.active_count()
        
        assert final_threads == initial_threads, \
            f"Thread count changed from {initial_threads} to {final_threads}"

    def test_thread_pool_shutdown(self):
        """Verify ThreadPoolExecutor shuts down properly."""
        from concurrent.futures import ThreadPoolExecutor

        initial_threads = threading.active_count()
        
        executor = ThreadPoolExecutor(max_workers=4)
        
        # Submit tasks
        futures = [executor.submit(lambda: time.sleep(0.01)) for _ in range(10)]
        
        # Wait for completion
        for f in futures:
            f.result(timeout=1.0)
        
        # Shutdown
        executor.shutdown(wait=True)
        
        # Small delay for cleanup
        time.sleep(0.1)
        
        final_threads = threading.active_count()
        
        # Thread count should return to initial
        assert final_threads <= initial_threads + 1, \
            f"Thread count: {initial_threads} -> {final_threads}"


class TestDatabaseResources:
    """Test database resource handling."""

    @pytest.mark.skipif(
        not os.environ.get('TEST_DATABASE_URL'),
        reason="No test database configured"
    )
    def test_connection_cleanup(self):
        """Verify database connections are cleaned up."""
        import psycopg2

        db_url = os.environ.get('TEST_DATABASE_URL')
        
        # Get initial connection count (if possible)
        initial_count = self._get_connection_count(db_url)
        
        # Open and close connections
        for _ in range(10):
            conn = psycopg2.connect(db_url)
            cur = conn.cursor()
            cur.execute("SELECT 1")
            cur.close()
            conn.close()
        
        final_count = self._get_connection_count(db_url)
        
        assert final_count <= initial_count + 1, \
            f"Connection leak: {initial_count} -> {final_count}"

    def _get_connection_count(self, db_url: str) -> int:
        """Get current connection count."""
        try:
            import psycopg2
            conn = psycopg2.connect(db_url)
            cur = conn.cursor()
            cur.execute("SELECT count(*) FROM pg_stat_activity")
            count = cur.fetchone()[0]
            cur.close()
            conn.close()
            return count
        except Exception:
            return 0


class TestNetworkResources:
    """Test network resource handling."""

    def test_socket_cleanup(self):
        """Verify sockets are properly closed."""
        import socket

        # Get initial file descriptor count
        initial_fds = len(os.listdir('/proc/self/fd'))
        
        # Create and close sockets
        for _ in range(10):
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(0.1)
            try:
                sock.connect(('localhost', 1))  # Will fail, but that's ok
            except Exception:
                pass
            sock.close()
        
        final_fds = len(os.listdir('/proc/self/fd'))
        leaked = final_fds - initial_fds
        
        assert leaked < 2, f"Leaked {leaked} file descriptors (sockets)"

    @pytest.mark.asyncio
    async def test_http_session_cleanup(self):
        """Verify HTTP sessions are properly closed."""
        pytest.importorskip("aiohttp")
        import aiohttp

        initial_fds = len(os.listdir('/proc/self/fd'))
        
        # Create and close sessions
        for _ in range(5):
            async with aiohttp.ClientSession() as session:
                async with session.get('http://httpbin.org/get') as resp:
                    pass
        
        final_fds = len(os.listdir('/proc/self/fd'))
        leaked = final_fds - initial_fds
        
        assert leaked < 2, f"Leaked {leaked} file descriptors (HTTP)"


class TestResourceTracking:
    """Test resource tracking utilities."""

    def test_resource_snapshot(self):
        """Test resource snapshot creation."""
        # Import from our resource monitor
        sys.path.insert(0, str(project_root / "scripts"))
        from resource_monitor import ResourceMonitor

        monitor = ResourceMonitor()
        snapshot = monitor._get_snapshot()
        
        assert snapshot.memory_rss_mb > 0
        assert snapshot.thread_count >= 1
        assert snapshot.timestamp > 0

    def test_resource_report_analysis(self):
        """Test resource report analysis."""
        sys.path.insert(0, str(project_root / "scripts"))
        from resource_monitor import ResourceReport, ResourceSnapshot

        report = ResourceReport()
        
        # Add snapshots simulating memory growth
        for i in range(10):
            snapshot = ResourceSnapshot(
                timestamp=i * 5.0,
                memory_rss_mb=100.0 + i * 50.0,  # Growing memory
                memory_vms_mb=200.0 + i * 50.0,
                open_files=10,
                thread_count=4,
                cpu_percent=10.0,
            )
            report.add_snapshot(snapshot)
        
        report.duration_seconds = 45.0
        
        analysis = report.analyze()
        
        # Should detect potential memory leak
        assert len(analysis['potential_leaks']) > 0
        assert any(leak['type'] == 'memory' for leak in analysis['potential_leaks'])


class TestGPUMemoryTracking:
    """Test GPU memory tracking (if available)."""

    @pytest.mark.skipif(
        not os.environ.get('NVIDIA_VISIBLE_DEVICES'),
        reason="No GPU available"
    )
    def test_gpu_memory_tracking(self):
        """Test GPU memory can be tracked."""
        sys.path.insert(0, str(project_root / "scripts"))
        from resource_monitor import ResourceMonitor

        monitor = ResourceMonitor()
        gpu_memory = monitor._get_gpu_memory()
        
        # Should return some value if GPU is available
        assert gpu_memory >= 0


# Integration tests

class TestExtendedOperation:
    """Test resources during extended operation."""

    @pytest.mark.slow
    def test_extended_monitoring(self):
        """Monitor resources over extended period."""
        sys.path.insert(0, str(project_root / "scripts"))
        from resource_monitor import ResourceMonitor

        monitor = ResourceMonitor()
        report = monitor.monitor_for(duration=30.0, interval=2.0)
        
        analysis = report.analyze()
        
        # Memory should not grow significantly
        assert analysis['memory']['growth_rate_mb_per_min'] < 50.0, \
            f"Memory growing at {analysis['memory']['growth_rate_mb_per_min']:.2f} MB/min"
        
        # Should not detect leaks
        assert analysis['status'] == 'PASS', \
            f"Status: {analysis['status']}, Leaks: {analysis['potential_leaks']}"


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
