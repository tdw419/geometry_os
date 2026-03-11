#!/usr/bin/env python3
"""
Feedback Widget for Enhanced Glyph Shell

Provides an inline feedback mechanism for users to report issues,
suggestions, and rate their experience without leaving the shell.

Integrates with the user testing framework for automated collection.
"""

import json
import time
from pathlib import Path
from dataclasses import dataclass, asdict
from typing import Any, Callable
from enum import Enum
from datetime import datetime


class FeedbackType(Enum):
    """Type of feedback."""
    BUG = "bug"
    SUGGESTION = "suggestion"
    PRAISE = "praise"
    CONFUSION = "confusion"
    QUESTION = "question"


class Severity(Enum):
    """Feedback severity level."""
    LOW = "low"
    MEDIUM = "medium"
    HIGH = "high"
    CRITICAL = "critical"


@dataclass
class FeedbackEntry:
    """A single feedback entry."""
    timestamp: float
    feedback_type: str
    severity: str
    message: str
    context: dict[str, Any]
    user_id: str
    session_id: str | None = None
    task_id: str | None = None
    rating: int | None = None  # 1-5
    tags: list[str] | None = None
    resolved: bool = False
    resolution_notes: str | None = None


class FeedbackWidget:
    """
    Inline feedback widget for the Enhanced Glyph Shell.

    Features:
    - Quick rating (1-5 stars)
    - Categorized feedback
    - Context capture
    - Offline-first storage
    """

    def __init__(self, storage_path: Path | None = None):
        self.storage_path = storage_path or Path(".geometry/feedback")
        self.storage_path.mkdir(parents=True, exist_ok=True)

        self.current_session_id: str | None = None
        self.current_user_id: str = "anonymous"
        self.pending_feedback: list[FeedbackEntry] = []

        # Callbacks
        self.on_submit: Callable | None = None
        self.on_error: Callable | None = None

        # Context capture
        self.context_providers: dict[str, Callable] = {}

    def register_context_provider(self, name: str, provider: Callable):
        """Register a function that provides context for feedback."""
        self.context_providers[name] = provider

    def set_session(self, session_id: str, user_id: str = "anonymous"):
        """Set the current session context."""
        self.current_session_id = session_id
        self.current_user_id = user_id

    def capture_context(self) -> dict[str, Any]:
        """Capture current context from all providers."""
        context = {
            "timestamp": time.time(),
            "datetime": datetime.now().isoformat(),
        }

        for name, provider in self.context_providers.items():
            try:
                context[name] = provider()
            except Exception as e:
                context[name] = f"Error: {e}"

        return context

    def quick_rating(self, rating: int, comment: str = "",
                    task_id: str | None = None) -> FeedbackEntry:
        """
        Submit a quick 1-5 star rating.

        This is the simplest feedback mechanism - just a rating
        with an optional comment.
        """
        if not 1 <= rating <= 5:
            raise ValueError("Rating must be between 1 and 5")

        entry = FeedbackEntry(
            timestamp=time.time(),
            feedback_type="rating",
            severity="low",
            message=comment or f"Rating: {rating}/5",
            context=self.capture_context(),
            user_id=self.current_user_id,
            session_id=self.current_session_id,
            task_id=task_id,
            rating=rating
        )

        self._save_feedback(entry)
        return entry

    def submit_bug(self, message: str, severity: Severity = Severity.MEDIUM,
                  task_id: str | None = None, tags: list[str] | None = None) -> FeedbackEntry:
        """Report a bug."""
        entry = FeedbackEntry(
            timestamp=time.time(),
            feedback_type=FeedbackType.BUG.value,
            severity=severity.value,
            message=message,
            context=self.capture_context(),
            user_id=self.current_user_id,
            session_id=self.current_session_id,
            task_id=task_id,
            tags=tags or []
        )

        self._save_feedback(entry)
        return entry

    def submit_suggestion(self, message: str, task_id: str | None = None) -> FeedbackEntry:
        """Submit a feature suggestion."""
        entry = FeedbackEntry(
            timestamp=time.time(),
            feedback_type=FeedbackType.SUGGESTION.value,
            severity=Severity.LOW.value,
            message=message,
            context=self.capture_context(),
            user_id=self.current_user_id,
            session_id=self.current_session_id,
            task_id=task_id,
            tags=["suggestion"]
        )

        self._save_feedback(entry)
        return entry

    def submit_praise(self, message: str, task_id: str | None = None) -> FeedbackEntry:
        """Submit positive feedback."""
        entry = FeedbackEntry(
            timestamp=time.time(),
            feedback_type=FeedbackType.PRAISE.value,
            severity=Severity.LOW.value,
            message=message,
            context=self.capture_context(),
            user_id=self.current_user_id,
            session_id=self.current_session_id,
            task_id=task_id,
            tags=["praise"]
        )

        self._save_feedback(entry)
        return entry

    def report_confusion(self, message: str, task_id: str | None = None) -> FeedbackEntry:
        """Report something confusing or unclear."""
        entry = FeedbackEntry(
            timestamp=time.time(),
            feedback_type=FeedbackType.CONFUSION.value,
            severity=Severity.MEDIUM.value,
            message=message,
            context=self.capture_context(),
            user_id=self.current_user_id,
            session_id=self.current_session_id,
            task_id=task_id,
            tags=["ux", "confusion"]
        )

        self._save_feedback(entry)
        return entry

    def ask_question(self, question: str, task_id: str | None = None) -> FeedbackEntry:
        """Ask a question about the UI."""
        entry = FeedbackEntry(
            timestamp=time.time(),
            feedback_type=FeedbackType.QUESTION.value,
            severity=Severity.LOW.value,
            message=question,
            context=self.capture_context(),
            user_id=self.current_user_id,
            session_id=self.current_session_id,
            task_id=task_id,
            tags=["question"]
        )

        self._save_feedback(entry)
        return entry

    def _save_feedback(self, entry: FeedbackEntry):
        """Save feedback to storage."""
        # Add to pending queue
        self.pending_feedback.append(entry)

        # Save to daily file
        date_str = datetime.now().strftime("%Y-%m-%d")
        feedback_file = self.storage_path / f"feedback_{date_str}.jsonl"

        with open(feedback_file, "a") as f:
            f.write(json.dumps(asdict(entry)) + "\n")

        # Notify callback
        if self.on_submit:
            try:
                self.on_submit(entry)
            except Exception as e:
                if self.on_error:
                    self.on_error(e)

    def get_feedback_stats(self) -> dict[str, Any]:
        """Get statistics on collected feedback."""
        all_feedback = self._load_all_feedback()

        if not all_feedback:
            return {"total": 0}

        by_type: dict[str, int] = {}
        by_severity: dict[str, int] = {}
        ratings: list[int] = []

        for entry in all_feedback:
            ft = entry["feedback_type"]
            by_type[ft] = by_type.get(ft, 0) + 1

            sev = entry["severity"]
            by_severity[sev] = by_severity.get(sev, 0) + 1

            if entry.get("rating"):
                ratings.append(entry["rating"])

        stats = {
            "total": len(all_feedback),
            "by_type": by_type,
            "by_severity": by_severity,
            "unresolved": sum(1 for e in all_feedback if not e.get("resolved", False))
        }

        if ratings:
            stats["average_rating"] = sum(ratings) / len(ratings)
            stats["rating_count"] = len(ratings)

        return stats

    def _load_all_feedback(self) -> list[dict]:
        """Load all feedback entries."""
        all_entries = []

        for feedback_file in self.storage_path.glob("feedback_*.jsonl"):
            with open(feedback_file) as f:
                for line in f:
                    try:
                        all_entries.append(json.loads(line))
                    except json.JSONDecodeError:
                        continue

        return all_entries

    def render_inline_prompt(self) -> str:
        """Render an inline feedback prompt for the terminal."""
        return """
┌─────────────────────────────────────────────────────────────┐
│                    📝 Quick Feedback                         │
├─────────────────────────────────────────────────────────────┤
│  How was your experience? Rate 1-5 or describe an issue:    │
│                                                             │
│  [1] ★☆☆☆☆  [2] ★★☆☆☆  [3] ★★★☆☆  [4] ★★★★☆  [5] ★★★★★    │
│                                                             │
│  Or type:                                                   │
│    bug <message>    - Report a bug                          │
│    suggest <msg>    - Suggest an improvement                │
│    confused <msg>   - Report something unclear              │
│    cancel           - Skip feedback                         │
└─────────────────────────────────────────────────────────────┘
"""


