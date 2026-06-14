use std::collections::HashMap;
use std::sync::Arc;
use tokio::sync::Mutex;
use tracing::{info, warn, error, debug};
use std::fs;
use std::path::Path;

use crate::task::{Task, TaskStatus, TaskPriority};

/// Task Orchestrator - Manages the workflow and task lifecycle for Sisyphus
pub struct TaskOrchestrator {
    /// All tasks managed by this orchestrator
    tasks: Arc<Mutex<HashMap<u32, Task>>>,
    /// Next available task ID
    next_task_id: u32,
    /// Whether to enforce strict completion (no 80% solutions)
    enforce_completion: bool,
    /// Path to the state file for persistence
    state_path: String,
}

impl TaskOrchestrator {
    /// Create a new task orchestrator
    pub fn new() -> Self {
        info!("Initializing Task Orchestrator");

        let mut orchestrator = TaskOrchestrator {
            tasks: Arc::new(Mutex::new(HashMap::new())),
            next_task_id: 1,
            enforce_completion: true,
            state_path: ".loop/sisyphus_tasks.json".to_string(),
        };

        // Try to load existing state
        if let Err(e) = orchestrator.load_state() {
            warn!("Could not load existing state: {}. Starting fresh.", e);
        }

        orchestrator
    }

    /// Save the current state to a JSON file
    pub fn save_state(&self) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        let tasks = futures::executor::block_on(self.tasks.lock());
        let json = serde_json::to_string_pretty(&*tasks)?;

        let path = Path::new(&self.state_path);
        if let Some(parent) = path.parent() {
            fs::create_dir_all(parent)?;
        }

        fs::write(path, json)?;
        debug!("Saved orchestrator state to {}", self.state_path);
        Ok(())
    }

    /// Load state from a JSON file
    fn load_state(&mut self) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        let path = Path::new(&self.state_path);
        if !path.exists() {
            return Ok(());
        }

        let json = fs::read_to_string(path)?;
        let loaded_tasks: HashMap<u32, Task> = serde_json::from_str(&json)?;
        
        let max_id = loaded_tasks.keys().max().copied().unwrap_or(0);
        
        let mut tasks = futures::executor::block_on(self.tasks.lock());
        *tasks = loaded_tasks;
        self.next_task_id = max_id + 1;

        info!("Loaded {} tasks from {}", tasks.len(), self.state_path);
        Ok(())
    }

    /// Get all unfinished tasks (persistence mechanism)
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
    pub fn generate_improvement_tasks(
        &mut self,
    ) -> Result<Vec<Task>, Box<dyn std::error::Error + Send + Sync>> {
        info!("Generating improvement tasks from system analysis");

        let mut tasks = Vec::new();

        // Example task: Check for TODO/FIXME comments
        let task1 = Task::new(
            self.next_task_id,
            "Scan for TODO/FIXME comments".to_string(),
            "Review codebase for TODO/FIXME comments that need attention".to_string(),
            TaskPriority::Medium,
        );
        tasks.push(task1);
        self.next_task_id += 1;

        // Example task: Run test suite
        let task2 = Task::new(
            self.next_task_id,
            "Run Geometry OS test suite".to_string(),
            "Execute all tests to ensure no regressions".to_string(),
            TaskPriority::High,
        );
        tasks.push(task2);
        self.next_task_id += 1;

        // Add them to our internal map
        {
            let mut tasks_lock = futures::executor::block_on(self.tasks.lock());
            for task in &tasks {
                tasks_lock.insert(task.id, task.clone());
            }
        }

        self.save_state()?;

        Ok(tasks)
    }

    /// Add a task to the orchestrator
    pub async fn add_task(
        &mut self,
        mut task: Task,
    ) -> Result<u32, Box<dyn std::error::Error + Send + Sync>> {
        if task.id == 0 {
            task.id = self.next_task_id;
            self.next_task_id += 1;
        }

        {
            let mut tasks_lock = self.tasks.lock().await;
            tasks_lock.insert(task.id, task.clone());
        }

        self.save_state()?;
        info!("Added task {}: {}", task.id, task.name);
        Ok(task.id)
    }

    /// Update a task's status
    pub async fn update_task_status(
        &self,
        task_id: u32,
        status: TaskStatus,
    ) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        {
            let mut tasks_lock = self.tasks.lock().await;
            if let Some(task) = tasks_lock.get_mut(&task_id) {
                task.status = status;
                info!("Updated task {} status to {:?}", task_id, status);
            } else {
                return Err(format!("Task {} not found", task_id).into());
            }
        }
        self.save_state()?;
        Ok(())
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
    pub async fn complete_task(
        &self,
        task_id: u32,
        verified: bool,
    ) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        {
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
            } else {
                return Err(format!("Task {} not found", task_id).into());
            }
        }
        self.save_state()?;
        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_orchestrator_creation() {
        let orchestrator = TaskOrchestrator::new();
        assert_eq!(orchestrator.next_task_id, 1);
    }

    #[tokio::test]
    async fn test_add_task() {
        let mut orchestrator = TaskOrchestrator::new();
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
    }
}

