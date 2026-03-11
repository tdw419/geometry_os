"""
Territorial Map - Region-based Agent Assignment for Infinite Map

Maps agency agents to specific regions of the Infinite Map based on
Hilbert coordinates. Each region has a "squad" of agents that manage it.

Architecture:
- TerritorialRegion: Defines a region with bounds and assigned agents
- TerritorialMap: Manages all regions and provides coordinate lookups
- RegionAwareAgent: Mixin for agents to understand their territorial context

Usage:
    from systems.swarm.territorial_map import get_territorial_map, Region

    # Get region for a coordinate
    tmap = get_territorial_map()
    region = tmap.get_region_at(500, 500)

    # Check which agents should handle a task
    agents = region.get_assigned_agents("evaluate_mutation")
"""

import logging
from dataclasses import dataclass, field
from enum import Enum

logger = logging.getLogger(__name__)


class RegionType(Enum):
    """Types of territorial regions on the Infinite Map."""
    FORGE = "forge"         # /dev/evolution - Mutation and code generation
    BASTION = "bastion"     # /sys/security - Security and integrity
    GALLERY = "gallery"     # /ui/visuals - Visual and spatial UI
    NEXUS = "nexus"         # /map/coord - Coordination and orchestration
    NEUTRAL = "neutral"     # Unassigned regions


