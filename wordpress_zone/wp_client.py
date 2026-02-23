"""WordPress HTTP Client for Truth Daemon.

This module provides a client for interacting with WordPress via the ai-publisher.php
endpoint. It handles content discovery, metadata updates, and author information.

Usage:
    from wordpress_zone.wp_client import WordPressClient

    client = WordPressClient()
    posts = client.get_modified_posts(since="2026-01-01", post_types=["post", "page"])
"""
import logging
from dataclasses import dataclass
from datetime import datetime
from typing import Any, Dict, List, Optional

import requests

logger = logging.getLogger(__name__)

# Default timeout for HTTP requests (10 seconds)
DEFAULT_TIMEOUT = 10


@dataclass
class AuthorInfo:
    """Author information for a WordPress post."""
    role: str
    post_count: int


class WordPressClient:
    """HTTP client for WordPress content discovery via ai-publisher.php.

    This client communicates with the WordPress semantic district through
    the ai-publisher.php endpoint to discover modified content and update
    post metadata.

    Attributes:
        base_url: The base URL for the WordPress instance.
        endpoint: The full URL to the ai-publisher.php endpoint.
    """

    def __init__(self, base_url: str = "http://localhost:8080"):
        """Initialize the WordPress client.

        Args:
            base_url: Base URL for WordPress (default: http://localhost:8080).
        """
        self.base_url = base_url.rstrip("/")
        self.endpoint = f"{self.base_url}/ai-publisher.php"

    def get_modified_posts(
        self,
        since: Optional[str] = None,
        post_types: Optional[List[str]] = None,
        limit: int = 50
    ) -> List[Dict[str, Any]]:
        """Query WordPress for modified content.

        Retrieves posts that have been modified since a given timestamp,
        filtered by post types.

        Args:
            since: ISO-format datetime string for filtering by modification date.
                   If None, returns all posts.
            post_types: List of post types to include (e.g., ["post", "page"]).
                        If None, defaults to ["post"].
            limit: Maximum number of posts to return (default: 50).

        Returns:
            List of post dictionaries, each containing:
                - id: Post ID
                - title: Post title
                - content: Post content
                - excerpt: Post excerpt
                - date: Publication date (ISO format)
                - url: Permalink URL

        Example:
            >>> client = WordPressClient()
            >>> posts = client.get_modified_posts(
            ...     since="2026-02-01T00:00:00Z",
            ...     post_types=["post", "page", "research_document"],
            ...     limit=10
            ... )
        """
        if post_types is None:
            post_types = ["post"]

        payload = {
            "action": "getModifiedContent",
            "args": {
                "since": since,
                "post_types": post_types,
                "limit": limit
            }
        }

        try:
            response = self._make_request(payload)
            if response.get("success"):
                posts = response.get("posts", [])
                logger.info(f"Retrieved {len(posts)} modified posts since {since}")
                return posts
            else:
                logger.warning(f"Failed to get modified posts: {response.get('error')}")
                return []
        except Exception as e:
            logger.error(f"Error getting modified posts: {e}")
            return []

    def update_post_meta(
        self,
        post_id: int,
        meta_key: str,
        meta_value: Any
    ) -> bool:
        """Update post metadata.

        Args:
            post_id: WordPress post ID.
            meta_key: Metadata key to update.
            meta_value: Value to store.

        Returns:
            True if update was successful, False otherwise.

        Example:
            >>> client = WordPressClient()
            >>> success = client.update_post_meta(
            ...     post_id=123,
            ...     meta_key="truth_extracted",
            ...     meta_value=True
            ... )
        """
        payload = {
            "action": "updatePostMeta",
            "args": {
                "post_id": post_id,
                "meta_key": meta_key,
                "meta_value": meta_value
            }
        }

        try:
            response = self._make_request(payload)
            if response.get("success"):
                logger.info(f"Updated post {post_id} meta: {meta_key}")
                return True
            else:
                logger.warning(f"Failed to update post meta: {response.get('error')}")
                return False
        except Exception as e:
            logger.error(f"Error updating post meta: {e}")
            return False

    def get_post_author_info(self, post_id: int) -> AuthorInfo:
        """Get author role and post count for a post.

        Args:
            post_id: WordPress post ID.

        Returns:
            AuthorInfo with role and post_count fields.
            Returns default AuthorInfo(role="unknown", post_count=0) on error.

        Example:
            >>> client = WordPressClient()
            >>> info = client.get_post_author_info(post_id=123)
            >>> print(f"Role: {info.role}, Posts: {info.post_count}")
        """
        payload = {
            "action": "getPostAuthorInfo",
            "args": {
                "post_id": post_id
            }
        }

        try:
            response = self._make_request(payload)
            if response.get("success"):
                data = response.get("author_info", {})
                return AuthorInfo(
                    role=data.get("role", "unknown"),
                    post_count=data.get("post_count", 0)
                )
            else:
                logger.warning(f"Failed to get author info: {response.get('error')}")
                return AuthorInfo(role="unknown", post_count=0)
        except Exception as e:
            logger.error(f"Error getting author info: {e}")
            return AuthorInfo(role="unknown", post_count=0)

    def _make_request(self, payload: Dict[str, Any]) -> Dict[str, Any]:
        """Make HTTP POST request to ai-publisher.php.

        Args:
            payload: JSON payload to send.

        Returns:
            Response dictionary from the server.

        Raises:
            requests.RequestException: If the HTTP request fails.
            ValueError: If the response is not valid JSON.
        """
        try:
            response = requests.post(
                self.endpoint,
                json=payload,
                timeout=DEFAULT_TIMEOUT
            )
            response.raise_for_status()
            return response.json()
        except requests.Timeout:
            logger.error(f"Request timeout after {DEFAULT_TIMEOUT}s")
            raise
        except requests.RequestException as e:
            logger.error(f"HTTP request failed: {e}")
            raise
        except ValueError as e:
            logger.error(f"Invalid JSON response: {e}")
            raise


if __name__ == "__main__":
    # Simple test/demo
    import sys

    logging.basicConfig(level=logging.INFO)

    client = WordPressClient()
    print(f"WordPressClient initialized with base_url: {client.base_url}")

    # Test get_modified_posts (will return empty if WordPress not running)
    try:
        posts = client.get_modified_posts(limit=5)
        print(f"Found {len(posts)} posts")
    except Exception as e:
        print(f"Note: Could not connect to WordPress: {e}")
