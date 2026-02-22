#!/usr/bin/env python3
"""
Geometry OS: Research Documents Batch Importer
----------------------------------------------
Imports research documents from /home/jericho/zion/docs/research into WordPress
as custom post type 'research_document' for AI semantic search access.

Forked from sync_skills_to_wp.py pattern.
"""

import os
import re
import glob
import hashlib
import argparse
import time
import logging
import requests
from dataclasses import dataclass
from typing import List, Optional

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)
logger = logging.getLogger(__name__)

# Configuration
RESEARCH_DOCS_DIR = "/home/jericho/zion/docs/research"
WP_PUBLISHER_URL = "http://localhost:8080/ai-publisher.php"
WP_AJAX_URL = "http://localhost:8080/wp-admin/admin-ajax.php"
WP_NONCE = "research_import_nonce"  # Must match wp_create_nonce in PHP
BATCH_SIZE = 50
BATCH_DELAY = 2  # seconds between batches
MAX_RETRIES = 2  # max retry attempts for transient API failures
DEFAULT_TIMEOUT = 30  # seconds for standard requests
LARGE_FILE_TIMEOUT = 120  # seconds for large file uploads (1MB+)
PROGRESS_UPDATE_INTERVAL = 5  # Update progress every N documents


@dataclass
class ResearchDocument:
    """Represents a research document ready for import."""
    file_path: str
    title: str
    content: str
    file_hash: str
    line_count: int


def extract_title_from_filename(file_path: str) -> str:
    """
    Extract title from filename pattern.
    Pattern: {number}_{topic}{iteration}.txt
    Example: 107_rre_recursive_development_system12.txt -> "Rre Recursive Development System"
    """
    filename = os.path.basename(file_path)
    name_without_ext = os.path.splitext(filename)[0]

    # Remove leading number and underscore: "107_" -> ""
    title = re.sub(r'^\d+_', '', name_without_ext)

    # Remove trailing iteration numbers: "12" -> ""
    title = re.sub(r'\d+$', '', title)

    # Replace underscores with spaces and capitalize
    title = title.replace('_', ' ').strip()
    title = ' '.join(word.capitalize() for word in title.split())

    # Fallback if empty
    if not title:
        title = name_without_ext.replace('_', ' ').title()

    return title


def calculate_file_hash(file_path: str) -> str:
    """Calculate SHA256 hash of file contents."""
    sha256 = hashlib.sha256()
    try:
        with open(file_path, 'rb') as f:
            for chunk in iter(lambda: f.read(8192), b''):
                sha256.update(chunk)
        return sha256.hexdigest()
    except PermissionError as e:
        logger.error(f"Permission denied reading file for hash: {file_path} - {e}")
        return ""
    except OSError as e:
        logger.error(f"OS error calculating hash for {file_path}: {e}")
        return ""
    except Exception as e:
        logger.error(f"Unexpected error calculating hash for {file_path}: {e}")
        return ""


def discover_documents(docs_dir: str = RESEARCH_DOCS_DIR, limit: Optional[int] = None) -> List[str]:
    """
    Discover all .txt and .md files in the research docs directory.
    Returns list of file paths, sorted alphabetically.
    """
    txt_files = glob.glob(os.path.join(docs_dir, "**/*.txt"), recursive=True)
    md_files = glob.glob(os.path.join(docs_dir, "**/*.md"), recursive=True)

    all_files = sorted(txt_files + md_files)

    if limit:
        all_files = all_files[:limit]

    return all_files


def parse_document(file_path: str) -> Optional[ResearchDocument]:
    """
    Parse a research document file.
    Returns ResearchDocument dataclass or None on error.
    """
    try:
        # Check file size first
        file_size = os.path.getsize(file_path)

        # Handle empty files (0 bytes) - skip with warning
        if file_size == 0:
            logger.warning(f"Skipping empty file (0 bytes): {file_path}")
            return None

        with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
            content = f.read()

        # Skip files with only whitespace
        if not content.strip():
            logger.warning(f"Skipping whitespace-only file: {file_path}")
            return None

        title = extract_title_from_filename(file_path)
        file_hash = calculate_file_hash(file_path)
        line_count = content.count('\n') + 1

        return ResearchDocument(
            file_path=file_path,
            title=title,
            content=content,
            file_hash=file_hash,
            line_count=line_count
        )
    except PermissionError as e:
        logger.error(f"Permission denied: {file_path} - {e}")
        return None
    except FileNotFoundError as e:
        logger.error(f"File not found: {file_path} - {e}")
        return None
    except IsADirectoryError as e:
        logger.error(f"Path is a directory, not a file: {file_path} - {e}")
        return None
    except UnicodeDecodeError as e:
        logger.error(f"Unicode decode error reading {file_path}: {e}")
        return None
    except OSError as e:
        logger.error(f"OS error reading {file_path}: {e}")
        return None
    except Exception as e:
        logger.error(f"Unexpected error parsing {file_path}: {e}")
        return None


