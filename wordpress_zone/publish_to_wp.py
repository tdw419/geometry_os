"""Geometry OS WordPress Auto-Blogger Tool.

This module provides functions for AI agents to publish updates directly
to the WordPress semantic district, including CTRM/TMS integration.

Modules:
    requests: HTTP client for WordPress API calls
    json: JSON serialization for payloads
    sys: System-specific parameters
    os: Operating system interfaces
    websocket: WebSocket client for Visual Bridge
    time: Timestamp generation
"""
from typing import Any, Dict, List, Optional, Union

import requests
import json
import sys
import os
import websocket
import time


# Valid ANSMO cycle phases
VALID_ANSMO_PHASES = ('introspection', 'synthesis', 'optimization')


class ValidationError(ValueError):
    """Raised when input validation fails."""
    pass


def validate_confidence(confidence: float) -> float:
    """Validate confidence value is within range [0.0, 1.0].

    Args:
        confidence: The confidence value to validate.

    Returns:
        The validated confidence value.

    Raises:
        ValidationError: If confidence is not between 0.0 and 1.0.
    """
    if not isinstance(confidence, (int, float)):
        raise ValidationError(f"Confidence must be a number, got {type(confidence).__name__}")
    if not 0.0 <= confidence <= 1.0:
        raise ValidationError(f"Confidence must be between 0.0 and 1.0, got {confidence}")
    return float(confidence)


def validate_ansmo_phase(phase: str) -> str:
    """Validate ANSMO phase is one of the allowed values.

    Args:
        phase: The phase name to validate.

    Returns:
        The validated phase string.

    Raises:
        ValidationError: If phase is not introspection, synthesis, or optimization.
    """
    if not isinstance(phase, str):
        raise ValidationError(f"Phase must be a string, got {type(phase).__name__}")
    if phase not in VALID_ANSMO_PHASES:
        raise ValidationError(f"Phase must be one of {VALID_ANSMO_PHASES}, got '{phase}'")
    return phase


def send_visual_pulse(title: str, content: str, url: str) -> bool:
    """Send an immediate telemetry pulse to the Visual Bridge.

    This function broadcasts a WordPress publish event to the Visual Bridge
    WebSocket server for real-time visualization.

    Args:
        title: The title of the published content.
        content: The content body of the publication.
        url: The URL of the published post.

    Returns:
        True if pulse was sent successfully, False otherwise.
    """
    try:
        ws = websocket.create_connection("ws://localhost:8768", timeout=1)
        payload = {
            "type": "wordpress_publish",
            "title": title,
            "content": content,
            "url": url,
            "timestamp": time.time()
        }
        ws.send(json.dumps(payload))
        ws.close()
        print("Sent visual pulse to Visual Bridge.")
        return True
    except Exception as e:
        print(f"Warning: Failed to send visual pulse: {e}")
        return False


def publish_to_wordpress(
    title: str,
    content: str,
    post_type: str = 'post'
) -> Optional[Dict[str, Any]]:
    """Publish a post to the local WordPress instance.

    Args:
        title: The title of the post to publish.
        content: The body content of the post.
        post_type: WordPress post type (default: 'post').

    Returns:
        Dictionary with post_id, url on success, None on failure.
    """
    url = "http://localhost:8080/ai-publisher.php"
    payload = {
        "title": title,
        "content": content,
        "type": post_type
    }

    try:
        response = requests.post(url, json=payload, timeout=5)
        if response.status_code == 200:
            result = response.json()
            print(f"Post published successfully!")
            print(f"URL: {result.get('url')}")
            print(f"ID: {result.get('post_id')}")

            # Send visual pulse for immediate feedback
            send_visual_pulse(title, content, result.get('url', ''))

            return result
        else:
            print(f"Failed to publish: {response.status_code}")
            print(response.text)
            return None
    except Exception as e:
        print(f"Connection error: {e}")
        return None

# CTRM/TMS Helper Functions
# -------------------------

def publish_truth(
    claim: str,
    evidence: str,
    confidence: float,
    reasoning_path: List[str]
) -> Optional[Dict[str, Any]]:
    """Publish a CTRM truth entry to WordPress.

    This function logs a truth claim with supporting evidence and confidence
    to the WordPress CTRM system for transparent reasoning tracking.

    Args:
        claim: The truth claim statement describing the assertion.
        evidence: Supporting evidence for the claim.
        confidence: Confidence level for the claim (0.0-1.0).
        reasoning_path: List of reasoning steps that led to this claim.

    Returns:
        Dictionary containing post_id, truth_id, url, and transparency_score
        on success. None on failure.

    Raises:
        ValidationError: If confidence is not between 0.0 and 1.0.

    Example:
        >>> result = publish_truth(
        ...     claim="API response time improved by 40%",
        ...     evidence="Benchmark data from 1000 requests",
        ...     confidence=0.85,
        ...     reasoning_path=["collected metrics", "compared baselines"]
        ... )
    """
    # Validate inputs
    confidence = validate_confidence(confidence)

    url = "http://localhost:8080/ai-publisher.php"
    payload = {
        "action": "logTruth",
        "args": {
            "agent": "geometry_os",
            "subject": "ctrm_publish",
            "claim": claim,
            "confidence": confidence,
            "evidence": evidence,
            "reasoning_path": reasoning_path
        }
    }

    try:
        response = requests.post(url, json=payload, timeout=5)
        if response.status_code == 200:
            result = response.json()
            if result.get('success'):
                print(f"Truth published successfully!")
                print(f"URL: {result.get('url')}")
                print(f"Truth ID: {result.get('truth_id')}")
                print(f"Transparency: {result.get('transparency_score')}")

                # Send visual pulse for immediate feedback
                send_visual_pulse(
                    f"Truth: {claim[:50]}...",
                    f"Confidence: {confidence} | Evidence: {evidence}",
                    result.get('url', '')
                )

                return result
            else:
                print(f"Failed to publish truth: {result.get('error', 'Unknown error')}")
                return None
        else:
            print(f"Failed to publish: {response.status_code}")
            print(response.text)
            return None
    except Exception as e:
        print(f"Connection error: {e}")
        return None


