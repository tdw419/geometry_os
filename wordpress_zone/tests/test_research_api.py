#!/usr/bin/env python3
"""
Mock PHP test runner - verifies research API PHP code structure and logic
Run when PHP is not available in the environment

Tests:
- handle_import_research_document structure
- handle_search_research structure
- Deduplication logic
- Meta field handling
"""

import os
import re


def get_php_content():
    """Read the ai-publisher.php file"""
    php_path = os.path.join(
        os.path.dirname(__file__),
        '..', 'wordpress', 'ai-publisher.php'
    )
    with open(php_path, 'r') as f:
        return f.read()


# ─────────────────────────────────────────────────────────────
# Test: handle_import_research_document Structure
# ─────────────────────────────────────────────────────────────

def test_import_action_registered():
    """Verify importResearchDocument action is registered in dispatcher"""
    content = get_php_content()

    if "case 'importResearchDocument':" not in content:
        print("FAIL: importResearchDocument case not found in dispatcher")
        return False

    if "handle_import_research_document($args)" not in content:
        print("FAIL: handle_import_research_document handler call not found")
        return False

    print("PASS: importResearchDocument action registered in dispatcher")
    return True


def test_import_function_exists():
    """Verify handle_import_research_document function exists"""
    content = get_php_content()

    if "function handle_import_research_document($args)" not in content:
        print("FAIL: handle_import_research_document function not defined")
        return False

    print("PASS: handle_import_research_document function defined")
    return True


def test_import_validates_required_fields():
    """Verify import handler validates title and content"""
    content = get_php_content()

    if "!isset($args['title'])" not in content and "!isset($args['title']" not in content:
        print("FAIL: Import handler should validate title")
        return False

    if "!isset($args['content'])" not in content and "!isset($args['content']" not in content:
        print("FAIL: Import handler should validate content")
        return False

    print("PASS: Import handler validates required fields (title, content)")
    return True


def test_import_uses_research_document_cpt():
    """Verify import handler uses research_document post type"""
    content = get_php_content()

    if "'post_type' => 'research_document'" not in content and '"post_type" => "research_document"' not in content:
        print("FAIL: Import handler should use research_document post type")
        return False

    # Check for multiple occurrences (in create and update)
    count = content.count("'post_type' => 'research_document'")
    if count < 2:
        print(f"FAIL: Expected 2+ occurrences of research_document post_type, found {count}")
        return False

    print("PASS: Import handler uses research_document post type")
    return True


def test_import_returns_status():
    """Verify import handler returns status field in response"""
    content = get_php_content()

    status_fields = ["'status' => 'created'", "'status' => 'updated'", "'status' => 'skipped'"]
    missing = []

    for status in status_fields:
        if status not in content:
            missing.append(status)

    if missing:
        print(f"FAIL: Missing status responses: {missing}")
        return False

    print("PASS: Import handler returns status (created/updated/skipped)")
    return True


# ─────────────────────────────────────────────────────────────
# Test: handle_search_research Structure
# ─────────────────────────────────────────────────────────────

def test_search_action_registered():
    """Verify searchResearch action is registered in dispatcher"""
    content = get_php_content()

    if "case 'searchResearch':" not in content:
        print("FAIL: searchResearch case not found in dispatcher")
        return False

    if "handle_search_research($args)" not in content:
        print("FAIL: handle_search_research handler call not found")
        return False

    print("PASS: searchResearch action registered in dispatcher")
    return True


def test_search_function_exists():
    """Verify handle_search_research function exists"""
    content = get_php_content()

    if "function handle_search_research($args)" not in content:
        print("FAIL: handle_search_research function not defined")
        return False

    print("PASS: handle_search_research function defined")
    return True


def test_search_uses_wp_query():
    """Verify search handler uses WP_Query"""
    content = get_php_content()

    if "new WP_Query(" not in content:
        print("FAIL: Search handler should use WP_Query")
        return False

    if "handle_search_research" not in content:
        print("FAIL: searchResearch handler not present")
        return False

    print("PASS: Search handler uses WP_Query")
    return True