class FeedbackCollector:
    """
    Interactive feedback collector that integrates with the shell.
    """

    def __init__(self, widget: FeedbackWidget):
        self.widget = widget
        self.is_collecting = False
        self.collection_context: dict[str, Any] = {}

    def start_collection(self, prompt: str = "How was your experience?") -> str:
        """Start an interactive feedback collection session."""
        self.is_collecting = True
        self.collection_context = {
            "prompt": prompt,
            "start_time": time.time()
        }
        return self.widget.render_inline_prompt()

    def process_input(self, user_input: str) -> tuple[bool, str]:
        """
        Process user input during feedback collection.

        Returns (done, message) tuple.
        """
        input_lower = user_input.lower().strip()

        if input_lower == "cancel":
            self.is_collecting = False
            return True, "Feedback cancelled."

        if input_lower in ["1", "2", "3", "4", "5"]:
            rating = int(input_lower)
            entry = self.widget.quick_rating(rating)
            self.is_collecting = False
            return True, f"Thank you for your rating ({rating}/5)!"

        if input_lower.startswith("bug "):
            message = user_input[4:].strip()
            if message:
                entry = self.widget.submit_bug(message)
                self.is_collecting = False
                return True, "Bug report submitted. Thank you!"
            return False, "Please describe the bug: bug <description>"

        if input_lower.startswith("suggest "):
            message = user_input[8:].strip()
            if message:
                entry = self.widget.submit_suggestion(message)
                self.is_collecting = False
                return True, "Suggestion submitted. Thank you!"
            return False, "Please describe your suggestion: suggest <description>"

        if input_lower.startswith("confused "):
            message = user_input[9:].strip()
            if message:
                entry = self.widget.report_confusion(message)
                self.is_collecting = False
                return True, "Feedback submitted. We'll work on making this clearer!"
            return False, "Please describe what's confusing: confused <description>"

        # Default: treat as general feedback
        if len(user_input) > 3:
            entry = self.widget.submit_suggestion(user_input)
            self.is_collecting = False
            return True, "Feedback submitted. Thank you!"

        return False, "Invalid input. Please enter a rating (1-5) or describe your feedback."


