"""
VisualPerceptionAgent - The "Retina" of the Swarm.
Integrates the Visual Extraction Pipeline to provide semantic grounding for the Collective Consciousness.
"""

import asyncio
import logging
import json
from typing import Dict, Any, Optional
from systems.visual_shell.swarm.worker_agent import WorkerAgent
from systems.visual_shell.swarm.visual_perception.extraction_pipeline import extract_gui as extract_gui_from_image

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
        
        logger.info(f"VisualPerceptionAgent {agent_id} initialized")

    async def handle_message(self, msg: Dict[str, Any]) -> Dict[str, Any]:
        """Handle incoming perception requests."""
        msg_type = msg.get("type")
        
        if msg_type == "PERCEIVE_REGION":
            return await self._handle_perceive_region(msg)
            
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
