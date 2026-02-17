"""
Vision-Based UI Understanding System

A shared GPU inference daemon that provides visual UI understanding as a
system-level primitive for Geometry OS agents. Uses Florence-2 as the
foundational vision model.

Usage:
    from systems.vision import VisionDaemon, VisionClient

    # Start daemon
    daemon = VisionDaemon()
    await daemon.start()

    # Query from client
    client = VisionClient()
    result = await client.query({
        "image": screenshot,
        "steps": [
            {"op": "detect", "classes": ["button"], "assign_to": "buttons"},
            {"op": "ground", "text": "Export", "assign_to": "export_btn"}
        ]
    })
"""

from systems.vision.vision_daemon import VisionDaemon
from systems.vision.pipeline_executor import PipelineExecutor
from systems.vision.florence_model import FlorenceModel

__all__ = [
    "VisionDaemon",
    "PipelineExecutor",
    "FlorenceModel",
]