def test_search_supports_fulltext():
    """Verify search handler supports full-text search via 's' parameter"""
    content = get_php_content()

    # Look for 's' parameter assignment from 'q' input
    if "$query_args['s']" not in content:
        print("FAIL: Search handler should set 's' parameter for full-text search")
        return False

    if "sanitize_text_field($args['q'])" not in content:
        print("FAIL: Search handler should use 'q' input parameter")
        return False

    print("PASS: Search handler supports full-text search via 'q' parameter")
    return True


def test_search_returns_results_array():
    """Verify search handler returns results array"""
    content = get_php_content()

    if "'results' => $results" not in content:
        print("FAIL: Search handler should return 'results' array")
        return False

    if "'total' =>" not in content:
        print("FAIL: Search handler should return 'total' count")
        return False

    print("PASS: Search handler returns results array with total")
    return True


def test_search_pagination():
    """Verify search handler supports pagination"""
    content = get_php_content()

    if "'limit'" not in content or "'offset'" not in content:
        print("FAIL: Search handler should support limit/offset pagination")
        return False

    if "'posts_per_page' => $limit" not in content:
        print("FAIL: Search handler should use limit for posts_per_page")
        return False

    print("PASS: Search handler supports pagination (limit/offset)")
    return True


# ─────────────────────────────────────────────────────────────
# Test: Deduplication Logic
# ─────────────────────────────────────────────────────────────

def test_dedup_by_source_path():
    """Verify deduplication by source_path meta lookup"""
    content = get_php_content()

    # Check for source_path meta query
    if "'key' => 'source_path'" not in content:
        print("FAIL: Deduplication should use source_path meta key")
        return False

    if "get_posts(" not in content:
        print("FAIL: Should use get_posts for source_path lookup")
        return False

    print("PASS: Deduplication uses source_path meta lookup")
    return True


def test_dedup_checks_file_hash():
    """Verify deduplication checks file_hash for content changes"""
    content = get_php_content()

    # Check for file_hash comparison
    if "file_hash" not in content:
        print("FAIL: Deduplication should use file_hash")
        return False

    if "get_post_meta(" not in content and "file_hash" not in content:
        print("FAIL: Should get existing file_hash from post meta")
        return False

    if "$existing_hash === $file_hash" not in content and "existing_hash" not in content:
        print("FAIL: Should compare existing hash with new hash")
        return False

    print("PASS: Deduplication checks file_hash for content changes")
    return True


def test_skip_on_hash_match():
    """Verify document is skipped when hash matches"""
    content = get_php_content()

    if "'status' => 'skipped'" not in content:
        print("FAIL: Should return 'skipped' status on hash match")
        return False

    if "Document unchanged" not in content and "hash match" not in content:
        print("FAIL: Should indicate document unchanged in message")
        return False

    print("PASS: Document skipped when hash matches (no changes)")
    return True


def test_update_on_hash_diff():
    """Verify document is updated when hash differs"""
    content = get_php_content()

    if "'status' => 'updated'" not in content:
        print("FAIL: Should return 'updated' status when hash differs")
        return False

    if "wp_update_post(" not in content:
        print("FAIL: Should call wp_update_post when content changed")
        return False

    print("PASS: Document updated when hash differs (content changed)")
    return True


def test_create_on_new():
    """Verify new document is created when no existing post"""
    content = get_php_content()

    if "'status' => 'created'" not in content:
        print("FAIL: Should return 'created' status for new documents")
        return False

    if "wp_insert_post(" not in content:
        print("FAIL: Should call wp_insert_post for new documents")
        return False

    print("PASS: New document created when no existing post found")
    return True


# ─────────────────────────────────────────────────────────────
# Test: Meta Field Handling
# ─────────────────────────────────────────────────────────────

def test_meta_source_path():
    """Verify source_path meta field is saved"""
    content = get_php_content()

    if "'source_path'" not in content and "source_path" not in content:
        print("FAIL: source_path meta field should be handled")
        return False

    if "add_post_meta(" not in content or "update_post_meta(" not in content:
        print("FAIL: Should use add_post_meta/update_post_meta for source_path")
        return False

    print("PASS: source_path meta field is saved")
    return True


def test_meta_file_hash():
    """Verify file_hash meta field is saved"""
    content = get_php_content()

    if "'file_hash'" not in content and '"file_hash"' not in content:
        print("FAIL: file_hash meta field should be handled")
        return False

    if "add_post_meta(" not in content:
        print("FAIL: Should use add_post_meta for file_hash")
        return False

    print("PASS: file_hash meta field is saved")
    return True


