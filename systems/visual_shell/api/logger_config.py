"""Minimal logger configuration for Visual Shell API."""
import logging
import sys


def get_logger(name: str = "visual_shell") -> logging.Logger:
    """Get a logger instance with basic configuration."""
    logger = logging.getLogger(name)
    if not logger.handlers:
        handler = logging.StreamHandler(sys.stdout)
        handler.setFormatter(
            logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
        )
        logger.addHandler(handler)
        logger.setLevel(logging.INFO)
    return logger
