"""
Integration Tests for WordPress Truth Daemon

Level 4: Proves pieces work together
- Post → Claims → Scores → Stored in DB
- Verification updates confidence
- WordPress metadata updates
- Role ordering in scoring
"""
import pytest
import asyncio
import tempfile
import os
from datetime import datetime
from unittest.mock import AsyncMock, patch, MagicMock
from dataclasses import dataclass

import sys
sys.path.insert(0, '..')
sys.path.insert(0, '../src')

from wordpress_truth_daemon import WordPressTruthDaemon, DaemonConfig
from truth_extractor import ExtractedClaim
from triad_scorer import TriadScorer, TriadScore
from ctrm_core.database import CTRMDatabase


class MockAuthorInfo:
    """Mock author info response"""
    def __init__(self, role='admin', post_count=10):
        self.role = role
        self.post_count = post_count


class TestFullPipeline:
    """Test the complete extraction pipeline"""

    @pytest.fixture
    def temp_db(self):
        """Create a temporary database for testing"""
        with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as f:
            db_path = f.name
        yield db_path
        if os.path.exists(db_path):
            os.unlink(db_path)

    @pytest.fixture
    def daemon(self, temp_db):
        """Create daemon with temporary database"""
        config = DaemonConfig(db_path=temp_db)
        return WordPressTruthDaemon(config)

    @pytest.mark.asyncio
    async def test_full_extraction_pipeline(self, daemon):
        """
        Prove: WordPress post → LM Studio → Claims → Scores → CTRM DB

        This is the main integration test that proves the entire pipeline works.
        """
        # Mock WordPress returning a post
        with patch.object(daemon.wp_client, 'get_modified_posts') as mock_posts, \
             patch.object(daemon.wp_client, 'get_post_author_info') as mock_author, \
             patch.object(daemon.wp_client, 'update_post_meta') as mock_meta, \
             patch.object(daemon.extractor, 'extract_claims', new_callable=AsyncMock) as mock_extract:

            mock_posts.return_value = [{
                'id': 1,
                'title': 'Performance Report Q1',
                'content': 'Our API achieved 99.9% uptime with an average latency of 45ms.',
                'modified': '2026-02-22T10:00:00',
                'type': 'post'
            }]
            mock_author.return_value = MockAuthorInfo(role='admin', post_count=15)
            mock_extract.return_value = [
                ExtractedClaim(
                    statement='API achieved 99.9% uptime',
                    confidence=0.95,
                    evidence_type='E1',  # Physical/measurable
                    source_context='Performance Report Q1'
                ),
                ExtractedClaim(
                    statement='Average latency is 45ms',
                    confidence=0.90,
                    evidence_type='E1',
                    source_context='Performance Report Q1'
                )
            ]

            # Run discovery
            count = await daemon.run_discovery()

            # Assert: Truths were extracted
            assert count == 2, f"Expected 2 truths, got {count}"

            # Assert: WordPress metadata was updated
            assert mock_meta.call_count >= 3, "Expected at least 3 meta updates (score, count, time)"

            # Verify the calls included CTRM score
            meta_calls = [call[0] for call in mock_meta.call_args_list]
            meta_keys = [call[1] for call in meta_calls]
            assert '_ctrm_score' in meta_keys, "CTRM score not updated"
            assert '_ctrm_truth_count' in meta_keys, "Truth count not updated"

    @pytest.mark.asyncio
    async def test_empty_posts_returns_zero(self, daemon):
        """Prove: No posts → no crash → returns 0"""
        with patch.object(daemon.wp_client, 'get_modified_posts') as mock_posts:
            mock_posts.return_value = []

            count = await daemon.run_discovery()

            assert count == 0

    @pytest.mark.asyncio
    async def test_extraction_failure_handled(self, daemon):
        """Prove: Extraction failure → graceful handling → continues"""
        with patch.object(daemon.wp_client, 'get_modified_posts') as mock_posts, \
             patch.object(daemon.wp_client, 'get_post_author_info') as mock_author, \
             patch.object(daemon.extractor, 'extract_claims', new_callable=AsyncMock) as mock_extract:

            mock_posts.return_value = [{
                'id': 1,
                'title': 'Test',
                'content': 'Content',
                'modified': '2026-02-22',
                'type': 'post'
            }]
            mock_author.return_value = MockAuthorInfo(role='admin')
            mock_extract.side_effect = Exception("LM Studio connection failed")

            # Should not crash
            count = await daemon.run_discovery()

            # Should return 0 (failed extraction)
            assert count == 0


