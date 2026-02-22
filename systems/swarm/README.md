# Swarm Intelligence System

Decentralized MapReduce-style swarm coordination for parallel agent work.

## Overview

The Swarm Intelligence System enables multiple agents to coordinate work through a shared task board without centralized coordination. Agents claim tasks, execute work in parallel, and post results. The system uses MapReduce-style orchestration for splitting work (map) and aggregating results (reduce).

**Key Features:**
- Decentralized coordination with no single point of failure
- File-based task storage with file locking for cross-process safety
- Configurable reduction strategies for merging results
- Support for multiple task types: code analysis, parallel search, solution exploration, distributed review
- Progress tracking for MapReduce jobs

## Components

| Component | Purpose | Location |
|-----------|---------|----------|
| `Task` | Unit of work with lifecycle states | `systems/swarm/task.py` |
| `TaskBoard` | Shared task storage with atomic claiming | `systems/swarm/task_board.py` |
| `SwarmAgent` | Worker that claims and executes tasks | `systems/swarm/swarm_agent.py` |
| `SwarmCoordinator` | MapReduce orchestration (map/reduce) | `systems/swarm/swarm_coordinator.py` |
| `ReductionStrategy` | Result merging strategies | `systems/swarm/reduction.py` |

## Quick Start

```python
from systems.swarm.task_board import TaskBoard
from systems.swarm.swarm_agent import SwarmAgent
from systems.swarm.swarm_coordinator import SwarmCoordinator
from systems.swarm.task import TaskType

# Create shared task board
board = TaskBoard(storage_path=".swarm/tasks")

# Create coordinator for MapReduce
coord = SwarmCoordinator(task_board=board)

# Map: split work into subtasks
parent_id = coord.map(
    task_type=TaskType.CODE_ANALYSIS,
    description="Analyze modules",
    subtask_payloads=[
        {"module": "auth"},
        {"module": "api"},
        {"module": "db"}
    ]
)

# Create agents to do work
agents = [SwarmAgent(agent_id=f"agent-{i}", task_board=board) for i in range(3)]

# Agents claim and complete tasks
for agent in agents:
    task = agent.claim_next_task()
    if task:
        result = agent.execute_task(task)
        agent.complete_task(task, result)

# Reduce: aggregate results
final = coord.reduce(parent_id, strategy="merge_all")
```

## Task Types

| Type | Use Case | Example |
|------|----------|---------|
| `CODE_ANALYSIS` | Analyze code quality, patterns | Static analysis, linting, complexity metrics |
| `PARALLEL_SEARCH` | Search codebase with different patterns | Finding TODOs, detecting patterns, grep-like operations |
| `SOLUTION_EXPLORATION` | Try multiple approaches, pick best | Algorithm comparison, optimization strategies |
| `DISTRIBUTED_REVIEW` | Multiple reviewers on same artifact | PR reviews, security audits, design reviews |

## Task Lifecycle

```
PENDING -> CLAIMED -> IN_PROGRESS -> COMPLETED
                                    -> FAILED
```

- **PENDING**: Task is posted and available for claiming
- **CLAIMED**: Agent has claimed the task (atomic operation)
- **IN_PROGRESS**: Agent is actively working on the task
- **COMPLETED**: Task finished with result
- **FAILED**: Task failed with error

## Reduction Strategies

| Strategy | When to Use | Example |
|----------|-------------|---------|
| `first` | Any result is acceptable | First successful search result |
| `best_score` | Pick highest-scoring result | Best algorithm by performance metric |
| `merge_all` | Combine all results (dedupe lists) | Aggregating search findings |
| `majority_vote` | Democratic decision making | PR approval voting |

### Strategy Usage

```python
# Pick first result
coord.reduce(parent_id, strategy="first")

# Pick best by score
coord.reduce(parent_id, strategy="best_score", score_key="confidence")

# Merge all results
coord.reduce(parent_id, strategy="merge_all")

# Majority vote
coord.reduce(parent_id, strategy="majority_vote", vote_key="decision")
```

## Progress Tracking

Monitor MapReduce job progress:

```python
progress = coord.get_progress(parent_id)
print(f"{progress['completed']}/{progress['total']} tasks complete")
print(f"{progress['progress_pct']:.1f}% complete")
print(f"Is complete: {progress['is_complete']}")

# Progress dict includes:
# - total: total subtasks
# - completed: completed subtasks
# - failed: failed subtasks
# - pending: pending subtasks
# - in_progress: currently running subtasks
# - progress_pct: percentage complete
# - is_complete: boolean, True if all complete
```

## Agent Capabilities

Agents can be configured with specific capabilities:

```python
# Agent that only handles CODE_ANALYSIS tasks
agent = SwarmAgent(
    agent_id="analyzer",
    task_board=board,
    capabilities=["CODE_ANALYSIS"]
)

# Agent with custom task handler
def handle_search(task):
    # Custom search logic
    return {"found": ["result1", "result2"]}

agent = SwarmAgent(
    agent_id="searcher",
    task_board=board,
    capabilities=["PARALLEL_SEARCH"],
    handlers={TaskType.PARALLEL_SEARCH: handle_search}
)
```

## Running Tests

```bash
# All swarm tests
pytest tests/swarm/ -v

# Specific component
pytest tests/swarm/test_task_board.py -v
pytest tests/swarm/test_task.py -v
pytest tests/swarm/test_reduction.py -v
pytest tests/swarm/test_swarm_agent.py -v
pytest tests/swarm/test_swarm_coordinator.py -v

# Integration tests
pytest tests/swarm/test_swarm_integration.py -v
```

## Architecture

```
+-------------------+     Map      +-------------------+
| SwarmCoordinator | ----------> |   TaskBoard       |
+-------------------+             +-------------------+
        ^                              ^    |
        |                              |    | Claim
        | Reduce                       |    v
        |                              +-------------------+
        |                              |  SwarmAgent 1     |
        |                              +-------------------+
        |                              |
        |                              +-------------------+
        +------------------------------|  SwarmAgent N     |
                                       +-------------------+
```

1. **Map Phase**: `SwarmCoordinator` splits work into subtasks on `TaskBoard`
2. **Work Phase**: `SwarmAgent` instances claim and execute tasks
3. **Reduce Phase**: `SwarmCoordinator` aggregates results using configured strategy

## File-Based Storage

Tasks are stored as individual JSON files in the storage directory:

```
.swarm/tasks/
  .board.lock           # File lock for atomic operations
  task-001.json         # Task files
  parent-abc123-sub-0.json
  parent-abc123-sub-1.json
```

Each task file contains:
- `task_id`: Unique identifier
- `task_type`: Type of task
- `description`: Human-readable description
- `status`: Current lifecycle state
- `priority`: Priority (1=highest, 10=lowest)
- `created_at`: Timestamp
- `claimed_by`: Agent ID (if claimed)
- `claimed_at`: Claim timestamp
- `result`: Result data (if completed)
- `payload`: Task-specific data

## Thread Safety

The `TaskBoard` uses file locking (`fcntl.flock`) for atomic operations across multiple processes. This allows multiple agents in separate processes to safely coordinate through the same task board.

## API Reference

### TaskBoard

```python
board = TaskBoard(storage_path=".swarm/tasks")

# Post a task
board.post(task)

# Get a task by ID
task = board.get(task_id)

# Claim a task atomically
success = board.claim(task_id, agent_id)

# Complete a task with result
success = board.complete(task_id, result)

# Get all pending tasks
pending = board.get_pending()

# Get tasks by type
tasks = board.get_by_type(TaskType.CODE_ANALYSIS)

# Get results for a parent task
results = board.get_results_by_parent(parent_id)
```

### SwarmAgent

```python
agent = SwarmAgent(agent_id="agent-1", task_board=board)

# Claim next available task
task = agent.claim_next_task()

# Execute a task
result = agent.execute_task(task)

# Complete a task
agent.complete_task(task, result)

# Fail a task
agent.fail_task(task, "error message")

# Single work cycle
completed_task = agent.work_cycle()
```

### SwarmCoordinator

```python
coord = SwarmCoordinator(task_board=board)

# Map phase: create subtasks
parent_id = coord.map(
    task_type=TaskType.CODE_ANALYSIS,
    description="Analyze code",
    subtask_payloads=[{"module": "auth"}, {"module": "api"}]
)

# Reduce phase: aggregate results
result = coord.reduce(parent_id, strategy="merge_all")

# Get job progress
progress = coord.get_progress(parent_id)
```