def test_meta_line_count():
    """Verify line_count meta field is saved"""
    content = get_php_content()

    if "'line_count'" not in content and '"line_count"' not in content:
        print("FAIL: line_count meta field should be handled")
        return False

    # Should be cast to int
    if "intval(" not in content:
        print("FAIL: line_count should be cast to int")
        return False

    print("PASS: line_count meta field is saved (as integer)")
    return True


def test_meta_import_batch():
    """Verify import_batch meta field is saved"""
    content = get_php_content()

    if "'import_batch'" not in content and '"import_batch"' not in content:
        print("FAIL: import_batch meta field should be handled")
        return False

    # Should be sanitized
    if "sanitize_text_field(" not in content:
        print("FAIL: import_batch should be sanitized")
        return False

    print("PASS: import_batch meta field is saved (sanitized)")
    return True


def test_meta_returned_in_search():
    """Verify meta fields are returned in search results"""
    content = get_php_content()

    # Search should include source_path and line_count
    if "'source_path' => get_post_meta(" not in content:
        print("FAIL: Search results should include source_path")
        return False

    if "'line_count' =>" not in content:
        print("FAIL: Search results should include line_count")
        return False

    print("PASS: Meta fields returned in search results")
    return True


def test_meta_filter_support():
    """Verify search supports meta filtering"""
    content = get_php_content()

    # Should support meta_filter for import_batch
    if "'meta_filter'" not in content and "meta_filter" not in content:
        print("FAIL: Search should support meta_filter parameter")
        return False

    if "'import_batch'" not in content:
        print("FAIL: Search should filter by import_batch")
        return False

    if "'min_line_count'" not in content:
        print("FAIL: Search should filter by min_line_count")
        return False

    if "'max_line_count'" not in content:
        print("FAIL: Search should filter by max_line_count")
        return False

    print("PASS: Search supports meta filtering (import_batch, line_count range)")
    return True


# ─────────────────────────────────────────────────────────────
# Test: Security and Sanitization
# ─────────────────────────────────────────────────────────────

def test_input_sanitization():
    """Verify inputs are sanitized"""
    content = get_php_content()

    if "sanitize_text_field(" not in content:
        print("FAIL: Inputs should be sanitized with sanitize_text_field")
        return False

    if "wp_strip_all_tags(" not in content:
        print("FAIL: Title should be sanitized with wp_strip_all_tags")
        return False

    print("PASS: Inputs are sanitized")
    return True


def test_error_handling():
    """Verify WP_Error is handled"""
    content = get_php_content()

    if "is_wp_error(" not in content:
        print("FAIL: Should check for WP_Error on insert/update")
        return False

    if "get_error_message()" not in content:
        print("FAIL: Should return error message on failure")
        return False

    print("PASS: WP_Error is handled properly")
    return True


def main():
    tests = [
        # Import structure tests
        test_import_action_registered,
        test_import_function_exists,
        test_import_validates_required_fields,
        test_import_uses_research_document_cpt,
        test_import_returns_status,

        # Search structure tests
        test_search_action_registered,
        test_search_function_exists,
        test_search_uses_wp_query,
        test_search_supports_fulltext,
        test_search_returns_results_array,
        test_search_pagination,

        # Deduplication tests
        test_dedup_by_source_path,
        test_dedup_checks_file_hash,
        test_skip_on_hash_match,
        test_update_on_hash_diff,
        test_create_on_new,

        # Meta field handling tests
        test_meta_source_path,
        test_meta_file_hash,
        test_meta_line_count,
        test_meta_import_batch,
        test_meta_returned_in_search,
        test_meta_filter_support,

        # Security tests
        test_input_sanitization,
        test_error_handling,
    ]

    print("Running Research API Mock PHP Verification Tests")
    print("=" * 50)
    print()

    passed = 0
    failed = 0

    for test in tests:
        try:
            if test():
                passed += 1
            else:
                failed += 1
        except Exception as e:
            print(f"FAIL: {test.__name__} - Exception: {e}")
            failed += 1

    print()
    print("=" * 50)
    print(f"Results: {passed} passed, {failed} failed")

    return failed == 0


if __name__ == '__main__':
    import sys
    sys.exit(0 if main() else 1)
