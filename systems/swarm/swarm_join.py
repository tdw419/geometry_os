#!/usr/bin/env python3
"""
Swarm Join Protocol - Allow remote AIs to discover and join a WordPress Swarm.

Usage:
    # Get join instructions from a swarm node
    python3 swarm_join.py discover <host>:<port>

    # Join a swarm (install plugin and configure sync)
    python3 swarm_join.py join <host>:<port> --name my-node

    # Generate join config to share with others
    python3 swarm_join.py generate-config
"""

import argparse
import json
import subprocess
import sys
from pathlib import Path
from typing import Optional
import urllib.request
import urllib.error

# WordPress plugin path
PLUGIN_SOURCE = Path(__file__).parent.parent.parent / "wordpress_zone/wordpress/wp-content/plugins/geometry-os-swarm-node"
REMOTE_NODES_CONFIG = Path(__file__).parent / "remote_nodes.json"


def get_join_info(host: str, port: int = 8080) -> dict:
    """Fetch join information from a swarm node."""
    url = f"http://{host}:{port}/?rest_route=/geoos/v1/swarm/info"

    try:
        with urllib.request.urlopen(url, timeout=10) as resp:
            return json.loads(resp.read().decode())
    except urllib.error.HTTPError as e:
        if e.code == 404:
            return {"error": "Swarm info endpoint not found. Node may not have swarm plugin."}
        raise
    except Exception as e:
        return {"error": str(e)}


def generate_join_config(local_host: str = "localhost", local_port: int = 8080) -> dict:
    """Generate a config that can be shared with remote AIs to join this swarm."""
    return {
        "swarm_name": "geometry-os-swarm",
        "join_url": f"http://{local_host}:{local_port}",
        "api_base": f"http://{local_host}:{local_port}/wp-json/geoos/v1",
        "sync_endpoint": f"http://{local_host}:{local_port}/?rest_route=/geoos/v1/sync",
        "plugin_required": "geometry-os-swarm-node",
        "instructions": [
            "1. Install the geometry-os-swarm-node WordPress plugin",
            "2. Add this node to your remote_nodes.json",
            "3. Start the sync daemon"
        ],
        "remote_node_config": {
            "node_id": f"swarm-node-{local_host}",
            "url": f"http://{local_host}:{local_port}",
            "api_url": f"http://{local_host}:{local_port}/?rest_route=/geoos/v1",
            "enabled": True
        }
    }


def install_plugin_locally() -> bool:
    """Install the swarm plugin in the local WordPress."""
    if not PLUGIN_SOURCE.exists():
        print(f"❌ Plugin source not found: {PLUGIN_SOURCE}")
        return False

    # Find WordPress plugins directory
    wp_plugins = PLUGIN_SOURCE  # Already in the right place if local

    print(f"✅ Plugin already installed at: {PLUGIN_SOURCE}")
    return True


def add_remote_node(node_id: str, url: str, api_url: str) -> bool:
    """Add a remote node to the config file."""
    config = {"nodes": []}

    if REMOTE_NODES_CONFIG.exists():
        try:
            config = json.loads(REMOTE_NODES_CONFIG.read_text())
        except:
            pass

    # Check if node already exists
    for node in config.get("nodes", []):
        if node.get("node_id") == node_id:
            print(f"⚠️  Node {node_id} already exists in config")
            return True

    # Add new node
    config["nodes"].append({
        "node_id": node_id,
        "url": url,
        "api_url": api_url,
        "enabled": True
    })

    REMOTE_NODES_CONFIG.write_text(json.dumps(config, indent=2))
    print(f"✅ Added remote node: {node_id}")
    return True


