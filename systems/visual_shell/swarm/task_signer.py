"""
Task Signer - Handles cryptographic signing and verification of task payloads.
"""

import json
import logging
import secrets
from typing import Any

from cryptography.exceptions import InvalidSignature
from cryptography.hazmat.primitives.asymmetric import ed25519

logger = logging.getLogger(__name__)

class TaskSigner:
    """
    Provides Ed25519 signing and verification for swarm tasks.
    Includes nonce-based replay prevention.
    """

    def __init__(self, private_key: ed25519.Ed25519PrivateKey | None = None,
                 public_key: ed25519.Ed25519PublicKey | None = None):
        self.private_key = private_key
        self.public_key = public_key

        if self.private_key and not self.public_key:
            self.public_key = self.private_key.public_key()

        self.used_nonces: set[str] = set()

        logger.info("TaskSigner initialized")

    async def sign_payload(self, payload: dict[str, Any]) -> dict[str, Any]:
        """
        Signs a payload and attaches a nonce and signature.
        """
        if not self.private_key:
            raise ValueError("Private key required for signing")

        nonce = secrets.token_hex(16)
        payload_json = json.dumps(payload, sort_keys=True)
        message = f"{nonce}:{payload_json}".encode()

        signature = self.private_key.sign(message)

        return {
            "payload": payload,
            "nonce": nonce,
            "signature": signature.hex()
        }

    async def verify_signature(self, signed_data: dict[str, Any],
                               public_key: ed25519.Ed25519PublicKey) -> bool:
        """
        Verifies the signature of a signed payload.
        Checks for nonces to prevent replays.
        """
        try:
            payload = signed_data.get("payload")
            nonce = signed_data.get("nonce")
            signature_hex = signed_data.get("signature")

            if not all([payload, nonce, signature_hex]):
                return False

            # Replay prevention
            if nonce in self.used_nonces:
                logger.warning(f"Replay attack detected with nonce: {nonce}")
                return False

            payload_json = json.dumps(payload, sort_keys=True)
            message = f"{nonce}:{payload_json}".encode()
            signature = bytes.fromhex(signature_hex)

            public_key.verify(signature, message)

            # Mark nonce as used only after successful verification
            self.used_nonces.add(nonce)
            return True

        except (InvalidSignature, ValueError, TypeError) as e:
            logger.error(f"Signature verification failed: {e}")
            return False
