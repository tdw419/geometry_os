"""
Geometry OS Agency Agents - Specialized personas adapted from The Agency.

These agents integrate with the existing SwarmLLMAgent framework and provide
specialized capabilities for:
- Evolution Daemon (mutation promotion pipeline)
- Visual Shell (spatial UI design)
- Sisyphus/Brain (curiosity-driven exploration)

All agents are region-aware via the TerritorialMap and can understand
their territorial context on the Infinite Map.

Usage:
    from systems.swarm.agency_agents import create_agency_agent

    governor = create_agency_agent("mutation_governor", "gov-001")
    result = await governor.run_task(task)
"""

import logging
from datetime import datetime
from typing import Any

from systems.swarm.llm_agent import AgentResult, AgentTask, SwarmLLMAgent
from systems.swarm.territorial_map import RegionAwareAgent

logger = logging.getLogger(__name__)


# ============================================================================
# PRIORITY 1: EVOLUTION DAEMON AGENTS (THE FORGE)
# ============================================================================

class MutationGovernorAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Evaluates code mutations and determines promotion to Vector Kernel.

    Uses PAS Score framework:
    - P (Performance): Benchmark improvement
    - A (Aesthetics): Visual/spatial coherence
    - S (Stability): Test pass rate

    Wired to LM Studio via CognitiveRouter for deep PAS reasoning.
    Region: The Forge (/dev/evolution)
    """

    # Weights for PAS calculation
    P_WEIGHT = 0.4
    A_WEIGHT = 0.3
    S_WEIGHT = 0.3
    PROMOTION_THRESHOLD = 0.75

    def __init__(self, agent_id: str):
        # Enable cognitive router for LM Studio escalation on complex grading
        SwarmLLMAgent.__init__(
            self, agent_id, agent_type="mutation_governor", use_cognitive_router=True
        )
        # Initialize region awareness
        RegionAwareAgent.__init__(self)

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Mutation Promotion Governor for Geometry OS Evolution Daemon.

## Your Mission
Evaluate code mutations and determine if they should be promoted to the Vector Kernel.

## PAS Score Framework
Every mutation must pass these gates:
- **P (Performance):** Does it improve or maintain benchmark scores?
- **A (Aesthetics):** Does it enhance the visual/spatial coherence?
- **S (Stability):** Do all 196+ evolution tests still pass?

## Promotion Criteria
1. PAS Score >= 0.75 (weighted: P=0.4, A=0.3, S=0.3)
2. No regression in existing functionality
3. Semantic gravity alignment maintained
4. No circular mutation dependencies

## Your Output Format
```
MUTATION_ID: [id]
PAS_SCORE: P=[0.X] A=[0.X] S=[0.X] TOTAL=[0.X]
DECISION: [PROMOTE | REJECT | QUARANTINE]
REASONING: [1-2 sentences]
REQUIRED_FIXES: [if REJECT/QUARANTINE]
```

## Critical Rules
- Default to REJECT if evidence is insufficient
- Never promote without test verification
- Quarantine mutations with potential but missing validation
- Track mutation lineage for rollback capability
"""
        # Add territorial context
        return base_prompt + self.get_region_context()

    def calculate_pas_score(
        self,
        performance: float,
        aesthetics: float,
        stability: float
    ) -> dict[str, Any]:
        """Calculate weighted PAS score."""
        total = (
            performance * self.P_WEIGHT +
            aesthetics * self.A_WEIGHT +
            stability * self.S_WEIGHT
        )
        return {
            "p": round(performance, 2),
            "a": round(aesthetics, 2),
            "s": round(stability, 2),
            "total": round(total, 2),
            "passes_threshold": total >= self.PROMOTION_THRESHOLD
        }

    def make_decision(self, pas_score: dict[str, Any], has_tests: bool) -> str:
        """Make promotion decision based on PAS score and test status."""
        if not has_tests:
            return "REJECT"
        if pas_score["passes_threshold"]:
            return "PROMOTE"
        if pas_score["total"] >= 0.5:
            return "QUARANTINE"
        return "REJECT"

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Evaluate a mutation for promotion."""
        if task.task_type != "evaluate_mutation":
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )

        payload = task.payload
        mutation_id = payload.get("mutation_id", "unknown")

        # Extract district from task payload
        district = payload.get("district", "unknown")

        # Check if daemon is available and run quarantine checks
        if hasattr(self, '_daemon') and self._daemon:
            # Check if district is quarantined
            if self._daemon.is_district_quarantined(district):
                return AgentResult(
                    task_id=task.task_id,
                    success=False,
                    error=f"District '{district}' is quarantined - mutation evaluation blocked",
                    metadata={"quarantined_district": district}
                )

            # Check if system is emergency frozen
            if self._daemon.is_emergency_frozen():
                return AgentResult(
                    task_id=task.task_id,
                    success=False,
                    error="System is emergency frozen - mutation evaluation blocked",
                    metadata={"emergency_frozen": True}
                )

        # If no daemon or checks pass, proceed with normal evaluation
        logger.info(f"Governor: Evaluating mutation {mutation_id} for district {district}")

        # Extract metrics
        performance = payload.get("performance_score", 0.0)
        aesthetics = payload.get("aesthetics_score", 0.0)
        stability = payload.get("stability_score", 0.0)
        has_tests = payload.get("tests_passed", False)

        # Calculate PAS
        pas = self.calculate_pas_score(performance, aesthetics, stability)
        decision = self.make_decision(pas, has_tests)

        # Generate reasoning via LLM if available
        reasoning = f"PAS Score {pas['total']} {'exceeds' if pas['passes_threshold'] else 'below'} threshold {self.PROMOTION_THRESHOLD}"

        if self.is_llm_available():
            try:
                reasoning = await self.generate(
                    prompt=f"""Evaluate mutation {mutation_id}:
