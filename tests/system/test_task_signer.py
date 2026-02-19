import pytest
import json
from cryptography.hazmat.primitives.asymmetric import ed25519
from systems.visual_shell.swarm.task_signer import TaskSigner

class TestTaskSigner:
    """Tests for the cryptographic task signer."""

    @pytest.fixture
    def key_pair(self):
        private_key = ed25519.Ed25519PrivateKey.generate()
        public_key = private_key.public_key()
        return private_key, public_key

    @pytest.mark.asyncio
    async def test_task_signer_initialization(self, key_pair):
        """TaskSigner initializes with private and public keys."""
        private_key, public_key = key_pair
        signer = TaskSigner(private_key=private_key, public_key=public_key)
        
        assert signer.private_key == private_key
        assert signer.public_key == public_key

    @pytest.mark.asyncio
    async def test_sign_and_verify_payload(self, key_pair):
        """TaskSigner can sign a payload and verify the signature."""
        private_key, public_key = key_pair
        signer = TaskSigner(private_key=private_key, public_key=public_key)
        
        payload = {"task_id": "task-123", "data": "hello"}
        signed_data = await signer.sign_payload(payload)
        
        assert "signature" in signed_data
        assert "nonce" in signed_data
        assert signed_data["payload"] == payload
        
        # Verify
        assert await signer.verify_signature(signed_data, public_key) is True

    @pytest.mark.asyncio
    async def test_invalid_signature_rejection(self, key_pair):
        """TaskSigner rejects payloads with invalid signatures."""
        private_key, public_key = key_pair
        signer = TaskSigner(private_key=private_key, public_key=public_key)
        
        payload = {"task_id": "task-123"}
        signed_data = await signer.sign_payload(payload)
        
        # Tamper with payload
        signed_data["payload"]["task_id"] = "task-456"
        
        assert await signer.verify_signature(signed_data, public_key) is False

    @pytest.mark.asyncio
    async def test_replay_prevention(self, key_pair):
        """TaskSigner prevents replay attacks using nonces."""
        private_key, public_key = key_pair
        signer = TaskSigner(private_key=private_key, public_key=public_key)
        
        payload = {"task_id": "task-123"}
        signed_data = await signer.sign_payload(payload)
        
        # First verification succeeds
        assert await signer.verify_signature(signed_data, public_key) is True
        
        # Second verification with same nonce fails
        assert await signer.verify_signature(signed_data, public_key) is False

    @pytest.mark.asyncio
    async def test_wrong_public_key(self, key_pair):
        """TaskSigner rejects signatures from unknown public keys."""
        private_key, public_key = key_pair
        signer = TaskSigner(private_key=private_key, public_key=public_key)
        
        payload = {"task_id": "task-123"}
        signed_data = await signer.sign_payload(payload)
        
        # Generate another key pair
        other_public_key = ed25519.Ed25519PrivateKey.generate().public_key()
        
        assert await signer.verify_signature(signed_data, other_public_key) is False
