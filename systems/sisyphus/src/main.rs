use sisyphus_agent::{SisyphusAgent, TaskOrchestrator};
use tracing::{info, Level};
use tracing_subscriber::FmtCollector;

#[tokio::main]
async fn main() {
    // Initialize tracing
    tracing_subscriber::fmt().with_max_level(Level::INFO).init();

    info!("Starting Geometry OS Sisyphus Orchestration Agent");

    // Create and start the Sisyphus agent
    let mut agent = SisyphusAgent::new();

    // Run the agent until interrupted
    if let Err(e) = agent.start().await {
        eprintln!("Sisyphus agent failed: {}", e);
        std::process::exit(1);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_agent_creation() {
        let agent = SisyphusAgent::new();
        assert!(!agent.running);
    }

    #[tokio::test]
    async fn test_orchestrator_integration() {
        let orchestrator = TaskOrchestrator::new();
        let task_count = orchestrator.generate_improvement_tasks().unwrap().len();
        assert!(task_count > 0);
    }
}
