"""
Tests for TectonicClaim data structures.

Task 1.1 of Tectonic Realignment Plan.
"""

import pytest
import time
import struct
import uuid

from systems.tectonic.claim import (
    ClaimStatus,
    TectonicClaim,
    TectonicBid,
    TectonicSettlement,
    TECTONIC_SETTLE_OPCODE,
)


class TestClaimStatus:
    """Tests for ClaimStatus enum."""

    def test_status_values(self):
        """Test all expected status values exist."""
        assert ClaimStatus.PENDING.value == "pending"
        assert ClaimStatus.APPROVED.value == "approved"
        assert ClaimStatus.REJECTED.value == "rejected"
        assert ClaimStatus.ESCALATED.value == "escalated"

    def test_status_count(self):
        """Test we have exactly 4 statuses."""
        assert len(ClaimStatus) == 4


class TestTectonicClaim:
    """Tests for TectonicClaim dataclass."""

    def test_claim_creation_with_defaults(self):
        """Test creating a claim with auto-generated fields."""
        before = time.time()
        claim = TectonicClaim(
            tile=(10, 20),
            purpose="build_sensor",
            bid=50.0,
            agent_id="agent-001"
        )
        after = time.time()

        assert claim.tile == (10, 20)
        assert claim.purpose == "build_sensor"
        assert claim.bid == 50.0
        assert claim.agent_id == "agent-001"
        assert claim.status == ClaimStatus.PENDING
        assert before <= claim.timestamp <= after
        # Verify claim_id is a valid UUID
        uuid.UUID(claim.claim_id)  # Will raise if invalid

    def test_claim_creation_with_explicit_fields(self):
        """Test creating a claim with all fields specified."""
        claim = TectonicClaim(
            tile=(0, 0),
            purpose="test",
            bid=100.0,
            agent_id="agent-002",
            timestamp=12345.0,
            status=ClaimStatus.APPROVED,
            claim_id="custom-id-123"
        )

        assert claim.tile == (0, 0)
        assert claim.timestamp == 12345.0
        assert claim.status == ClaimStatus.APPROVED
        assert claim.claim_id == "custom-id-123"

    def test_claim_serialization(self):
        """Test to_dict serializes claim correctly."""
        claim = TectonicClaim(
            tile=(5, 15),
            purpose="deploy_daemon",
            bid=75.5,
            agent_id="agent-003",
            timestamp=1000.0,
            status=ClaimStatus.ESCALATED,
            claim_id="test-claim-id"
        )

        data = claim.to_dict()

        assert data["tile"] == [5, 15]
        assert data["purpose"] == "deploy_daemon"
        assert data["bid"] == 75.5
        assert data["agent_id"] == "agent-003"
        assert data["timestamp"] == 1000.0
        assert data["status"] == "escalated"
        assert data["claim_id"] == "test-claim-id"

    def test_claim_deserialization(self):
        """Test from_dict creates claim correctly."""
        data = {
            "tile": [100, 200],
            "purpose": "memory_bank",
            "bid": 200.0,
            "agent_id": "agent-004",
            "timestamp": 5000.0,
            "status": "rejected",
            "claim_id": "claim-xyz"
        }

        claim = TectonicClaim.from_dict(data)

        assert claim.tile == (100, 200)
        assert claim.purpose == "memory_bank"
        assert claim.bid == 200.0
        assert claim.agent_id == "agent-004"
        assert claim.timestamp == 5000.0
        assert claim.status == ClaimStatus.REJECTED
        assert claim.claim_id == "claim-xyz"

    def test_claim_roundtrip(self):
        """Test serialization then deserialization preserves data."""
        original = TectonicClaim(
            tile=(42, 69),
            purpose="evolution_node",
            bid=999.99,
            agent_id="agent-roundtrip",
            timestamp=99999.0,
            status=ClaimStatus.APPROVED,
            claim_id="roundtrip-id"
        )

        data = original.to_dict()
        restored = TectonicClaim.from_dict(data)

        assert restored.tile == original.tile
        assert restored.purpose == original.purpose
        assert restored.bid == original.bid
        assert restored.agent_id == original.agent_id
        assert restored.timestamp == original.timestamp
        assert restored.status == original.status
        assert restored.claim_id == original.claim_id

    def test_uuid_generation_uniqueness(self):
        """Test that claim_id generation is unique."""
        claims = [
            TectonicClaim(
                tile=(i, i),
                purpose="test",
                bid=1.0,
                agent_id="agent"
            )
            for i in range(100)
        ]

        claim_ids = [c.claim_id for c in claims]
        assert len(set(claim_ids)) == 100  # All unique

    def test_invalid_tile_raises_error(self):
        """Test that invalid tile raises ValueError."""
        with pytest.raises(ValueError, match="tile must be a tuple"):
            TectonicClaim(
                tile=[1, 2],  # List instead of tuple
                purpose="test",
                bid=1.0,
                agent_id="agent"
            )

    def test_invalid_status_raises_error(self):
        """Test that invalid status raises ValueError."""
        with pytest.raises(ValueError, match="status must be a ClaimStatus"):
            TectonicClaim(
                tile=(1, 2),
                purpose="test",
                bid=1.0,
                agent_id="agent",
                status="pending"  # String instead of enum
            )