def publish_ansmo_cycle(
    phase: str,
    input_state: Dict[str, Any],
    output_state: Dict[str, Any],
    improvement_delta: float
) -> Optional[Dict[str, Any]]:
    """Publish an ANSMO cycle log entry to WordPress.

    ANSMO cycles represent iterative improvement phases in the system:
    - introspection: Self-analysis of current state
    - synthesis: Combining insights into actionable changes
    - optimization: Applying and measuring improvements

    Args:
        phase: Cycle phase - must be 'introspection', 'synthesis', or 'optimization'.
        input_state: Dictionary representing state before the cycle.
        output_state: Dictionary representing state after the cycle.
        improvement_delta: Measured improvement metric from the cycle.

    Returns:
        Dictionary containing post_id, cycle_id, and url on success.
        None on failure.

    Raises:
        ValidationError: If phase is not one of the valid ANSMO phases.

    Example:
        >>> result = publish_ansmo_cycle(
        ...     phase="optimization",
        ...     input_state={"latency_ms": 150},
        ...     output_state={"latency_ms": 90},
        ...     improvement_delta=0.4
        ... )
    """
    # Validate inputs
    phase = validate_ansmo_phase(phase)

    url = "http://localhost:8080/ai-publisher.php"
    payload = {
        "action": "logAnsmoCycle",
        "args": {
            "phase": phase,
            "input_state": input_state,
            "output_state": output_state,
            "improvement_delta": improvement_delta
        }
    }

    try:
        response = requests.post(url, json=payload, timeout=5)
        if response.status_code == 200:
            result = response.json()
            if result.get('success'):
                print(f"ANSMO cycle published successfully!")
                print(f"URL: {result.get('url')}")
                print(f"Cycle ID: {result.get('cycle_id')}")
                print(f"Phase: {phase} | Delta: {improvement_delta}")

                # Send visual pulse for immediate feedback
                send_visual_pulse(
                    f"ANSMO Cycle: {phase}",
                    f"Delta: {improvement_delta} | Input->Output logged",
                    result.get('url', '')
                )

                return result
            else:
                print(f"Failed to publish ANSMO cycle: {result.get('error', 'Unknown error')}")
                return None
        else:
            print(f"Failed to publish: {response.status_code}")
            print(response.text)
            return None
    except Exception as e:
        print(f"Connection error: {e}")
        return None


def sync_ctrm_truths(
    truths: List[Dict[str, Any]]
) -> Optional[Dict[str, Any]]:
    """Bulk sync CTRM truths to WordPress.

    Synchronizes multiple truth entries from external systems to WordPress,
    performing upserts based on truth_id to prevent duplicates.

    Args:
        truths: List of truth dictionaries, each containing:
            - agent (str): Agent identifier that created the truth
            - subject (str): Subject area of the truth
            - claim (str): The truth claim statement
            - confidence (float): Confidence level (0.0-1.0)
            - evidence (str): Supporting evidence
            - reasoning_path (List[str]): Reasoning steps
            - truth_id (str): Unique identifier for upsert

    Returns:
        Dictionary containing:
        - synced_count: Number of truths successfully synced
        - skipped_count: Number of truths skipped (duplicates)
        - results: List of individual sync results
        None on failure.

    Note:
        Maximum batch size is 100 truths per call to maintain performance.
        Confidence values are validated for each truth entry.

    Example:
        >>> truths = [
        ...     {
        ...         "agent": "test_agent",
        ...         "subject": "performance",
        ...         "claim": "Cache hit rate at 95%",
        ...         "confidence": 0.95,
        ...         "evidence": "Monitoring data",
        ...         "reasoning_path": ["analyzed logs"],
        ...         "truth_id": "truth-001"
        ...     }
        ... ]
        >>> result = sync_ctrm_truths(truths)
    """
    # Validate confidence for each truth entry
    for i, truth in enumerate(truths):
        if 'confidence' in truth:
            try:
                validate_confidence(truth['confidence'])
            except ValidationError as e:
                print(f"Invalid confidence in truth {i}: {e}")
                return None

    url = "http://localhost:8080/ai-publisher.php"
    payload = {
        "action": "syncTruths",
        "args": {
            "truths": truths
        }
    }

    try:
        response = requests.post(url, json=payload, timeout=10)
        if response.status_code == 200:
            result = response.json()
            if result.get('success'):
                print(f"Truths synced successfully!")
                print(f"Synced: {result.get('synced_count', 0)}")
                print(f"Skipped: {result.get('skipped_count', 0)}")

                # Send visual pulse for immediate feedback
                send_visual_pulse(
                    f"CTRM Sync Complete",
                    f"Synced {result.get('synced_count', 0)} truths to WordPress",
                    ''
                )

                return result
            else:
                print(f"Failed to sync truths: {result.get('error', 'Unknown error')}")
                return None
        else:
            print(f"Failed to sync: {response.status_code}")
            print(response.text)
            return None
    except Exception as e:
        print(f"Connection error: {e}")
        return None


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 publish_to_wp.py 'Title' 'Content'")
        # Demo post if no args
        title = "System Awareness Initialized"
        content = "The Architect Prime has successfully established a link between the Neural Substrate and the WordPress District."
    else:
        title = sys.argv[1]
        content = sys.argv[2]

    publish_to_wordpress(title, content)
