#!/usr/bin/env python3
"""
Visual Shell Tuning Parameters - Phase 65

Centralized configuration and adaptive tuning for visual shell responsiveness.

This module provides:
1. Static tuning parameters for performance optimization
2. Adaptive tuning that adjusts based on system load
3. Performance monitoring and metrics collection
4. Real-time adjustment of responsiveness parameters

Key Areas:
- Frame timing and rendering intervals
- Event processing and queue management
- Buffer synchronization frequencies
- Memory and resource limits
- Timeout and retry configurations

Usage:
    from systems.visual_shell.tuning_parameters import (
        TuningConfig,
        AdaptiveTuner,
        PerformanceMonitor,
        get_tuning_config,
        set_tuning_config,
    )

    # Get configuration
    config = get_tuning_config()

    # Access parameters
    frame_time = config.rendering.target_frame_time_ms
    sync_interval = config.gnb.sync_interval_seconds

    # Enable adaptive tuning
    tuner = AdaptiveTuner(config)
    await tuner.start()

    # Monitor performance
    monitor = PerformanceMonitor()
    monitor.record_frame_time(16.2)
    stats = monitor.get_stats()
"""

import asyncio
import json
import logging
import os
import statistics
import time
from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Any, Callable

logger = logging.getLogger("TuningParameters")


# ============================================================================
# Tuning Parameter Data Classes
# ============================================================================


class PerformanceMode(Enum):
    """Performance mode presets."""
    POWER_SAVE = "power_save"      # Lower power, reduced responsiveness
    BALANCED = "balanced"          # Default balanced mode
    PERFORMANCE = "performance"    # Maximum responsiveness
    ADAPTIVE = "adaptive"          # Auto-adjust based on load


@dataclass
class RenderingTuning:
    """Rendering performance parameters."""
    # Frame timing
    target_fps: int = 60
    target_frame_time_ms: float = 16.67  # 1000 / 60
    max_frame_time_ms: float = 33.33     # 2x target (dropped frame threshold)
    min_frame_time_ms: float = 8.33      # Minimum cap (120fps equivalent)

    # Adaptive frame skipping
    enable_frame_skipping: bool = True
    max_consecutive_skips: int = 3
    frame_skip_threshold_ms: float = 25.0  # Skip frame if previous was this slow

    # Rendering quality vs performance
    dynamic_quality: bool = True
    quality_floor: float = 0.5  # Minimum quality scale (0.0-1.0)
    quality_ceiling: float = 1.0

    # Batch rendering
    max_glyphs_per_frame: int = 10000
    max_particles_per_frame: int = 100000
    batch_size: int = 256

    # Dirty region optimization
    enable_dirty_regions: bool = True
    dirty_region_merge_threshold: int = 4
    full_redraw_interval_frames: int = 60

    def get_target_frame_time_for_mode(self, mode: PerformanceMode) -> float:
        """Get target frame time adjusted for performance mode."""
        if mode == PerformanceMode.POWER_SAVE:
            return self.target_frame_time_ms * 2.0  # 30fps
        elif mode == PerformanceMode.PERFORMANCE:
            return self.target_frame_time_ms * 0.5  # 120fps attempt
        return self.target_frame_time_ms


@dataclass
class EventProcessingTuning:
    """Event processing and distribution parameters."""
    # Event queue sizing
    max_event_queue_size: int = 1000
    event_batch_size: int = 50
    event_processing_timeout_ms: float = 5.0

    # Event priorities
    high_priority_event_types: list[str] = field(default_factory=lambda: [
        "user_action", "alert", "health_check", "migration_failed"
    ])

    # Event distribution
    max_subscribers_per_event: int = 100
    subscriber_queue_size: int = 500
    event_delivery_timeout_ms: float = 100.0

    # Backpressure
    enable_backpressure: bool = True
    backpressure_threshold: float = 0.8  # 80% queue full
    backpressure_cooldown_ms: float = 100.0

    # Event batching for performance
    batch_similar_events: bool = True
    event_batch_window_ms: float = 10.0
    max_events_per_batch: int = 20