def import_document_with_retry(
    doc: ResearchDocument,
    batch_id: str,
    max_retries: int = MAX_RETRIES
) -> tuple[str, Optional[str]]:
    """
    Import a single document with retry logic for transient failures.

    Returns:
        tuple of (status, error_message)
        status: 'created', 'updated', 'skipped', 'error'
        error_message: None on success, error string on failure
    """
    payload = {
        "action": "importResearchDocument",
        "title": doc.title,
        "content": doc.content,
        "meta": {
            "source_path": doc.file_path,
            "file_hash": doc.file_hash,
            "line_count": doc.line_count,
            "import_batch": batch_id
        }
    }

    # Determine timeout based on content size
    content_size = len(doc.content.encode('utf-8'))
    timeout = LARGE_FILE_TIMEOUT if content_size > 1_000_000 else DEFAULT_TIMEOUT

    last_error = None
    for attempt in range(max_retries + 1):
        try:
            response = requests.post(
                WP_PUBLISHER_URL,
                json=payload,
                timeout=timeout
            )

            if response.status_code == 200:
                data = response.json()
                if data.get("success"):
                    return (data.get("status", "unknown"), None)
                else:
                    return ("error", data.get("message", "Unknown error"))
            elif response.status_code >= 500:
                # Server error - retry
                last_error = f"HTTP {response.status_code}"
                if attempt < max_retries:
                    logger.warning(f"Server error for {doc.title[:50]}, retrying ({attempt + 1}/{max_retries})")
                    time.sleep(1 * (attempt + 1))  # Exponential backoff: 1s, 2s
                    continue
                return ("error", f"HTTP {response.status_code}")
            else:
                # Client error - don't retry
                return ("error", f"HTTP {response.status_code}")

        except requests.exceptions.Timeout:
            last_error = "Request timeout"
            if attempt < max_retries:
                logger.warning(f"Timeout for {doc.title[:50]} ({content_size} bytes), retrying ({attempt + 1}/{max_retries})")
                time.sleep(2 * (attempt + 1))  # Longer backoff for timeout
                continue
        except requests.exceptions.ConnectionError as e:
            last_error = f"Connection error: {e}"
            if attempt < max_retries:
                logger.warning(f"Connection error for {doc.title[:50]}, retrying ({attempt + 1}/{max_retries})")
                time.sleep(2 * (attempt + 1))
                continue
        except requests.exceptions.RequestException as e:
            last_error = f"Request error: {e}"
            if attempt < max_retries:
                logger.warning(f"Request error for {doc.title[:50]}, retrying ({attempt + 1}/{max_retries})")
                time.sleep(1 * (attempt + 1))
                continue
        except Exception as e:
            last_error = f"Unexpected error: {e}"
            logger.error(f"Unexpected error importing {doc.title[:50]}: {e}")
            break

    return ("error", last_error or "Unknown error")


def import_batch(documents: List[ResearchDocument], batch_id: str, dry_run: bool = False) -> dict:
    """
    Import a batch of documents to WordPress.
    Returns summary with counts of created, updated, skipped, errors.
    """
    results = {"created": 0, "updated": 0, "skipped": 0, "errors": 0}

    for doc in documents:
        if dry_run:
            logger.info(f"[DRY-RUN] Would import: {doc.title[:50]}...")
            results["created"] += 1
            continue

        status, error_msg = import_document_with_retry(doc, batch_id)

        if status == "created":
            results["created"] += 1
            logger.info(f"[created] {doc.title[:50]}")
        elif status == "updated":
            results["updated"] += 1
            logger.info(f"[updated] {doc.title[:50]}")
        elif status == "skipped":
            results["skipped"] += 1
            logger.info(f"[skipped] {doc.title[:50]}")
        else:
            results["errors"] += 1
            logger.error(f"[error] {doc.title[:50]}: {error_msg}")

    return results


def update_progress(
    processed: int,
    total: int,
    created: int,
    updated: int,
    skipped: int,
    errors: int,
    status: str = "running"
) -> bool:
    """
    Update import progress in WordPress transient via AJAX API.

    Args:
        processed: Number of documents processed so far
        total: Total number of documents to process
        created: Number of documents created
        updated: Number of documents updated
        skipped: Number of documents skipped
        errors: Number of errors
        status: Current status (running, complete, error)

    Returns:
        True if progress update succeeded, False otherwise
    """
    try:
        percent = int((processed / total * 100)) if total > 0 else 0
        message = f"Processing document {processed} of {total}..."

        if status == "complete":
            message = f"Import complete: {created} created, {updated} updated, {skipped} skipped, {errors} errors"
        elif status == "error":
            message = f"Import failed with {errors} errors"

        payload = {
            "action": "research_import_update_progress",
            "nonce": WP_NONCE,
            "status": status,
            "message": message,
            "percent": percent,
            "processed": processed,
            "total": total,
            "created": created,
            "updated": updated,
            "skipped": skipped,
            "errors": errors,
        }

        response = requests.post(
            WP_AJAX_URL,
            data=payload,
            timeout=10
        )

        if response.status_code == 200:
            return True
        else:
            logger.warning(f"Progress update failed: HTTP {response.status_code}")
            return False

    except Exception as e:
        logger.warning(f"Progress update error: {e}")
        return False


