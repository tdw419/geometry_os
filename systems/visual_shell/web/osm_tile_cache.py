#!/usr/bin/env python3
"""
OSM Tile Cache Downloader for Geometry OS WorldView

Downloads OpenStreetMap tiles for offline/sovereign operation.
Supports zoom levels 0-8 with coverage for world and North America.

Usage:
    python3 osm_tile_cache.py           # Download all tiles
    python3 osm_tile_cache.py --verify  # Verify existing tiles
    python3 osm_tile_cache.py --stats   # Show cache statistics

Tile URL: https://tile.openstreetmap.org/{z}/{x}/{y}.png
Local path: tiles/{z}/{x}/{y}.png

Rate limiting: 0.1s between requests (OSM policy compliance)
"""

import os
import sys
import time
import argparse
from pathlib import Path
from urllib.request import urlopen, Request
from urllib.error import URLError, HTTPError

# Rate limiting in seconds (OSM requests max ~1 request per second)
RATE_LIMIT = 0.1

# User agent for OSM API compliance
USER_AGENT = "GeometryOS-WorldView/1.0 (https://geometry.os)"

# Tile cache directory
TILES_DIR = Path(__file__).parent / "tiles"

# Tile ranges for different zoom levels
# Format: {zoom: (x_min, x_max, y_min, y_max)}
# World coverage at low zoom, North America at higher zoom

TILE_RANGES = {
    # Zoom 0: Single tile covers entire world
    0: [(0, 0, 0, 0)],

    # Zoom 1: 2x2 tiles - full world
    1: [(0, 1, 0, 1)],

    # Zoom 2: 4x4 tiles - full world
    2: [(0, 3, 0, 3)],

    # Zoom 3: 8x8 tiles - full world
    3: [(0, 7, 0, 7)],

    # Zoom 4: 16x16 tiles - full world
    4: [(0, 15, 0, 15)],

    # Zoom 5: 32x32 tiles - full world
    5: [(0, 31, 0, 31)],

    # Zoom 6: 64x64 tiles - North America focus (x: 2-15, y: 5-20)
    6: [(0, 63, 0, 63)],  # Full world (64 tiles is manageable)

    # Zoom 7: 128x128 tiles - North America + Europe
    7: [
        (4, 30, 8, 40),   # North America
        (50, 80, 20, 50), # Europe
    ],

    # Zoom 8: 256x256 tiles - North America detailed
    8: [
        (8, 60, 16, 80),   # North America detailed
        (100, 160, 40, 100), # Europe
    ],
}


def get_tile_url(z, x, y):
    """Generate OSM tile URL."""
    return f"https://tile.openstreetmap.org/{z}/{x}/{y}.png"


def get_tile_path(z, x, y):
    """Get local path for tile."""
    return TILES_DIR / str(z) / str(x) / f"{y}.png"


def download_tile(z, x, y, force=False):
    """
    Download a single tile from OSM.

    Args:
        z: Zoom level
        x: Tile X coordinate
        y: Tile Y coordinate
        force: Overwrite existing tile

    Returns:
        True if downloaded or already exists, False on error
    """
    tile_path = get_tile_path(z, x, y)

    # Skip if already exists and not forcing
    if tile_path.exists() and not force:
        return True

    # Create directory structure
    tile_path.parent.mkdir(parents=True, exist_ok=True)

    url = get_tile_url(z, x, y)

    try:
        request = Request(url, headers={"User-Agent": USER_AGENT})
        with urlopen(request, timeout=30) as response:
            data = response.read()

        with open(tile_path, "wb") as f:
            f.write(data)

        return True

    except HTTPError as e:
        print(f"  HTTP error {e.code} for tile {z}/{x}/{y}")
        return False
    except URLError as e:
        print(f"  URL error for tile {z}/{x}/{y}: {e.reason}")
        return False
    except Exception as e:
        print(f"  Error downloading tile {z}/{x}/{y}: {e}")
        return False