def integrate_with_shell(shell_instance) -> FeedbackWidget:
    """
    Integrate feedback widget with an EnhancedGlyphShell instance.

    This adds feedback-related commands and context providers.
    """
    widget = FeedbackWidget()

    # Register context providers
    widget.register_context_provider("cwd", lambda: str(Path.cwd()))
    widget.register_context_provider("terminal_size",
        lambda: f"{shell_instance.cols}x{shell_instance.rows}")
    widget.register_context_provider("fps", lambda: f"{shell_instance.fps:.1f}")

    # Set session
    widget.set_session(
        session_id=f"shell_{int(time.time())}",
        user_id="shell_user"
    )

    return widget


# Demo
if __name__ == "__main__":
    print("Feedback Widget Demo")
    print("=" * 50)
    print()

    widget = FeedbackWidget()

    # Quick ratings
    print("Submitting quick ratings...")
    for rating in [5, 4, 5, 3, 5]:
        widget.quick_rating(rating)
        print(f"  Rating: {rating}/5")

    # Bug report
    print("\nSubmitting bug report...")
    bug = widget.submit_bug(
        "Command palette doesn't close on escape",
        severity=Severity.MEDIUM,
        tags=["ui", "keyboard"]
    )
    print(f"  Bug ID: {bug.timestamp}")

    # Suggestion
    print("\nSubmitting suggestion...")
    suggestion = widget.submit_suggestion(
        "Add dark mode toggle to status bar"
    )
    print(f"  Suggestion: {suggestion.message}")

    # Stats
    print("\nFeedback Statistics:")
    stats = widget.get_feedback_stats()
    print(f"  Total feedback: {stats['total']}")
    print(f"  By type: {stats['by_type']}")
    print(f"  Average rating: {stats.get('average_rating', 'N/A')}")

    # Inline prompt demo
    print("\n" + widget.render_inline_prompt())

    print("\nFeedback files saved to:", widget.storage_path)
