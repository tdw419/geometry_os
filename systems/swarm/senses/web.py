"""
Web sense for HTTP access with rate limiting.
"""

import asyncio
from typing import Optional

import httpx

from systems.swarm.senses.base import SenseResult


class WebSense:
    """
    HTTP client sense with timeout and rate limiting.

    Security: Requests are rate-limited and have timeouts to prevent abuse.
    """

    def __init__(
        self,
        timeout: float = 30.0,
        max_requests_per_minute: int = 60,
    ):
        """
        Initialize WebSense.

        Args:
            timeout: Request timeout in seconds
            max_requests_per_minute: Rate limit for requests
        """
        self._timeout = timeout
        self._max_requests_per_minute = max_requests_per_minute
        self._request_timestamps: list[float] = []

    def _check_rate_limit(self) -> Optional[str]:
        """
        Check if rate limit has been exceeded.

        Returns error message if over limit, None otherwise.
        """
        import time
        now = time.time()
        window_start = now - 60.0

        # Remove old timestamps
        self._request_timestamps = [
            ts for ts in self._request_timestamps if ts > window_start
        ]

        if len(self._request_timestamps) >= self._max_requests_per_minute:
            return f"Rate limit exceeded: {self._max_requests_per_minute} requests per minute"

        self._request_timestamps.append(now)
        return None

    async def fetch(self, url: str, method: str = "GET") -> SenseResult:
        """
        Fetch URL asynchronously.

        Args:
            url: URL to fetch
            method: HTTP method (GET, POST, etc.)

        Returns:
            SenseResult with response text on success
        """
        # Check rate limit
        rate_error = self._check_rate_limit()
        if rate_error:
            return SenseResult(success=False, error=rate_error)

        try:
            async with httpx.AsyncClient(timeout=self._timeout) as client:
                response = await client.request(method, url)
                response.raise_for_status()
                return SenseResult(
                    success=True,
                    data={
                        "status_code": response.status_code,
                        "content": response.text,
                        "headers": dict(response.headers),
                    }
                )
        except httpx.TimeoutException:
            return SenseResult(success=False, error=f"Request timed out after {self._timeout}s")
        except httpx.HTTPStatusError as e:
            return SenseResult(success=False, error=f"HTTP error {e.response.status_code}")
        except Exception as e:
            return SenseResult(success=False, error=f"Request failed: {e}")