class TestTectonicBid:
    """Tests for TectonicBid dataclass."""

    def test_bid_creation_with_defaults(self):
        """Test creating a bid with auto-generated timestamp."""
        before = time.time()
        bid = TectonicBid(
            claim_id="claim-123",
            amount=150.0,
            agent_id="agent-bidder"
        )
        after = time.time()

        assert bid.claim_id == "claim-123"
        assert bid.amount == 150.0
        assert bid.agent_id == "agent-bidder"
        assert before <= bid.timestamp <= after

    def test_bid_creation_with_explicit_timestamp(self):
        """Test creating a bid with explicit timestamp."""
        bid = TectonicBid(
            claim_id="claim-456",
            amount=200.0,
            agent_id="agent-bidder-2",
            timestamp=12345.0
        )

        assert bid.timestamp == 12345.0

    def test_bid_serialization(self):
        """Test to_dict serializes bid correctly."""
        bid = TectonicBid(
            claim_id="claim-789",
            amount=300.0,
            agent_id="agent-bidder-3",
            timestamp=5000.0
        )

        data = bid.to_dict()

        assert data["claim_id"] == "claim-789"
        assert data["amount"] == 300.0
        assert data["agent_id"] == "agent-bidder-3"
        assert data["timestamp"] == 5000.0

    def test_bid_deserialization(self):
        """Test from_dict creates bid correctly."""
        data = {
            "claim_id": "claim-abc",
            "amount": 500.0,
            "agent_id": "agent-bidder-4",
            "timestamp": 10000.0
        }

        bid = TectonicBid.from_dict(data)

        assert bid.claim_id == "claim-abc"
        assert bid.amount == 500.0
        assert bid.agent_id == "agent-bidder-4"
        assert bid.timestamp == 10000.0

    def test_bid_roundtrip(self):
        """Test serialization then deserialization preserves data."""
        original = TectonicBid(
            claim_id="roundtrip-claim",
            amount=999.99,
            agent_id="roundtrip-agent",
            timestamp=88888.0
        )

        data = original.to_dict()
        restored = TectonicBid.from_dict(data)

        assert restored.claim_id == original.claim_id
        assert restored.amount == original.amount
        assert restored.agent_id == original.agent_id
        assert restored.timestamp == original.timestamp