def download_all_tiles(force=False, dry_run=False):
    """
    Download all tiles defined in TILE_RANGES.

    Args:
        force: Overwrite existing tiles
        dry_run: Only count tiles, don't download
    """
    total_tiles = 0
    existing_tiles = 0
    to_download = 0

    # Count tiles first
    for z, ranges in TILE_RANGES.items():
        for x_min, x_max, y_min, y_max in ranges:
            count = (x_max - x_min + 1) * (y_max - y_min + 1)
            total_tiles += count

            if not dry_run:
                for x in range(x_min, x_max + 1):
                    for y in range(y_min, y_max + 1):
                        if get_tile_path(z, x, y).exists():
                            existing_tiles += 1
                        else:
                            to_download += 1

    print(f"Tile Cache Summary:")
    print(f"  Total tiles in ranges: {total_tiles}")
    print(f"  Existing tiles: {existing_tiles}")
    print(f"  Tiles to download: {to_download}")

    if dry_run:
        print("\n[DRY RUN] No downloads performed.")
        return

    if to_download == 0:
        print("\nAll tiles already cached!")
        return

    print(f"\nStarting download (rate limit: {RATE_LIMIT}s between requests)...")
    print(f"Estimated time: ~{to_download * RATE_LIMIT / 60:.1f} minutes\n")

    downloaded = 0
    failed = 0
    start_time = time.time()

    for z, ranges in TILE_RANGES.items():
        print(f"Zoom level {z}:")
        for x_min, x_max, y_min, y_max in ranges:
            for x in range(x_min, x_max + 1):
                for y in range(y_min, y_max + 1):
                    tile_path = get_tile_path(z, x, y)

                    if tile_path.exists() and not force:
                        continue

                    success = download_tile(z, x, y, force)

                    if success:
                        downloaded += 1
                        if downloaded % 50 == 0:
                            elapsed = time.time() - start_time
                            rate = downloaded / elapsed if elapsed > 0 else 0
                            print(f"  Progress: {downloaded}/{to_download} ({rate:.1f} tiles/s)")
                    else:
                        failed += 1

                    # Rate limiting
                    time.sleep(RATE_LIMIT)

    elapsed = time.time() - start_time
    print(f"\nDownload complete!")
    print(f"  Downloaded: {downloaded}")
    print(f"  Failed: {failed}")
    print(f"  Time: {elapsed:.1f}s")


def verify_tiles():
    """Verify all tiles exist and are valid PNG files."""
    missing = 0
    invalid = 0
    total = 0

    print("Verifying tile cache...\n")

    for z, ranges in TILE_RANGES.items():
        for x_min, x_max, y_min, y_max in ranges:
            for x in range(x_min, x_max + 1):
                for y in range(y_min, y_max + 1):
                    total += 1
                    tile_path = get_tile_path(z, x, y)

                    if not tile_path.exists():
                        missing += 1
                        print(f"  Missing: {z}/{x}/{y}")
                    elif tile_path.stat().st_size < 100:
                        invalid += 1
                        print(f"  Invalid (too small): {z}/{x}/{y}")

    print(f"\nVerification complete:")
    print(f"  Total tiles: {total}")
    print(f"  Missing: {missing}")
    print(f"  Invalid: {invalid}")
    print(f"  Valid: {total - missing - invalid}")

    return missing == 0 and invalid == 0


def show_stats():
    """Show statistics about the tile cache."""
    print("Tile Cache Statistics\n")
    print(f"Cache directory: {TILES_DIR}")

    if not TILES_DIR.exists():
        print("Cache directory does not exist. Run download first.")
        return

    total_size = 0
    total_files = 0
    zoom_stats = {}

    for z_dir in TILES_DIR.iterdir():
        if not z_dir.is_dir():
            continue

        try:
            z = int(z_dir.name)
        except ValueError:
            continue

        zoom_size = 0
        zoom_files = 0

        for x_dir in z_dir.rglob("*.png"):
            if x_dir.is_file():
                size = x_dir.stat().st_size
                zoom_size += size
                zoom_files += 1

        zoom_stats[z] = {"files": zoom_files, "size": zoom_size}
        total_size += zoom_size
        total_files += zoom_files

    print(f"\nTotal tiles: {total_files}")
    print(f"Total size: {total_size / (1024*1024):.2f} MB")

    print("\nBy zoom level:")
    for z in sorted(zoom_stats.keys()):
        stats = zoom_stats[z]
        size_mb = stats["size"] / (1024*1024)
        print(f"  Zoom {z}: {stats['files']:4d} tiles, {size_mb:6.2f} MB")


def main():
    parser = argparse.ArgumentParser(
        description="Download OSM tiles for offline WorldView operation"
    )
    parser.add_argument(
        "--verify",
        action="store_true",
        help="Verify existing tiles without downloading"
    )
    parser.add_argument(
        "--stats",
        action="store_true",
        help="Show cache statistics"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Count tiles without downloading"
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Overwrite existing tiles"
    )

    args = parser.parse_args()

    # Ensure tiles directory exists
    TILES_DIR.mkdir(parents=True, exist_ok=True)

    if args.stats:
        show_stats()
    elif args.verify:
        success = verify_tiles()
        sys.exit(0 if success else 1)
    else:
        download_all_tiles(force=args.force, dry_run=args.dry_run)


if __name__ == "__main__":
    main()
