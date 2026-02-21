"""
Layout Memory - Semantic Search Integration

Query WordPress Semantic District for similar layout patterns.
Enables agents to "remember" why a change happened by searching
past layout analysis results.

Integration with SynapticQueryEngine and Memory Beam system.
"""

import json
import time
from typing import List, Dict, Any, Optional
from dataclasses import dataclass, field
from pathlib import Path

try:
    import requests
    REQUESTS_AVAILABLE = True
except ImportError:
    REQUESTS_AVAILABLE = False


@dataclass
class LayoutMemory:
    """
    A remembered layout analysis from WordPress.

    Attributes:
        post_id: WordPress post ID
        title: Post title
        content: HTML content
        panel_count: Number of detected panels
        button_count: Number of detected buttons
        line_count: Number of detected lines
        timestamp: When it was published
        source_image: Original screenshot path (if available)
    """
    post_id: int
    title: str
    content: str = ""
    panel_count: int = 0
    button_count: int = 0
    line_count: int = 0
    timestamp: float = 0
    source_image: str = ""

    def similarity_score(self, other_panels: int, other_buttons: int) -> float:
        """
        Calculate similarity score to another layout.

        Args:
            other_panels: Panel count to compare
            other_buttons: Button count to compare

        Returns:
            Similarity score 0.0-1.0
        """
        # Simple similarity based on structure counts
        panel_diff = abs(self.panel_count - other_panels)
        button_diff = abs(self.button_count - other_buttons)

        # Normalize to 0-1 scale (assuming max differences of ~20)
        max_diff = 20
        similarity = 1.0 - (panel_diff + button_diff) / (2 * max_diff)

        return max(0.0, min(1.0, similarity))


class LayoutMemorySearch:
    """
    Search WordPress Semantic District for layout patterns.

    Usage:
        search = LayoutMemorySearch()
        results = search.query_similar_layouts(panel_count=5, button_count=10)
        for memory in results:
            print(f"Found similar layout: {memory.title}")
    """

    WORDPRESS_API = "http://localhost:8080/wp-json/wp/v2/posts"
    SEARCH_ENDPOINT = "http://localhost:8080/wp-json/wp/v2/posts"

    def __init__(self, cache_ttl: int = 300):
        """
        Initialize the search engine.

        Args:
            cache_ttl: Cache time-to-live in seconds (default: 5 min)
        """
        self.cache_ttl = cache_ttl
        self.cache: List[LayoutMemory] = []
        self.cache_time = 0

    def _fetch_posts(self, search: str = None, per_page: int = 50) -> List[Dict]:
        """Fetch posts from WordPress REST API."""
        if not REQUESTS_AVAILABLE:
            print("⚠️ requests not available for WordPress search")
            return []

        try:
            params = {"per_page": per_page}
            if search:
                params["search"] = search

            response = requests.get(self.SEARCH_ENDPOINT, params=params, timeout=10)
            if response.status_code == 200:
                return response.json()
        except Exception as e:
            print(f"⚠️ WordPress API error: {e}")

        return []

    def _parse_layout_memory(self, post: Dict) -> LayoutMemory:
        """Parse a WordPress post into LayoutMemory."""
        content = post.get("content", {}).get("rendered", "")
        title = post.get("title", {}).get("rendered", "")

        # Extract structure counts from content
        panel_count = self._extract_count(content, "Panels", "panel_count")
        button_count = self._extract_count(content, "Buttons", "button_count")
        line_count = self._extract_count(content, "Lines", "line_count", "Edges")

        # Extract source image if present
        source_image = ""
        if "Source:" in content or "source_image" in content:
            import re
            match = re.search(r'<code>([^<]+\.(?:png|jpg|jpeg))</code>', content)
            if match:
                source_image = match.group(1)

        return LayoutMemory(
            post_id=post.get("id", 0),
            title=title,
            content=content,
            panel_count=panel_count,
            button_count=button_count,
            line_count=line_count,
            timestamp=time.mktime(time.strptime(
                post.get("date", "2024-01-01T00:00:00"),
                "%Y-%m-%dT%H:%M:%S"
            )) if post.get("date") else 0,
            source_image=source_image
        )

    def _extract_count(self, content: str, *keywords) -> int:
        """Extract a count from HTML content by keyword."""
        import re

        # Try different patterns
        for keyword in keywords:
            # Pattern: <b>keyword</b></td><td>5</td>
            pattern = rf'>{keyword}</b></td><td>(\d+)</td>'
            match = re.search(pattern, content, re.IGNORECASE)
            if match:
                return int(match.group(1))

            # Pattern: keyword: 5
            pattern = rf'{keyword}:\s*(\d+)'
            match = re.search(pattern, content, re.IGNORECASE)
            if match:
                return int(match.group(1))

        return 0

    def _refresh_cache(self):
        """Refresh the cache from WordPress."""
        if time.time() - self.cache_time < self.cache_ttl:
            return

        posts = self._fetch_posts(per_page=100)
        self.cache = [self._parse_layout_memory(p) for p in posts]
        self.cache_time = time.time()
        print(f"📖 Cached {len(self.cache)} layout memories from WordPress")

    def query_similar_layouts(
        self,
        panel_count: int,
        button_count: int,
        tolerance: int = 2,
        limit: int = 5
    ) -> List[LayoutMemory]:
        """
        Search for layouts with similar structure.

        Args:
            panel_count: Target panel count
            button_count: Target button count
            tolerance: Allowed difference in counts (default: 2)
            limit: Maximum results to return

        Returns:
            List of similar LayoutMemory objects
        """
        self._refresh_cache()

        results = []
        for memory in self.cache:
            panel_match = abs(memory.panel_count - panel_count) <= tolerance
            button_match = abs(memory.button_count - button_count) <= tolerance

            if panel_match or button_match:
                memory.similarity_score(panel_count, button_count)
                results.append(memory)

        # Sort by similarity (highest first)
        results.sort(
            key=lambda m: m.similarity_score(panel_count, button_count),
            reverse=True
        )

        return results[:limit]

    def query_by_keyword(self, keyword: str, limit: int = 10) -> List[LayoutMemory]:
        """
        Search for layouts by keyword in title or content.

        Args:
            keyword: Search term
            limit: Maximum results

        Returns:
            List of matching LayoutMemory objects
        """
        self._refresh_cache()

        keyword_lower = keyword.lower()
        results = []

        for memory in self.cache:
            if keyword_lower in memory.title.lower() or keyword_lower in memory.content.lower():
                results.append(memory)

        return results[:limit]

    def get_recent_memories(self, hours: int = 24, limit: int = 10) -> List[LayoutMemory]:
        """
        Get recent layout memories.

        Args:
            hours: Look back period in hours
            limit: Maximum results

        Returns:
            List of recent LayoutMemory objects
        """
        self._refresh_cache()

        cutoff = time.time() - (hours * 3600)
        results = [m for m in self.cache if m.timestamp >= cutoff]

        # Sort by timestamp (newest first)
        results.sort(key=lambda m: m.timestamp, reverse=True)

        return results[:limit]

    def get_structure_statistics(self) -> Dict[str, Any]:
        """
        Get statistics about remembered layouts.

        Returns:
            Dict with average counts, total memories, etc.
        """
        self._refresh_cache()

        if not self.cache:
            return {"total_memories": 0}

        panels = [m.panel_count for m in self.cache]
        buttons = [m.button_count for m in self.cache]
        lines = [m.line_count for m in self.cache]

        return {
            "total_memories": len(self.cache),
            "avg_panels": sum(panels) / len(panels),
            "avg_buttons": sum(buttons) / len(buttons),
            "avg_lines": sum(lines) / len(lines),
            "max_panels": max(panels),
            "max_buttons": max(buttons),
            "most_recent": max(m.timestamp for m in self.cache) if self.cache else 0
        }