@dataclass
class GNBTuning:
    """Geometric Native Browser tuning parameters."""
    # State synchronization
    sync_interval_seconds: float = 0.5
    min_sync_interval_seconds: float = 0.1
    max_sync_interval_seconds: float = 2.0

    # Adaptive sync based on activity
    adaptive_sync: bool = True
    idle_sync_multiplier: float = 4.0  # Slower sync when idle
    activity_threshold: float = 0.1  # Consider idle below this activity level

    # State buffer management
    state_buffer_size_kb: int = 64
    max_state_history: int = 10
    state_compression: bool = True

    # Scene graph updates
    scene_update_batch_ms: float = 16.0
    max_scene_updates_per_batch: int = 100
    deferred_update_threshold: int = 50

    # File watching
    file_watch_poll_interval_ms: float = 100.0
    file_watch_debounce_ms: float = 50.0


@dataclass
class AutonomousLoopTuning:
    """Autonomous loop tuning parameters."""
    # Loop timing
    cycle_interval_seconds: float = 5.0
    min_cycle_interval_seconds: float = 1.0
    max_cycle_interval_seconds: float = 30.0

    # Adaptive cycle timing
    adaptive_cycle: bool = True
    cycle_speedup_factor: float = 0.5   # Speed up when issues detected
    cycle_slowdown_factor: float = 2.0  # Slow down when stable

    # Action management
    confidence_threshold: float = 0.7
    max_actions_per_cycle: int = 3
    action_timeout_seconds: float = 30.0

    # Metrics collection
    metrics_retention_count: int = 100
    cycle_time_sample_size: int = 20

    # Recovery behavior
    error_backoff_multiplier: float = 2.0
    max_error_backoff_seconds: float = 60.0
    error_recovery_threshold: int = 3  # Errors before backoff


@dataclass
class MemoryTuning:
    """Memory and resource management parameters."""
    # Buffer pools
    max_buffer_pool_size_mb: int = 256
    buffer_pool_growth_factor: float = 1.5
    buffer_shrink_threshold: float = 0.3  # Shrink when 30% utilized

    # Cache management
    max_cache_size_mb: int = 128
    cache_ttl_seconds: float = 300.0
    cache_cleanup_interval_seconds: float = 60.0

    # Garbage collection hints
    gc_threshold_mb: int = 512
    gc_trigger_fraction: float = 0.8
    incremental_gc: bool = True

    # Resource limits
    max_concurrent_operations: int = 100
    max_memory_per_operation_mb: int = 10


@dataclass
class NetworkTuning:
    """Network and I/O tuning parameters."""
    # Connection management
    connection_timeout_seconds: float = 30.0
    read_timeout_seconds: float = 10.0
    write_timeout_seconds: float = 10.0

    # Retry behavior
    max_retries: int = 3
    retry_backoff_base: float = 1.0
    retry_backoff_multiplier: float = 2.0
    retry_jitter: float = 0.1

    # Throughput optimization
    max_concurrent_connections: int = 50
    connection_pool_size: int = 10
    keep_alive_timeout_seconds: float = 60.0

    # Buffer sizes
    read_buffer_size_kb: int = 64
    write_buffer_size_kb: int = 64
    max_message_size_mb: int = 10


@dataclass
class MonitoringTuning:
    """Performance monitoring parameters."""
    # Metrics collection
    metrics_interval_seconds: float = 1.0
    metrics_history_size: int = 3600  # 1 hour at 1s intervals

    # Alerting thresholds
    frame_time_alert_threshold_ms: float = 20.0
    queue_depth_alert_threshold: float = 0.9
    memory_usage_alert_threshold: float = 0.85
    error_rate_alert_threshold: float = 0.05

    # Sampling
    sample_rate: float = 1.0  # Sample every N events
    detailed_sampling_rate: float = 0.1  # Detailed sampling for 10% of events

    # Reporting
    stats_report_interval_seconds: float = 60.0
    export_metrics: bool = True
    metrics_export_path: str = ".geometry/metrics"


