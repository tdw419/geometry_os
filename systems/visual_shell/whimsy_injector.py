"""
Whimsy Injector - Visual Delight for Geometry OS
Region: The Gallery (/ui/visuals)

This module provides the implementation for the WhimsyInjectorAgent's 
visual capabilities, including spring-physics animations, reactive glows, 
and "Neural City" aesthetic enhancements.
"""

import logging
import time
from dataclasses import dataclass, field
from typing import Any

logger = logging.getLogger("WhimsyInjector")

@dataclass
class WhimsyEffect:
    """A visual whimsy effect specification."""
    effect_id: str
    target_component: str
    effect_type: str  # 'spring_pulse', 'reactive_glow', 'particle_burst'
    params: dict[str, Any]
    duration: float
    start_time: float = field(default_factory=time.time)

class WhimsyEngine:
    """
    Engine that manages and manifests whimsy effects in the Visual Shell.
    """

    def __init__(self, visual_bridge=None):
        self.visual_bridge = visual_bridge
        self.active_effects: dict[str, WhimsyEffect] = {}
        self._running = False

    async def inject_spring_pulse(self, component_id: str, intensity: float = 1.0):
        """Inject a spring-physics pulse effect into a UI component."""
        effect_id = f"spring-{component_id}-{int(time.time())}"
        params = {
            "stiffness": 150 * intensity,
            "damping": 10,
            "mass": 1.0,
            "scale_multiplier": 1.1 * intensity
        }

        effect = WhimsyEffect(
            effect_id=effect_id,
            target_component=component_id,
            effect_type="spring_pulse",
            params=params,
            duration=2.0
        )

        self.active_effects[effect_id] = effect
        logger.info(f"✨ Injected spring pulse into {component_id}")

        if self.visual_bridge:
            # Manifest in PixiJS via bridge
            await self.visual_bridge.send_command("apply_shader_effect", {
                "component_id": component_id,
                "shader": "whimsy_spring_pulse",
                "params": params
            })

    async def inject_reactive_glow(self, component_id: str, color: str = "#4ECDC4"):
        """Inject a reactive glow that responds to user proximity or attention."""
        effect_id = f"glow-{component_id}-{int(time.time())}"
        params = {
            "color": color,
            "radius": 25.0,
            "pulse_freq": 0.5, # Hz
            "intensity": 0.8
        }

        effect = WhimsyEffect(
            effect_id=effect_id,
            target_component=component_id,
            effect_type="reactive_glow",
            params=params,
            duration=-1.0 # Persistent until cleared
        )

        self.active_effects[effect_id] = effect
        logger.info(f"🌟 Applied reactive glow to {component_id}")

        if self.visual_bridge:
            await self.visual_bridge.send_command("set_component_glow", {
                "component_id": component_id,
                "glow_params": params
            })

    async def clear_effect(self, effect_id: str):
        """Remove a whimsy effect."""
        if effect_id in self.active_effects:
            effect = self.active_effects.pop(effect_id)
            if self.visual_bridge:
                await self.visual_bridge.send_command("clear_shader_effect", {
                    "component_id": effect.target_component,
                    "effect_id": effect_id
                })

# Registry for the agent to call
_engine_instance: WhimsyEngine | None = None

def get_whimsy_engine(visual_bridge=None) -> WhimsyEngine:
    global _engine_instance
    if _engine_instance is None:
        _engine_instance = WhimsyEngine(visual_bridge)
    return _engine_instance
