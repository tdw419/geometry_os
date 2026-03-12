# Sisyphus CLI Test Plan and Results

## Test Inventory

| File | Type | Tests | Status |
|------|------|-------|--------|
| test_core.py | Unit | 18 | Pending |
| test_e2e.py | E2E | 16 | Pending |

**Total: 34 tests**

## Unit Test Plan (test_core.py)

### Helper Functions
- [x] `test_json_output_dict` - JSON formatting of dict
- [x] `test_json_output_with_datetime` - JSON formatting with datetime
- [x] `test_task_to_dict` - Task to dict conversion
- [x] `test_daemon_status_dict` - Daemon status structure

### CLI Commands
- [x] `test_status_command` - Human-readable status
- [x] `test_status_json_command` - JSON status output
- [x] `test_tasks_command` - Human-readable task list
- [x] `test_tasks_json_command` - JSON task list
- [x] `test_show_command` - Show task details
- [x] `test_show_nonexistent_task` - Error handling
- [x] `test_health_command` - Health check
- [x] `test_health_json_command` - JSON health output

### Help Commands
- [x] `test_main_help` - Main help shows all commands
- [x] `test_status_help` - Status help
- [x] `test_tasks_help` - Tasks help with options

### Task States
- [x] `test_tasks_filter_pending` - Filter pending tasks
- [x] `test_tasks_filter_complete` - Filter complete tasks
- [x] `test_tasks_filter_failed` - Filter failed tasks

### Edge Cases
- [x] `test_empty_task_list` - Handle empty list
- [x] `test_no_router_available` - Handle degraded state
- [x] `test_invalid_command` - Error on invalid command

## E2E Test Plan (test_e2e.py)

### Installation Tests
- [x] `test_cli_help_runs` - CLI --help works
- [x] `test_cli_version_runs` - CLI --version works

### Status Command
- [x] `test_status_human_readable` - Human output
- [x] `test_status_json_output` - JSON output
- [x] `test_status_shows_component_status` - Component availability

### Tasks Command
- [x] `test_tasks_lists_tasks` - List tasks
- [x] `test_tasks_json_output` - JSON task list
- [x] `test_tasks_limit_option` - -n option works

### Health Command
- [x] `test_health_check` - Health check runs
- [x] `test_health_json_output` - JSON health output

### Show Command
- [x] `test_show_task` - Show task details
- [x] `test_show_nonexistent_task` - Error handling

### Logs Command
- [x] `test_logs_command` - Logs output

### Generate Command
- [x] `test_generate_command` - Generation runs

### JSON Output Mode
- [x] `test_json_flag_affects_output` - JSON flag changes format

### REPL Mode
- [x] `test_repl_starts` - REPL starts (skipped - interactive)

## Test Execution

```bash
# Run all tests
pytest systems/sisyphus/cli/tests/ -v

# Run unit tests only
pytest systems/sisyphus/cli/tests/test_core.py -v

# Run E2E tests only
pytest systems/sisyphus/cli/tests/test_e2e.py -v
```

## Test Results

_Tests pending execution._

---

*Last updated: 2024-01-11*