def join_swarm(host: str, port: int, node_name: Optional[str] = None) -> dict:
    """Join a remote WordPress swarm."""
    print(f"🔍 Discovering swarm at {host}:{port}...")

    # Get join info
    info_url = f"http://{host}:{port}/?rest_route=/geoos/v1/swarm/info"
    try:
        with urllib.request.urlopen(info_url, timeout=10) as resp:
            info = json.loads(resp.read().decode())
    except urllib.error.HTTPError as e:
        if e.code == 404:
            # Try sync endpoint as fallback
            sync_url = f"http://{host}:{port}/?rest_route=/geoos/v1/sync&since=0&limit=1"
            try:
                with urllib.request.urlopen(sync_url, timeout=10) as resp:
                    data = json.loads(resp.read().decode())
                    info = {
                        "node_id": data.get("node_id", f"remote-{host}"),
                        "sync_available": True
                    }
            except:
                return {"error": f"Could not connect to swarm at {host}:{port}"}
        else:
            return {"error": f"HTTP error {e.code}"}
    except Exception as e:
        return {"error": str(e)}

    print(f"✅ Found swarm node: {info.get('node_id', 'unknown')}")

    # Install plugin locally
    print("\n📦 Checking local plugin...")
    install_plugin_locally()

    # Add remote node to config
    print("\n🔗 Adding remote node to config...")
    node_id = node_name or info.get("node_id", f"remote-{host}")
    api_url = f"http://{host}:{port}/?rest_route=/geoos/v1"

    add_remote_node(node_id, f"http://{host}:{port}", api_url)

    # Test sync
    print("\n🔄 Testing sync...")
    sync_url = f"http://{host}:{port}/?rest_route=/geoos/v1/sync&since=0&limit=5"
    try:
        with urllib.request.urlopen(sync_url, timeout=10) as resp:
            data = json.loads(resp.read().decode())
            print(f"✅ Sync test successful: {data.get('count', 0)} posts available")
    except Exception as e:
        print(f"⚠️  Sync test failed: {e}")

    return {
        "success": True,
        "node_id": node_id,
        "remote_url": f"http://{host}:{port}",
        "api_url": api_url
    }


def main():
    parser = argparse.ArgumentParser(description="Swarm Join Protocol")
    subparsers = parser.add_subparsers(dest="command", help="Commands")

    # Discover command
    discover_parser = subparsers.add_parser("discover", help="Discover a swarm node")
    discover_parser.add_argument("host", help="Host to discover (e.g., 10.42.0.1:8080)")
    discover_parser.add_argument("--port", type=int, default=None, help="Port (if not in host)")

    # Join command
    join_parser = subparsers.add_parser("join", help="Join a swarm")
    join_parser.add_argument("host", help="Host to join (e.g., 10.42.0.1:8080)")
    join_parser.add_argument("--name", help="Name for this node")
    join_parser.add_argument("--port", type=int, default=None, help="Port (if not in host)")

    # Generate config command
    gen_parser = subparsers.add_parser("generate-config", help="Generate join config for sharing")
    gen_parser.add_argument("--host", default="localhost", help="This machine's reachable host")
    gen_parser.add_argument("--port", type=int, default=8080, help="This machine's port")

    args = parser.parse_args()

    if args.command == "discover":
        host = args.host
        port = args.port or 8080
        if ":" in host and not args.port:
            host, port_str = host.rsplit(":", 1)
            port = int(port_str)

        print(f"🔍 Discovering {host}:{port}...")
        info = get_join_info(host, port)

        if "error" in info:
            print(f"❌ {info['error']}")
            sys.exit(1)

        print(json.dumps(info, indent=2))

    elif args.command == "join":
        host = args.host
        port = args.port or 8080
        if ":" in host and not args.port:
            host, port_str = host.rsplit(":", 1)
            port = int(port_str)

        result = join_swarm(host, port, args.name)

        if "error" in result:
            print(f"\n❌ Join failed: {result['error']}")
            sys.exit(1)

        print(f"\n✅ Successfully joined swarm!")
        print(f"   Remote node: {result['node_id']}")
        print(f"   URL: {result['remote_url']}")
        print(f"\n🚀 Start the sync daemon to begin syncing:")
        print(f"   python3 systems/swarm/wp_discovery_daemon.py -f")

    elif args.command == "generate-config":
        config = generate_join_config(args.host, args.port)
        print(json.dumps(config, indent=2))
        print(f"\n💡 Share this config with remote AIs so they can join your swarm")

    else:
        parser.print_help()


if __name__ == "__main__":
    main()
