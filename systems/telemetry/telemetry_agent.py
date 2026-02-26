"""TelemetryAgent - Ingests real-world telemetry and injects into NEB.

Maps:
- Satellites (NORAD TLE) -> orbital.satellite.* topics
- Aviation (ADSB) -> orbital.aviation.* topics
- System processes -> orbital.process.* topics
"""

import time
from typing import Optional, Dict, Any

from systems.swarm.neb_bus import NEBBus
from systems.swarm.neb_signal import NEBSignal


# Use dataclass from tle_parser module for consistency
from dataclasses import dataclass


@dataclass
class SatellitePosition:
    """Satellite position with system mapping."""
    norad_id: int
    name: str
    latitude: float
    longitude: float
    altitude_km: float
    velocity_kmps: float
    cpu_priority: int        # Maps to altitude in visualization
    memory_bandwidth: float  # Maps to velocity in visualization
    timestamp: float


class TelemetryAgent:
    """Ingests real-world telemetry and injects into NEB.

    Maps:
    - Satellites (NORAD TLE) -> orbital.satellite.* topics
    - Aviation (ADSB) -> orbital.aviation.* topics
    - System processes -> orbital.process.* topics
    """

    def __init__(self, node_id: str = "telemetry-agent"):
        self.node_id = node_id
        self.neb_bus = NEBBus(node_id=node_id)
        self._satellite_cache: Dict[int, SatellitePosition] = {}

    def publish_satellite_position(
        self,
        norad_id: int,
        name: str,
        lat: float,
        lon: float,
        alt_km: float,
        velocity: float,
        priority: int = 0,
    ) -> None:
        """Publish satellite position to NEB on topic orbital.satellite.{norad_id}.

        Args:
            norad_id: NORAD catalog number
            name: Satellite name
            lat: Latitude in degrees
            lon: Longitude in degrees
            alt_km: Altitude in kilometers
            velocity: Orbital velocity in km/s
            priority: CPU priority for visualization mapping
        """
        position = SatellitePosition(
            norad_id=norad_id,
            name=name,
            latitude=lat,
            longitude=lon,
            altitude_km=alt_km,
            velocity_kmps=velocity,
            cpu_priority=priority,
            memory_bandwidth=0.0,
            timestamp=time.time()
        )

        # Cache the position
        self._satellite_cache[norad_id] = position

        # Publish to NEB
        topic = f"orbital.satellite.{norad_id}"
        payload = {
            "norad_id": norad_id,
            "name": name,
            "latitude": lat,
            "longitude": lon,
            "altitude_km": alt_km,
            "velocity_kmps": velocity,
            "cpu_priority": priority,
            "memory_bandwidth": 0.0,
            "timestamp": position.timestamp,
        }

        self.neb_bus.publish(topic, payload)

    def map_process_to_satellite(
        self,
        process_id: int,
        process_name: str,
        cpu_priority: int,
        memory_bandwidth: float,
    ) -> SatellitePosition:
        """Map a system process to a virtual satellite.

        Process priority -> orbital altitude
        Memory bandwidth -> orbital velocity

        Args:
            process_id: System process ID
            process_name: Name of the process
            cpu_priority: Process priority (higher = more important)
            memory_bandwidth: Memory usage rate in MB/s

        Returns:
            SatellitePosition representing the process
        """
        # Use negative NORAD ID to distinguish virtual satellites
        virtual_norad_id = -process_id

        # Scale priority to altitude (priority 0-100 -> altitude 200-2000 km)
        # Higher priority = higher altitude (more visible)
        altitude_km = 200.0 + (cpu_priority / 100.0) * 1800.0

        # Scale bandwidth to velocity (bandwidth 0-10000 MB/s -> velocity 3-10 km/s)
        # Higher bandwidth = faster movement
        velocity_kmps = 3.0 + min(memory_bandwidth / 10000.0, 1.0) * 7.0

        position = SatellitePosition(
            norad_id=virtual_norad_id,
            name=f"process:{process_name}",
            latitude=0.0,  # Processes start at origin
            longitude=0.0,
            altitude_km=altitude_km,
            velocity_kmps=velocity_kmps,
            cpu_priority=cpu_priority,
            memory_bandwidth=memory_bandwidth,
            timestamp=time.time()
        )

        return position

    def publish_process(
        self,
        process_id: int,
        process_name: str,
        cpu_priority: int,
        memory_bandwidth: float,
    ) -> None:
        """Convenience method to publish a process as a virtual satellite.

        Publishes to orbital.process.{process_id} topic.

        Args:
            process_id: System process ID
            process_name: Name of the process
            cpu_priority: Process priority
            memory_bandwidth: Memory usage rate in MB/s
        """
        position = self.map_process_to_satellite(
            process_id=process_id,
            process_name=process_name,
            cpu_priority=cpu_priority,
            memory_bandwidth=memory_bandwidth
        )

        # Cache with negative ID
        self._satellite_cache[-process_id] = position

        # Publish to NEB with process topic
        topic = f"orbital.process.{process_id}"
        payload = {
            "norad_id": position.norad_id,
            "name": position.name,
            "latitude": position.latitude,
            "longitude": position.longitude,
            "altitude_km": position.altitude_km,
            "velocity_kmps": position.velocity_kmps,
            "cpu_priority": cpu_priority,
            "memory_bandwidth": memory_bandwidth,
            "timestamp": position.timestamp,
        }

        self.neb_bus.publish(topic, payload)

    def get_cached_satellite(self, norad_id: int) -> Optional[SatellitePosition]:
        """Get cached satellite position by NORAD ID.

        Args:
            norad_id: NORAD catalog number (positive for real, negative for virtual)

        Returns:
            SatellitePosition if cached, None otherwise
        """
        return self._satellite_cache.get(norad_id)