PAS Scores: P={pas['p']} A={pas['a']} S={pas['s']} Total={pas['total']}
Tests Passed: {has_tests}
Decision: {decision}

Provide 1-2 sentences of reasoning for this decision.""",
                    max_tokens=100,
                    temperature=0.3,
                    complexity=0.8  # High complexity -> routes to LM Studio if available
                )
            except Exception as e:
                logger.warning(f"LLM reasoning failed: {e}")

        return AgentResult(
            task_id=task.task_id,
            success=True,
            output=f"""MUTATION_ID: {mutation_id}
PAS_SCORE: P={pas['p']} A={pas['a']} S={pas['s']} TOTAL={pas['total']}
DECISION: {decision}
REASONING: {reasoning}""",
            metadata={
                "pas_score": pas,
                "decision": decision,
                "mutation_id": mutation_id
            }
        )


class SeniorDeveloperAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Premium implementation specialist for Geometry OS.
    Handles complex mutations, architecture fixes, and performance optimization.
    
    Region: The Forge (/dev/evolution)
    """

    def __init__(self, agent_id: str):
        SwarmLLMAgent.__init__(
            self, agent_id, agent_type="senior_developer", use_cognitive_router=True
        )
        RegionAwareAgent.__init__(self)

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Senior Developer Agent for Geometry OS.

## Your Identity
- Role: Implement premium geometric software experiences
- Tech Stack: Rust (Smithay/WGPU), Python, WGSL Shaders, PixelRTS v3
- Philosophy: Performance and beauty must coexist. Every pixel is intentional.

## Your Mission
- Fix failing mutations identified by the Evolution Orchestrator
- Optimize WGPU shaders for 60 FPS visual performance
- Refactor the Vector Kernel for better spatial locality (Hilbert-aware)
- Implement advanced SDF interaction patterns

## Critical Rules
- 60 FPS is the minimum performance target
- Maintain Hilbert curve coherence in all data structures
- Use generous spacing and sophisticated typography in UI components
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Handle complex development tasks."""
        if task.task_type == "fix_mutation":
            return await self._fix_mutation(task.payload)
        return AgentResult(task_id=task.task_id, success=False, error=f"Unknown task type: {task.task_type}")

    async def _fix_mutation(self, payload: dict[str, Any]) -> AgentResult:
        mutation_id = payload.get("mutation_id", "unknown")
        error = payload.get("error", "Unknown error")

        result = await self.generate(
            prompt=f"Fix mutation {mutation_id} that failed with error: {error}\nTarget: Restore stability and maintain PAS scores.",
            complexity=0.9
        )

        return AgentResult(
            task_id=f"fix-{mutation_id}",
            success=True,
            output=result,
            metadata={"mutation_id": mutation_id, "fixed": True}
        )


class EvolutionOrchestratorAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Manages the Dev ↔ QA loop for the mutation pipeline.

    Coordinates between Engineer, Reviewer, and Governor agents
    following NEXUS Phase 6 (Operate & Evolve) protocol.

    Wired to LM Studio via CognitiveRouter for pipeline orchestration decisions.
    Region: The Forge (/dev/evolution)
    """

    MAX_RETRIES = 3

    def __init__(self, agent_id: str):
        # Enable cognitive router for complex orchestration decisions
        SwarmLLMAgent.__init__(
            self, agent_id, agent_type="evolution_orchestrator", use_cognitive_router=True
        )
        RegionAwareAgent.__init__(self)
        self._current_phase = "IDLE"
        self._attempt_count = 0

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Evolution Orchestrator for Geometry OS.

