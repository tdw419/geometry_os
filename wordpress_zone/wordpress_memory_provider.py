import asyncio
import json
import socket
import os
import time
import requests
import hashlib
import numpy as np
from pathlib import Path

# WordPress Memory Provider
# -------------------------
# Synchronizes WordPress posts into the Vector Memory Daemon (Hippocampus).
# This enables semantic discovery of posts via Memory Beams.

class WordPressMemoryProvider:
    def __init__(
        self,
        wp_url="http://localhost:8080",
        socket_path="/tmp/vector_memory_daemon.sock",
        map_size=16384, # Standard map size for coordinates
        tms_url="http://localhost:8000"
    ):
        self.wp_url = wp_url
        self.socket_path = socket_path
        self.map_size = map_size
        self.tms_url = tms_url
        # WordPress Zone coordinates: (3000-3400, 1000-1400)
        self.x_min, self.x_max = 3000, 3400
        self.y_min, self.y_max = 1000, 1400

    def embed_text(self, text: str) -> list:
        """Deterministic mock embedding."""
        hash_bytes = hashlib.sha256(text.encode()).digest()
        vector = np.zeros(1536, dtype=np.float32)
        for i in range(48):
            chunk = int.from_bytes(hash_bytes[i*4:(i+1)*4], 'little')
            vector[i*32:(i+1)*32] = (chunk % 1000) / 1000.0
        norm = np.linalg.norm(vector)
        if norm > 0:
            vector = vector / norm
        return vector.tolist()

    def get_spatial_coords(self, post_id: int):
        """Map post ID to deterministic position within WordPress zone."""
        # Use post ID as seed
        state = (post_id * 12345) % 1000000
        x = self.x_min + (state % (self.x_max - self.x_min))
        y = self.y_min + ((state // 1000) % (self.y_max - self.y_min))
        
        # Normalize for daemon (0-1)
        return x / self.map_size, y / self.map_size

    def sync_posts(self, post_types=None):
        """Sync WordPress posts to Memory Daemon.

        Args:
            post_types: List of post types to sync. Defaults to ['post', 'research_document'].
        """
        if post_types is None:
            post_types = ['post', 'research_document']

        print(f"🔄 Fetching posts from {self.wp_url}...")
        all_posts = []
        for post_type in post_types:
            try:
                r = requests.post(
                    f"{self.wp_url}/ai-publisher.php",
                    json={"action": "list_posts", "limit": 100, "post_type": post_type}
                )
                r.raise_for_status()
                posts = r.json().get("posts", [])
                all_posts.extend(posts)
                print(f"  📥 Found {len(posts)} {post_type} posts")
            except Exception as e:
                print(f"❌ Failed to fetch {post_type} posts: {e}")

        posts = all_posts

        print(f"🧠 Syncing {len(posts)} posts to Memory Daemon...")
        
        count = 0
        for post in posts:
            title = post.get("title", "")
            content = post.get("content", "")
            post_id = post.get("id", 0)
            
            # 1. Embed
            embedding = self.embed_text(f"{title} {content}")
            
            # 2. Map spatially
            nx, ny = self.get_spatial_coords(post_id)
            
            # 3. Store in Memory Daemon
            success = self.store_in_daemon({
                "token_id": post_id,
                "token": f"WP:{title}",
                "embedding": embedding,
                "hilbert_x": nx,
                "hilbert_y": ny,
                "layer": 10, # Semantic layer
                "activation": 1.0,
                "session_id": "wordpress_sync"
            })
            
            if success:
                count += 1
        
        print(f"✅ Successfully synced {count} posts.")

    def store_in_daemon(self, payload: dict) -> bool:
        """Send StoreThought message to daemon socket."""
        if not os.path.exists(self.socket_path):
            print(f"⚠️ Memory Daemon not found at {self.socket_path}")
            return False

        try:
            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as sock:
                sock.connect(self.socket_path)
                message = {
                    "message_type": "StoreThought",
                    "payload": payload
                }
                sock.sendall(json.dumps(message).encode('utf-8'))
                
                response = sock.recv(4096)
                if response:
                    return json.loads(response.decode('utf-8')).get("success", False)
        except Exception as e:
            print(f"❌ Socket error: {e}")
        return False

    def sync_to_tms(self, post_types=None) -> dict:
        """Sync WordPress posts to TMS backend.

        Args:
            post_types: List of post types to sync. Defaults to ['truth_entry'].

        Returns:
            dict with synced, failed counts and any errors.
        """
        if post_types is None:
            post_types = ['truth_entry']

        result = {"synced": 0, "failed": 0, "errors": []}

        # Fetch posts from WordPress
        posts = self.get_posts_from_wp(post_types=post_types)

        for post in posts:
            try:
                tms_result = self.send_to_tms(post)
                if tms_result.get("success"):
                    result["synced"] += 1
                else:
                    result["failed"] += 1
                    result["errors"].append(tms_result.get("error", "Unknown error"))
            except Exception as e:
                result["failed"] += 1
                result["errors"].append(str(e))

        return result

    def get_posts_from_wp(self, post_types=None, limit=100) -> list:
        """Fetch posts from WordPress for TMS sync.

        Args:
            post_types: List of post types to fetch.
            limit: Maximum posts to fetch per type.

        Returns:
            List of post dicts with id, title, content, meta.
        """
        if post_types is None:
            post_types = ['truth_entry']

        all_posts = []
        for post_type in post_types:
            try:
                r = requests.post(
                    f"{self.wp_url}/ai-publisher.php",
                    json={"action": "list_posts", "limit": limit, "post_type": post_type}
                )
                r.raise_for_status()
                posts = r.json().get("posts", [])
                all_posts.extend(posts)
            except Exception as e:
                print(f"Failed to fetch {post_type} posts: {e}")

        return all_posts

    def send_to_tms(self, post: dict) -> dict:
        """Send a single post to TMS /api/truths/add endpoint.

        Args:
            post: Post dict with title, content, and meta fields.

        Returns:
            dict with success status and truth_id or error.
        """
        try:
            payload = {
                "claim": post.get("title", ""),
                "evidence": post.get("content", ""),
                "confidence": post.get("meta", {}).get("confidence", 0.5),
                "source": "wordpress_sync"
            }
            r = requests.post(
                f"{self.tms_url}/api/truths/add",
                json=payload,
                timeout=5
            )
            r.raise_for_status()
            return {"success": True, "truth_id": r.json().get("truth_id")}
        except Exception as e:
            return {"success": False, "error": str(e)}

    def get_truth_stats(self) -> dict:
        """Get truth statistics from WordPress.

        Returns:
            dict with total_truths, avg_confidence, avg_transparency, system_health.
        """
        try:
            r = requests.post(
                f"{self.wp_url}/ai-publisher.php",
                json={"action": "getTruthStats"}
            )
            r.raise_for_status()
            return r.json()
        except Exception as e:
            return {"success": False, "error": str(e)}


if __name__ == "__main__":
    provider = WordPressMemoryProvider()
    provider.sync_posts()