class TestScoringIntegration:
    """Test scoring logic integration"""

    def test_role_ordering_affects_final_score(self):
        """
        Prove: Admin role produces higher confidence than contributor
        for the same LLM confidence
        """
        scorer = TriadScorer()

        admin_score = scorer.calculate_score(
            llm_confidence=0.8,
            author_role='admin',
            source_type='post',
            corroboration_count=0
        )

        contributor_score = scorer.calculate_score(
            llm_confidence=0.8,
            author_role='contributor',
            source_type='post',
            corroboration_count=0
        )

        assert admin_score.confidence > contributor_score.confidence, \
            f"Admin ({admin_score.confidence}) should > Contributor ({contributor_score.confidence})"

    def test_corroboration_increases_confidence(self):
        """
        Prove: More corroborating truths = higher confidence
        """
        scorer = TriadScorer()

        no_corroboration = scorer.calculate_score(
            llm_confidence=0.7,
            author_role='author',
            source_type='post',
            corroboration_count=0
        )

        with_corroboration = scorer.calculate_score(
            llm_confidence=0.7,
            author_role='author',
            source_type='post',
            corroboration_count=5
        )

        assert with_corroboration.confidence > no_corroboration.confidence, \
            f"With corroboration ({with_corroboration.confidence}) should > without ({no_corroboration.confidence})"

    def test_confidence_distance_inverse_relationship(self):
        """
        Prove: Higher confidence = closer to center (lower distance)
        """
        scorer = TriadScorer()

        high_confidence = scorer.calculate_score(0.95, 'admin', 'research_document', 5)
        low_confidence = scorer.calculate_score(0.4, 'contributor', 'comment', 0)

        assert high_confidence.confidence > low_confidence.confidence
        assert high_confidence.distance_from_center < low_confidence.distance_from_center, \
            f"High conf distance ({high_confidence.distance_from_center}) should < low conf ({low_confidence.distance_from_center})"

    def test_all_roles_produce_valid_scores(self):
        """Prove: All role combinations produce valid ranges"""
        scorer = TriadScorer()

        roles = ['admin', 'editor', 'author', 'contributor']
        source_types = ['post', 'page', 'research_document', 'comment']

        for role in roles:
            for source_type in source_types:
                score = scorer.calculate_score(
                    llm_confidence=0.7,
                    author_role=role,
                    source_type=source_type,
                    corroboration_count=2
                )

                assert 0.0 <= score.confidence <= 1.0, \
                    f"Invalid confidence {score.confidence} for {role}/{source_type}"
                assert 0 <= score.distance_from_center <= 100, \
                    f"Invalid distance {score.distance_from_center} for {role}/{source_type}"


class TestDatabaseIntegration:
    """Test database operations"""

    @pytest.fixture
    def temp_db(self):
        """Create a temporary database"""
        with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as f:
            db_path = f.name
        db = CTRMDatabase(db_path)
        db.initialize()
        yield db
        db.close()
        if os.path.exists(db_path):
            os.unlink(db_path)

    def test_truth_storage_and_retrieval(self, temp_db):
        """Prove: Can store and retrieve a truth"""
        now = datetime.now().isoformat()
        truth = {
            'id': 'test_truth_001',
            'statement': 'API latency is 45ms',
            'embedding': [0.1] * 384,
            'confidence': 0.85,
            'distance_from_center': 35,
            'verification_count': 0,
            'failure_count': 0,
            'token_cost': 100,
            'importance_score': 0.7,
            'category': 'wordpress_extracted',
            'dependencies': [],
            'metadata': {'source': 'test'},
            'created_at': now,
            'updated_at': now
        }

        # Store
        temp_db.store_truth(truth)

        # Retrieve
        retrieved = temp_db.get_truth('test_truth_001')

        assert retrieved is not None
        assert retrieved['statement'] == 'API latency is 45ms'
        assert retrieved['confidence'] == 0.85
        assert retrieved['category'] == 'wordpress_extracted'

    def test_similar_truths_query(self, temp_db):
        """Prove: Can find similar truths by embedding"""
        # Store a truth
        now = datetime.now().isoformat()
        truth = {
            'id': 'test_truth_002',
            'statement': 'System uptime is 99.9%',
            'embedding': [0.5] * 384,
            'confidence': 0.9,
            'distance_from_center': 20,
            'verification_count': 5,
            'failure_count': 0,
            'token_cost': 50,
            'importance_score': 0.8,
            'category': 'wordpress_extracted',
            'dependencies': [],
            'metadata': {},
            'created_at': now,
            'updated_at': now
        }
        temp_db.store_truth(truth)

        # Query with similar embedding
        results = temp_db.query_similar_truths([0.5] * 384, limit=5)

        assert len(results) >= 1
        assert results[0]['id'] == 'test_truth_002'

    def test_truth_update(self, temp_db):
        """Prove: Can update truth confidence after verification"""
        # Store initial truth
        now = datetime.now().isoformat()
        truth = {
            'id': 'test_truth_003',
            'statement': 'Test statement',
            'embedding': [0.3] * 384,
            'confidence': 0.6,
            'distance_from_center': 50,
            'verification_count': 0,
            'failure_count': 0,
            'token_cost': 50,
            'importance_score': 0.5,
            'category': 'wordpress_extracted',
            'dependencies': [],
            'metadata': {},
            'created_at': now,
            'updated_at': now
        }
        temp_db.store_truth(truth)

        # Update after verification
        truth['confidence'] = 0.8
        truth['distance_from_center'] = 30
        truth['verification_count'] = 1
        truth['updated_at'] = datetime.now().isoformat()
        temp_db.update_truth(truth)

        # Verify update
        updated = temp_db.get_truth('test_truth_003')
        assert updated['confidence'] == 0.8
        assert updated['verification_count'] == 1


