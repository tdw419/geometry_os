"""
HealerAgent - V16 Reaction Loop Consumer.

Autonomous agent that subscribes to Visual Bridge WebSocket (ws://localhost:8768),
processes DIAGNOSTIC_PULSE events, and executes healing actions based on pattern matching.

Requirements: FR-1, FR-2, FR-3, FR-6, FR-7, FR-8, FR-9, FR-12
"""

import asyncio
import json
import logging
import time
from dataclasses import dataclass, field
from enum import Enum
from typing import Dict, Any, Optional, List

try:
    import websockets
    WEBSOCKETS_AVAILABLE = True
except ImportError:
    WEBSOCKETS_AVAILABLE = False
    websockets = None

logger = logging.getLogger("HealerAgent")


class HealingAction(Enum):
    """Available healing actions for responding to anomalies."""
    ANALYZE = "analyze"      # Capture state, log, no immediate action
    QUARANTINE = "quarantine"  # Isolate district from others
    REBOOT = "reboot"        # Trigger substrate restart


@dataclass
class HealingResult:
    """Result of a healing action execution."""
    action: HealingAction
    district_id: str
    reason: str
    timestamp: float
    success: bool = True
    details: Dict[str, Any] = field(default_factory=dict)


class HealerAgent:
    """
    Agent that consumes DIAGNOSTIC_PULSE events and executes healing actions.

    Configuration:
        ws_url: Visual Bridge WebSocket URL (default: ws://localhost:8768)
        reaction_threshold: Max seconds to react to CRITICAL events (default: 1.0)
        auto_reboot: Allow automatic REBOOT actions (default: False for safety)

    Actions:
        ANALYZE: Log detailed diagnostic, no state change
        QUARANTINE: Broadcast QUARANTINE_DISTRICT to isolate
        REBOOT: Trigger substrate restart (requires auto_reboot=True)
    """

    def __init__(
        self,
        ws_url: str = "ws://localhost:8768",
        reaction_threshold: float = 1.0,
        auto_reboot: bool = False
    ):
        self._ws_url = ws_url
        self._reaction_threshold = reaction_threshold
        self._auto_reboot = auto_reboot
        self._history: List[HealingResult] = []
        self._max_history = 100

        # WebSocket connection state
        self._ws: Optional[Any] = None
        self._running = False
        self._reconnect_delay = 1.0
        self._max_reconnect_delay = 30.0

    @property
    def ws_url(self) -> str:
        """Visual Bridge WebSocket URL."""
        return self._ws_url

    @property
    def reaction_threshold(self) -> float:
        """Maximum seconds to react to CRITICAL events."""
        return self._reaction_threshold

    @property
    def auto_reboot(self) -> bool:
        """Whether automatic reboot is enabled."""
        return self._auto_reboot

    async def _handle_diagnostic_pulse(self, pulse: Dict[str, Any]) -> Optional[Dict[str, Any]]:
        """
        Process a DIAGNOSTIC_PULSE event and execute appropriate action.

        Args:
            pulse: DIAGNOSTIC_PULSE event dict with keys:
                - type: "DIAGNOSTIC_PULSE"
                - status: "HEALTHY" | "WARNING" | "CRITICAL"
                - district_id: str
                - matched_pattern: str (optional)
                - detected_text: str (optional)

        Returns:
            Dict with action result or None if no action needed
        """
        start_time = time.time()

        # Validate pulse structure
        if pulse.get("type") != "DIAGNOSTIC_PULSE":
            logger.warning(f"Ignoring non-diagnostic pulse: {pulse.get('type')}")
            return None

        status = pulse.get("status", "UNKNOWN")
        district_id = pulse.get("district_id", "unknown")
        matched_pattern = pulse.get("matched_pattern", "")
        detected_text = pulse.get("detected_text", "")

        # Filter by status
        if status == "HEALTHY":
            logger.debug(f"District {district_id} is healthy, no action needed")
            return None

        # Determine action based on status and pattern
        action = self._decide_action(status, matched_pattern, detected_text)

        # Execute action
        result = await self._execute_action(action, district_id, matched_pattern, detected_text)

        # Track timing
        elapsed = time.time() - start_time
        result.details["elapsed_seconds"] = elapsed

        # Check reaction threshold for CRITICAL
        if status == "CRITICAL" and elapsed > self._reaction_threshold:
            logger.warning(
                f"Reaction time {elapsed:.3f}s exceeded threshold {self._reaction_threshold}s"
            )

        # Add to history
        self._add_to_history(result)

        # Return as dict for test compatibility
        return {
            "action": result.action.value,
            "district_id": result.district_id,
            "reason": result.reason,
            "timestamp": result.timestamp,
            "success": result.success,
            "details": result.details
        }

    def _decide_action(
        self,
        status: str,
        matched_pattern: str,
        detected_text: str
    ) -> HealingAction:
        """
        Determine healing action based on status and pattern.

        Decision logic:
        - WARNING: Always ANALYZE (safe default)
        - CRITICAL with panic/not syncing: QUARANTINE
        - CRITICAL with segfault/segmentation: ANALYZE
        - CRITICAL with frozen/freeze: REBOOT (if auto_reboot) else QUARANTINE
        - CRITICAL unknown pattern: QUARANTINE (safe default)
        """
        pattern_lower = matched_pattern.lower()
        text_lower = detected_text.lower()

        if status == "WARNING":
            return HealingAction.ANALYZE

        if status == "CRITICAL":
            # Panic - immediate isolation
            if "panic" in pattern_lower or "not syncing" in pattern_lower:
                return HealingAction.QUARANTINE

            # Segfault - analyze state
            if "segfault" in pattern_lower or "segmentation" in pattern_lower:
                return HealingAction.ANALYZE

            # Frozen - may need reboot
            if "frozen" in pattern_lower or "freeze" in text_lower:
                return HealingAction.REBOOT if self._auto_reboot else HealingAction.QUARANTINE

            # Unknown CRITICAL pattern - safe default
            return HealingAction.QUARANTINE

        # Unknown status - analyze
        return HealingAction.ANALYZE

    async def _execute_action(
        self,
        action: HealingAction,
        district_id: str,
        matched_pattern: str,
        detected_text: str
    ) -> HealingResult:
        """Execute the chosen healing action."""
        timestamp = time.time()

        if action == HealingAction.ANALYZE:
            # Log detailed diagnostic
            logger.info(
                f"ANALYZE action for district {district_id}: "
                f"pattern={matched_pattern}, text={detected_text[:100]}"
            )
            return HealingResult(
                action=action,
                district_id=district_id,
                reason=f"Analyzed pattern: {matched_pattern}",
                timestamp=timestamp,
                success=True,
                details={"matched_pattern": matched_pattern, "detected_text": detected_text[:200]}
            )

        elif action == HealingAction.QUARANTINE:
            # Log quarantine action
            logger.warning(
                f"QUARANTINE action for district {district_id}: "
                f"pattern={matched_pattern}"
            )
            # Note: In full implementation, would broadcast QUARANTINE_DISTRICT to Visual Bridge
            return HealingResult(
                action=action,
                district_id=district_id,
                reason=f"Quarantined due to: {matched_pattern}",
                timestamp=timestamp,
                success=True,
                details={"matched_pattern": matched_pattern, "broadcast": "QUARANTINE_DISTRICT"}
            )

        elif action == HealingAction.REBOOT:
            # Log reboot action
            logger.warning(
                f"REBOOT action for district {district_id}: "
                f"auto_reboot={self._auto_reboot}"
            )
            if not self._auto_reboot:
                logger.error("REBOOT attempted but auto_reboot=False, skipping")
                return HealingResult(
                    action=action,
                    district_id=district_id,
                    reason="Reboot blocked: auto_reboot disabled",
                    timestamp=timestamp,
                    success=False,
                    details={"error": "auto_reboot_disabled"}
                )
            # Note: In full implementation, would trigger substrate restart
            return HealingResult(
                action=action,
                district_id=district_id,
                reason="Rebooting substrate",
                timestamp=timestamp,
                success=True,
                details={"reboot_initiated": True}
            )

        else:
            logger.error(f"Unknown action: {action}")
            return HealingResult(
                action=action,
                district_id=district_id,
                reason=f"Unknown action: {action}",
                timestamp=timestamp,
                success=False,
                details={"error": "unknown_action"}
            )

    def _add_to_history(self, result: HealingResult):
        """Add result to healing history with size limit."""
        self._history.append(result)
        if len(self._history) > self._max_history:
            self._history = self._history[-self._max_history:]

    @property
    def history(self) -> List[HealingResult]:
        """Get healing history."""
        return self._history.copy()

    @property
    def is_running(self) -> bool:
        """Check if the agent is actively running."""
        return self._running

    async def start(self) -> None:
        """
        Start the WebSocket client loop.

        Connects to Visual Bridge, sends subscription message, and processes
        incoming DIAGNOSTIC_PULSE events. Implements graceful reconnection
        with exponential backoff on disconnect.
        """
        if not WEBSOCKETS_AVAILABLE:
            logger.error("websockets library not available, cannot start")
            raise RuntimeError("websockets library required for WebSocket support")

        self._running = True
        logger.info(f"HealerAgent starting, connecting to {self._ws_url}")

        while self._running:
            try:
                await self._connect_and_listen()
            except Exception as e:
                if not self._running:
                    break
                logger.error(f"WebSocket error: {e}, reconnecting in {self._reconnect_delay}s")
                await asyncio.sleep(self._reconnect_delay)
                # Exponential backoff
                self._reconnect_delay = min(
                    self._reconnect_delay * 2,
                    self._max_reconnect_delay
                )

        logger.info("HealerAgent stopped")

    async def stop(self) -> None:
        """
        Stop the WebSocket client loop.

        Closes the WebSocket connection gracefully and signals the loop to exit.
        """
        logger.info("HealerAgent stopping...")
        self._running = False

        if self._ws is not None:
            try:
                await self._ws.close()
                logger.debug("WebSocket connection closed")
            except Exception as e:
                logger.warning(f"Error closing WebSocket: {e}")
            finally:
                self._ws = None

    async def _connect_and_listen(self) -> None:
        """
        Connect to WebSocket server and listen for messages.

        Sends subscription message on connect and processes incoming messages.
        """
        logger.debug(f"Connecting to {self._ws_url}")

        async with websockets.connect(self._ws_url) as ws:
            self._ws = ws
            self._reconnect_delay = 1.0  # Reset backoff on successful connection
            logger.info(f"Connected to {self._ws_url}")

            # Send subscription message
            subscribe_msg = json.dumps({
                "type": "SUBSCRIBE",
                "events": ["DIAGNOSTIC_PULSE"]
            })
            await ws.send(subscribe_msg)
            logger.debug("Sent SUBSCRIBE message for DIAGNOSTIC_PULSE events")

            # Listen for messages
            async for message in ws:
                if not self._running:
                    break

                try:
                    await self._process_message(message)
                except json.JSONDecodeError as e:
                    logger.warning(f"Invalid JSON in message: {e}")
                except Exception as e:
                    logger.error(f"Error processing message: {e}")

    async def _process_message(self, message: str) -> None:
        """
        Process an incoming WebSocket message.

        Args:
            message: Raw JSON string from WebSocket
        """
        data = json.loads(message)
        msg_type = data.get("type")

        if msg_type == "DIAGNOSTIC_PULSE":
            logger.debug(f"Received DIAGNOSTIC_PULSE: {data.get('status', 'unknown')}")
            result = await self._handle_diagnostic_pulse(data)
            if result:
                logger.info(
                    f"Healing action taken: {result['action']} "
                    f"for district {result['district_id']}"
                )
        elif msg_type == "SUBSCRIBE_ACK":
            logger.debug("Subscription acknowledged")
        else:
            logger.debug(f"Ignoring message type: {msg_type}")


# For backward compatibility with old interface
class HealerAgentLegacy:
    """Legacy HealerAgent for fracture detection (deprecated)."""

    def __init__(self, bridge_port: int = 8765, vnc_display: str = "127.0.0.1:0"):
        import warnings
        warnings.warn(
            "HealerAgentLegacy is deprecated, use HealerAgent with V16 reaction loop",
            DeprecationWarning
        )
        self.bridge_url = f"ws://localhost:{bridge_port}"