# Convenience functions
def query_similar_layouts(panel_count: int, button_count: int, tolerance: int = 2) -> List[LayoutMemory]:
    """Convenience function to search for similar layouts."""
    search = LayoutMemorySearch()
    return search.query_similar_layouts(panel_count, button_count, tolerance)


def query_layout_memory(keyword: str) -> List[LayoutMemory]:
    """Convenience function to search by keyword."""
    search = LayoutMemorySearch()
    return search.query_by_keyword(keyword)


# CLI interface
if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Layout Memory Search")
    parser.add_argument("--panels", type=int, help="Panel count to search")
    parser.add_argument("--buttons", type=int, help="Button count to search")
    parser.add_argument("--keyword", type=str, help="Keyword to search")
    parser.add_argument("--stats", action="store_true", help="Show statistics")
    parser.add_argument("--recent", type=int, help="Show recent N memories")

    args = parser.parse_args()

    search = LayoutMemorySearch()

    if args.stats:
        stats = search.get_structure_statistics()
        print(f"📊 Layout Memory Statistics:")
        print(f"  Total memories: {stats.get('total_memories', 0)}")
        print(f"  Avg panels: {stats.get('avg_panels', 0):.1f}")
        print(f"  Avg buttons: {stats.get('avg_buttons', 0):.1f}")

    elif args.panels is not None and args.buttons is not None:
        results = search.query_similar_layouts(args.panels, args.buttons)
        print(f"🔍 Found {len(results)} similar layouts:")
        for m in results:
            print(f"  - {m.title} (Panels: {m.panel_count}, Buttons: {m.button_count})")

    elif args.keyword:
        results = search.query_by_keyword(args.keyword)
        print(f"🔍 Found {len(results)} matching layouts:")
        for m in results:
            print(f"  - {m.title}")

    elif args.recent:
        results = search.get_recent_memories(hours=24, limit=args.recent)
        print(f"🕐 Recent {len(results)} layouts:")
        for m in results:
            print(f"  - {m.title}")

    else:
        parser.print_help()
