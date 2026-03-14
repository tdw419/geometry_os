//! Worker Pool - Parallel Task Execution
//!
//! Manages a collection of subagents that can execute tasks in parallel.

use std::sync::Arc;
use std::time::Duration;
use tokio::sync::Mutex;
use tracing::{debug, error, info, warn};

use crate::orchestrator::TaskOrchestrator;
use crate::subagent::{Subagent, SubagentFactory, SubagentType};
use crate::task::{Task, TaskPriority, TaskStatus};

/// Worker Pool - Manages a collection of workers that execute tasks using subagents
///
/// Implements parallel execution where multiple agents can work on
/// different tasks simultaneously for improved efficiency.
pub struct WorkerPool {
    /// Collection of available subagents
    agents: Vec<Box<dyn Subagent>>,
    /// Maximum number of concurrent tasks
    max_concurrency: usize,
    /// Current number of active workers
    active_workers: Arc<Mutex<usize>>,
}

impl WorkerPool {
    /// Create a new worker pool with default subagents
    pub fn new() -> Self {
        info!("Initializing Worker Pool with standard subagents");
        let agents = SubagentFactory::create_all();

        WorkerPool {
            agents,
            max_concurrency: 4,
            active_workers: Arc::new(Mutex::new(0)),
        }
    }

    /// Create a worker pool with custom settings
    pub fn new_with_settings(agents: Vec<Box<dyn Subagent>>, max_concurrency: usize) -> Self {
        WorkerPool {
            agents,
            max_concurrency,
            active_workers: Arc::new(Mutex::new(0)),
        }
    }

    /// Execute a collection of tasks using the worker pool
    pub async fn execute_tasks(
        &self,
        orchestrator: &mut TaskOrchestrator,
        tasks: Vec<Task>,
    ) -> Result<Vec<TaskResult>, Box<dyn std::error::Error + Send + Sync>> {
        if tasks.is_empty() {
            return Ok(Vec::new());
        }

        info!("Executing {} tasks with worker pool (max concurrency: {})",
              tasks.len(), self.max_concurrency);

        let task_handles: Vec<Arc<Mutex<Task>>> = tasks.into_iter()
            .map(|task| Arc::new(Mutex::new(task)))
            .collect();

        let mut results = Vec::with_capacity(task_handles.len());

        for batch in task_handles.chunks(self.max_concurrency) {
            let mut batch_futures = Vec::new();

            for task_handle in batch {
                let orchestrator_ref = orchestrator as *mut TaskOrchestrator;
                let agents_ref = self.agents.clone();
                let active_workers_ref = self.active_workers.clone();
                let task_handle_clone = task_handle.clone();

                batch_futures.push(tokio::spawn(async move {
                    {
                        let mut active = active_workers_ref.lock().await;
                        *active += 1;
                        debug!("Active workers: {}", *active);
                    }

                    let result = Self::execute_single_task(
                        unsafe { &mut *orchestrator_ref },
                        &agents_ref,
                        task_handle_clone
                    ).await;

                    {
                        let mut active = active_workers_ref.lock().await;
                        *active -= 1;
                        debug!("Active workers: {}", *active);
                    }

                    result
                }));
            }

            let mut batch_results = Vec::new();
            for future in batch_futures {
                if let Ok(result) = future.await {
                    batch_results.push(result);
                }
            }

            results.extend(batch_results);
        }

        info!("Completed execution of {} tasks", results.len());
        Ok(results)
    }

    /// Execute a single task
    async fn execute_single_task(
        orchestrator: &mut TaskOrchestrator,
        _agents: &[Box<dyn Subagent>],
        task_handle: Arc<Mutex<Task>>,
    ) -> TaskResult {
        let start_time = std::time::Instant::now();
        let (task_id, description, priority) = {
            let task = task_handle.lock().await;
            (task.id, task.description.clone(), task.priority)
        };

        let selected_agent = Self::select_subagent_for_task(&description, priority);
        info!("Selected {:?} for task {}", selected_agent.agent_type(), task_id);

        let task = task_handle.lock().await.clone();
        let success = selected_agent.execute_task(&task).await;
        let duration = start_time.elapsed();

        let mut task_lock = task_handle.lock().await;

        let result = TaskResult {
            task_id,
            success,
            duration: duration.as_secs_f32(),
            agent_type: selected_agent.agent_type(),
            error_message: if success {
                None
            } else {
                Some("Subagent execution failed".to_string())
            },
        };

        if success {
            task_lock.complete(true);
            if let Err(e) = orchestrator.complete_task(task_id, true).await {
                error!("Failed to mark task {} as complete: {}", task_id, e);
            }
        } else {
            task_lock.fail();
            if let Err(e) = orchestrator
                .update_task_status(task_id, TaskStatus::Failed)
                .await
            {
                error!("Failed to mark task {} as failed: {}", task_id, e);
            }
        }

        result
    }

    /// Select the most appropriate subagent for a given task
    fn select_subagent_for_task(description: &str, priority: TaskPriority) -> Box<dyn Subagent> {
        // Oracle: architecture, debugging, design, root-cause
        if description.contains("architecture")
            || description.contains("design")
            || description.contains("debug")
            || description.contains("root-cause")
            || description.contains("refactor")
        {
            return SubagentFactory::create(SubagentType::Oracle);
        }

        // Librarian: documentation, research, libraries
        if description.contains("document")
            || description.contains("research")
            || description.contains("library")
            || description.contains("best practice")
        {
            return SubagentFactory::create(SubagentType::Librarian);
        }

        // Explore: scan, search, find, locate, analyze
        if description.contains("scan")
            || description.contains("search")
            || description.contains("find")
            || description.contains("locate")
            || description.contains("explore")
            || description.contains("analyze")
        {
            return SubagentFactory::create(SubagentType::Explore);
        }

        // Hephaestus: code, implement, write, fix, build, create
        if description.contains("code")
            || description.contains("implement")
            || description.contains("write")
            || description.contains("fix")
            || description.contains("build")
            || description.contains("create")
        {
            return SubagentFactory::create(SubagentType::Hephaestus);
        }

        // Priority-based fallback
        match priority {
            TaskPriority::Critical | TaskPriority::High => {
                SubagentFactory::create(SubagentType::Hephaestus)
            },
            TaskPriority::Medium => {
                SubagentFactory::create(SubagentType::Explore)
            },
            TaskPriority::Low => {
                SubagentFactory::create(SubagentType::Librarian)
            },
        }
    }
}

impl Default for WorkerPool {
    fn default() -> Self {
        Self::new()
    }
}

/// Result of executing a task
#[derive(Debug, Clone)]
pub struct TaskResult {
    /// ID of the task that was executed
    pub task_id: u32,
    /// Whether the task was successful
    pub success: bool,
    /// How long the task took to execute (in seconds)
    pub duration: f32,
    /// Which subagent type executed the task
    pub agent_type: SubagentType,
    /// Error message if the task failed
    pub error_message: Option<String>,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_worker_pool_creation() {
        let pool = WorkerPool::new();
        assert_eq!(pool.agents.len(), 4);
        assert_eq!(pool.max_concurrency, 4);
    }
}
