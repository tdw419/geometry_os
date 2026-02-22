import asyncio
import hashlib
import logging
from typing import Dict, Any
from systems.swarm.telepathy_protocol import TelepathyNode, TelepathySignal
from systems.transpiler.safety_verifier import ProofWrightLite

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(levelname)s] %(message)s')
logger = logging.getLogger("DistributedVerifier")

class DistributedVerifierNode(TelepathyNode):
    """
    A 'Verifying Neuron' that processes formal verification requests
    from the swarm and returns Proof Artifacts.
    """
    def __init__(self, port=7000):
        super().__init__(port=port, capabilities=["formal_verification", "proofwright_lite"])
        self.verifier = ProofWrightLite()
        self.register_observer(self.on_signal_received)

    def on_signal_received(self, signal: TelepathySignal):
        """Observer callback for incoming signals."""
        if signal.signal_type == "VERIFY_REQUEST":
            # Schedule the handler in the event loop
            asyncio.create_task(self.handle_verify_request(signal))

    async def handle_verify_request(self, signal: TelepathySignal):
        """Process a verification request and return the result."""
        dis_code = signal.payload.get("code")
        dis_type = signal.payload.get("type", "wgsl") # wgsl or python
        job_id = signal.payload.get("job_id", "unknown")
        
        logger.info(f"🔬 Verification Job [{job_id}] received from {signal.source_id}")
        
        if dis_type == "wgsl":
            is_safe, violations = self.verifier.verify_wgsl(dis_code)
        else:
            is_safe, violations = self.verifier.verify_python_intent(dis_code)
            
        # Generate Proof Artifact (Hash + Status + Node Signature)
        proof_payload = {
            "job_id": job_id,
            "is_safe": is_safe,
            "violations": violations,
            "dis_hash": hashlib.sha256(dis_code.encode()).hexdigest(),
            "verifier_id": self.node_id,
            "proof_standard": "ProofWright-Lite-v1"
        }
        
        logger.info(f"✅ Job [{job_id}] complete. Status: {'SAFE' if is_safe else 'FAILED'}")
        
        # Transmit result back to source
        await self.transmit_thought(
            target_node_id=signal.source_id,
            signal_type="VERIFY_RESPONSE",
            payload=proof_payload
        )

async def main():
    # Use a specific port for verification nodes
    node = DistributedVerifierNode(port=7000)
    await node.start()

if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        logger.info("Verifier node shutting down.")
