#!/usr/bin/env python3
"""
Evolution WebMCP Bridge

Connects the Evolution Daemon to WebMCP tools for WordPress building.

Architecture:
┌──────────────────────┐     ┌──────────────────────┐     ┌──────────────────────┐
│ Evolution Daemon     │ ──► │ WebMCP Bridge        │ ──► │ WordPress Admin      │
│ (improvement cycle)  │     │ invoke_tool()        │     │ (WebMCP tools)       │
└──────────────────────┘     └──────────────────────┘     └──────────────────────┘
                                      │
                                      ▼
                             ┌──────────────────────┐
                             │ Available Tools:     │
                             │ - createPost         │
                             │ - editPage           │
                             │ - addPlugin          │
                             │ - modifyTheme        │
                             │ - runSQL             │
                             └──────────────────────┘

Usage:
    from systems.visual_shell.api.evolution_webmcp_bridge import (
        EvolutionWebMCPBridge, WordPressTools
    )

    bridge = EvolutionWebMCPBridge(wordpress_url="http://localhost:8080")

    # Create a post
    result = bridge.create_post(
        title="Evolution Log: Cycle 50",
        content="<p>System improved by 12%...</p>"
    )

    # Update architecture page
    bridge.edit_page(
        slug="neural-substrate",
        section="components",
        content="<h3>New Component</h3>..."
    )
"""

import json
import logging
import time
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Optional, Dict, Any, List, Callable
import requests

logger = logging.getLogger("evolution_webmcp_bridge")


@dataclass
class WebMCPTool:
    """Represents a WebMCP tool definition."""
    name: str
    description: str
    parameters: Dict[str, Any]
    returns: str = "object"


@dataclass
class ToolInvocation:
    """Represents a tool invocation request."""
    tool: str
    arguments: Dict[str, Any]
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())


class WordPressTools:
    """
    WebMCP tool definitions for WordPress.

    These are the tools that the Evolution Daemon can invoke to build
    and modify the WordPress semantic district.
    """

    # Tool: Create a new post
    CREATE_POST = WebMCPTool(
        name="createPost",
        description="Create a new WordPress post with title and content",
        parameters={
            "type": "object",
            "properties": {
                "title": {"type": "string", "description": "Post title"},
                "content": {"type": "string", "description": "HTML content"},
                "category": {"type": "string", "description": "Post category"},
                "tags": {"type": "array", "items": {"type": "string"}},
                "status": {"type": "string", "enum": ["draft", "publish", "private"]}
            },
            "required": ["title", "content"]
        }
    )

    # Tool: Edit an existing page
    EDIT_PAGE = WebMCPTool(
        name="editPage",
        description="Edit an existing WordPress page by slug or ID",
        parameters={
            "type": "object",
            "properties": {
                "slug": {"type": "string", "description": "Page slug"},
                "page_id": {"type": "integer", "description": "Page ID"},
                "section": {"type": "string", "description": "Section to update"},
                "content": {"type": "string", "description": "New HTML content"},
                "append": {"type": "boolean", "description": "Append to section"}
            }
        }
    )

    # Tool: Update architecture documentation
    UPDATE_ARCHITECTURE = WebMCPTool(
        name="updateArchitecture",
        description="Update the living architecture documentation page",
        parameters={
            "type": "object",
            "properties": {
                "component": {"type": "string", "description": "Component name"},
                "description": {"type": "string", "description": "Component description"},
                "path": {"type": "string", "description": "File path"},
                "status": {"type": "string", "enum": ["active", "deprecated", "planned"]}
            }
        }
    )

    # Tool: Log evolution event
    LOG_EVOLUTION = WebMCPTool(
        name="logEvolution",
        description="Log an evolution daemon improvement event",
        parameters={
            "type": "object",
            "properties": {
                "cycle": {"type": "integer"},
                "target": {"type": "string"},
                "improvement": {"type": "string"},
                "delta": {"type": "number"},
                "success": {"type": "boolean"}
            },
            "required": ["cycle", "target", "improvement", "delta"]
        }
    )

    # Tool: Create dashboard widget
    CREATE_WIDGET = WebMCPTool(
        name="createWidget",
        description="Create a WordPress dashboard widget",
        parameters={
            "type": "object",
            "properties": {
                "title": {"type": "string"},
                "content": {"type": "string"},
                "position": {"type": "string", "enum": ["left", "right", "center"]}
            }
        }
    )

    ALL_TOOLS = [CREATE_POST, EDIT_PAGE, UPDATE_ARCHITECTURE, LOG_EVOLUTION, CREATE_WIDGET]