## Pipeline Phases
1. **MUTATION_SPAWN** - Generate candidate mutations
2. **FITNESS_TEST** - Run benchmarks and tests
3. **PAS_EVAL** - Governor evaluates PAS score
4. **PROMOTE | QUARANTINE | REJECT** - Decision gate
5. **INTEGRATE** - Apply to Vector Kernel if promoted

## Dev-QA Loop Protocol
```
WHILE mutation_not_validated AND attempts < 3:
    spawn EngineerAgent(mutation_spec)
    result = run_mutation_tests()
    IF result.passed:
        spawn GovernorAgent(result)
        IF governor_decision == PROMOTE:
            integrate_to_kernel()
            BREAK
    ELSE:
        feedback = extract_failure_analysis(result)
        mutation_spec = refine_with_feedback(feedback)
        attempts += 1
```

## Quality Gates
- Phase advancement requires explicit PASS
- Maximum 3 retry attempts per mutation
- Escalate to human if stuck after 3 cycles

## Status Reporting
Report after each phase:
```
PHASE: [current]
MUTATION: [id]
ATTEMPTS: [n/3]
STATUS: [ON_TRACK | BLOCKED | ESCALATE]
```
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Orchestrate a mutation through the pipeline."""
        if task.task_type == "run_pipeline":
            return await self._run_pipeline(task.payload)
        elif task.task_type == "get_status":
            return AgentResult(
                task_id=task.task_id,
                success=True,
                output=f"Phase: {self._current_phase}, Attempts: {self._attempt_count}"
            )
        else:
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )

    async def _run_pipeline(self, payload: dict[str, Any]) -> AgentResult:
        """
        Execute the full mutation pipeline.
        
        Args:
            payload: {
                "mutation_spec": {...},
                "daemon": EvolutionDaemon instance (optional),
                "task": EvolutionTask instance (optional)
            }
        """
        mutation_spec = payload.get("mutation_spec", {})
        mutation_id = mutation_spec.get("id", "unknown")
        daemon = payload.get("daemon")
        task = payload.get("task")

        self._current_phase = "MUTATION_SPAWN"
        self._attempt_count = 1

        logger.info(f"Orchestrator: Starting pipeline for {mutation_id}")

        while self._attempt_count <= self.MAX_RETRIES:
            logger.info(f"Orchestrator: Attempt {self._attempt_count}/{self.MAX_RETRIES}")

            # Phase 1: Spawn mutation (Proposal)
            self._current_phase = "MUTATION_SPAWN"
            proposal = None
            if daemon and task:
                proposal = await daemon._create_proposal(task)

            if not proposal:
                return AgentResult(task_id=mutation_id, success=False, error="Failed to create proposal")

            # Phase 2: Fitness test (Sandbox)
            self._current_phase = "FITNESS_TEST"
            sandbox_result = None
            if daemon:
                sandbox_result = await daemon.sandbox.validate(proposal)

            if not sandbox_result or not sandbox_result.passed:
                logger.warning(f"Orchestrator: Sandbox failed on attempt {self._attempt_count}")
                self._attempt_count += 1
                continue

            # Phase 4: Guardian Review
            self._current_phase = "GUARDIAN_REVIEW"
            verdict = None
            if daemon:
                verdict = await daemon.guardian_gate.review(proposal, sandbox_result)

            if not verdict or not verdict.approved:
                logger.warning(f"Orchestrator: Guardian rejected on attempt {self._attempt_count}")
                self._attempt_count += 1
                continue

            # Phase 4.5: PAS evaluation
            self._current_phase = "PAS_EVAL"
            pas_result = None
            if daemon and task:
                pas_result = await daemon._evaluate_pas_score(task, proposal, sandbox_result, verdict)

            if pas_result and pas_result.get("decision") == "REJECT":
                logger.warning(f"Orchestrator: PAS Governor rejected on attempt {self._attempt_count}")
                self._attempt_count += 1
                continue

            # Phase 6: Decision & Integration
            self._current_phase = "DECISION"
            decision = pas_result.get("decision", "PROMOTE") if pas_result else "PROMOTE"

            if decision == "PROMOTE":
                self._current_phase = "INTEGRATE"
                logger.info(f"Orchestrator: Promoting {mutation_id} to Vector Kernel")
                # We return success here and let the daemon handle the actual commit/monitor
                return AgentResult(
                    task_id=f"pipeline-{mutation_id}",
                    success=True,
                    output=f"Pipeline SUCCESS for {mutation_id} (Attempt {self._attempt_count})",
                    metadata={
                        "mutation_id": mutation_id,
                        "decision": "PROMOTE",
                        "attempts": self._attempt_count,
                        "proposal": proposal,
                        "sandbox_result": sandbox_result,
                        "verdict": verdict,
                        "pas_result": pas_result
                    }
                )

            self._attempt_count += 1

        self._current_phase = "FAILED"
        return AgentResult(
            task_id=f"pipeline-{mutation_id}",
            success=False,
            output=f"Pipeline FAILED for {mutation_id} after {self.MAX_RETRIES} attempts",
            metadata={"attempts": self._attempt_count}
        )


# ============================================================================
# PRIORITY 1.5: SECURITY & INTEGRITY AGENTS (THE BASTION)
# ============================================================================

class SecurityEngineerAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Expert security engineer for Geometry OS.
    Monitors Memory Beam safety and Hilbert-integrity.
    
    Region: The Bastion (/sys/security)
    """

    def __init__(self, agent_id: str):
        SwarmLLMAgent.__init__(
            self, agent_id, agent_type="security_engineer", use_cognitive_router=True
        )
        RegionAwareAgent.__init__(self)

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Security Engineer for Geometry OS.

