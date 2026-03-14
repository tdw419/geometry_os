use serde::{Deserialize, Serialize};
use std::fmt;
use tracing::{info};

/// Priority levels for tasks
#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Serialize, Deserialize)]
pub enum TaskPriority {
    /// Low priority tasks - done when convenient
    Low,
    /// Medium priority tasks - normal importance
    Medium,
    /// High priority tasks - should be done soon
    High,
    /// Critical priority tasks - must be done immediately
    Critical,
}

/// Status of a task throughout its lifecycle
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum TaskStatus {
    /// Task has not been started yet
    Pending,
    /// Task is currently being worked on
    InProgress,
    /// Task has been completed successfully
    Completed,
    /// Task failed during execution
    Failed,
    /// Task is blocked waiting for dependencies
    Blocked,
}

/// Represents a unit of work that Sisyphus can orchestrate
///
/// This is the core data structure that flows through the OMO-style
/// orchestration system, being processed by specialized subagents.
#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct Task {
    /// Unique identifier for the task
    pub id: u32,
    /// Human-readable name of the task
    pub name: String,
    /// Detailed description of what needs to be done
    pub description: String,
    /// Priority level of the task
    pub priority: TaskPriority,
    /// Current status of the task
    pub status: TaskStatus,
    /// Optional verification criteria for completion
    pub verification: Option<String>,
    /// Timestamp when task was created
    pub created_at: std::time::SystemTime,
    /// Timestamp when task was last updated
    pub updated_at: std::time::SystemTime,
}

impl Task {
    /// Create a new task
    ///
    /// # Arguments
    /// * `id` - Task ID (0 for auto-assignment)
    /// * `name` - Short name of the task
    /// * `description` - Detailed description
    /// * `priority` - Priority level
    pub fn new(id: u32, name: String, description: String, priority: TaskPriority) -> Self {
        let now = std::time::SystemTime::now();
        Task {
            id,
            name,
            description,
            priority,
            status: TaskStatus::Pending,
            verification: None,
            created_at: now,
            updated_at: now,
        }
    }

    /// Set verification criteria for this task
    ///
    /// # Arguments
    /// * `verification` - Description of how to verify task completion
    pub fn with_verification(mut self, verification: String) -> Self {
        self.verification = Some(verification);
        self.updated_at = std::time::SystemTime::now();
        self
    }

    /// Mark task as in progress
    pub fn start_work(&mut self) {
        self.status = TaskStatus::InProgress;
        self.updated_at = std::time::SystemTime::now();
        info!("Started working on task {}: {}", self.id, self.name);
    }

    /// Mark task as completed
    pub fn complete(&mut self, verified: bool) {
        if verified {
            self.status = TaskStatus::Completed;
            info!("Completed task {}: {}", self.id, self.name);
        } else {
            self.status = TaskStatus::Failed;
            info!("Failed task {}: {}", self.id, self.name);
        }
        self.updated_at = std::time::SystemTime::now();
    }

    /// Mark task as failed
    pub fn fail(&mut self) {
        self.status = TaskStatus::Failed;
        self.updated_at = std::time::SystemTime::now();
        info!("Marked task {} as failed: {}", self.id, self.name);
    }

    /// Check if task is finished (either completed or failed)
    pub fn is_finished(&self) -> bool {
        matches!(self.status, TaskStatus::Completed | TaskStatus::Failed)
    }

    /// Check if task is pending (not started)
    pub fn is_pending(&self) -> bool {
        self.status == TaskStatus::Pending
    }

    /// Check if task is currently in progress
    pub fn is_in_progress(&self) -> bool {
        self.status == TaskStatus::InProgress
    }
}

impl fmt::Display for Task {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let status_char = match self.status {
            TaskStatus::Pending => " ",
            TaskStatus::InProgress => "→",
            TaskStatus::Completed => "x",
            TaskStatus::Failed => "!",
            TaskStatus::Blocked => "!",
        };

        write!(
            f,
            "- [{}] {}. **{}**: {}",
            status_char, self.id, self.name, self.description
        )?;

        if let Some(ref verification) = self.verification {
            write!(f, " - **Verification**: {}", verification)?;
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_task_creation() {
        let task = Task::new(
            1,
            "Test Task".to_string(),
            "A test task".to_string(),
            TaskPriority::Medium,
        );
        assert_eq!(task.id, 1);
        assert_eq!(task.name, "Test Task");
        assert_eq!(task.description, "A test task");
        assert_eq!(task.priority, TaskPriority::Medium);
        assert_eq!(task.status, TaskStatus::Pending);
        assert!(task.verification.is_none());
    }

    #[test]
    fn test_task_verification() {
        let task = Task::new(
            1,
            "Test Task".to_string(),
            "A test task".to_string(),
            TaskPriority::Medium,
        )
        .with_verification("Check that it works".to_string());

        assert_eq!(task.verification, Some("Check that it works".to_string()));
    }

    #[test]
    fn test_task_lifecycle() {
        let mut task = Task::new(
            1,
            "Test Task".to_string(),
            "A test task".to_string(),
            TaskPriority::Medium,
        );

        assert!(task.is_pending());
        assert!(!task.is_in_progress());
        assert!(!task.is_finished());

        task.start_work();
        assert!(!task.is_pending());
        assert!(task.is_in_progress());
        assert!(!task.is_finished());

        task.complete(true);
        assert!(!task.is_pending());
        assert!(!task.is_in_progress());
        assert!(task.is_finished());
    }
}