class EvolutionWebMCPBridge:
    """
    Bridge between Evolution Daemon and WordPress via WebMCP.

    This enables the daemon to:
    - Create posts for evolution logs
    - Update living documentation pages
    - Build WordPress UI components
    - Maintain semantic memory
    """

    def __init__(
        self,
        wordpress_url: str = "http://localhost:8080",
        api_endpoint: str = "/wp-json/geometry-os/v1",
        auth_token: Optional[str] = None,
        timeout: float = 10.0,
        enabled: bool = True
    ):
        """
        Initialize the bridge.

        Args:
            wordpress_url: WordPress base URL
            api_endpoint: API endpoint path
            auth_token: Optional authentication token
            timeout: Request timeout
            enabled: Whether bridge is enabled
        """
        self.wordpress_url = wordpress_url.rstrip('/')
        self.api_endpoint = api_endpoint
        self.auth_token = auth_token
        self.timeout = timeout
        self.enabled = enabled

        self._invocation_log: List[ToolInvocation] = []
        self._stats = {
            "total_invocations": 0,
            "successful": 0,
            "failed": 0
        }

        # Check connectivity
        self._available = self._check_availability() if enabled else False

        if self._available:
            logger.info(f"EvolutionWebMCPBridge connected to {wordpress_url}")
        else:
            logger.info(f"EvolutionWebMCPBridge initialized (WordPress not available)")

    def _check_availability(self) -> bool:
        """Check if WordPress WebMCP endpoint is available."""
        try:
            response = requests.get(
                f"{self.wordpress_url}{self.api_endpoint}/tools",
                timeout=self.timeout
            )
            return response.status_code == 200
        except Exception:
            return False

    def _get_headers(self) -> Dict[str, str]:
        """Get request headers."""
        headers = {
            "Content-Type": "application/json"
        }
        if self.auth_token:
            headers["Authorization"] = f"Bearer {self.auth_token}"
        return headers

    def invoke_tool(self, tool_name: str, arguments: Dict[str, Any]) -> Dict[str, Any]:
        """
        Invoke a WebMCP tool.

        Args:
            tool_name: Name of the tool to invoke
            arguments: Tool arguments

        Returns:
            Tool result
        """
        if not self.enabled or not self._available:
            logger.debug(f"Bridge disabled/unavailable, skipping: {tool_name}")
            return {"success": False, "error": "Bridge not available"}

        invocation = ToolInvocation(tool=tool_name, arguments=arguments)
        self._invocation_log.append(invocation)
        self._stats["total_invocations"] += 1

        try:
            response = requests.post(
                f"{self.wordpress_url}{self.api_endpoint}/invoke",
                headers=self._get_headers(),
                json={"tool": tool_name, "arguments": arguments},
                timeout=self.timeout
            )

            if response.status_code == 200:
                result = response.json()
                self._stats["successful"] += 1
                logger.info(f"Tool invoked successfully: {tool_name}")
                return {"success": True, "result": result}
            else:
                self._stats["failed"] += 1
                logger.warning(f"Tool invocation failed: {response.status_code}")
                return {"success": False, "error": f"HTTP {response.status_code}"}

        except Exception as e:
            self._stats["failed"] += 1
            logger.error(f"Tool invocation error: {e}")
            return {"success": False, "error": str(e)}

    # Convenience methods for common operations

    def create_post(
        self,
        title: str,
        content: str,
        category: Optional[str] = None,
        tags: Optional[List[str]] = None,
        status: str = "publish"
    ) -> Dict[str, Any]:
        """Create a WordPress post."""
        args = {
            "title": title,
            "content": content,
            "status": status
        }
        if category:
            args["category"] = category
        if tags:
            args["tags"] = tags

        return self.invoke_tool("createPost", args)

    def edit_page(
        self,
        slug: Optional[str] = None,
        page_id: Optional[int] = None,
        content: Optional[str] = None,
        section: Optional[str] = None,
        append: bool = False
    ) -> Dict[str, Any]:
        """Edit a WordPress page."""
        args = {}
        if slug:
            args["slug"] = slug
        if page_id:
            args["page_id"] = page_id
        if content:
            args["content"] = content
        if section:
            args["section"] = section
        args["append"] = append

        return self.invoke_tool("editPage", args)

    def update_architecture(
        self,
        component: str,
        description: str,
        path: str,
        status: str = "active"
    ) -> Dict[str, Any]:
        """Update architecture documentation."""
        return self.invoke_tool("updateArchitecture", {
            "component": component,
            "description": description,
            "path": path,
            "status": status
        })

    def log_evolution(
        self,
        cycle: int,
        target: str,
        improvement: str,
        delta: float,
        success: bool = True
    ) -> Dict[str, Any]:
        """Log an evolution event to WordPress."""
        return self.invoke_tool("logEvolution", {
            "cycle": cycle,
            "target": target,
            "improvement": improvement,
            "delta": delta,
            "success": success
        })

    def get_available_tools(self) -> List[WebMCPTool]:
        """Get list of available WebMCP tools."""
        return WordPressTools.ALL_TOOLS

    def get_stats(self) -> Dict[str, Any]:
        """Get bridge statistics."""
        return {
            **self._stats,
            "enabled": self.enabled,
            "available": self._available,
            "wordpress_url": self.wordpress_url
        }