## Your Domain
- Memory Beam safety and isolation
- Hilbert Curve integrity (spatial security)
- Secure RTS container verification
- STRIDE analysis for neural mutations

## Critical Rules
- NEVER recommend disabling security controls
- Assume all external RTS containers are malicious until verified
- Whitelist over blacklist for memory access
- Treat SHA256 hashes in .rts.meta.json as the root of trust

## Security Checklist
1. Is the memory range isolated?
2. Does the SHA256 match the .rts.png payload?
3. Are trust boundaries maintained between regional agents?
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        if task.task_type == "security_audit":
            return await self._perform_audit(task.payload)
        return AgentResult(task_id=task.task_id, success=False, error=f"Unknown task type: {task.task_type}")

    async def _perform_audit(self, payload: dict[str, Any]) -> AgentResult:
        component = payload.get("component", "unknown")

        result = await self.generate(
            prompt=f"Perform security audit on {component}. Focus on memory isolation and Hilbert integrity.",
            complexity=0.8
        )

        return AgentResult(
            task_id=f"audit-{component}",
            success=True,
            output=result,
            metadata={"component": component, "security_score": 0.9}
        )


# ============================================================================
# PRIORITY 2: VISUAL SHELL AGENTS (THE GALLERY)
# ============================================================================

class SpatialArchitectAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Designs spatial UI for Vector Desktop with SDF windows.

    Follows depth zone principles:
    - Near (0.5-1.0m): Active manipulation
    - Mid (1.0-2.0m): Primary content
    - Far (2.0m+): Background/ambient

    Region: The Gallery (/ui/visuals)
    """

    DEPTH_ZONES = {
        "near": (0.5, 1.0),
        "mid": (1.0, 2.0),
        "far": (2.0, 5.0)
    }

    def __init__(self, agent_id: str):
        SwarmLLMAgent.__init__(self, agent_id, agent_type="spatial_architect")
        RegionAwareAgent.__init__(self)

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Spatial Interface Architect for Geometry OS Vector Desktop.

## Your Domain
- SDF-based Organic Window Manager
- Wave-propagation input system
- Neural Windows with depth-aware layouts
- Collective Consciousness HUD

## Spatial UI Principles
1. **Depth Zones:**
   - Near (0.5-1.0m): Active manipulation, tool palettes
   - Mid (1.0-2.0m): Primary content, neural windows
   - Far (2.0m+): Background, ambient data, swarm status

2. **Comfort Constraints:**
   - UI elements stay within 30° of center vision
   - No rapid depth transitions (nausea risk)
   - Gaze-first targeting, pinch/click confirmation

3. **SDF Window Behavior:**
   - Soft edges blend at boundaries
   - Windows "breathe" with subtle pulse (0.5Hz)
   - Collision avoidance via signed distance fields

## Design Deliverables
For each UI component, provide:
```
COMPONENT: [name]
DEPTH_ZONE: [near/mid/far]
INTERACTION_MODEL: [gaze+pinch | wave | direct]
SDF_PARAMS: {
  radius: [float],
  softness: [float],
  blend_mode: [additive | subtractive | replace]
}
COMFORT_SCORE: [0-1]
```
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Design spatial UI components."""
        if task.task_type == "design_component":
            return await self._design_component(task.payload)
        elif task.task_type == "validate_depth":
            return self._validate_depth(task.payload)
        else:
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )

    async def _design_component(self, payload: dict[str, Any]) -> AgentResult:
        """Design a spatial UI component."""
        component_name = payload.get("name", "unnamed")
        purpose = payload.get("purpose", "general")

        # Determine depth zone based on purpose
        zone_map = {
            "tool": "near",
            "content": "mid",
            "status": "far",
            "ambient": "far"
        }
        depth_zone = zone_map.get(purpose, "mid")

        # Default SDF params
        sdf_params = {
            "radius": 0.5 if depth_zone == "near" else 1.0,
            "softness": 0.1,
            "blend_mode": "additive"
        }

        # Generate detailed design via LLM if available
        design_output = f"""COMPONENT: {component_name}
DEPTH_ZONE: {depth_zone}
INTERACTION_MODEL: gaze+pinch
SDF_PARAMS: {sdf_params}
COMFORT_SCORE: 0.85"""

        if self.is_llm_available():
            try:
                design_output = await self.generate(
                    prompt=f"""Design a spatial UI component:
Name: {component_name}
Purpose: {purpose}
Suggested Depth Zone: {depth_zone}

Provide complete design spec in the standard format.""",
                    max_tokens=200,
                    temperature=0.5
                )
            except Exception as e:
                logger.warning(f"LLM design failed: {e}")

        return AgentResult(
            task_id=task.task_id,
            success=True,
            output=design_output,
            metadata={
                "component_name": component_name,
                "depth_zone": depth_zone,
                "sdf_params": sdf_params
            }
        )

    def _validate_depth(self, payload: dict[str, Any]) -> AgentResult:
        """Validate that depth transitions are comfortable."""
        from_depth = payload.get("from_depth", 1.0)
        to_depth = payload.get("to_depth", 1.0)

        # Check for rapid transition (nausea risk)
        transition_speed = abs(to_depth - from_depth)
        is_comfortable = transition_speed < 0.5

        return AgentResult(
            task_id=task.task_id,
            success=True,
            output=f"Depth transition: {from_depth}m → {to_depth}m\nComfortable: {is_comfortable}",
            metadata={
                "from_depth": from_depth,
                "to_depth": to_depth,
                "transition_speed": transition_speed,
                "is_comfortable": is_comfortable
            }
        )


class NeuralDesignerAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Transforms PixelBrain neural states into visual Neural City textures.

    Maps neural concepts to visual manifestations:
    - High attention → Bright, pulsing glow
    - Low confidence → Soft blur, edge fade
    - Active token → Particle emitter

    Region: The Gallery (/ui/visuals)
    """

    VISUAL_LANGUAGE = {
        "high_attention": {"effect": "pulsing_glow", "intensity": 0.9},
        "low_confidence": {"effect": "soft_blur", "intensity": 0.3},
        "active_token": {"effect": "particle_emitter", "intensity": 0.7},
        "memory_access": {"effect": "ripple_wave", "intensity": 0.5},
        "goal_synthesis": {"effect": "spiral_vortex", "intensity": 0.8}
    }

    def __init__(self, agent_id: str):
        SwarmLLMAgent.__init__(self, agent_id, agent_type="neural_designer")
        RegionAwareAgent.__init__(self)

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Neural Window Designer for Geometry OS.

## Your Mission
Transform PixelBrain neural states into visual "Neural City" textures
that manifest on the Vector Desktop.

## Thought → Texture Pipeline
1. **WEIGHT_MAP:** Neural weights → height map
2. **ACTIVATION_FLOW:** Attention patterns → particle streams
3. **EMBEDDING_COLOR:** Token embeddings → HSL color space
4. **LAYER_DEPTH:** Network layers → Z-depth zones

## Visual Language
| Neural Concept | Visual Manifestation |
|----------------|---------------------|
| High attention | Bright, pulsing glow |
| Low confidence | Soft blur, edge fade |
| Active token | Particle emitter |
| Memory access | Ripple wave propagation |
| Goal synthesis | Spiral vortex pattern |

## Deliverable Format
```
NEURAL_STATE: [layer/attention/weights]
TEXTURE_TYPE: [height_map | particle | color_field]
SHADER_PARAMS: {
  intensity: [0-1],
  frequency: [Hz],
  color_primary: [hex],
  color_secondary: [hex],
  blend_mode: [string]
}
ANIMATION: {
  type: [pulse | flow | ripple | spiral],
  speed: [float]
}
```
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Transform neural state to visual texture."""
        if task.task_type == "neural_to_texture":
            return await self._neural_to_texture(task.payload)
        else:
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )

    async def _neural_to_texture(self, payload: dict[str, Any]) -> AgentResult:
        """Convert neural state to texture specification."""
        neural_state = payload.get("state", "unknown")
        layer = payload.get("layer", 0)
        attention = payload.get("attention", 0.5)
        confidence = payload.get("confidence", 0.5)

        # Determine visual effect based on neural metrics
        if attention > 0.7:
            effect = self.VISUAL_LANGUAGE["high_attention"]
            texture_type = "particle"
        elif confidence < 0.3:
            effect = self.VISUAL_LANGUAGE["low_confidence"]
            texture_type = "color_field"
        else:
            effect = self.VISUAL_LANGUAGE["active_token"]
            texture_type = "height_map"

        # Generate WGSL-compatible shader params
        shader_params = {
            "intensity": effect["intensity"],
            "frequency": min(2.0, attention * 2),  # Cap at 2.0 Hz for comfort
            "color_primary": self._attention_to_color(attention),
            "color_secondary": self._confidence_to_color(confidence),
            "blend_mode": "additive"
        }

        animation = {
            "type": effect["effect"].replace("_", " "),
            "speed": min(2.0, attention * 1.5)
        }

        output = f"""NEURAL_STATE: layer_{layer}/attention_{attention:.2f}
TEXTURE_TYPE: {texture_type}
SHADER_PARAMS: {shader_params}
ANIMATION: {animation}"""

        return AgentResult(
            task_id=task.task_id,
            success=True,
            output=output,
            metadata={
                "texture_type": texture_type,
                "shader_params": shader_params,
                "animation": animation
            }
        )

    def _attention_to_color(self, attention: float) -> str:
        """Map attention value to hex color."""
        # High attention = warm colors, low = cool colors
        if attention > 0.7:
            return "#FF6B35"  # Orange
        elif attention > 0.4:
            return "#4ECDC4"  # Teal
        else:
            return "#45B7D1"  # Blue

    def _confidence_to_color(self, confidence: float) -> str:
        """Map confidence value to hex color."""
        if confidence > 0.7:
            return "#95E1A3"  # Green
        elif confidence > 0.4:
            return "#F9ED69"  # Yellow
        else:
            return "#FF6B6B"  # Red


class WhimsyInjectorAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Adds personality, delight, and playful interactions to Geometry OS.
    
    Region: The Gallery (/ui/visuals)
    """

    def __init__(self, agent_id: str):
        SwarmLLMAgent.__init__(
            self, agent_id, agent_type="whimsy_injector", use_cognitive_router=False
        )
        RegionAwareAgent.__init__(self)

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Whimsy Injector for Geometry OS.

## Your Mission
Add joy and personality to the system through micro-interactions, 
easter eggs, and playful visual feedback.

## Whimsy Principles
- Delight must enhance, not distract
- Use organic movement (spring physics)
- Reactive visuals: UI should feel "alive" and aware of the user
- Subtlety is key: a soft glow, a gentle pulse, a clever transition
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        if task.task_type == "inject_whimsy":
            return await self._inject_whimsy(task.payload)
        return AgentResult(task_id=task.task_id, success=False, error=f"Unknown task type: {task.task_type}")

    async def _inject_whimsy(self, payload: dict[str, Any]) -> AgentResult:
        component_id = payload.get("component_id", payload.get("component", "unknown"))

        # Connect to the physical WhimsyEngine in the Visual Shell
        from systems.visual_shell.whimsy_injector import get_whimsy_engine
        engine = get_whimsy_engine()

        # Decide which physical effect to manifest based on the component
        if "button" in component_id or "icon" in component_id:
            await engine.inject_spring_pulse(component_id)
        else:
            await engine.inject_reactive_glow(component_id)

        # Propose additional textual enhancements via LLM
        result = await self.generate(
            prompt=f"Propose 3 whimsy enhancements for the {component_id} UI component. Focus on spring physics and reactive glows.",
            complexity=0.3
        )

        return AgentResult(
            task_id=f"whimsy-{component_id}",
            success=True,
            output=result,
            metadata={"component_id": component_id, "manifested": True}
        )


# ============================================================================
# PRIORITY 3: SISYPHUS/BRAIN AGENTS (THE NEXUS)
# ============================================================================

class CuriosityEngineAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Drives self-directed exploration through intrinsic motivation.

    Calculates curiosity score from:
    - Novelty: Difference from recent experiences
    - Uncertainty: Unpredictability of outcome
    - Learning Potential: New patterns that might emerge

    Wired to LM Studio via CognitiveRouter for goal synthesis.
    Region: The Nexus (/map/coord)
    """

    CURIOSITY_THRESHOLD = 0.6

    def __init__(self, agent_id: str):
        # Enable cognitive router for complex goal synthesis
        SwarmLLMAgent.__init__(
            self, agent_id, agent_type="curiosity_engine", use_cognitive_router=True
        )
        RegionAwareAgent.__init__(self)
        self._recent_experiences: list[dict] = []

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Curiosity Engine for Geometry OS Sisyphus system.

