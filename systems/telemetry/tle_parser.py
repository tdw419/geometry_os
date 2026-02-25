"""TLE (Two-Line Element) parser for satellite orbital data."""

from dataclasses import dataclass
from typing import Optional
import math


@dataclass
class OrbitalState:
    """Current orbital state of a satellite."""
    latitude: float  # degrees
    longitude: float  # degrees
    altitude_km: float
    velocity_kmps: float
    epoch: float  # Unix timestamp


@dataclass
class TLEData:
    """Parsed TLE data."""
    norad_id: int
    satellite_name: str
    inclination: float  # degrees
    raan: float  # Right Ascension of Ascending Node
    eccentricity: float
    argument_of_perigee: float
    mean_anomaly: float
    mean_motion: float  # revolutions per day
    epoch_year: int
    epoch_day: float
    line1: str
    line2: str

    def to_orbital_state(self) -> OrbitalState:
        """Convert TLE to approximate orbital state using SGP4 principles."""
        # Simplified orbital mechanics calculation
        # Real implementation would use sgp4 library
        earth_radius_km = 6371.0

        # Mean motion to semi-major axis (Kepler's 3rd law)
        # a^3 = GM / n^2 where n = mean motion in rad/s
        n = self.mean_motion * 2 * math.pi / 86400  # rad/s
        a = (398600.4418 / (n ** 2)) ** (1/3)  # km

        altitude_km = a - earth_radius_km

        # Circular velocity approximation
        velocity_kmps = math.sqrt(398600.4418 / a)

        # Approximate position from mean anomaly
        # This is a simplification - real SGP4 is much more complex
        lat = self.inclination * math.sin(math.radians(self.mean_anomaly))
        lon = self.raan + self.mean_anomaly

        return OrbitalState(
            latitude=lat,
            longitude=lon,
            altitude_km=altitude_km,
            velocity_kmps=velocity_kmps,
            epoch=self._epoch_to_unix(),
        )

    def _epoch_to_unix(self) -> float:
        """Convert TLE epoch to Unix timestamp."""
        # TLE epoch: year (2 or 4 digits) + day of year (fractional)
        import datetime
        year = self.epoch_year
        if year < 57:
            year += 2000
        else:
            year += 1900

        base = datetime.datetime(year, 1, 1)
        delta = datetime.timedelta(days=self.epoch_day - 1)
        return (base + delta).timestamp()


class TLEParser:
    """Parser for NORAD Two-Line Element format."""

    @staticmethod
    def parse(line1: str, line2: str, name: str = "Unknown") -> TLEData:
        """
        Parse TLE lines into structured data.

        Args:
            line1: First line of TLE (starts with '1')
            line2: Second line of TLE (starts with '2')
            name: Optional satellite name

        Returns:
            TLEData with parsed orbital elements
        """
        # Validate line format
        if not line1.startswith('1') or not line2.startswith('2'):
            raise ValueError("Invalid TLE format")

        # Parse line 1
        norad_id = int(line1[2:7])
        epoch_year = int(line1[18:20])
        epoch_day = float(line1[20:32])

        # Parse line 2
        inclination = float(line2[8:16])
        raan = float(line2[17:25])
        eccentricity = float("0." + line2[26:33])
        argument_of_perigee = float(line2[34:42])
        mean_anomaly = float(line2[43:51])
        mean_motion = float(line2[52:].strip())  # Read to end of line for full precision

        return TLEData(
            norad_id=norad_id,
            satellite_name=name,
            inclination=inclination,
            raan=raan,
            eccentricity=eccentricity,
            argument_of_perigee=argument_of_perigee,
            mean_anomaly=mean_anomaly,
            mean_motion=mean_motion,
            epoch_year=epoch_year,
            epoch_day=epoch_day,
            line1=line1,
            line2=line2,
        )