class TestTectonicSettlement:
    """Tests for TectonicSettlement dataclass."""

    def test_settlement_creation_with_defaults(self):
        """Test creating a settlement with auto-generated fields."""
        claim = TectonicClaim(
            tile=(10, 20),
            purpose="test",
            bid=50.0,
            agent_id="agent-001"
        )
        program = TectonicSettlement.create_program((10, 20))

        before = time.time()
        settlement = TectonicSettlement(
            claim=claim,
            winner="agent-001",
            force=50.0,
            program=program
        )
        after = time.time()

        assert settlement.claim == claim
        assert settlement.winner == "agent-001"
        assert settlement.force == 50.0
        assert settlement.program == program
        assert before <= settlement.settled_at <= after

    def test_settlement_serialization(self):
        """Test to_dict serializes settlement correctly."""
        claim = TectonicClaim(
            tile=(5, 10),
            purpose="sensor",
            bid=100.0,
            agent_id="agent-002",
            timestamp=1000.0,
            status=ClaimStatus.APPROVED,
            claim_id="claim-xyz"
        )
        program = bytes([TECTONIC_SETTLE_OPCODE, 5, 0, 0, 0, 10, 0, 0, 0])

        settlement = TectonicSettlement(
            claim=claim,
            winner="agent-002",
            force=100.0,
            program=program,
            settled_at=2000.0
        )

        data = settlement.to_dict()

        assert data["claim"]["claim_id"] == "claim-xyz"
        assert data["winner"] == "agent-002"
        assert data["force"] == 100.0
        assert data["program"] == list(program)
        assert data["settled_at"] == 2000.0

    def test_settlement_deserialization(self):
        """Test from_dict creates settlement correctly."""
        data = {
            "claim": {
                "tile": [15, 25],
                "purpose": "daemon",
                "bid": 200.0,
                "agent_id": "agent-003",
                "timestamp": 3000.0,
                "status": "approved",
                "claim_id": "claim-abc"
            },
            "winner": "agent-003",
            "force": 200.0,
            "program": [TECTONIC_SETTLE_OPCODE] + [0] * 8,
            "settled_at": 4000.0
        }

        settlement = TectonicSettlement.from_dict(data)

        assert settlement.claim.tile == (15, 25)
        assert settlement.claim.claim_id == "claim-abc"
        assert settlement.winner == "agent-003"
        assert settlement.force == 200.0
        assert settlement.settled_at == 4000.0

    def test_settlement_roundtrip(self):
        """Test serialization then deserialization preserves data."""
        claim = TectonicClaim(
            tile=(99, 88),
            purpose="roundtrip",
            bid=777.0,
            agent_id="agent-roundtrip",
            timestamp=11111.0,
            status=ClaimStatus.APPROVED,
            claim_id="roundtrip-claim"
        )
        program = TectonicSettlement.create_program((99, 88))

        original = TectonicSettlement(
            claim=claim,
            winner="agent-roundtrip",
            force=777.0,
            program=program,
            settled_at=22222.0
        )

        data = original.to_dict()
        restored = TectonicSettlement.from_dict(data)

        assert restored.claim.tile == original.claim.tile
        assert restored.claim.claim_id == original.claim.claim_id
        assert restored.winner == original.winner
        assert restored.force == original.force
        assert restored.program == original.program
        assert restored.settled_at == original.settled_at

    def test_to_geoasm_returns_program(self):
        """Test to_geoasm returns the program bytes."""
        claim = TectonicClaim(
            tile=(42, 69),
            purpose="test",
            bid=1.0,
            agent_id="agent"
        )
        program = TectonicSettlement.create_program((42, 69))

        settlement = TectonicSettlement(
            claim=claim,
            winner="agent",
            force=1.0,
            program=program
        )

        assert settlement.to_geoasm() == program

    def test_create_program_format(self):
        """Test create_program generates correct GeoASM format."""
        program = TectonicSettlement.create_program((100, 200))

        # Parse the program
        opcode, x, y = struct.unpack("<Bii", program)

        assert opcode == TECTONIC_SETTLE_OPCODE
        assert x == 100
        assert y == 200
        assert len(program) == 9  # 1 + 4 + 4 bytes

    def test_create_program_negative_coords(self):
        """Test create_program handles negative coordinates."""
        program = TectonicSettlement.create_program((-50, -100))

        opcode, x, y = struct.unpack("<Bii", program)

        assert opcode == TECTONIC_SETTLE_OPCODE
        assert x == -50
        assert y == -100

    def test_create_program_large_coords(self):
        """Test create_program handles large coordinates."""
        program = TectonicSettlement.create_program((1000000, 2000000))

        opcode, x, y = struct.unpack("<Bii", program)

        assert opcode == TECTONIC_SETTLE_OPCODE
        assert x == 1000000
        assert y == 2000000


class TestStatusTransitions:
    """Tests for status transition scenarios."""

    def test_pending_to_approved(self):
        """Test transitioning from PENDING to APPROVED."""
        claim = TectonicClaim(
            tile=(1, 1),
            purpose="test",
            bid=10.0,
            agent_id="agent"
        )
        assert claim.status == ClaimStatus.PENDING

        # Simulate status change (in real system, this would be via a method)
        claim = TectonicClaim(
            tile=claim.tile,
            purpose=claim.purpose,
            bid=claim.bid,
            agent_id=claim.agent_id,
            timestamp=claim.timestamp,
            status=ClaimStatus.APPROVED,
            claim_id=claim.claim_id
        )
        assert claim.status == ClaimStatus.APPROVED

    def test_pending_to_rejected(self):
        """Test transitioning from PENDING to REJECTED."""
        claim = TectonicClaim(
            tile=(2, 2),
            purpose="test",
            bid=20.0,
            agent_id="agent"
        )
        assert claim.status == ClaimStatus.PENDING

        claim = TectonicClaim(
            tile=claim.tile,
            purpose=claim.purpose,
            bid=claim.bid,
            agent_id=claim.agent_id,
            timestamp=claim.timestamp,
            status=ClaimStatus.REJECTED,
            claim_id=claim.claim_id
        )
        assert claim.status == ClaimStatus.REJECTED

    def test_pending_to_escalated(self):
        """Test transitioning from PENDING to ESCALATED."""
        claim = TectonicClaim(
            tile=(3, 3),
            purpose="test",
            bid=30.0,
            agent_id="agent"
        )
        assert claim.status == ClaimStatus.PENDING

        claim = TectonicClaim(
            tile=claim.tile,
            purpose=claim.purpose,
            bid=claim.bid,
            agent_id=claim.agent_id,
            timestamp=claim.timestamp,
            status=ClaimStatus.ESCALATED,
            claim_id=claim.claim_id
        )
        assert claim.status == ClaimStatus.ESCALATED

    def test_all_statuses_serializable(self):
        """Test all statuses serialize and deserialize correctly."""
        for status in ClaimStatus:
            claim = TectonicClaim(
                tile=(0, 0),
                purpose="test",
                bid=1.0,
                agent_id="agent",
                status=status
            )

            data = claim.to_dict()
            restored = TectonicClaim.from_dict(data)

            assert restored.status == status