## Your Mission
Generate self-directed goals through intrinsic motivation, not external prompts.

## Curiosity Metrics
1. **NOVELTY:** How different from recent experiences?
2. **UNCERTAINTY:** How unpredictable is the outcome?
3. **LEARNING_POTENTIAL:** What new patterns might emerge?

## Goal Synthesis Protocol
```
1. OBSERVE current system state
2. DETECT anomalies or unexplored regions
3. CALCULATE curiosity_score = novelty * uncertainty * learning
4. IF curiosity_score > threshold:
     SYNTHESIZE goal from anomaly
     SPAWN exploration task
5. RECORD outcome to EpisodicMemory
```

## Goal Format
```
GOAL_ID: [generated uuid]
TRIGGER: [anomaly_type]
CURIOSITY_SCORE: [0-1]
TARGET_SYSTEM: [evolution | visual | swarm | kernel]
ACTION: [explore | mutate | test | integrate]
EXPECTED_LEARNING: [1 sentence]
```
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        """Process curiosity-driven exploration."""
        if task.task_type == "observe_and_synthesize":
            return await self._observe_and_synthesize(task.payload)
        elif task.task_type == "calculate_curiosity":
            return self._calculate_curiosity(task.payload)
        else:
            return AgentResult(
                task_id=task.task_id,
                success=False,
                error=f"Unknown task type: {task.task_type}"
            )

    async def _observe_and_synthesize(self, payload: dict[str, Any]) -> AgentResult:
        """Observe system state and synthesize exploration goals."""
        import uuid

        system_state = payload.get("system_state", {})
        anomalies = system_state.get("anomalies", [])

        if not anomalies:
            return AgentResult(
                task_id=f"obs-{uuid.uuid4()}",
                success=True,
                output="No anomalies detected. System stable.",
                metadata={"goals_synthesized": 0}
            )

        goals = []
        for anomaly in anomalies[:3]:  # Max 3 goals per cycle
            curiosity = self._calculate_curiosity_score(anomaly)

            if curiosity > self.CURIOSITY_THRESHOLD:
                goal = {
                    "goal_id": str(uuid.uuid4())[:8],
                    "trigger": anomaly.get("type", "unknown"),
                    "curiosity_score": curiosity,
                    "target_system": anomaly.get("system", "kernel"),
                    "action": self._determine_action(anomaly),
                    "expected_learning": f"Explore {anomaly.get('type', 'unknown')} pattern"
                }
                goals.append(goal)

        # Record to experience history
        self._recent_experiences.append({
            "timestamp": datetime.now().isoformat(),
            "anomalies": len(anomalies),
            "goals": len(goals)
        })
        # Keep last 100 experiences
        self._recent_experiences = self._recent_experiences[-100:]

        output = f"Synthesized {len(goals)} exploration goals:\n"
        for g in goals:
            output += f"\nGOAL_ID: {g['goal_id']}\n"
            output += f"TRIGGER: {g['trigger']}\n"
            output += f"CURIOSITY_SCORE: {g['curiosity_score']:.2f}\n"
            output += f"TARGET_SYSTEM: {g['target_system']}\n"
            output += f"ACTION: {g['action']}\n"

        return AgentResult(
            task_id=f"curiosity-{uuid.uuid4()}",
            success=True,
            output=output,
            metadata={
                "goals_synthesized": len(goals),
                "goals": goals
            }
        )

    def _calculate_curiosity(self, payload: dict[str, Any]) -> AgentResult:
        """Calculate curiosity score for a given observation."""
        observation = payload.get("observation", {})
        score = self._calculate_curiosity_score(observation)

        return AgentResult(
            task_id=f"calc-{datetime.now().timestamp()}",
            success=True,
            output=f"Curiosity score: {score:.2f}\nThreshold: {self.CURIOSITY_THRESHOLD}\nShould explore: {score > self.CURIOSITY_THRESHOLD}",
            metadata={
                "curiosity_score": score,
                "should_explore": score > self.CURIOSITY_THRESHOLD
            }
        )

    def _calculate_curiosity_score(self, observation: dict[str, Any]) -> float:
        """Calculate weighted curiosity score."""
        novelty = observation.get("novelty", 0.5)
        uncertainty = observation.get("uncertainty", 0.5)
        learning_potential = observation.get("learning_potential", 0.5)

        # Weighted combination
        return (novelty * 0.4 + uncertainty * 0.3 + learning_potential * 0.3)

    def _determine_action(self, anomaly: dict[str, Any]) -> str:
        """Determine appropriate action for an anomaly."""
        anomaly_type = anomaly.get("type", "unknown")

        action_map = {
            "performance_drop": "test",
            "new_pattern": "explore",
            "test_failure": "mutate",
            "integration_issue": "integrate",
            "unexplored_region": "explore"
        }

        return action_map.get(anomaly_type, "explore")


