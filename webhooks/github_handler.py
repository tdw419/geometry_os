#!/usr/bin/env python3
"""
GitHub Webhook Handler for Geometry OS

Handles GitHub webhooks and triggers appropriate agent actions.

Setup:
1. Run this server: python github_webhook_handler.py
2. Configure GitHub webhook to point to http://your-server:8080/webhook
3. Set GITHUB_WEBHOOK_SECRET environment variable

Endpoints:
  POST /webhook - Receives GitHub webhooks
  GET /health - Health check
  GET /status - Current queue status
"""

import asyncio
import hashlib
import hmac
import json
import os
import subprocess
from pathlib import Path
from typing import Dict, Any, Optional
from dataclasses import dataclass
from datetime import datetime
import logging
from aiohttp import web

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("github-webhook")

# Configuration
GEOMETRY_OS_ROOT = Path(__file__).parent.parent
WEBHOOK_SECRET = os.environ.get("GITHUB_WEBHOOK_SECRET", "dev-secret")
PORT = int(os.environ.get("WEBHOOK_PORT", "8080"))

# Queue for processing events
event_queue: asyncio.Queue = asyncio.Queue()
processing = False


@dataclass
class WebhookEvent:
    event_type: str
    action: str
    payload: Dict[str, Any]
    timestamp: str


def verify_signature(payload: bytes, signature: str) -> bool:
    """Verify GitHub webhook signature."""
    if not signature.startswith("sha256="):
        return False
    
    expected = signature[7:]
    computed = hmac.new(
        WEBHOOK_SECRET.encode(),
        payload,
        hashlib.sha256
    ).hexdigest()
    
    return hmac.compare_digest(expected, computed)


async def spawn_agent_for_event(event: WebhookEvent) -> Dict[str, Any]:
    """Spawn appropriate agent based on webhook event."""
    
    if event.event_type == "pull_request":
        return await handle_pr_event(event)
    elif event.event_type == "issues":
        return await handle_issue_event(event)
    elif event.event_type == "push":
        return await handle_push_event(event)
    elif event.event_type == "release":
        return await handle_release_event(event)
    else:
        return {"status": "ignored", "reason": f"Unhandled event type: {event.event_type}"}


async def handle_pr_event(event: WebhookEvent) -> Dict[str, Any]:
    """Handle pull request events."""
    pr = event.payload.get("pull_request", {})
    action = event.action
    pr_number = pr.get("number")
    repo = event.payload.get("repository", {}).get("full_name", "unknown")
    
    if action == "opened":
        # Spawn review agent
        logger.info(f"New PR #{pr_number} in {repo} - spawning review agent")
        
        # Create review task file
        task_dir = GEOMETRY_OS_ROOT / ".ai-pm-artifacts" / "github-prs"
        task_dir.mkdir(parents=True, exist_ok=True)
        
        task_file = task_dir / f"pr-{pr_number}-review.json"
        task_file.write_text(json.dumps({
            "type": "pr_review",
            "pr_number": pr_number,
            "repo": repo,
            "title": pr.get("title"),
            "author": pr.get("user", {}).get("login"),
            "url": pr.get("html_url"),
            "created": datetime.now().isoformat(),
            "status": "pending"
        }, indent=2))
        
        return {
            "status": "spawned",
            "agent": "review-agent",
            "pr_number": pr_number,
            "task_file": str(task_file)
        }
    
    elif action == "closed" and pr.get("merged"):
        # PR merged - update roadmap
        logger.info(f"PR #{pr_number} merged - updating roadmap")
        return {"status": "noted", "action": "merged"}
    
    return {"status": "ignored", "action": action}


async def handle_issue_event(event: WebhookEvent) -> Dict[str, Any]:
    """Handle issue events."""
    issue = event.payload.get("issue", {})
    action = event.action
    issue_number = issue.get("number")
    labels = [l.get("name") for l in issue.get("labels", [])]
    
    if action == "opened":
        # Check if it's a bug or feature request
        is_bug = "bug" in labels or "bug" in issue.get("title", "").lower()
        is_feature = "enhancement" in labels or "feature" in issue.get("title", "").lower()
        
        if is_bug:
            logger.info(f"Bug issue #{issue_number} - spawning research agent")
            agent_type = "bug-research"
        elif is_feature:
            logger.info(f"Feature issue #{issue_number} - spawning design agent")
            agent_type = "feature-design"
        else:
            agent_type = "triage"
        
        # Create issue task
        task_dir = GEOMETRY_OS_ROOT / ".ai-pm-artifacts" / "github-issues"
        task_dir.mkdir(parents=True, exist_ok=True)
        
        task_file = task_dir / f"issue-{issue_number}.json"
        task_file.write_text(json.dumps({
            "type": "issue_analysis",
            "agent": agent_type,
            "issue_number": issue_number,
            "title": issue.get("title"),
            "body": issue.get("body"),
            "labels": labels,
            "url": issue.get("html_url"),
            "created": datetime.now().isoformat(),
            "status": "pending"
        }, indent=2))
        
        return {
            "status": "spawned",
            "agent": agent_type,
            "issue_number": issue_number
        }
    
    return {"status": "ignored", "action": action}


