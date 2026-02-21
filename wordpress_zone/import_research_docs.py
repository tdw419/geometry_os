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
import requests
from dataclasses import dataclass
from typing import List, Optional

# Configuration
RESEARCH_DOCS_DIR = "/home/jericho/zion/docs/research"
WP_PUBLISHER_URL = "http://localhost:8080/ai-publisher.php"
BATCH_SIZE = 50
BATCH_DELAY = 2  # seconds between batches


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
    except Exception as e:
        print(f"  Error calculating hash for {file_path}: {e}")
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
        with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
            content = f.read()

        # Skip empty files
        if not content.strip():
            print(f"  Skipping empty file: {file_path}")
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
    except PermissionError:
        print(f"  Permission denied: {file_path}")
        return None
    except Exception as e:
        print(f"  Error parsing {file_path}: {e}")
        return None


def import_batch(documents: List[ResearchDocument], batch_id: str, dry_run: bool = False) -> dict:
    """
    Import a batch of documents to WordPress.
    Returns summary with counts of created, updated, skipped, errors.
    """
    results = {"created": 0, "updated": 0, "skipped": 0, "errors": 0}

    for doc in documents:
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

        if dry_run:
            print(f"  [DRY-RUN] Would import: {doc.title[:50]}...")
            results["created"] += 1
            continue

        try:
            response = requests.post(
                WP_PUBLISHER_URL,
                json=payload,
                timeout=30
            )

            if response.status_code == 200:
                data = response.json()
                if data.get("success"):
                    status = data.get("status", "unknown")
                    if status == "created":
                        results["created"] += 1
                    elif status == "updated":
                        results["updated"] += 1
                    elif status == "skipped":
                        results["skipped"] += 1
                    else:
                        results["errors"] += 1
                    print(f"  [{status}] {doc.title[:50]}")
                else:
                    results["errors"] += 1
                    print(f"  [ERROR] {doc.title[:50]}: {data.get('message', 'Unknown error')}")
            else:
                results["errors"] += 1
                print(f"  [ERROR] {doc.title[:50]}: HTTP {response.status_code}")
        except requests.exceptions.Timeout:
            results["errors"] += 1
            print(f"  [TIMEOUT] {doc.title[:50]}")
        except Exception as e:
            results["errors"] += 1
            print(f"  [ERROR] {doc.title[:50]}: {e}")

    return results


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
    print(f"Discovering documents in {docs_dir}...")
    file_paths = discover_documents(docs_dir, limit)
    total_files = len(file_paths)
    print(f"discovered {total_files} documents")

    if not file_paths:
        print("No documents found to import.")
        return {"total": 0, "created": 0, "updated": 0, "skipped": 0, "errors": 0}

    # Generate batch ID
    batch_id = f"import_{int(time.time())}"

    # Process in batches
    total_results = {"created": 0, "updated": 0, "skipped": 0, "errors": 0}
    processed = 0

    for i in range(0, total_files, batch_size):
        batch_paths = file_paths[i:i + batch_size]
        batch_num = (i // batch_size) + 1
        total_batches = (total_files + batch_size - 1) // batch_size

        print(f"\nProcessing batch {batch_num}/{total_batches} ({len(batch_paths)} docs)...")

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
        print(f"Progress: {processed}/{total_files} documents")

        # Delay between batches (except for last batch)
        if i + batch_size < total_files and batch_delay > 0:
            print(f"Waiting {batch_delay}s before next batch...")
            time.sleep(batch_delay)

    # Summary
    print(f"\n{'=' * 50}")
    print("Import Summary")
    print(f"{'=' * 50}")
    print(f"Total processed: {total_files}")
    print(f"Created: {total_results['created']}")
    print(f"Updated: {total_results['updated']}")
    print(f"Skipped: {total_results['skipped']}")
    print(f"Errors: {total_results['errors']}")
    print(f"Batch ID: {batch_id}")

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