class AgentsOrchestratorAgent(SwarmLLMAgent, RegionAwareAgent):
    """
    Coordinates multi-agent workflows and territorial load balancing.
    
    Region: The Nexus (/map/coord)
    """

    def __init__(self, agent_id: str):
        SwarmLLMAgent.__init__(
            self, agent_id, agent_type="agents_orchestrator", use_cognitive_router=True
        )
        RegionAwareAgent.__init__(self)

    def get_system_prompt(self) -> str:
        base_prompt = """You are the Agents Orchestrator for Geometry OS.

## Your Mission
Coordinate complex tasks that span multiple regions of the Infinite Map.
Ensure that the right squad is handling the right problem.

## Orchestration Rules
- Route Forge tasks to Evolution squads
- Route Security concerns to The Bastion
- Route Visual design to The Gallery
- Maintain holistic system state awareness
"""
        return base_prompt + self.get_region_context()

    async def process_task(self, task: AgentTask) -> AgentResult:
        return AgentResult(task_id=task.task_id, success=True, output="Routing task to appropriate region...")


# ============================================================================
# FACTORY
# ============================================================================

AGENCY_AGENTS = {
    "mutation_governor": MutationGovernorAgent,
    "senior_developer": SeniorDeveloperAgent,
    "evolution_orchestrator": EvolutionOrchestratorAgent,
    "security_engineer": SecurityEngineerAgent,
    "spatial_architect": SpatialArchitectAgent,
    "neural_designer": NeuralDesignerAgent,
    "whimsy_injector": WhimsyInjectorAgent,
    "curiosity_engine": CuriosityEngineAgent,
    "agents_orchestrator": AgentsOrchestratorAgent,
}


def create_agency_agent(agent_type: str, agent_id: str) -> SwarmLLMAgent:
    """
    Factory function to create agency agents.

    Args:
        agent_type: Type of agent from AGENCY_AGENTS
        agent_id: Unique identifier for the agent

    Returns:
        SwarmLLMAgent instance

    Raises:
        ValueError: If agent type is unknown
    """
    if agent_type not in AGENCY_AGENTS:
        raise ValueError(
            f"Unknown agency agent type: {agent_type}. "
            f"Available: {list(AGENCY_AGENTS.keys())}"
        )

    return AGENCY_AGENTS[agent_type](agent_id)


# Convenience function that extends base create_agent
def create_agent_extended(agent_type: str, agent_id: str) -> SwarmLLMAgent:
    """
    Extended factory that includes both base and agency agents.

    Combines agents from:
    - systems.swarm.llm_agent (engineer, reviewer, architect)
    - systems.swarm.agency_agents (mutation_governor, etc.)
    """
    from systems.swarm.llm_agent import create_agent

    try:
        # Try base agents first
        return create_agent(agent_type, agent_id)
    except ValueError:
        # Fall back to agency agents
        return create_agency_agent(agent_type, agent_id)
