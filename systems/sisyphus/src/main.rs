use sisyphus_agent::SisyphusAgent;
use tracing::{info, Level};

#[tokio::main]
async fn main() {
    // Initialize tracing
    tracing_subscriber::fmt().with_max_level(Level::INFO).init();

    info!("Starting Geometry OS Sisyphus Orchestration Agent");

    // Create and start the Sisyphus agent
    let mut agent = SisyphusAgent::new();

    // Run the agent until interrupted
    agent.start().await;
}

#[cfg(test)]
mod tests {
    use super::*;

    #[tokio::test]
    async fn test_agent_creation() {
        let agent = SisyphusAgent::new();
        // Since running is private, we can't check it directly here if it's not pub.
        // But for now let's just ensure it can be created.
    }
}
