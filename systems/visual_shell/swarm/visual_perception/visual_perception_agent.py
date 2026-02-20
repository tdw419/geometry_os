"""
VisualPerceptionAgent - The "Retina" of the Swarm.
Integrates the Visual Extraction Pipeline to provide semantic grounding for the Collective Consciousness.
"""

import asyncio
import logging
import json
import uuid
from typing import Dict, Any, Optional
from systems.visual_shell.swarm.worker_agent import WorkerAgent
from systems.visual_shell.swarm.visual_perception.extraction_pipeline import extract_gui as extract_gui_from_image
from systems.visual_shell.swarm.visual_perception.completion_detector import CompletionDetector, CompletionMatch

logger = logging.getLogger(__name__)

class VisualPerceptionAgent(WorkerAgent):
    """
    Perceives visual regions of the infinite map and extracts semantic structure.
    Uses Change-Aware Broadcasting to minimize noise.
    """

    def __init__(self, agent_id: str):
        super().__init__(agent_id=agent_id)
        self.capabilities = []
        self.capabilities.extend(["visual_perception", "extraction"])
        self.last_state: Dict[str, Any] = {} # Map of region_id -> last_json_state
        self._active_monitors: Dict[str, asyncio.Task] = {}
        self._completion_detector = CompletionDetector()

        logger.info(f"VisualPerceptionAgent {agent_id} initialized")

    async def handle_message(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Handle incoming perception requests."""
        msg_type = msg.get("type")

        if msg_type == "PERCEIVE_REGION":
            return await self._handle_perceive_region(msg)
        elif msg_type == "MONITOR_RENDER":
            return await self._handle_monitor_render(msg)
        elif msg_type == "STOP_MONITOR":
            return await self._handle_stop_monitor(msg)

        return await super().handle_message(msg)

    async def _handle_perceive_region(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Process a request to perceive a specific map region."""
        payload = msg.get("payload", {})
        region = payload.get("region")
        
        if not region:
            return {"error": "Missing region data"}
            
        # In a real system, we'd capture a screenshot of this region here
        # For this implementation, we assume the payload might contain image data or a reference
        # Or we use a mock/placeholder if no image provided (for testing)
        image_path = payload.get("image_path") 
        
        try:
            # Extract semantic structure
            scene_graph = self._extract_region(region, image_path)
            
            # Check for changes if this is a monitored region
            region_id = f"{region['x']},{region['y']}"
            changed = self._detect_change(self.last_state.get(region_id), scene_graph)
            
            if changed:
                self.last_state[region_id] = scene_graph
                # In a real loop, we would broadcast this update
                
            return {
                "type": "PERCEPTION_RESULT",
                "payload": {
                    "region_id": region_id,
                    "scene_graph": scene_graph,
                    "changed": changed
                }
            }
            
        except Exception as e:
            logger.error(f"Perception failed: {e}")
            return {"error": str(e)}

    def _extract_region(self, region: Dict[str, int], image_path: Optional[str] = None) -> Dict[str, Any]:
        """Run the extraction pipeline on the region."""
        if not image_path:
            # Return empty structure for testing/mocking without actual image I/O
            return {"widgets": [], "metadata": {"status": "no_image"}}
            
        # Call the actual pipeline
        # Note: extract_gui_from_image needs to be imported or adapted from extraction_pipeline.py
        # For now, we wrap it safely
        try:
            # This is a synchronous call, might want to run in executor for production
            result = extract_gui_from_image(image_path) 
            return result
        except Exception as e:
            logger.error(f"Extraction pipeline error: {e}")
            return {"widgets": [], "error": str(e)}

    def _detect_change(self, old_state: Optional[Dict], new_state: Dict) -> bool:
        """Detect meaningful semantic changes between two states."""
        if old_state is None:
            return True
            
        # Compare widget counts
        if len(old_state.get("widgets", [])) != len(new_state.get("widgets", [])):
            return True
            
        # Deep compare widgets (simplified)
        # In production, use a more robust diffing (e.g., text content, widget types)
        # Avoiding direct JSON string compare to handle ordering/metadata noise
        
        old_widgets = sorted([w.get("text", "") for w in old_state.get("widgets", [])])
        new_widgets = sorted([w.get("text", "") for w in new_state.get("widgets", [])])

        return old_widgets != new_widgets

    # === Render Monitoring ===

    async def _handle_monitor_render(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Start monitoring for render completion."""
        payload = msg.get("payload", {})
        result = await self._start_render_monitor(payload)
        return {
            "type": "MONITORING_STARTED",
            "payload": result
        }

    async def _handle_stop_monitor(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Stop monitoring."""
        monitor_id = msg.get("payload", {}).get("monitor_id")
        if not monitor_id:
            return {"type": "MONITOR_ERROR", "payload": {"error": "Missing monitor_id"}}

        result = await self._stop_render_monitor(monitor_id)
        return {
            "type": "MONITORING_STOPPED",
            "payload": result
        }

    async def _start_render_monitor(self, config: Dict[str, Any]) -> Dict[str, Any]:
        """Start a render monitoring task."""
        monitor_id = f"render-monitor-{uuid.uuid4().hex[:8]}"
        vm_id = config.get("vm_id", "default")
        poll_interval = config.get("poll_interval", 5)

        # Create and start the monitoring task
        task = asyncio.create_task(
            self._run_monitor_loop(monitor_id, vm_id, config)
        )
        self._active_monitors[monitor_id] = task

        logger.info(f"Started render monitor {monitor_id} for VM {vm_id}")

        return {
            "monitor_id": monitor_id,
            "vm_id": vm_id,
            "status": "active",
            "poll_interval": poll_interval
        }

    async def _stop_render_monitor(self, monitor_id: str) -> Dict[str, Any]:
        """Stop a render monitoring task."""
        if monitor_id not in self._active_monitors:
            return {"status": "not_found", "monitor_id": monitor_id}

        task = self._active_monitors.pop(monitor_id)
        task.cancel()
        try:
            await task
        except asyncio.CancelledError:
            pass

        logger.info(f"Stopped render monitor {monitor_id}")
        return {"status": "stopped", "monitor_id": monitor_id}

    async def _run_monitor_loop(self, monitor_id: str, vm_id: str, config: Dict[str, Any]):
        """Background task that monitors for render completion."""
        poll_interval = config.get("poll_interval", 5)
        timeout = config.get("timeout", 3600)  # 1 hour default
        start_time = asyncio.get_event_loop().time()

        logger.info(f"Monitor loop {monitor_id} started, polling every {poll_interval}s")

        try:
            while True:
                # Check timeout
                elapsed = asyncio.get_event_loop().time() - start_time
                if elapsed > timeout:
                    await self._broadcast_event({
                        "type": "MONITOR_TIMEOUT",
                        "payload": {"monitor_id": monitor_id, "vm_id": vm_id}
                    })
                    break

                # Capture and analyze screenshot
                try:
                    screenshot_path = await self._capture_vm_screenshot(vm_id, config)
                    result = await self._extract_from_screenshot(screenshot_path)

                    # Check for completion
                    match = self._completion_detector.detect(result)
                    if match:
                        await self._broadcast_event({
                            "type": "RENDER_COMPLETE",
                            "payload": {
                                "monitor_id": monitor_id,
                                "vm_id": vm_id,
                                "detected_text": match.text,
                                "pattern": match.pattern,
                                "screenshot_path": screenshot_path
                            }
                        })
                        break

                except Exception as e:
                    logger.warning(f"Monitor {monitor_id} capture/extraction error: {e}")

                await asyncio.sleep(poll_interval)

        except asyncio.CancelledError:
            logger.info(f"Monitor {monitor_id} cancelled")
            raise
        finally:
            # Cleanup
            if monitor_id in self._active_monitors:
                del self._active_monitors[monitor_id]

    async def _capture_vm_screenshot(self, vm_id: str, config: Dict[str, Any]) -> str:
        """Capture VM screenshot."""
        # Import screenshot utility
        try:
            from conductor.tracks.shotcut_on_the_map.screenshot_vm import capture_vm_screenshot
            return await capture_vm_screenshot(vm_id)
        except ImportError:
            # Fallback for testing
            logger.warning("screenshot_vm not available, using mock")
            return f"/tmp/mock_screenshot_{vm_id}.png"

    async def _extract_from_screenshot(self, screenshot_path: str) -> Dict[str, Any]:
        """Run extraction pipeline on screenshot."""
        try:
            result = extract_gui_from_image(screenshot_path)
            return result
        except Exception as e:
            logger.error(f"Extraction failed: {e}")
            return {"widgets": [], "error": str(e)}

    async def _broadcast_event(self, event: Dict[str, Any]):
        """Broadcast event to swarm."""
        if hasattr(self, 'send_event'):
            await self.send_event(event)
        else:
            logger.info(f"Event broadcast: {event['type']}")
