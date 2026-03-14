//! Sisyphus Orchestration Agent - Meta-System Guardian for Geometry OS
//! 
//! This agent provides persistent orchestration, multi-agent leadership,
//! parallel execution, self-correction, and codebase-awareness for
//! improving Geometry OS systems.

#![warn(missing_docs)]
#![warn(rust_2018_idioms)]
#![warn(rust_2021_compatibility)]

pub mod agent;
pub mod orchestrator;
pub mod subagent;
pub mod task;
pub mod worker;

/// Re-export core types for convenience
pub use agent::SisyphusAgent;
pub use orchestrator::TaskOrchestrator;
pub use subagent::SubagentType;
pub use task::Task;
pub use worker::WorkerPool;