@dataclass
class TuningConfig:
    """
    Complete tuning configuration for the visual shell.

    This class aggregates all tuning parameters and provides
    methods for loading, saving, and adjusting configuration.
    """
    # Mode selection
    performance_mode: PerformanceMode = PerformanceMode.BALANCED

    # Component-specific tuning
    rendering: RenderingTuning = field(default_factory=RenderingTuning)
    events: EventProcessingTuning = field(default_factory=EventProcessingTuning)
    gnb: GNBTuning = field(default_factory=GNBTuning)
    autonomous_loop: AutonomousLoopTuning = field(default_factory=AutonomousLoopTuning)
    memory: MemoryTuning = field(default_factory=MemoryTuning)
    network: NetworkTuning = field(default_factory=NetworkTuning)
    monitoring: MonitoringTuning = field(default_factory=MonitoringTuning)

    # Metadata
    config_version: str = "1.0.0"
    last_updated: float = field(default_factory=time.time)

    def to_dict(self) -> dict[str, Any]:
        """Convert configuration to dictionary."""
        return {
            "config_version": self.config_version,
            "performance_mode": self.performance_mode.value,
            "last_updated": self.last_updated,
            "rendering": {
                "target_fps": self.rendering.target_fps,
                "target_frame_time_ms": self.rendering.target_frame_time_ms,
                "max_frame_time_ms": self.rendering.max_frame_time_ms,
                "enable_frame_skipping": self.rendering.enable_frame_skipping,
                "dynamic_quality": self.rendering.dynamic_quality,
                "max_glyphs_per_frame": self.rendering.max_glyphs_per_frame,
            },
            "events": {
                "max_event_queue_size": self.events.max_event_queue_size,
                "event_batch_size": self.events.event_batch_size,
                "enable_backpressure": self.events.enable_backpressure,
            },
            "gnb": {
                "sync_interval_seconds": self.gnb.sync_interval_seconds,
                "adaptive_sync": self.gnb.adaptive_sync,
            },
            "autonomous_loop": {
                "cycle_interval_seconds": self.autonomous_loop.cycle_interval_seconds,
                "confidence_threshold": self.autonomous_loop.confidence_threshold,
                "max_actions_per_cycle": self.autonomous_loop.max_actions_per_cycle,
            },
            "memory": {
                "max_buffer_pool_size_mb": self.memory.max_buffer_pool_size_mb,
                "max_cache_size_mb": self.memory.max_cache_size_mb,
            },
            "network": {
                "connection_timeout_seconds": self.network.connection_timeout_seconds,
                "max_retries": self.network.max_retries,
            },
            "monitoring": {
                "metrics_interval_seconds": self.monitoring.metrics_interval_seconds,
                "frame_time_alert_threshold_ms": self.monitoring.frame_time_alert_threshold_ms,
            },
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "TuningConfig":
        """Create configuration from dictionary."""
        config = cls()

        # Load mode
        if "performance_mode" in data:
            config.performance_mode = PerformanceMode(data["performance_mode"])

        # Load component configs (partial updates supported)
        if "rendering" in data:
            for k, v in data["rendering"].items():
                if hasattr(config.rendering, k):
                    setattr(config.rendering, k, v)

        if "events" in data:
            for k, v in data["events"].items():
                if hasattr(config.events, k):
                    setattr(config.events, k, v)

        if "gnb" in data:
            for k, v in data["gnb"].items():
                if hasattr(config.gnb, k):
                    setattr(config.gnb, k, v)

        if "autonomous_loop" in data:
            for k, v in data["autonomous_loop"].items():
                if hasattr(config.autonomous_loop, k):
                    setattr(config.autonomous_loop, k, v)

        if "memory" in data:
            for k, v in data["memory"].items():
                if hasattr(config.memory, k):
                    setattr(config.memory, k, v)

        if "network" in data:
            for k, v in data["network"].items():
                if hasattr(config.network, k):
                    setattr(config.network, k, v)

        if "monitoring" in data:
            for k, v in data["monitoring"].items():
                if hasattr(config.monitoring, k):
                    setattr(config.monitoring, k, v)

        config.last_updated = time.time()
        return config

    @classmethod
    def from_env(cls) -> "TuningConfig":
        """Load configuration from environment variables."""
        config = cls()

        # Performance mode
        mode_str = os.getenv("GEOMETRY_OS_PERFORMANCE_MODE", "balanced")
        try:
            config.performance_mode = PerformanceMode(mode_str.lower())
        except ValueError:
            config.performance_mode = PerformanceMode.BALANCED

        # Rendering overrides
        if fps := os.getenv("GEOMETRY_OS_TARGET_FPS"):
            config.rendering.target_fps = int(fps)
            config.rendering.target_frame_time_ms = 1000.0 / config.rendering.target_fps

        # GNB overrides
        if sync := os.getenv("GEOMETRY_OS_GNB_SYNC_INTERVAL"):
            config.gnb.sync_interval_seconds = float(sync)

        # Autonomous loop overrides
        if cycle := os.getenv("GEOMETRY_OS_CYCLE_INTERVAL"):
            config.autonomous_loop.cycle_interval_seconds = float(cycle)

        # Memory overrides
        if cache := os.getenv("GEOMETRY_OS_MAX_CACHE_MB"):
            config.memory.max_cache_size_mb = int(cache)

        return config

    def apply_mode_preset(self, mode: PerformanceMode) -> None:
        """Apply preset values for a performance mode."""
        self.performance_mode = mode

        if mode == PerformanceMode.POWER_SAVE:
            # Reduce power consumption
            self.rendering.target_fps = 30
            self.rendering.target_frame_time_ms = 33.33
            self.rendering.dynamic_quality = True
            self.rendering.quality_ceiling = 0.7
            self.gnb.sync_interval_seconds = 1.0
            self.autonomous_loop.cycle_interval_seconds = 10.0
            self.monitoring.metrics_interval_seconds = 5.0

        elif mode == PerformanceMode.PERFORMANCE:
            # Maximum responsiveness
            self.rendering.target_fps = 120
            self.rendering.target_frame_time_ms = 8.33
            self.rendering.dynamic_quality = False
            self.rendering.quality_floor = 0.9
            self.gnb.sync_interval_seconds = 0.1
            self.gnb.adaptive_sync = True
            self.autonomous_loop.cycle_interval_seconds = 2.0
            self.events.event_processing_timeout_ms = 2.0

        elif mode == PerformanceMode.BALANCED:
            # Default balanced settings
            self.rendering.target_fps = 60
            self.rendering.target_frame_time_ms = 16.67
            self.rendering.dynamic_quality = True
            self.rendering.quality_floor = 0.5
            self.gnb.sync_interval_seconds = 0.5
            self.autonomous_loop.cycle_interval_seconds = 5.0

        elif mode == PerformanceMode.ADAPTIVE:
            # Adaptive mode - tuner will adjust dynamically
            self.rendering.dynamic_quality = True
            self.gnb.adaptive_sync = True
            self.autonomous_loop.adaptive_cycle = True

        self.last_updated = time.time()


# ============================================================================
# Performance Monitoring
# ============================================================================


@dataclass
class FrameStats:
    """Statistics for frame rendering."""
    frame_times_ms: list[float] = field(default_factory=list)
    dropped_frames: int = 0
    total_frames: int = 0

    def record(self, frame_time_ms: float, dropped: bool = False):
        """Record a frame time."""
        self.frame_times_ms.append(frame_time_ms)
        self.total_frames += 1
        if dropped:
            self.dropped_frames += 1

        # Keep limited history
        if len(self.frame_times_ms) > 1000:
            self.frame_times_ms = self.frame_times_ms[-1000:]

    def get_percentiles(self) -> dict[str, float]:
        """Get frame time percentiles."""
        if not self.frame_times_ms:
            return {"p50": 0, "p95": 0, "p99": 0}

        sorted_times = sorted(self.frame_times_ms)
        n = len(sorted_times)

        return {
            "p50": sorted_times[int(n * 0.50)],
            "p95": sorted_times[int(n * 0.95)],
            "p99": sorted_times[int(n * 0.99)],
            "min": sorted_times[0],
            "max": sorted_times[-1],
            "avg": statistics.mean(sorted_times),
        }


@dataclass
class QueueStats:
    """Statistics for queue operations."""
    current_depth: int = 0
    max_depth: int = 0
    total_enqueued: int = 0
    total_dequeued: int = 0
    total_dropped: int = 0

    def record_enqueue(self, success: bool):
        """Record an enqueue attempt."""
        if success:
            self.total_enqueued += 1
        else:
            self.total_dropped += 1

    def record_dequeue(self):
        """Record a dequeue."""
        self.total_dequeued += 1

    def update_depth(self, depth: int):
        """Update current queue depth."""
        self.current_depth = depth
        self.max_depth = max(self.max_depth, depth)


class PerformanceMonitor:
    """
    Monitors and records performance metrics.

    Collects metrics on:
    - Frame rendering times
    - Queue depths and operations
    - Memory usage
    - Event processing latency
    """

    def __init__(self, config: TuningConfig | None = None):
        self.config = config or TuningConfig()
        self.frame_stats = FrameStats()
        self.queue_stats: dict[str, QueueStats] = {}
        self._start_time = time.time()
        self._last_report = time.time()

        # Latency tracking
        self._event_latencies: list[float] = []
        self._sync_latencies: list[float] = []

        # Memory tracking
        self._memory_samples: list[float] = []

    def record_frame_time(self, frame_time_ms: float, dropped: bool = False):
        """Record a frame rendering time."""
        self.frame_stats.record(frame_time_ms, dropped)

        # Check for alerts
        if frame_time_ms > self.config.monitoring.frame_time_alert_threshold_ms:
            logger.warning(
                f"Frame time {frame_time_ms:.2f}ms exceeds threshold "
                f"{self.config.monitoring.frame_time_alert_threshold_ms:.2f}ms"
            )

    def record_event_latency(self, latency_ms: float):
        """Record event processing latency."""
        self._event_latencies.append(latency_ms)
        if len(self._event_latencies) > 1000:
            self._event_latencies = self._event_latencies[-1000:]

    def record_sync_latency(self, latency_ms: float):
        """Record state sync latency."""
        self._sync_latencies.append(latency_ms)
        if len(self._sync_latencies) > 1000:
            self._sync_latencies = self._sync_latencies[-1000:]

    def record_queue_depth(self, queue_name: str, depth: int):
        """Record queue depth."""
        if queue_name not in self.queue_stats:
            self.queue_stats[queue_name] = QueueStats()
        self.queue_stats[queue_name].update_depth(depth)

    def record_memory_usage(self, usage_mb: float):
        """Record memory usage."""
        self._memory_samples.append(usage_mb)
        if len(self._memory_samples) > 1000:
            self._memory_samples = self._memory_samples[-1000:]

    def get_stats(self) -> dict[str, Any]:
        """Get comprehensive statistics."""
        now = time.time()
        uptime = now - self._start_time

        stats = {
            "uptime_seconds": uptime,
            "frames": {
                "total": self.frame_stats.total_frames,
                "dropped": self.frame_stats.dropped_frames,
                "drop_rate": (
                    self.frame_stats.dropped_frames / self.frame_stats.total_frames
                    if self.frame_stats.total_frames > 0 else 0.0
                ),
                "percentiles": self.frame_stats.get_percentiles(),
            },
            "queues": {
                name: {
                    "current_depth": qs.current_depth,
                    "max_depth": qs.max_depth,
                    "total_enqueued": qs.total_enqueued,
                    "total_dequeued": qs.total_dequeued,
                    "total_dropped": qs.total_dropped,
                }
                for name, qs in self.queue_stats.items()
            },
            "latency": {
                "event_avg_ms": (
                    statistics.mean(self._event_latencies)
                    if self._event_latencies else 0.0
                ),
                "sync_avg_ms": (
                    statistics.mean(self._sync_latencies)
                    if self._sync_latencies else 0.0
                ),
            },
            "memory": {
                "current_mb": self._memory_samples[-1] if self._memory_samples else 0.0,
                "avg_mb": (
                    statistics.mean(self._memory_samples)
                    if self._memory_samples else 0.0
                ),
                "max_mb": max(self._memory_samples) if self._memory_samples else 0.0,
            },
        }

        return stats

    def should_report(self) -> bool:
        """Check if it's time for a periodic report."""
        now = time.time()
        if now - self._last_report >= self.config.monitoring.stats_report_interval_seconds:
            self._last_report = now
            return True
        return False

    def get_health_score(self) -> float:
        """
        Calculate overall health score (0.0 - 1.0).

        Factors:
        - Frame time stability
        - Queue depths
        - Memory usage
        - Drop rates
        """
        scores = []

        # Frame time score
        frame_percentiles = self.frame_stats.get_percentiles()
        if frame_percentiles["avg"] > 0:
            target = self.config.rendering.target_frame_time_ms
            frame_score = min(1.0, target / max(frame_percentiles["p95"], target))
            scores.append(frame_score)

        # Drop rate score
        if self.frame_stats.total_frames > 0:
            drop_rate = self.frame_stats.dropped_frames / self.frame_stats.total_frames
            drop_score = max(0.0, 1.0 - drop_rate * 10)  # Penalize drops heavily
            scores.append(drop_score)

        # Queue score
        for qs in self.queue_stats.values():
            if qs.max_depth > 0:
                utilization = qs.current_depth / qs.max_depth
                queue_score = max(0.0, 1.0 - utilization)
                scores.append(queue_score)

        # Memory score
        if self._memory_samples:
            current = self._memory_samples[-1]
            max_allowed = self.config.memory.max_buffer_pool_size_mb
            memory_score = max(0.0, 1.0 - (current / max_allowed))
            scores.append(memory_score)

        return statistics.mean(scores) if scores else 1.0


# ============================================================================
# Adaptive Tuner
# ============================================================================


class AdaptiveTuner:
    """
    Dynamically adjusts tuning parameters based on performance.

    Monitors system performance and adjusts parameters to
    maintain responsiveness under varying loads.
    """

    def __init__(
        self,
        config: TuningConfig,
        monitor: PerformanceMonitor | None = None,
    ):
        self.config = config
        self.monitor = monitor or PerformanceMonitor(config)

        self._running = False
        self._task: asyncio.Task | None = None
        self._adjustment_callbacks: list[Callable[[str, Any, Any], None]] = []

        # Tuning state
        self._current_quality = 1.0
        self._consecutive_slow_frames = 0
        self._last_adjustment = time.time()
        self._adjustment_cooldown = 5.0  # Seconds between adjustments

        # History for trend analysis
        self._health_history: list[float] = []

    def on_adjustment(self, callback: Callable[[str, Any, Any], None]):
        """Register callback for parameter adjustments."""
        self._adjustment_callbacks.append(callback)

    async def start(self):
        """Start the adaptive tuner."""
        if self._running:
            return

        self._running = True
        self._task = asyncio.create_task(self._tuning_loop())
        logger.info("Adaptive tuner started")

    async def stop(self):
        """Stop the adaptive tuner."""
        self._running = False
        if self._task:
            self._task.cancel()
            try:
                await self._task
            except asyncio.CancelledError:
                pass
            self._task = None
        logger.info("Adaptive tuner stopped")

    async def _tuning_loop(self):
        """Main tuning loop."""
        while self._running:
            try:
                await self._run_adjustment_cycle()
                await asyncio.sleep(self.config.monitoring.metrics_interval_seconds)
            except asyncio.CancelledError:
                break
            except Exception as e:
                logger.error(f"Tuning loop error: {e}")
                await asyncio.sleep(1.0)

    async def _run_adjustment_cycle(self):
        """Run a single adjustment cycle."""
        now = time.time()

        # Check cooldown
        if now - self._last_adjustment < self._adjustment_cooldown:
            return

        # Get health score
        health = self.monitor.get_health_score()
        self._health_history.append(health)
        if len(self._health_history) > 100:
            self._health_history = self._health_history[-100:]

        # Determine if adjustment needed
        if health < 0.7:
            await self._apply_performance_adjustments(health)
        elif health > 0.9 and self._current_quality < 1.0:
            await self._apply_quality_improvements(health)

    async def _apply_performance_adjustments(self, health: float):
        """Apply adjustments to improve performance."""
        logger.info(f"Applying performance adjustments (health={health:.2f})")

        adjustments_made = []

        # Check frame times
        frame_stats = self.monitor.frame_stats.get_percentiles()
        if frame_stats["p95"] > self.config.rendering.target_frame_time_ms * 1.5:
            # Reduce quality
            if self._current_quality > self.config.rendering.quality_floor:
                old_quality = self._current_quality
                self._current_quality = max(
                    self.config.rendering.quality_floor,
                    self._current_quality - 0.1
                )
                adjustments_made.append(("quality_scale", old_quality, self._current_quality))

        # Check queue depths
        for name, qs in self.monitor.queue_stats.items():
            if qs.current_depth > self.config.events.max_event_queue_size * self.config.events.backpressure_threshold:
                # Increase processing rate
                old_batch = self.config.events.event_batch_size
                self.config.events.event_batch_size = min(100, int(old_batch * 1.2))
                adjustments_made.append(("event_batch_size", old_batch, self.config.events.event_batch_size))

        # Check sync intervals
        if self.monitor._sync_latencies and statistics.mean(self.monitor._sync_latencies) > 50:
            old_interval = self.config.gnb.sync_interval_seconds
            self.config.gnb.sync_interval_seconds = min(
                self.config.gnb.max_sync_interval_seconds,
                old_interval * 1.2
            )
            adjustments_made.append(("gnb_sync_interval", old_interval, self.config.gnb.sync_interval_seconds))

        # Notify callbacks
        for param, old_val, new_val in adjustments_made:
            for callback in self._adjustment_callbacks:
                try:
                    callback(param, old_val, new_val)
                except Exception as e:
                    logger.warning(f"Adjustment callback error: {e}")

        if adjustments_made:
            self._last_adjustment = time.time()

    async def _apply_quality_improvements(self, health: float):
        """Improve quality when performance is good."""
        logger.debug(f"Improving quality (health={health:.2f})")

        adjustments_made = []

        # Restore quality
        if self._current_quality < self.config.rendering.quality_ceiling:
            old_quality = self._current_quality
            self._current_quality = min(
                self.config.rendering.quality_ceiling,
                self._current_quality + 0.05
            )
            adjustments_made.append(("quality_scale", old_quality, self._current_quality))

        # Restore sync interval
        if self.config.gnb.sync_interval_seconds > 0.5:
            old_interval = self.config.gnb.sync_interval_seconds
            self.config.gnb.sync_interval_seconds = max(
                self.config.gnb.min_sync_interval_seconds,
                old_interval * 0.9
            )
            adjustments_made.append(("gnb_sync_interval", old_interval, self.config.gnb.sync_interval_seconds))

        # Notify callbacks
        for param, old_val, new_val in adjustments_made:
            for callback in self._adjustment_callbacks:
                try:
                    callback(param, old_val, new_val)
                except Exception as e:
                    logger.warning(f"Adjustment callback error: {e}")

        if adjustments_made:
            self._last_adjustment = time.time()

    def get_current_quality(self) -> float:
        """Get current quality scale factor."""
        return self._current_quality

    def get_adjustment_history(self) -> list[float]:
        """Get health score history."""
        return self._health_history.copy()


# ============================================================================
# Global Configuration Management
# ============================================================================


# Global configuration instance
_GLOBAL_CONFIG: TuningConfig | None = None
_GLOBAL_MONITOR: PerformanceMonitor | None = None


def get_tuning_config() -> TuningConfig:
    """Get the global tuning configuration."""
    global _GLOBAL_CONFIG
    if _GLOBAL_CONFIG is None:
        _GLOBAL_CONFIG = TuningConfig.from_env()
    return _GLOBAL_CONFIG


def set_tuning_config(config: TuningConfig) -> None:
    """Set the global tuning configuration."""
    global _GLOBAL_CONFIG
    _GLOBAL_CONFIG = config


def get_performance_monitor() -> PerformanceMonitor:
    """Get the global performance monitor."""
    global _GLOBAL_MONITOR
    if _GLOBAL_MONITOR is None:
        _GLOBAL_MONITOR = PerformanceMonitor(get_tuning_config())
    return _GLOBAL_MONITOR


def load_tuning_config(path: str | Path) -> TuningConfig:
    """Load tuning configuration from file."""
    path = Path(path)
    if not path.exists():
        logger.warning(f"Config file not found: {path}, using defaults")
        return TuningConfig()

    with open(path) as f:
        data = json.load(f)

    config = TuningConfig.from_dict(data)
    set_tuning_config(config)
    return config


def save_tuning_config(path: str | Path) -> None:
    """Save tuning configuration to file."""
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)

    config = get_tuning_config()
    with open(path, "w") as f:
        json.dump(config.to_dict(), f, indent=2)

    logger.info(f"Saved tuning configuration to {path}")


