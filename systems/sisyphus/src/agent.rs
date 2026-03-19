use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::Arc;
use std::time::Duration;
use tokio::sync::Mutex;
use tracing::{error, info, warn};

use crate::orchestrator::TaskOrchestrator;
use crate::worker::WorkerPool;

/// Main Sisyphus Agent - The persistent orchestration agent for Geometry OS
///
/// Implements the OMO-style Sisyphus agent that:
/// - Persistently loops until 100% task completion
/// - Orchestrates multiple specialized subagents
/// - Executes tasks in parallel for efficiency
/// - Self-corrects and forces continuation on incomplete work
/// - Maintains codebase awareness for precise rewrites
pub struct SisyphusAgent {
    /// Task orchestrator that manages the workflow
    orchestrator: Arc<Mutex<TaskOrchestrator>>,
    /// Worker pool for executing subagent tasks
    worker_pool: WorkerPool,
    /// Whether the agent is currently running (shared for thread-safe stop)
    running: Arc<AtomicBool>,
    /// Persistence interval - how often to check for new work
    persistence_interval: Duration,
}

impl Default for SisyphusAgent {
    fn default() -> Self {
        Self::new()
    }
}

impl SisyphusAgent {
    /// Create a new Sisyphus agent
    pub fn new() -> Self {
        info!("Initializing Sisyphus Orchestration Agent");

        SisyphusAgent {
            orchestrator: Arc::new(Mutex::new(TaskOrchestrator::new())),
            worker_pool: WorkerPool::new(),
            running: Arc::new(AtomicBool::new(false)),
            persistence_interval: Duration::from_secs(5), // Check every 5 seconds
        }
    }

    /// Start the Sisyphus agent's main loop
    ///
    /// This implements the persistent "never-quit" loop that ensures
    /// tasks are completed to 100% before moving on.
    pub async fn start(&mut self) {
        info!("Starting Sisyphus Agent - entering persistent orchestration loop");
        self.running.store(true, Ordering::SeqCst);

        while self.running.load(Ordering::SeqCst) {
            // Check for and process pending tasks
            if let Err(e) = self.process_cycle().await {
                error!("Error in Sisyphus processing cycle: {}", e);
                // Continue the loop despite errors - persistence is key
            }

            // Wait before next persistence check
            tokio::time::sleep(self.persistence_interval).await;
        }

        info!("Sisyphus Agent stopped");
    }

    /// Stop the Sisyphus agent
    pub fn stop(&mut self) {
        info!("Stopping Sisyphus Agent");
        self.running.store(false, Ordering::SeqCst);
    }

    /// Process one cycle of the Sisyphus agent
    ///
    /// This is where the OMO patterns are implemented:
    /// 1. Check for unfinished work from previous cycles
    /// 2. Break down high-level goals into actionable tasks
    /// 3. Dispatch tasks to specialized subagents (Oracle, Librarian, Explore, Hephaestus)
    /// 4. Execute tasks in parallel
    /// 5. Verify completion and loop back if not 100% done
    async fn process_cycle(&self) -> Result<(), Box<dyn std::error::Error + Send + Sync>> {
        // Lock the orchestrator for this cycle to check tasks and generate new ones
        let (unfinished_tasks, new_tasks) = {
            let mut orchestrator = self.orchestrator.lock().await;

            // 1. Check for existing unfinished tasks (persistence mechanism)
            let unfinished = orchestrator.get_unfinished_tasks().await?;

            // 2. Generate new tasks from system analysis
            let new = orchestrator.generate_improvement_tasks()?;

            (unfinished, new)
        };

        if !unfinished_tasks.is_empty() {
            info!(
                "Found {} unfinished tasks from previous cycles",
                unfinished_tasks.len()
            );
        }

        if !new_tasks.is_empty() {
            info!("Generated {} new improvement tasks", new_tasks.len());
        }

        // Combine tasks to execute
        let mut tasks_to_execute = unfinished_tasks;
        tasks_to_execute.extend(new_tasks);

        if tasks_to_execute.is_empty() {
            return Ok(());
        }

        // 3. Dispatch tasks to specialized subagents
        // This implements the multi-agent leadership pattern
        let task_results = self
            .worker_pool
            .execute_tasks(self.orchestrator.clone(), tasks_to_execute)
            .await?;

        // 4. Verify task completion (self-correction mechanism)
        // If any tasks failed or are incomplete, we'll retry them in the next cycle
        let failed_count = task_results.iter().filter(|r| !r.success).count();
        if failed_count > 0 {
            warn!(
                "{} tasks failed in this cycle - will retry on next persistence loop",
                failed_count
            );
            // The orchestrator will keep these tasks as unfinished for next cycle
        } else if !task_results.is_empty() {
            info!(
                "All {} tasks completed successfully in this cycle",
                task_results.len()
            );
        }

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_sisyphus_agent_creation() {
        let agent = SisyphusAgent::new();
        assert!(!agent.running.load(Ordering::SeqCst));
    }
}
