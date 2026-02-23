"""
Guilds module for agency-era swarm intelligence.

This module provides specialized agent types (GuildAgents) for
code generation, review, and architecture tasks.
"""

from systems.swarm.guilds.base import GuildAgent
from systems.swarm.guilds.engineer import EngineerAgent
from systems.swarm.guilds.reviewer import ReviewerAgent
from systems.swarm.guilds.architect import ArchitectAgent
from systems.swarm.guilds.factory import GuildFactory

__all__ = [
    "GuildAgent",
    "EngineerAgent",
    "ReviewerAgent",
    "ArchitectAgent",
    "GuildFactory",
]