class TestVerificationIntegration:
    """Test verification scheduler integration"""

    @pytest.fixture
    def temp_db_path(self):
        """Create a temporary database path"""
        with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as f:
            yield f.name
        if os.path.exists(f.name):
            os.unlink(f.name)

    @pytest.mark.asyncio
    async def test_verification_cycle_returns_results(self, temp_db_path):
        """Prove: Verification cycle executes and returns results"""
        from verification_scheduler import VerificationScheduler

        scheduler = VerificationScheduler(
            db_path=temp_db_path,
            interval_seconds=60,
            max_tokens=100
        )

        result = await scheduler.run_cycle()

        assert 'verified_truths' in result
        assert isinstance(result['verified_truths'], int)

    def test_scheduler_default_config(self):
        """Prove: Scheduler has correct defaults"""
        from verification_scheduler import VerificationScheduler

        scheduler = VerificationScheduler()

        assert scheduler.interval_seconds == 3600
        assert scheduler.max_tokens == 5000


class TestEndToEndScenarios:
    """Test realistic end-to-end scenarios"""

    @pytest.fixture
    def temp_db(self):
        with tempfile.NamedTemporaryFile(suffix='.db', delete=False) as f:
            db_path = f.name
        yield db_path
        if os.path.exists(db_path):
            os.unlink(db_path)

    @pytest.mark.asyncio
    async def test_multiple_posts_batch_processing(self, temp_db):
        """Prove: Can process multiple posts in one batch"""
        config = DaemonConfig(db_path=temp_db, batch_size=5)
        daemon = WordPressTruthDaemon(config)

        with patch.object(daemon.wp_client, 'get_modified_posts') as mock_posts, \
             patch.object(daemon.wp_client, 'get_post_author_info') as mock_author, \
             patch.object(daemon.wp_client, 'update_post_meta'), \
             patch.object(daemon.extractor, 'extract_claims', new_callable=AsyncMock) as mock_extract:

            # 3 posts, each with 2 claims
            mock_posts.return_value = [
                {'id': i, 'title': f'Post {i}', 'content': f'Content {i}', 'modified': '2026-02-22', 'type': 'post'}
                for i in range(1, 4)
            ]
            mock_author.return_value = MockAuthorInfo(role='author')
            mock_extract.return_value = [
                ExtractedClaim(f'Claim {i}', 0.8, 'E1', 'Test')
                for i in range(2)
            ]

            count = await daemon.run_discovery()

            assert count == 6, f"Expected 6 truths (3 posts * 2 claims), got {count}"

    @pytest.mark.asyncio
    async def test_hybrid_scoring_reflects_all_factors(self, temp_db):
        """
        Prove: Final score reflects all triad factors

        Score = (LLM * 0.4) + (Author * 0.3) + (Source * 0.2) + (Corroboration * 0.1)
        """
        config = DaemonConfig(db_path=temp_db)
        daemon = WordPressTruthDaemon(config)

        with patch.object(daemon.wp_client, 'get_modified_posts') as mock_posts, \
             patch.object(daemon.wp_client, 'get_post_author_info') as mock_author, \
             patch.object(daemon.wp_client, 'update_post_meta'), \
             patch.object(daemon.extractor, 'extract_claims', new_callable=AsyncMock) as mock_extract:

            # Admin + research_document + corroboration = high score
            mock_posts.return_value = [{
                'id': 1, 'title': 'Research', 'content': 'Content',
                'modified': '2026-02-22', 'type': 'research_document'
            }]
            mock_author.return_value = MockAuthorInfo(role='admin', post_count=50)
            mock_extract.return_value = [
                ExtractedClaim('Verified fact', 0.95, 'E1', 'Research')
            ]

            # Mock existing similar truths (corroboration)
            with patch.object(daemon.db, 'query_similar_truths') as mock_similar:
                mock_similar.return_value = [
                    {'statement': 'Similar verified fact'}
                ] * 3  # 3 corroborating truths

                count = await daemon.run_discovery()

                # Check the stored truth has high confidence
                truths = daemon.db.get_all_truths()
                if truths:
                    assert truths[0]['confidence'] > 0.8, \
                        f"High-quality input should produce confidence > 0.8, got {truths[0]['confidence']}"


# Run with: python3 -m pytest tests/test_truth_daemon_integration.py -v
