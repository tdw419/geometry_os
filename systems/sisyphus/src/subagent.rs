use std::fmt;
use tracing::{debug, info};

/// Types of specialized subagents that Sisyphus can orchestrate
///
/// These correspond to the OMO agent types:
/// - Oracle: Handles architectural design and root-cause debugging
/// - Librarian: Conducts documentation research and finds relevant libraries
/// - Explore: Scans codebases for file paths and context
/// - Hephaestus: Executes deep, autonomous coding and exploration
#[derive(Debug, Clone, Copy, PartialEq, Eq, Hash)]
pub enum SubagentType {
    /// Oracle: Architectural design and root-cause debugging
    Oracle,
    /// Librarian: Documentation research and library discovery
    Librarian,
    /// Explore: Codebase scanning and context gathering
    Explore,
    /// Hephaestus: Deep coding and implementation
    Hephaestus,
}

impl SubagentType {
    /// Get a description of what this subagent type does
    pub fn description(&self) -> &'static str {
        match self {
            SubagentType::Oracle => "Handles architectural design and root-cause debugging",
            SubagentType::Librarian => {
                "Conducts documentation research and finds relevant libraries"
            },
            SubagentType::Explore => "Scans codebases for file paths and context",
            SubagentType::Hephaestus => "Executes deep, autonomous coding and exploration",
        }
    }
}

impl fmt::Display for SubagentType {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        let name = match self {
            SubagentType::Oracle => "Oracle",
            SubagentType::Librarian => "Librarian",
            SubagentType::Explore => "Explore",
            SubagentType::Hephaestus => "Hephaestus",
        };
        write!(f, "{}", name)
    }
}

/// Trait that all subagents must implement
#[async_trait::async_trait]
pub trait Subagent: Send + Sync {
    /// Get the type of this subagent
    fn agent_type(&self) -> SubagentType;

    /// Execute a task with this subagent
    ///
    /// Returns whether the task was successful
    async fn execute_task(&self, task: &crate::task::Task) -> bool;

    /// Get estimated time to complete a task (in seconds)
    ///
    /// Used for scheduling and parallel execution planning
    async fn estimate_time(&self, task: &crate::task::Task) -> u32 {
        // Default implementation - can be overridden
        30
    }
}

/// Concrete implementation of the Oracle subagent
///
/// Handles architectural design and root-cause debugging
pub struct OracleAgent;

#[async_trait::async_trait]
impl Subagent for OracleAgent {
    fn agent_type(&self) -> SubagentType {
        SubagentType::Oracle
    }

    async fn execute_task(&self, task: &crate::task::Task) -> bool {
        info!("Oracle agent executing task: {}", task.name);
        debug!("Task description: {}", task.description);

        // In a real implementation, this would:
        // - Analyze system architecture
        // - Perform root-cause analysis on failures
        // - Design improvements to complex systems
        // For now, we'll simulate work

        // Simulate some work
        tokio::time::sleep(tokio::time::Duration::from_secs(2)).await;

        // Simulate success/failure (mostly success for demo)
        true
    }
}

/// Concrete implementation of the Librarian subagent
///
/// Conducts documentation research and finds relevant libraries
pub struct LibrarianAgent;

#[async_trait::async_trait]
impl Subagent for LibrarianAgent {
    fn agent_type(&self) -> SubagentType {
        SubagentType::Librarian
    }

    async fn execute_task(&self, task: &crate::task::Task) -> bool {
        info!("Librarian agent executing task: {}", task.name);
        debug!("Task description: {}", task.description);

        // In a real implementation, this would:
        // - Search documentation
        // - Find relevant libraries/crates
        // - Research best practices
        // For now, we'll simulate work

        // Simulate some work
        tokio::time::sleep(tokio::time::Duration::from_secs(1)).await;

        // Simulate success/failure (mostly success for demo)
        true
    }
}

/// Concrete implementation of the Explore subagent
///
/// Scans codebases for file paths and context
pub struct ExploreAgent;

#[async_trait::async_trait]
impl Subagent for ExploreAgent {
    fn agent_type(&self) -> SubagentType {
        SubagentType::Explore
    }

    async fn execute_task(&self, task: &crate::task::Task) -> bool {
        info!("Explore agent executing task: {}", task.name);
        debug!("Task description: {}", task.description);

        // In a real implementation, this would:
        // - Use LSP/AST-Grep to find code patterns
        // - Scan file structures
        // - Gather contextual information
        // For now, we'll simulate work

        // Simulate some work
        tokio::time::sleep(tokio::time::Duration::from_secs(1)).await;

        // Simulate success/failure (mostly success for demo)
        true
    }
}

/// Concrete implementation of the Hephaestus subagent
///
/// Executes deep, autonomous coding and exploration
pub struct HephaestusAgent;

#[async_trait::async_trait]
impl Subagent for HephaestusAgent {
    fn agent_type(&self) -> SubagentType {
        SubagentType::Hephaestus
    }

    async fn execute_task(&self, task: &crate::task::Task) -> bool {
        info!("Hephaestus agent executing task: {}", task.name);
        debug!("Task description: {}", task.description);

        // In a real implementation, this would:
        // - Write/refactor code
        // - Implement features
        // - Fix bugs
        // For now, we'll simulate work

        // Simulate some work (longer for coding tasks)
        tokio::time::sleep(tokio::time::Duration::from_secs(3)).await;

        // Simulate success/failure (mostly success for demo)
        true
    }
}

/// Factory for creating subagents
pub struct SubagentFactory;

impl SubagentFactory {
    /// Create a subagent of the specified type
    pub fn create(agent_type: SubagentType) -> Box<dyn Subagent> {
        match agent_type {
            SubagentType::Oracle => Box::new(OracleAgent),
            SubagentType::Librarian => Box::new(LibrarianAgent),
            SubagentType::Explore => Box::new(ExploreAgent),
            SubagentType::Hephaestus => Box::new(HephaestusAgent),
        }
    }

    /// Create all standard subagent types
    pub fn create_all() -> Vec<Box<dyn Subagent>> {
        vec![
            Self::create(SubagentType::Oracle),
            Self::create(SubagentType::Librarian),
            Self::create(SubagentType::Explore),
            Self::create(SubagentType::Hephaestus),
        ]
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use tokio::sync::Mutex;

    #[tokio::test]
    async fn test_subagent_types() {
        let oracle = SubagentFactory::create(SubagentType::Oracle);
        assert_eq!(oracle.agent_type(), SubagentType::Oracle);

        let librarian = SubagentFactory::create(SubagentType::Librarian);
        assert_eq!(librarian.agent_type(), SubagentType::Librarian);

        let explore = SubagentFactory::create(SubagentType::Explore);
        assert_eq!(explore.agent_type(), SubagentType::Explore);

        let hephaestus = SubagentFactory::create(SubagentType::Hephaestus);
        assert_eq!(hephaestus.agent_type(), SubagentType::Hephaestus);
    }

    #[tokio::test]
    async fn test_subagent_execution() {
        let oracle = SubagentFactory::create(SubagentType::Oracle);
        let task = crate::task::Task::new(
            1,
            "Test".to_string(),
            "Test task".to_string(),
            crate::task::TaskPriority::Medium,
        );

        let result = oracle.execute_task(&task).await;
        assert!(result);
    }
}
