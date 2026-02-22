import asyncio
import logging
import numpy as np
from typing import Dict, Any, List, Optional
from systems.swarm.telepathy_protocol import TelepathyNode, TelepathySignal
from systems.relativity.relativity_engine import RelativityEngine
from systems.quantum.entanglement_engine import EntanglementEngine
from systems.quantum.substrate_collapser import SubstrateCollapser

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] %(message)s')
logger = logging.getLogger("SwarmDaemon")

class SwarmDaemon:
    """
    The orchestrator of Collective Consciousness.
    Binds the Nervous System (Telepathy) with the Theory of Mind (Relativity).
    """
    def __init__(self, port: int = 6000, local_embedding: Optional[List[float]] = None, intent_bus: Any = None, capabilities: Optional[List[str]] = None):
        self.port = port
        self.intent_bus = intent_bus
        self.capabilities = capabilities or ["compute", "pixel_rts"]
        
        # Initialize default embedding if none provided (Random "Personality" for now)
        if local_embedding is None:
            rng = np.random.default_rng()
            self.local_embedding = rng.random(128).tolist()
        else:
            self.local_embedding = local_embedding
            
        # 1. Initialize Telepathy (The Network)
        self.telepathy = TelepathyNode(port=port, capabilities=self.capabilities)
        self.telepathy.register_observer(self.handle_incoming_signal)
        
        # 2. Initialize Relativity (The Interpreter)
        self.relativity = RelativityEngine(local_embedding=self.local_embedding)
        
        # 3. Initialize Quantum Entanglement (Phase 12)
        self.quantum = EntanglementEngine(node_id=self.telepathy.node_id, swarm_daemon=self)
        self.substrate = SubstrateCollapser(swarm_daemon=self)
        
        # Internal state
        self.current_intent: Optional[Dict[str, Any]] = None


        
    async def start(self):
        """Ignite the Swarm Daemon."""
        logger.info(f"🐝 SwarmDaemon starting on port {self.port}...")
        
        # Start Telepathy Node (this blocks if we just await it, so we create a task)
        # Actually TelepathyNode.start() runs forever, so we should wrap it.
        # But looking at TelepathyNode.start(), it uses server.serve_forever().
        # We probably want to run it as a background task if we have other loops.
        self.telepathy_task = asyncio.create_task(self.telepathy.start())
        
        # Start periodic sync task
        self.loop = asyncio.get_running_loop()
        self.sync_task = self.loop.create_task(self.periodic_state_sync())

        logger.info("🐝 SwarmDaemon fully operational.")
        
        # Keep the daemon alive if this is the main entry point
        try:
            while True:
                await asyncio.sleep(1)
        except asyncio.CancelledError:
            logger.info("🐝 SwarmDaemon shutting down...")
            self.telepathy_task.cancel()
            self.sync_task.cancel()

    async def periodic_state_sync(self):
        """Periodically broadcast our aesthetic state to align the swarm."""
        while True:
            await asyncio.sleep(10)  # Pulse every 10 seconds
            if self.local_embedding is not None:
                await self.broadcast_intent("AESTHETIC_SYNC", {"status": "ALIGNING"})

    def update_self_image(self, embedding: List[float]):
        """Update our own self-image (e.g. from AestheticEngine)."""
        self.local_embedding = embedding
        self.relativity.local_embedding = np.array(embedding)
        logger.info("🪞 Self-Image updated.")

    async def broadcast_intent(self, intent_type: str, payload: Dict[str, Any]):
        """Broadcast a local desire to the swarm."""
        self.current_intent = payload
        
        # Add our semantic signature
        signal_payload = payload.copy()
        
        # Broadcast via Telepathy
        await self.telepathy.broadcast_thought(
            signal_type=intent_type,
            payload=signal_payload,
            vector_embedding=self.local_embedding
        )

    def handle_incoming_signal(self, signal: TelepathySignal):
        """
        Callback for when a signal is received from the ether.
        """
        if signal.source_id == self.telepathy.node_id:
            return  # Ignore self-echoes if any

        # 1. Update our mental model of the peer
        if signal.vector_embedding:
             self.relativity.update_peer_frame(signal.source_id, signal.vector_embedding)
        
        # 2. Translate the intent through Relativity
        translated_intent = self.relativity.translate_intent(
            signal.payload, 
            signal.source_id
        )
        
        interpretation = translated_intent.get('interpretation', 'UNKNOWN')
        rel_score = translated_intent.get('relativity_score', 0.0)
        
        logger.info(f"👽 Signal from {signal.source_id} interpreted as {interpretation} (Resonance: {rel_score:.2f})")
        
        if interpretation == "RESONANCE":
            self.collaborate_with(signal.source_id, translated_intent)
            
            # Specific Handlers
            if signal.signal_type == "AESTHETIC_SYNC":
                self.absorb_aesthetic_influence(signal.vector_embedding, rel_score)
            elif signal.signal_type == "COMPUTE_OFFLOAD":
                asyncio.create_task(self.handle_compute_request(signal.source_id, signal.payload))
            elif signal.signal_type == "COMPUTE_RESULT":
                logger.info(f"✅ Received COMPUTE RESULT from {signal.source_id}: {signal.payload.get('result')}")
            elif signal.signal_type == "SYNAPTIC_ENTANGLEMENT":
                self.quantum.collapse_remote_delta(signal.source_id, signal.payload)
            elif signal.signal_type == "SUBSTRATE_ADVERTISEMENT":
                self.substrate.integrate_remote_map(signal.source_id, signal.payload.get("manifest", []))

        elif interpretation == "HERESY":
            self.ignore_heretic(signal.source_id)

    def collaborate_with(self, peer_id: str, intent: Dict[str, Any]):
        """Logic to act on resonant signals."""
        logger.info(f"🤝 COLLABORATING with {peer_id} on {intent.get('concept', 'unknown')}")
        
        # Push to EvolutionDaemon via SemanticIntentBus
        if self.intent_bus:
            # We wrap the foreign intent as a local 'collaboration' intent
            collaboration_payload = {
                "action": "COLLABORATE",
                "peer_id": peer_id,
                "original_intent": intent
            }
            # Boost intensity because it resonates (Relativity check passed)
            self.intent_bus.emit_resonance(collaboration_payload, intensity=1.2)
        else:
            logger.warning("⚠️ No Intent Bus connected - cannot act on collaboration.")

    async def handle_compute_request(self, peer_id: str, task: Dict[str, Any]):
        """Execute a task for a friend."""
        logger.info(f"⚙️ EXECUTING offloaded task for {peer_id}: {task.get('task_id')}")
        
        result_payload = {"task_id": task.get("task_id"), "result": None}
        
        # Check for executable code (RTS Fragment)
        if "code" in task:
            try:
                code_snippet = task["code"]
                function_name = task.get("function_name", "main")
                args = task.get("args", {})
                
                logger.info(f"💾 Compiling received memory fragment ({len(code_snippet)} bytes)...")
                
                # RESTRICTED EXECUTION ENVIRONMENT
                # In a real secure OS, this would be a sandbox.
                # Here we trust the swarm.
                local_scope = {}
                exec(code_snippet, {}, local_scope)
                
                if function_name in local_scope:
                    func = local_scope[function_name]
                    # Handle both dict args and list args if needed, simple kwargs for now
                    if isinstance(args, dict):
                        exec_result = func(**args)
                    else:
                        exec_result = func(args)
                    
                    result_payload["result"] = exec_result
                    result_payload["status"] = "SUCCESS"
                    logger.info(f"✅ Execution successful. Result: {exec_result}")
                else:
                    result_payload["status"] = "ERROR"
                    result_payload["error"] = f"Function '{function_name}' not found in fragment."
                    logger.error(result_payload["error"])

            except Exception as e:
                result_payload["status"] = "ERROR"
                result_payload["error"] = str(e)
                logger.error(f"❌ Execution failed: {e}")
        
        else:
            # Fallback to simulated mode
            await asyncio.sleep(0.5)
            result_payload["result"] = "COMPUTED_HASH_X"
            result_payload["status"] = "SIMULATED"
        
        # Send back result
        await self.telepathy.transmit_thought(
            target_node_id=peer_id,
            signal_type="COMPUTE_RESULT",
            payload=result_payload,
            vector_embedding=self.local_embedding
        )

    def absorb_aesthetic_influence(self, peer_embedding: List[float], resonance: float):
        """
        Subtly shift our own aesthetic towards resonant peers.
        This creates the 'Collective Consciousness'.
        """
        if not peer_embedding or resonance < 0.9: 
            return # Only highly resonant peers influence us

        # Cultural Influence (Lerp 5%)
        alpha = 0.05
        local_arr = np.array(self.local_embedding)
        peer_arr = np.array(peer_embedding)
        
        # Move slightly towards the peer's ideal
        new_embedding = (local_arr * (1 - alpha)) + (peer_arr * alpha)
        
        # Normalize
        norm = np.linalg.norm(new_embedding)
        if norm > 0:
            new_embedding = new_embedding / norm
            
        self.update_self_image(new_embedding.tolist())
        logger.info(f"🧠 AESTHETIC DRIFT: Influenced by resonant peer (Alpha: {alpha})")

    async def offload_compute_task(self, task_payload: Dict[str, Any]):
        """Find a friend and give them work. Now checks capabilities."""
        resonant_peers = self.relativity.get_resonant_peers()
        
        # Filter by capability if we can access the telepathy peer list
        # We need to map relativity peer IDs back to telepathy peer info
        # Relativity tracks 'friends' by ID. Telepathy tracks connection info by ID.
        
        capable_peers = []
        for peer_id in resonant_peers:
            if peer_id in self.telepathy.peers:
                peer_info = self.telepathy.peers[peer_id]
                # Handle new dict structure
                if isinstance(peer_info, dict):
                    caps = peer_info.get("capabilities", [])
                    if "compute" in caps:
                        capable_peers.append(peer_id)
                else:
                    # Legacy peer (assume capable for now or skip)
                    capable_peers.append(peer_id)

        if not capable_peers:
            logger.warning("⚠️ No resonant AND capable peers found for offloading.")
            return False
            
        # Pick one at random
        target = capable_peers[0] # Simple selection
        logger.info(f"📤 Offloading task to {target} (Capability Verified)...")
        
        await self.telepathy.transmit_thought(
            target_node_id=target,
            signal_type="COMPUTE_OFFLOAD",
            payload=task_payload,
            vector_embedding=self.local_embedding
        )
        return True

    def ignore_heretic(self, peer_id: str):
        """Logic to discard dissonant signals."""
        logger.info(f"🛡️ SHIELDS UP: Ignoring heretical signal from {peer_id}")

if __name__ == "__main__":
    daemon = SwarmDaemon()
    try:
        asyncio.run(daemon.start())
    except KeyboardInterrupt:
        pass