class EvolutionWebMCPHook:
    """
    Hook that connects Evolution Daemon to WordPress via WebMCP.

    When the daemon makes improvements, this hook automatically
    logs them to WordPress and updates living documentation.
    """

    def __init__(
        self,
        bridge: Optional[EvolutionWebMCPBridge] = None,
        log_improvements: bool = True,
        update_architecture: bool = True,
        min_delta_threshold: float = 0.05
    ):
        """
        Initialize the hook.

        Args:
            bridge: WebMCP bridge instance
            log_improvements: Whether to log improvements to WordPress
            update_architecture: Whether to update architecture docs
            min_delta_threshold: Minimum delta to trigger logging
        """
        self.bridge = bridge or EvolutionWebMCPBridge()
        self.log_improvements = log_improvements
        self.update_architecture = update_architecture
        self.min_delta_threshold = min_delta_threshold

    def on_improvement(
        self,
        cycle: int,
        target: str,
        improvement: str,
        delta: float,
        success: bool = True
    ) -> bool:
        """
        Called when daemon makes an improvement.

        Args:
            cycle: Evolution cycle number
            target: Target file/component
            improvement: Description of improvement
            delta: Improvement delta
            success: Whether improvement was accepted

        Returns:
            True if logged successfully
        """
        if abs(delta) < self.min_delta_threshold:
            return False

        result = False

        # Log to WordPress
        if self.log_improvements:
            log_result = self.bridge.log_evolution(
                cycle=cycle,
                target=target,
                improvement=improvement,
                delta=delta,
                success=success
            )
            result = log_result.get("success", False)

        # Update architecture if significant
        if self.update_architecture and success and delta > 0.1:
            self.bridge.update_architecture(
                component=Path(target).stem,
                description=improvement,
                path=target,
                status="active"
            )

        return result


# Convenience function
def create_evolution_wordpress_hook(
    wordpress_url: str = "http://localhost:8080"
) -> EvolutionWebMCPHook:
    """Create an Evolution WebMCP hook."""
    bridge = EvolutionWebMCPBridge(wordpress_url=wordpress_url)
    return EvolutionWebMCPHook(bridge=bridge)


if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description="Evolution WebMCP Bridge")
    parser.add_argument("--url", default="http://localhost:8080", help="WordPress URL")
    parser.add_argument("--tools", action="store_true", help="List available tools")
    parser.add_argument("--test", action="store_true", help="Test connection")
    parser.add_argument("--stats", action="store_true", help="Show stats")

    args = parser.parse_args()

    logging.basicConfig(level=logging.INFO)

    bridge = EvolutionWebMCPBridge(wordpress_url=args.url)

    if args.tools:
        print("Available WebMCP Tools:")
        for tool in bridge.get_available_tools():
            print(f"  - {tool.name}: {tool.description}")

    if args.test:
        result = bridge.create_post(
            title="Test Post from Evolution Daemon",
            content="<p>This is a test post created via WebMCP.</p>"
        )
        print(f"Test result: {result}")

    if args.stats:
        print(json.dumps(bridge.get_stats(), indent=2))