# ============================================================================
# Convenience Functions
# ============================================================================


def get_target_frame_time_ms() -> float:
    """Get the target frame time in milliseconds."""
    return get_tuning_config().rendering.target_frame_time_ms


def get_sync_interval_seconds() -> float:
    """Get the GNB sync interval in seconds."""
    return get_tuning_config().gnb.sync_interval_seconds


def get_cycle_interval_seconds() -> float:
    """Get the autonomous loop cycle interval in seconds."""
    return get_tuning_config().autonomous_loop.cycle_interval_seconds


def get_event_queue_size() -> int:
    """Get the maximum event queue size."""
    return get_tuning_config().events.max_event_queue_size


def record_frame(frame_time_ms: float, dropped: bool = False) -> None:
    """Record a frame time to the global monitor."""
    get_performance_monitor().record_frame_time(frame_time_ms, dropped)


def record_queue_depth(queue_name: str, depth: int) -> None:
    """Record queue depth to the global monitor."""
    get_performance_monitor().record_queue_depth(queue_name, depth)


# ============================================================================
# Main Entry Point
# ============================================================================


def main():
    """Demo the tuning parameters system."""
    print("=" * 60)
    print("Visual Shell Tuning Parameters")
    print("=" * 60)

    # Load configuration
    config = get_tuning_config()
    print(f"\nPerformance Mode: {config.performance_mode.value}")
    print(f"Target FPS: {config.rendering.target_fps}")
    print(f"Target Frame Time: {config.rendering.target_frame_time_ms:.2f}ms")
    print(f"GNB Sync Interval: {config.gnb.sync_interval_seconds}s")
    print(f"Cycle Interval: {config.autonomous_loop.cycle_interval_seconds}s")

    # Test different modes
    print("\n" + "-" * 60)
    print("Testing Performance Modes:")
    print("-" * 60)

    for mode in PerformanceMode:
        config = TuningConfig()
        config.apply_mode_preset(mode)
        print(f"\n{mode.value}:")
        print(f"  Target FPS: {config.rendering.target_fps}")
        print(f"  Quality Floor: {config.rendering.quality_floor}")
        print(f"  Sync Interval: {config.gnb.sync_interval_seconds}s")

    # Performance monitor demo
    print("\n" + "-" * 60)
    print("Performance Monitor Demo:")
    print("-" * 60)

    monitor = PerformanceMonitor()

    # Simulate some frames
    import random
    for _ in range(100):
        frame_time = 16.67 + random.gauss(0, 2)
        monitor.record_frame_time(abs(frame_time))

    stats = monitor.get_stats()
    print(f"\nFrame Stats:")
    print(f"  Total Frames: {stats['frames']['total']}")
    print(f"  Drop Rate: {stats['frames']['drop_rate']:.2%}")
    print(f"  P95 Frame Time: {stats['frames']['percentiles']['p95']:.2f}ms")
    print(f"  Health Score: {monitor.get_health_score():.2f}")

    # Save config
    config_path = Path(".geometry/tuning_config.json")
    save_tuning_config(config_path)
    print(f"\nConfiguration saved to: {config_path}")

    return 0


if __name__ == "__main__":
    exit(main())