def run_full_import(
    docs_dir: str = RESEARCH_DOCS_DIR,
    limit: Optional[int] = None,
    dry_run: bool = False,
    batch_size: int = BATCH_SIZE,
    batch_delay: float = BATCH_DELAY
) -> dict:
    """
    Run full import of research documents.
    Processes in batches with delays to prevent PHP timeout.

    Args:
        docs_dir: Directory containing research documents
        limit: Maximum number of documents to import (None = all)
        dry_run: If True, don't actually import to WordPress
        batch_size: Number of documents per batch
        batch_delay: Seconds to wait between batches

    Returns:
        Summary dict with total counts
    """
    # Discover documents
    logger.info(f"Discovering documents in {docs_dir}...")
    file_paths = discover_documents(docs_dir, limit)
    total_files = len(file_paths)
    logger.info(f"discovered {total_files} documents")

    if not file_paths:
        logger.info("No documents found to import.")
        return {"total": 0, "created": 0, "updated": 0, "skipped": 0, "errors": 0}

    # Generate batch ID
    batch_id = f"import_{int(time.time())}"

    # Initialize progress tracking
    total_results = {"created": 0, "updated": 0, "skipped": 0, "errors": 0}
    processed = 0
    last_progress_update = 0

    # Send initial progress update
    update_progress(0, total_files, 0, 0, 0, 0, "running")

    # Process in batches
    for i in range(0, total_files, batch_size):
        batch_paths = file_paths[i:i + batch_size]
        batch_num = (i // batch_size) + 1
        total_batches = (total_files + batch_size - 1) // batch_size

        logger.info(f"Processing batch {batch_num}/{total_batches} ({len(batch_paths)} docs)...")

        # Parse documents
        batch_docs = []
        for path in batch_paths:
            doc = parse_document(path)
            if doc:
                batch_docs.append(doc)

        # Import batch
        if batch_docs:
            batch_results = import_batch(batch_docs, batch_id, dry_run)
            for key in total_results:
                total_results[key] += batch_results.get(key, 0)

        processed += len(batch_paths)
        logger.info(f"Progress: {processed}/{total_files} documents")

        # Update progress every PROGRESS_UPDATE_INTERVAL documents or at key points
        if processed - last_progress_update >= PROGRESS_UPDATE_INTERVAL or processed == total_files:
            update_progress(
                processed,
                total_files,
                total_results["created"],
                total_results["updated"],
                total_results["skipped"],
                total_results["errors"],
                "running"
            )
            last_progress_update = processed

        # Delay between batches (except for last batch)
        if i + batch_size < total_files and batch_delay > 0:
            logger.info(f"Waiting {batch_delay}s before next batch...")
            time.sleep(batch_delay)

    # Final progress update - complete
    update_progress(
        total_files,
        total_files,
        total_results["created"],
        total_results["updated"],
        total_results["skipped"],
        total_results["errors"],
        "complete"
    )

    # Summary
    logger.info("=" * 50)
    logger.info("Import Summary")
    logger.info("=" * 50)
    logger.info(f"Total processed: {total_files}")
    logger.info(f"Created: {total_results['created']}")
    logger.info(f"Updated: {total_results['updated']}")
    logger.info(f"Skipped: {total_results['skipped']}")
    logger.info(f"Errors: {total_results['errors']}")
    logger.info(f"Batch ID: {batch_id}")

    return {**total_results, "total": total_files}


def main():
    parser = argparse.ArgumentParser(
        description="Import research documents to WordPress"
    )
    parser.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Maximum number of documents to import (default: all)"
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Parse documents but don't import to WordPress"
    )
    parser.add_argument(
        "--batch-size",
        type=int,
        default=BATCH_SIZE,
        help=f"Documents per batch (default: {BATCH_SIZE})"
    )
    parser.add_argument(
        "--batch-delay",
        type=float,
        default=BATCH_DELAY,
        help=f"Seconds between batches (default: {BATCH_DELAY})"
    )
    parser.add_argument(
        "--docs-dir",
        type=str,
        default=RESEARCH_DOCS_DIR,
        help=f"Research documents directory (default: {RESEARCH_DOCS_DIR})"
    )

    args = parser.parse_args()

    run_full_import(
        docs_dir=args.docs_dir,
        limit=args.limit,
        dry_run=args.dry_run,
        batch_size=args.batch_size,
        batch_delay=args.batch_delay
    )


if __name__ == "__main__":
    main()
