"""Tests for TLE (Two-Line Element) parser."""

import pytest
from systems.telemetry.tle_parser import TLEParser, TLEData


class TestTLEParser:
    def test_parse_iss_tle(self):
        """Parse ISS TLE data."""
        line1 = "1 25544U 98067A   08264.51782528 -.00002182  00000-0 -11606-4 0  2927"
        line2 = "2 25544  51.6416 247.4627 0006703 130.5360 325.0288 15.72125391563537"

        tle = TLEParser.parse(line1, line2, "ISS")

        assert tle.norad_id == 25544
        assert tle.satellite_name == "ISS"
        assert abs(tle.inclination - 51.6416) < 0.001

    def test_tle_to_orbital_state(self):
        """Convert TLE to orbital state vector."""
        line1 = "1 25544U 98067A   08264.51782528 -.00002182  00000-0 -11606-4 0  2927"
        line2 = "2 25544  51.6416 247.4627 0006703 130.5360 325.0288 15.72125391563537"

        tle = TLEParser.parse(line1, line2, "ISS")
        state = tle.to_orbital_state()

        assert state.altitude_km > 350  # ISS LEO altitude range (varies by epoch)
        assert state.altitude_km < 450  # Upper bound for ISS orbit
        assert state.velocity_kmps > 7.5  # ~7.66 km/s
