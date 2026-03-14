use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::Mutex;
use tracing::{debug, info, warn};

use crate::subagent::{Subagent, SubagentType};
use crate::task::{Task, TaskPriority, TaskStatus};

/// Task Orchestrator - Manages the workflow and task lifecycle for Sisyphus
///
/// Implements the OMO-style orchestration that:
/// - Breaks down complex goals into actionable tasks
/// - Tracks task state and dependencies
/// - Enforces 100% completion before moving on
/// - Provides persistence across cycles
pub struct TaskOrchestrator {
    /// All tasks managed by this orchestrator
    tasks: Arc<Mutex<HashMap<u32, Task>>>,
    /// Next available task ID
    next_task_id: u32,
    /// Whether to enforce strict completion (no 80% solutions)
    enforce_completion: bool,
}

impl TaskOrchestrator {
    /// Create a new task orchestrator
    pub fn new() -> Self {
        info!("Initializing Task Orchestrator");

        TaskOrchestrator {
            tasks: Arc::new(Mutex::new(HashMap::new())),
            next_task_id: 1,
            enforce_completion: true, // Sisyphus principle: no 80% solutions
        }
    }

    /// Get all unfinished tasks (persistence mechanism)
    ///
    /// Returns tasks that are PENDING, IN_PROGRESS, or FAILED
    pub async fn get_unfinished_tasks(
        &self,
    ) -> Result<Vec<Task>, Box<dyn std::error::Error + Send + Sync>> {
        let tasks_lock = self.tasks.lock().await;
        let unfinished: Vec<Task> = tasks_lock
            .values()
            .filter(|task| {
                matches!(
                    task.status,
                    TaskStatus::Pending | TaskStatus::InProgress | TaskStatus::Failed
                )
            })
            .cloned()
            .collect();

        Ok(unfinished)
    }

    /// Generate improvement tasks based on system analysis
    ///
    /// In a full implementation, this would:
    /// - Analyze codebase for issues using LSP/AST-Grep
    /// - Check test results and coverage
    /// - Monitor performance metrics
    /// - Identify technical debt
    /// For now, we'll return placeholder tasks that demonstrate the concept
    pub fn generate_improvement_tasks(
        &mut self,
    ) -> Result<Vec<Task>, Box<dyn std::error::Error + Send + Sync>> {
        info!("Generating improvement tasks from system analysis");

        // Placeholder implementation - in reality this would analyze the actual codebase
        let mut tasks = Vec::new();

        // Example task: Check for TODO/FIXME comments
        tasks.push(Task::new(
            self.next_task_id,
            "Scan for TODO/FIXME comments".to_string(),
            "Review codebase for TODO/FIXME comments that need attention".to_string(),
            TaskPriority::Medium,
        ));
        self.next_task_id += 1;

        // Example task: Run test suite
        tasks.push(Task::new(
            self.next_task_id,
            "Run Geometry OS test suite".to_string(),
            "Execute all tests to ensure no regressions".to_string(),
            TaskPriority::High,
        ));
        self.next_task_id += 1;

        // Example task: Check performance benchmarks
        tasks.push(Task::new(
            self.next_task_id,
            "Check performance benchmarks".to_string(),
            "Verify performance hasn't degraded and look for improvement opportunities".to_string(),
            TaskPriority::Medium,
        ));
        self.next_task_id += 1;

        Ok(tasks)
    }

    /// Add a task to the orchestrator
    pub async fn add_task(
        &mut self,
        mut task: Task,
    ) -> Result<u32, Box<dyn std::error::Error + Send + Sync>> {
        // Assign ID if not already set
        if task.id == 0 {
            task.id = self.next_task_id;
            self.next_task_id += 1;
        }

        let mut tasks_lock = self.tasks.lock().await;
        tasks_lock.insert(task.id, task.clone());

        info!("Added task {}: {}", task.id, task.name);
        Ok(task.id)
    }

    /// Update a task's status
    pub async fn update_task_status(
        &self,
        task_id: u32,
        status: TaskStatus,
    ) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        let mut tasks_lock = self.tasks.lock().await;
        if let Some(task) = tasks_lock.get_mut(&task_id) {
            task.status = status;
            info!("Updated task {} status to {:?}", task_id, status);
            Ok(())
        } else {
            Err(format!("Task {} not found", task_id).into())
        }
    }

    /// Get a task by ID
    pub async fn get_task(
        &self,
        task_id: u32,
    ) -> Result<Option<Task>, Box<dyn std::error::Error + Send + Sync>> {
        let tasks_lock = self.tasks.lock().await;
        Ok(tasks_lock.get(&task_id).cloned())
    }

    /// Mark a task as completed (with verification)
    ///
    /// Implements the self-correction pattern - only marks as complete
    /// if verification passes or if enforcement is disabled
    pub async fn complete_task(
        &self,
        task_id: u32,
        verified: bool,
    ) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        let mut tasks_lock = self.tasks.lock().await;
        if let Some(task) = tasks_lock.get_mut(&task_id) {
            if self.enforce_completion && !verified {
                warn!(
                    "Task {} failed verification - marking as FAILED instead of complete",
                    task_id
                );
                task.status = TaskStatus::Failed;
            } else {
                task.status = TaskStatus::Completed;
                info!(
                    "Task {} marked as COMPLETE (verified: {})",
                    task_id, verified
                );
            }
            Ok(())
        } else {
            Err(format!("Task {} not found", task_id).into())
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use tokio::sync::Mutex;

    #[tokio::test]
    async fn test_orchestrator_creation() {
        let orchestrator = TaskOrchestrator::new();
        assert_eq!(orchestrator.next_task_id, 1);
    }

    #[tokio::test]
    async fn test_add_task() {
        let orchestrator = TaskOrchestrator::new();
        let task_id = orchestrator
            .add_task(Task::new(
                0,
                "Test Task".to_string(),
                "A test task".to_string(),
                TaskPriority::Low,
            ))
            .await
            .unwrap();

        assert_eq!(task_id, 1);
        assert_eq!(orchestrator.next_task_id, 2);
    }

    #[tokio::test]
    async fn test_get_unfinished_tasks() {
        let orchestrator = TaskOrchestrator::new();

        // Add a pending task
        orchestrator
            .add_task(Task::new(
                0,
                "Pending Task".to_string(),
                "A pending task".to_string(),
                TaskPriority::Low,
            ))
            .await
            .unwrap();

        // Add a completed task
        let completed_id = orchestrator
            .add_task(Task::new(
                0,
                "Completed Task".to_string(),
                "A completed task".to_string(),
                TaskPriority::Low,
            ))
            .await
            .unwrap();

        // Mark it as completed
        orchestrator
            .update_task_status(completed_id, TaskStatus::Completed)
            .await
            .unwrap();

        // Should only get the pending task back
        let unfinished = orchestrator.get_unfinished_tasks().await.unwrap();
        assert_eq!(unfinished.len(), 1);
        assert_eq!(unfinished[0].name, "Pending Task");
    }
}