async def handle_push_event(event: WebhookEvent) -> Dict[str, Any]:
    """Handle push events."""
    ref = event.payload.get("ref", "")
    commits = event.payload.get("commits", [])
    repo = event.payload.get("repository", {}).get("full_name", "unknown")
    
    if ref == "refs/heads/master" or ref == "refs/heads/main":
        logger.info(f"Push to main in {repo}: {len(commits)} commits")
        
        # Trigger CI pipeline
        # Could spawn test-agent, visual-regression, etc.
        
        return {
            "status": "triggered",
            "pipeline": "post-merge",
            "commits": len(commits)
        }
    
    return {"status": "noted", "branch": ref}


async def handle_release_event(event: WebhookEvent) -> Dict[str, Any]:
    """Handle release events."""
    release = event.payload.get("release", {})
    action = event.action
    tag = release.get("tag_name")
    
    if action == "published":
        logger.info(f"Release {tag} published - spawning announcement agent")
        return {
            "status": "spawned",
            "agent": "release-announce",
            "tag": tag
        }
    
    return {"status": "ignored", "action": action}


async def process_queue():
    """Process events from the queue."""
    global processing
    
    while True:
        try:
            event = await asyncio.wait_for(event_queue.get(), timeout=1.0)
            processing = True
            
            logger.info(f"Processing {event.event_type}.{event.action}")
            result = await spawn_agent_for_event(event)
            logger.info(f"Result: {result}")
            
            processing = False
            
        except asyncio.TimeoutError:
            continue
        except Exception as e:
            logger.exception(f"Error processing event")
            processing = False


# HTTP Handlers

async def webhook_handler(request: web.Request) -> web.Response:
    """Handle incoming GitHub webhook."""
    
    # Verify signature
    signature = request.headers.get("X-Hub-Signature-256", "")
    payload = await request.read()
    
    if not verify_signature(payload, signature):
        logger.warning("Invalid webhook signature")
        return web.Response(status=401, text="Invalid signature")
    
    # Parse event
    event_type = request.headers.get("X-GitHub-Event", "unknown")
    
    try:
        body = json.loads(payload)
    except json.JSONDecodeError:
        return web.Response(status=400, text="Invalid JSON")
    
    action = body.get("action", "unknown")
    
    # Create event and queue for processing
    event = WebhookEvent(
        event_type=event_type,
        action=action,
        payload=body,
        timestamp=datetime.now().isoformat()
    )
    
    await event_queue.put(event)
    
    logger.info(f"Queued {event_type}.{action}")
    
    return web.Response(
        status=200,
        text=json.dumps({"status": "queued", "event": f"{event_type}.{action}"})
    )


async def health_handler(request: web.Request) -> web.Response:
    """Health check endpoint."""
    return web.Response(text="OK")


async def status_handler(request: web.Request) -> web.Response:
    """Queue status endpoint."""
    return web.Response(
        text=json.dumps({
            "queue_size": event_queue.qsize(),
            "processing": processing
        }, indent=2),
        content_type="application/json"
    )


def create_app() -> web.Application:
    """Create the web application."""
    app = web.Application()
    app.router.add_post("/webhook", webhook_handler)
    app.router.add_get("/health", health_handler)
    app.router.add_get("/status", status_handler)
    return app


async def main():
    """Run the webhook server."""
    app = create_app()
    
    # Start queue processor
    asyncio.create_task(process_queue())
    
    logger.info(f"Starting webhook server on port {PORT}")
    
    runner = web.AppRunner(app)
    await runner.setup()
    
    site = web.TCPSite(runner, "0.0.0.0", PORT)
    await site.start()
    
    # Run forever
    while True:
        await asyncio.sleep(3600)


if __name__ == "__main__":
    asyncio.run(main())