@dataclass
class TerritorialRegion:
    """
    A territorial region on the Infinite Map.

    Regions are defined by Hilbert coordinate bounds and have
    specific agent types assigned to manage them.
    """
    name: str
    region_type: RegionType
    bounds: tuple[int, int, int, int]  # x1, y1, x2, y2 (Hilbert coordinates)
    description: str
    assigned_agent_types: set[str] = field(default_factory=set)
    z_layer: int = 128  # Default semantic depth (0-255)

    def contains(self, x: int, y: int) -> bool:
        """Check if coordinates are within this region."""
        x1, y1, x2, y2 = self.bounds
        return x1 <= x <= x2 and y1 <= y <= y2

    def get_center(self) -> tuple[int, int]:
        """Get the center coordinates of this region."""
        x1, y1, x2, y2 = self.bounds
        return ((x1 + x2) // 2, (y1 + y2) // 2)

    def get_assigned_agents(self, task_type: str | None = None) -> list[str]:
        """
        Get agents assigned to this region.

        Args:
            task_type: Optional filter by task type

        Returns:
            List of agent type names
        """
        if task_type is None:
            return list(self.assigned_agent_types)

        # Map task types to relevant agent types
        task_agent_map = {
            "evaluate_mutation": {"mutation_governor", "senior_developer"},
            "run_pipeline": {"evolution_orchestrator", "devops_automator"},
            "design_component": {"spatial_architect", "ui_designer"},
            "neural_to_texture": {"neural_designer", "whimsy_injector"},
            "observe_and_synthesize": {"curiosity_engine", "agents_orchestrator"},
            "security_audit": {"security_engineer", "compliance_auditor"},
            "review_code": {"reviewer", "reality_checker"},
        }

        relevant = task_agent_map.get(task_type, set())
        return list(self.assigned_agent_types & relevant)

    def get_system_prompt_extension(self) -> str:
        """Get region-specific context to add to agent system prompts."""
        extensions = {
            RegionType.FORGE: f"""
## Territorial Context: The Forge (/dev/evolution)
You are operating in the Forge region of the Infinite Map.
- Focus: Code mutations, evolution pipelines, benchmark testing
- Coordinate Range: {self.bounds}
- Be aggressive with optimizations, but maintain stability gates
""",

            RegionType.BASTION: f"""
## Territorial Context: The Bastion (/sys/security)
You are operating in the Bastion region of the Infinite Map.
- Focus: Memory Beam safety, Hilbert integrity, security audits
- Coordinate Range: {self.bounds}
- Prioritize safety over speed; reject any mutation with security concerns
""",

            RegionType.GALLERY: f"""
## Territorial Context: The Gallery (/ui/visuals)
You are operating in the Gallery region of the Infinite Map.
- Focus: Visual coherence, SDF windows, Neural City textures
- Coordinate Range: {self.bounds}
- Balance aesthetics with performance; visual comfort is paramount
""",

            RegionType.NEXUS: f"""
## Territorial Context: The Nexus (/map/coord)
You are operating in the Nexus region of the Infinite Map.
- Focus: Cross-region coordination, load balancing, task routing
- Coordinate Range: {self.bounds}
- Think holistically; coordinate between all regional squads
""",

            RegionType.NEUTRAL: f"""
## Territorial Context: Neutral Zone
You are operating in an unassigned region of the Infinite Map.
- Focus: General purpose tasks
- Coordinate Range: {self.bounds}
""",
        }
        return extensions.get(self.region_type, "")


# Define the four primary territorial regions
DEFAULT_REGIONS = [
    TerritorialRegion(
        name="The Forge",
        region_type=RegionType.FORGE,
        bounds=(0, 0, 511, 511),
        description="Evolution and mutation pipeline",
        assigned_agent_types={
            "mutation_governor",
            "evolution_orchestrator",
            "senior_developer",
            "devops_automator",
            "test_results_analyzer",
        },
        z_layer=0  # Foundation layer
    ),
    TerritorialRegion(
        name="The Bastion",
        region_type=RegionType.BASTION,
        bounds=(512, 0, 1023, 511),
        description="Security and integrity monitoring",
        assigned_agent_types={
            "security_engineer",
            "compliance_auditor",
            "reality_checker",
            "evidence_collector",
        },
        z_layer=64  # Security layer
    ),
    TerritorialRegion(
        name="The Gallery",
        region_type=RegionType.GALLERY,
        bounds=(0, 512, 511, 1023),
        description="Visual and spatial UI design",
        assigned_agent_types={
            "spatial_architect",
            "neural_designer",
            "ui_designer",
            "whimsy_injector",
            "ux_architect",
        },
        z_layer=192  # Visual layer
    ),
    TerritorialRegion(
        name="The Nexus",
        region_type=RegionType.NEXUS,
        bounds=(512, 512, 1023, 1023),
        description="Cross-region coordination",
        assigned_agent_types={
            "agents_orchestrator",
            "curiosity_engine",
            "studio_producer",
            "project_shepherd",
        },
        z_layer=128  # Coordination layer
    ),
]


class TerritorialMap:
    """
    Manages territorial regions on the Infinite Map.

    Provides coordinate-based lookups to determine which region
    a given task or file belongs to.
    """

    def __init__(self, regions: list[TerritorialRegion] | None = None):
        self.regions = regions or DEFAULT_REGIONS.copy()
        self._region_cache: dict[tuple[int, int], TerritorialRegion] = {}

    def get_region_at(self, x: int, y: int) -> TerritorialRegion:
        """
        Get the region at specific Hilbert coordinates.

        Args:
            x, y: Hilbert coordinates

        Returns:
            The region containing these coordinates, or a neutral region
        """
        # Check cache
        cache_key = (x, y)
        if cache_key in self._region_cache:
            return self._region_cache[cache_key]

        # Find containing region
        for region in self.regions:
            if region.contains(x, y):
                self._region_cache[cache_key] = region
                return region

        # Return neutral region for unassigned coordinates
        neutral = TerritorialRegion(
            name="Neutral Zone",
            region_type=RegionType.NEUTRAL,
            bounds=(x, y, x, y),
            description="Unassigned region",
            assigned_agent_types=set()
        )
        return neutral

    def get_region_for_agent(self, agent_type: str) -> TerritorialRegion | None:
        """
        Get the primary region for an agent type.

        Args:
            agent_type: Type of agent (e.g., "mutation_governor")

        Returns:
            The region where this agent type is assigned, or None
        """
        for region in self.regions:
            if agent_type in region.assigned_agent_types:
                return region
        return None

    def get_region_by_type(self, region_type: RegionType) -> TerritorialRegion | None:
        """Get a region by its type."""
        for region in self.regions:
            if region.region_type == region_type:
                return region
        return None

    def assign_agent_to_region(
        self,
        agent_type: str,
        region_type: RegionType
    ) -> bool:
        """
        Assign an agent type to a region.

        Args:
            agent_type: Agent type to assign
            region_type: Target region type

        Returns:
            True if assignment successful
        """
        region = self.get_region_by_type(region_type)
        if region:
            region.assigned_agent_types.add(agent_type)
            logger.info(f"Assigned {agent_type} to {region.name}")
            return True
        return False

    def get_squad_for_region(self, region_type: RegionType) -> list[str]:
        """Get all agent types in a region's squad."""
        region = self.get_region_by_type(region_type)
        if region:
            return list(region.assigned_agent_types)
        return []

    def clear_cache(self):
        """Clear the coordinate lookup cache."""
        self._region_cache.clear()


class RegionAwareAgent:
    """
    Mixin for agents to understand their territorial context.

    Provides methods for region-aware behavior and coordinate-based routing.
    """

    def __init__(self, *args, region: TerritorialRegion | None = None, **kwargs):
        super().__init__(*args, **kwargs)
        self._region = region
        self._territorial_map: TerritorialMap | None = None

    @property
    def region(self) -> TerritorialRegion | None:
        """Get the agent's assigned region."""
        if self._region is None:
            # Try to infer region from agent type
            tmap = self._get_territorial_map()
            self._region = tmap.get_region_for_agent(
                getattr(self, 'agent_type', 'unknown')
            )
        return self._region

    def _get_territorial_map(self) -> TerritorialMap:
        """Get or create territorial map."""
        if self._territorial_map is None:
            self._territorial_map = get_territorial_map()
        return self._territorial_map

    def set_region(self, region: TerritorialRegion):
        """Set the agent's region."""
        self._region = region

    def set_coordinates(self, x: int, y: int):
        """Set the agent's region based on coordinates."""
        tmap = self._get_territorial_map()
        self._region = tmap.get_region_at(x, y)

    def get_region_context(self) -> str:
        """Get region-specific context for prompts."""
        if self.region:
            return self.region.get_system_prompt_extension()
        return ""

    def get_nearby_agents(self, radius: int = 100) -> list[str]:
        """
        Get agent types that might be nearby on the Infinite Map.

        Args:
            radius: Hilbert coordinate radius to check

        Returns:
            List of nearby agent type names
        """
        if not self.region:
            return []

        cx, cy = self.region.get_center()
        tmap = self._get_territorial_map()

        nearby = set()
        for dx in [-radius, 0, radius]:
            for dy in [-radius, 0, radius]:
                check_x, check_y = cx + dx, cy + dy
                if 0 <= check_x < 1024 and 0 <= check_y < 1024:
                    region = tmap.get_region_at(check_x, check_y)
                    nearby.update(region.assigned_agent_types)

        return list(nearby)


# Singleton
_territorial_map_instance: TerritorialMap | None = None


def get_territorial_map() -> TerritorialMap:
    """Get global TerritorialMap singleton."""
    global _territorial_map_instance
    if _territorial_map_instance is None:
        _territorial_map_instance = TerritorialMap()
    return _territorial_map_instance


def reset_territorial_map():
    """Reset singleton (for testing)."""
    global _territorial_map_instance
    _territorial_map_instance = None
