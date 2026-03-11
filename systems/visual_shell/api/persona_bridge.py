"""
PersonaBridge - Bridges Rust Compositor PERSONA_SHIFT Events to PixelBrain

Receives PERSONA_SHIFT events from the Rust compositor via WebSocket,
loads the corresponding Agency Agent persona, and injects it into the
PixelBrain cognitive substrate for spatial cognition.

Phase 7: FFI Bridge Integration
"""

import logging
import re
from dataclasses import dataclass
from pathlib import Path
from typing import TYPE_CHECKING, Optional

if TYPE_CHECKING:
    from systems.pixel_brain.persona_injector import PersonaInjector
    from systems.visual_shell.api.visual_bridge import VisualBridge

logger = logging.getLogger(__name__)


# Persona path mapping from persona_id to Agency Agent markdown files
PERSONA_PATHS = {
    # Engineering Division
    "ai-engineer": "engineering/engineering-ai-engineer.md",
    "security-engineer": "engineering/engineering-security-engineer.md",
    "rapid-prototyper": "engineering/engineering-rapid-prototyper.md",
    "backend-architect": "engineering/engineering-backend-architect.md",
    "senior-developer": "engineering/engineering-senior-developer.md",

    # Testing Division
    "reality-checker": "testing/testing-reality-checker.md",
    "evidence-collector": "testing/testing-evidence-collector.md",
    "performance-benchmarker": "testing/testing-performance-benchmarker.md",
    "api-tester": "testing/testing-api-tester.md",
    "accessibility-auditor": "testing/testing-accessibility-auditor.md",

    # Spatial Computing Division
    "metal-engineer": "spatial-computing/macos-spatial-metal-engineer.md",
    "xr-architect": "spatial-computing/xr-interface-architect.md",
    "visionos-engineer": "spatial-computing/visionos-spatial-engineer.md",
    "xr-immersive-developer": "spatial-computing/xr-immersive-developer.md",

    # Specialized
    "orchestrator": "specialized/agents-orchestrator.md",
    "cultural-intelligence": "specialized/specialized-cultural-intelligence-strategist.md",
}


@dataclass
class PersonaShiftEvent:
    """
    Event from Rust compositor when viewport moves to a new persona sector.

    Attributes:
        persona_id: ID of the persona to activate (e.g., "reality-checker")
        sector_id: Spatial sector that triggered the shift
        position: (x, y) coordinates of the viewport
        timestamp: Unix timestamp of the shift event
    """
    persona_id: str
    sector_id: str
    position: tuple[float, float] = (0.0, 0.0)
    timestamp: float = 0.0

    def __post_init__(self):
        """Set timestamp to now if not provided."""
        if self.timestamp == 0.0:
            import time
            self.timestamp = time.time()


@dataclass
class PersonaInfo:
    """
    Information about an active persona.

    Attributes:
        persona_id: ID of the persona
        name: Display name from markdown frontmatter
        description: Short description from frontmatter
        color: Display color from frontmatter
        mission: Core mission extracted from markdown
        rules: Critical rules extracted from markdown
    """
    persona_id: str
    name: str = ""
    description: str = ""
    color: str = ""
    mission: str = ""
    rules: str = ""


class PersonaBridge:
    """
    Bridge between Rust compositor PERSONA_SHIFT events and PixelBrain monologue injection.

    This class:
    1. Receives PERSONA_SHIFT events from Rust compositor via WebSocket
    2. Loads Agency Agent markdown for the new persona
    3. Extracts Core Mission + Critical Rules
    4. Injects into PixelBrain prompt context
    5. Emits PERSONA_ACTIVE event to frontend

    Usage:
        bridge = PersonaBridge(visual_bridge, persona_injector)
        await bridge.handle_persona_shift(PersonaShiftEvent("reality-checker", "validation_zone"))
    """

    def __init__(
        self,
        visual_bridge: Optional["VisualBridge"] = None,
        persona_injector: Optional["PersonaInjector"] = None
    ):
        """
        Initialize the PersonaBridge.

        Args:
            visual_bridge: Optional VisualBridge for emitting events to frontend
            persona_injector: Optional PersonaInjector for loading personas
        """
        self.visual_bridge = visual_bridge
        if self.visual_bridge is None:
            try:
                from systems.visual_shell.api.visual_bridge import get_multi_vm_streamer
                self.visual_bridge = get_multi_vm_streamer()
            except ImportError:
                logger.warning("Could not import get_multi_vm_streamer, visual feedback disabled")

        self.persona_injector = persona_injector

        # State tracking
        self.active_persona: str | None = None
        self.active_persona_info: PersonaInfo | None = None
        self.persona_cache: dict[str, str] = {}  # persona_id -> full markdown

        # Agency agents root path
        self.agency_root = Path("apps/agency-agents")

        logger.info("PersonaBridge initialized")

    async def handle_persona_shift(self, event: PersonaShiftEvent) -> PersonaInfo:
        """
        Handle PERSONA_SHIFT event from Rust compositor.

        This method:
        1. Validates the persona_id exists
        2. Loads Agency Agent markdown for new persona
        3. Extracts Core Mission + Critical Rules
        4. Injects into PixelBrain prompt context (via PersonaInjector)
        5. Emits PERSONA_ACTIVE event to frontend

        Args:
            event: PersonaShiftEvent from Rust compositor

        Returns:
            PersonaInfo with details about the activated persona

        Raises:
            ValueError: If persona_id is not found in PERSONA_PATHS
        """
        logger.info(f"Handling PERSONA_SHIFT: {event.persona_id} in sector {event.sector_id}")

        # Validate persona exists
        if event.persona_id not in PERSONA_PATHS:
            raise ValueError(
                f"Unknown persona_id: '{event.persona_id}'. "
                f"Valid IDs: {list(PERSONA_PATHS.keys())}"
            )

        # Load persona monologue (with caching)
        monologue = await self._load_persona_monologue(event.persona_id)

        # Truncate for the experiment to avoid token limits
        monologue = monologue[:1000]

        # Extract persona info from markdown
        persona_info = self._extract_persona_info(event.persona_id, monologue)


        # Update active state
        self.active_persona = event.persona_id
        self.active_persona_info = persona_info

        # Inject into PixelBrain if PersonaInjector is available
        if self.persona_injector:
            await self._inject_into_pixel_brain(persona_info, monologue)
        else:
            logger.warning("PersonaInjector not available, skipping PixelBrain injection")

        # Emit PERSONA_ACTIVE event to frontend
        if self.visual_bridge:
            await self._emit_persona_active(persona_info, event)
        else:
            logger.warning("VisualBridge not available, skipping frontend event")

        logger.info(f"Persona activated: {persona_info.name} ({event.persona_id})")
        return persona_info

    async def _load_persona_monologue(self, persona_id: str) -> str:
        """
        Load Agency Agent markdown and extract monologue-relevant sections.

        Path pattern: apps/agency-agents/{division}/{persona_id}.md

        Args:
            persona_id: ID of the persona to load

        Returns:
            Full markdown content of the persona file
        """
        # Check cache first
        if persona_id in self.persona_cache:
            logger.debug(f"Using cached monologue for {persona_id}")
            return self.persona_cache[persona_id]

        # Get relative path from mapping
        rel_path = PERSONA_PATHS.get(persona_id)
        if not rel_path:
            raise ValueError(f"No path mapping for persona_id: {persona_id}")

        # Load from file
        full_path = self.agency_root / rel_path
        if not full_path.exists():
            raise FileNotFoundError(f"Persona file not found: {full_path}")

        try:
            with open(full_path) as f:
                markdown = f.read()

            # Cache for future use
            self.persona_cache[persona_id] = markdown
            logger.debug(f"Loaded persona markdown: {full_path}")

            return markdown
        except Exception as e:
            logger.error(f"Error reading persona file {full_path}: {e}")
            raise

    def _extract_persona_info(self, persona_id: str, markdown: str) -> PersonaInfo:
        """
        Extract PersonaInfo from markdown frontmatter and content.

        Args:
            persona_id: ID of the persona
            markdown: Full markdown content

        Returns:
            PersonaInfo with extracted details
        """
        info = PersonaInfo(persona_id=persona_id, color="blue")  # Set default color

        # Extract frontmatter (between --- markers)
        frontmatter_match = re.search(
            r'^---\n(.*?)\n---',
            markdown,
            re.DOTALL
        )

        if frontmatter_match:
            frontmatter = frontmatter_match.group(1)
            # Extract fields from frontmatter
            info.name = self._extract_frontmatter_field(frontmatter, "name") or persona_id.replace("-", " ").title()
            info.description = self._extract_frontmatter_field(frontmatter, "description") or ""
            info.color = self._extract_frontmatter_field(frontmatter, "color") or "blue"
        else:
            info.name = persona_id.replace("-", " ").title()

        # Extract Core Mission section
        # Match "## [emoji] Your Core Mission" until next "##" at start of line OR end of doc
        mission_match = re.search(
            r'##[^\n]*Core Mission[^\n]*\n+(.+?)(?=^##|\Z)',
            markdown,
            re.DOTALL | re.MULTILINE
        )
        if mission_match:
            info.mission = mission_match.group(1).strip()

        # Extract Critical Rules / Identity section
        # Match various section names until next "##" at start of line OR end of doc
        rules_patterns = [
            (r'##[^\n]*Mandatory Process[^\n]*\n+(.+?)(?=^##|\Z)', 'Mandatory Process'),
            (r'##[^\n]*Identity[^\n]*\n+(.+?)(?=^##|\Z)', 'Identity'),
            (r'##[^\n]*Critical Rules[^\n]*\n+(.+?)(?=^##|\Z)', 'Critical Rules'),
        ]

        for pattern, name in rules_patterns:
            rules_match = re.search(pattern, markdown, re.DOTALL | re.MULTILINE)
            if rules_match:
                info.rules = rules_match.group(1).strip()
                break

        return info

    def _extract_frontmatter_field(self, frontmatter: str, field: str) -> str:
        """Extract a field value from YAML frontmatter."""
        pattern = rf'{field}:\s*(.+?)(?:\n|$)'
        match = re.search(pattern, frontmatter)
        if match:
            # Remove quotes if present
            value = match.group(1).strip()
            return value.strip('"\'')
        return ""

    async def _inject_into_pixel_brain(self, persona_info: PersonaInfo, monologue: str) -> None:
        """
        Inject persona into PixelBrain cognitive context.

        Args:
            persona_info: Extracted persona information
            monologue: Full markdown monologue
        """
        from systems.visual_shell.api.pixel_brain_service import get_pixel_brain_service
        service = get_pixel_brain_service()

        # Inject the monologue into the service
        service.set_persona(monologue)

        logger.debug(
            f"Injecting persona into PixelBrain: {persona_info.name}\n"
            f"Mission: {persona_info.mission[:100]}..."
        )

    async def _emit_persona_active(self, persona_info: PersonaInfo, event: PersonaShiftEvent) -> None:
        """
        Emit PERSONA_ACTIVE event to frontend via VisualBridge.

        Args:
            persona_info: Persona that was activated
            event: Original shift event
        """
        # This is a placeholder for actual frontend event emission
        # In a full implementation, this would:
        # 1. Create a WebSocket event payload
        # 2. Broadcast to all connected frontend clients

        event_data = {
            "type": "PERSONA_ACTIVE",
            "persona_id": persona_info.persona_id,
            "name": persona_info.name,
            "description": persona_info.description,
            "color": persona_info.color,
            "sector_id": event.sector_id,
            "position": event.position,
            "timestamp": event.timestamp
        }

        logger.debug(f"Emitting PERSONA_ACTIVE event: {event_data}")

        # If VisualBridge has an event emitter, use it
        if self.visual_bridge and hasattr(self.visual_bridge, 'broadcast_event'):
            await self.visual_bridge.broadcast_event(event_data)

    def get_active_persona(self) -> PersonaInfo | None:
        """
        Return currently active persona info.

        Returns:
            PersonaInfo if a persona is active, None otherwise
        """
        return self.active_persona_info

    def clear_cache(self) -> None:
        """Clear the persona monologue cache."""
        self.persona_cache.clear()
        logger.debug("Persona cache cleared")

    def get_available_personas(self) -> dict[str, str]:
        """
        Get list of available persona IDs and their names.

        Returns:
            Dict mapping persona_id to display name
        """
        return {
            pid: pid.replace("-", " ").title()
            for pid in PERSONA_PATHS
        }


# Convenience function for creating a PersonaBridge
def create_persona_bridge(
    visual_bridge: Optional["VisualBridge"] = None,
    persona_injector: Optional["PersonaInjector"] = None
) -> PersonaBridge:
    """
    Create a PersonaBridge instance.

    Args:
        visual_bridge: Optional VisualBridge for frontend events
        persona_injector: Optional PersonaInjector for persona loading

    Returns:
        Configured PersonaBridge instance
    """
    return PersonaBridge(
        visual_bridge=visual_bridge,
        persona_injector=persona_injector
    )
