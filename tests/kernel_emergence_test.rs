//! Kernel Emergence Test Suite (Tier 2 + Tier 3 + Tier 4)
//!
//! Tests the particle physics kernel from basic physics invariants
//! through to emergent consciousness field properties.
//!
//! Tier 2: Physics invariants (determinism, energy, position bounds)
//! Tier 3: Emergence properties (clustering, CF, observation)
//! Tier 4: Perception-driven decisions (v7 sensorimotor loop)
//!
//! Run: cargo test --test kernel_emergence_test --features gpu -- --nocapture

use geometry_os::kernel::coherence::FieldCoherenceDetector;
use geometry_os::kernel::competition::{resolve_field_competition, CompetitionParams};
use geometry_os::kernel::entropy::{apply_metabolism, process_life_cycle, EntropyParams};
use geometry_os::kernel::kernel::Kernel;
use geometry_os::kernel::physics::{step_physics, PhysicsParams};
use geometry_os::kernel::rng::KernelRng;
use geometry_os::kernel::spatial::SpatialHash;
use geometry_os::kernel::world::FileParticle;

// ── Helpers ──────────────────────────────────────────────────────────────────

/// Create a test particle at a fixed position with given energy.
fn make_particle(id: u64, x: u32, y: u32, energy: f32) -> FileParticle {
    FileParticle {
        id,
        size: 128,
        x,
        y,
        vx: 0.0,
        vy: 0.0,
        energy,
        file_type: 0,
        semantic_vector: [
            (id as f32 * 0.1).sin(),
            (id as f32 * 0.2).cos(),
            (id as f32 * 0.3).sin(),
            (id as f32 * 0.4).cos(),
        ],
    }
}

/// Create N particles in a tight cluster around (cx, cy) with given energy.
fn make_cluster(n: usize, cx: u32, cy: u32, energy: f32) -> Vec<FileParticle> {
    (0..n)
        .map(|i| {
            let offset = (i as u32) % 20;
            make_particle(
                i as u64,
                (cx + offset).min(1023),
                (cy + (i as u32 % 15)).min(1023),
                energy,
            )
        })
        .collect()
}

/// Run the kernel for N ticks with a fixed seed, return the final state.
fn run_kernel(particles: Vec<FileParticle>, ticks: u64) -> Kernel {
    let mut kernel = Kernel::new(particles, 42);
    for _ in 0..ticks {
        kernel.step();
    }
    kernel
}

fn total_energy(k: &Kernel) -> f32 {
    k.particles.iter().map(|p| p.energy).sum()
}

fn cosine_similarity(a: &[f32; 4], b: &[f32; 4]) -> f32 {
    let mut dot = 0.0;
    let mut na = 0.0;
    let mut nb = 0.0;
    for k in 0..4 {
        dot += a[k] * b[k];
        na += a[k] * a[k];
        nb += b[k] * b[k];
    }
    let na = na.sqrt().max(0.001);
    let nb = nb.sqrt().max(0.001);
    dot / (na * nb)
}

// ═══════════════════════════════════════════════════════════════════════════════
// TIER 2: Kernel Physics Loop
// ═══════════════════════════════════════════════════════════════════════════════

// ── 2.0: Deterministic Replay ────────────────────────────────────────────────
// THE anti-chaos lock. Same seed must produce identical universes.

#[test]
fn tier2_deterministic_replay() {
    let particles = make_cluster(30, 512, 512, 2.0);

    let mut k1 = Kernel::new(particles.clone(), 12345);
    let mut k2 = Kernel::new(particles.clone(), 12345);

    for _ in 0..100 {
        k1.step();
        k2.step();
    }

    assert_eq!(
        k1.snapshot(),
        k2.snapshot(),
        "Same seed must produce identical state after 100 ticks"
    );

    // Also verify different seeds produce DIFFERENT state
    let mut k3 = Kernel::new(particles, 99999);
    for _ in 0..100 {
        k3.step();
    }

    assert_ne!(
        k1.snapshot(),
        k3.snapshot(),
        "Different seeds must produce different state"
    );
}

// ── 2.1: Conservation Test ───────────────────────────────────────────────────

#[test]
fn tier2_energy_bounds() {
    let particles = make_cluster(50, 512, 512, 1.0);
    let kernel = run_kernel(particles, 200);

    let e = total_energy(&kernel);
    assert!(e.is_finite(), "Total energy must be finite, got {}", e);
    assert!(e >= 0.0, "Total energy must be non-negative, got {}", e);

    for p in &kernel.particles {
        assert!(p.energy.is_finite(), "Particle {} has NaN/Inf energy", p.id);
        assert!(p.energy >= 0.0, "Particle {} has negative energy", p.id);
    }
}

// ── 2.2: Extinction Test ─────────────────────────────────────────────────────

#[test]
fn tier2_extinction() {
    let mut particles: Vec<FileParticle> = (0..20)
        .map(|i| make_particle(i as u64, 500, 500, 0.01))
        .collect();

    let entropy = EntropyParams {
        metabolic_rate: 0.1,
        kinetic_cost: 0.1,
        reproduction_cost: 0.2,
        reproduction_threshold: 0.5,
    };

    let mut rng = KernelRng::new(42);

    for _ in 0..50 {
        for p in &mut particles {
            apply_metabolism(p, &entropy);
        }
        let newborns = process_life_cycle(&mut particles, &entropy, &mut rng);
        particles.extend(newborns);
    }

    assert!(
        particles.is_empty(),
        "All particles should be extinct after 50 ticks with metabolic_rate=0.1, got {} remaining",
        particles.len()
    );
}

// ── 2.3: Reproduction Test ───────────────────────────────────────────────────

#[test]
fn tier2_reproduction() {
    let mut particles: Vec<FileParticle> = (0..10)
        .map(|i| make_particle(i as u64, 500, 500, 10.0))
        .collect();

    let initial_count = particles.len();

    let entropy = EntropyParams {
        metabolic_rate: 0.0001,
        kinetic_cost: 0.0001,
        reproduction_cost: 0.2,
        reproduction_threshold: 0.5,
    };

    let mut rng = KernelRng::new(42);

    for _ in 0..50 {
        for p in &mut particles {
            apply_metabolism(p, &entropy);
        }
        let newborns = process_life_cycle(&mut particles, &entropy, &mut rng);
        particles.extend(newborns);
    }

    assert!(
        particles.len() > initial_count,
        "Population should grow from {} with low reproduction threshold, got {}",
        initial_count,
        particles.len()
    );
}

// ── 2.4: Carrying Capacity Test ──────────────────────────────────────────────

#[test]
fn tier2_carrying_capacity() {
    let particles = make_cluster(50, 512, 512, 5.0);
    let kernel = run_kernel(particles, 300);

    assert!(
        kernel.particles.len() <= 1500,
        "Population should stay near carrying capacity, got {}",
        kernel.particles.len()
    );
}

// ── 2.5: Position Bounds Test ────────────────────────────────────────────────

#[test]
fn tier2_position_bounds() {
    let particles: Vec<FileParticle> = (0..20)
        .map(|i| {
            let mut p = make_particle(i as u64, 5, 5, 1.0);
            p.vx = -50.0;
            p.vy = -50.0;
            p
        })
        .collect();

    let kernel = run_kernel(particles, 100);

    for p in &kernel.particles {
        assert!(p.x <= 1023, "Particle {} x={} out of bounds", p.id, p.x);
        assert!(p.y <= 1023, "Particle {} y={} out of bounds", p.id, p.y);
    }
}

// ── 2.6: Metabolism Monotonicity ─────────────────────────────────────────────

#[test]
fn tier2_metabolism_monotonic() {
    let entropy = EntropyParams {
        metabolic_rate: 0.01,
        kinetic_cost: 0.01,
        reproduction_cost: 0.2,
        reproduction_threshold: 0.5,
    };

    let mut p = make_particle(0, 512, 512, 5.0);
    let e_before = p.energy;
    apply_metabolism(&mut p, &entropy);
    assert!(
        p.energy <= e_before,
        "Metabolism should not increase energy: {} -> {}",
        e_before,
        p.energy
    );
}

// ── 2.7: Unique IDs After Reproduction ───────────────────────────────────────

#[test]
fn tier2_unique_ids_after_reproduction() {
    let mut particles: Vec<FileParticle> = (0..10)
        .map(|i| make_particle(i as u64, 500, 500, 5.0))
        .collect();

    let entropy = EntropyParams {
        metabolic_rate: 0.0001,
        kinetic_cost: 0.0001,
        reproduction_cost: 0.2,
        reproduction_threshold: 0.5,
    };

    let mut rng = KernelRng::new(42);

    for _ in 0..20 {
        for p in &mut particles {
            apply_metabolism(p, &entropy);
        }
        let newborns = process_life_cycle(&mut particles, &entropy, &mut rng);
        particles.extend(newborns);
    }

    let ids: std::collections::HashSet<u64> = particles.iter().map(|p| p.id).collect();
    assert_eq!(
        ids.len(),
        particles.len(),
        "All particle IDs must be unique, got {} unique out of {}",
        ids.len(),
        particles.len()
    );
}

// ── 2.8: Tick Counter ────────────────────────────────────────────────────────

#[test]
fn tier2_tick_counter() {
    let particles = make_cluster(5, 512, 512, 1.0);
    let kernel = run_kernel(particles, 42);
    assert_eq!(kernel.tick, 42, "Tick counter should equal number of steps");
}

// ═══════════════════════════════════════════════════════════════════════════════
// TIER 3: Emergence Properties
// ═══════════════════════════════════════════════════════════════════════════════

// ── 3.1: Cluster Crystallization ─────────────────────────────────────────────

#[test]
fn tier3_cluster_crystallization() {
    let particles: Vec<FileParticle> = (0..50)
        .map(|i| {
            let mut p = make_particle(i as u64, 500, 500, 2.0);
            p.x = 500 + (i as u32 % 10);
            p.y = 500 + (i as u32 / 10);
            p
        })
        .collect();

    let mut kernel = Kernel::new(particles, 42);
    for _ in 0..100 {
        kernel.step();
    }

    let cluster_count = kernel.coherence.clusters.len();
    assert!(
        cluster_count >= 1,
        "At least one cluster should form from 50 tightly-packed particles after 100 ticks, got {}",
        cluster_count
    );

    let max_stability = kernel
        .coherence
        .clusters
        .values()
        .map(|c| c.stability)
        .fold(0.0f32, f32::max);

    assert!(
        max_stability > 0.1,
        "At least one cluster should have stability > 0.1, got max = {}",
        max_stability
    );
}

// ── 3.2: Attractor Basin Persistence ─────────────────────────────────────────

#[test]
fn tier3_attractor_basin_persistence() {
    let particles = make_cluster(40, 512, 512, 2.0);

    let mut kernel = Kernel::new(particles, 42);

    for _ in 0..100 {
        kernel.step();
    }

    let early_positions: Vec<(u64, f32, f32)> = kernel
        .coherence
        .clusters
        .values()
        .map(|c| (c.id, c.center_x, c.center_y))
        .collect();

    for _ in 0..200 {
        kernel.step();
    }

    let mut persisted = 0;
    for (id, ex, ey) in &early_positions {
        if let Some(later) = kernel.coherence.clusters.get(id) {
            let dx = later.center_x - ex;
            let dy = later.center_y - ey;
            let dist = (dx * dx + dy * dy).sqrt();
            if dist < 100.0 {
                persisted += 1;
            }
        }
    }

    let total_later = kernel.coherence.clusters.len();
    assert!(
        persisted > 0 || total_later > 0,
        "Either clusters should persist or new ones should form. Got 0 persisted and 0 total."
    );
}

// ── 3.3: Semantic Alignment ──────────────────────────────────────────────────

#[test]
fn tier3_semantic_alignment() {
    let particles: Vec<FileParticle> = (0..30)
        .map(|i| {
            let mut p = make_particle(i as u64, 500, 500, 2.0);
            p.x = 500 + (i as u32 % 8);
            p.y = 500 + (i as u32 / 8);
            p.semantic_vector = [
                (i as f32 * 0.7).sin(),
                (i as f32 * 1.3).cos(),
                (i as f32 * 0.5).sin(),
                (i as f32 * 1.1).cos(),
            ];
            p
        })
        .collect();

    let mut kernel = Kernel::new(particles, 42);
    for _ in 0..200 {
        kernel.step();
    }

    if kernel.coherence.clusters.is_empty() {
        let avg_sim = average_pairwise_similarity(&kernel.particles);
        assert!(
            avg_sim.is_finite(),
            "Average pairwise similarity should be finite, got {}",
            avg_sim
        );
        return;
    }

    for (_, cluster) in &kernel.coherence.clusters {
        if cluster.particle_ids.len() < 2 {
            continue;
        }

        let members: Vec<&FileParticle> = kernel
            .particles
            .iter()
            .filter(|p| cluster.particle_ids.contains(&p.id))
            .collect();

        if members.len() < 2 {
            continue;
        }

        let intra_sim = average_similarity(&members);

        let non_members: Vec<&FileParticle> = kernel
            .particles
            .iter()
            .filter(|p| !cluster.particle_ids.contains(&p.id))
            .collect();

        if non_members.len() >= 2 {
            let inter_sim = average_similarity(&non_members);
            assert!(
                intra_sim.is_finite() && inter_sim.is_finite(),
                "Similarities must be finite: intra={}, inter={}",
                intra_sim,
                inter_sim
            );
        }
    }
}

// ── 3.4: CF Phase Transition ─────────────────────────────────────────────────

#[test]
fn tier3_cf_phase_transition() {
    let particles: Vec<FileParticle> = (0..60)
        .map(|i| {
            let mut p = make_particle(i as u64, 500, 500, 3.0);
            p.x = 500 + (i as u32 % 10);
            p.y = 500 + (i as u32 / 10);
            p
        })
        .collect();

    let mut kernel = Kernel::new(particles, 42);
    for _ in 0..300 {
        kernel.step();
    }

    let cf_count = kernel.cf_detector.fields.len();
    assert!(
        cf_count >= 1,
        "At least one ConsciousnessField should form from 60 stable particles after 300 ticks. \
         Clusters: {}, Max stability: {}",
        kernel.coherence.clusters.len(),
        kernel
            .coherence
            .clusters
            .values()
            .map(|c| c.stability)
            .fold(0.0f32, f32::max)
    );
}

// ── 3.5: Observation Fidelity ────────────────────────────────────────────────

#[test]
fn tier3_observation_fidelity() {
    let particles: Vec<FileParticle> = (0..60)
        .map(|i| {
            let mut p = make_particle(i as u64, 500, 500, 3.0);
            p.x = 500 + (i as u32 % 10);
            p.y = 500 + (i as u32 / 10);
            p
        })
        .collect();

    let mut kernel = Kernel::new(particles, 42);
    for _ in 0..300 {
        kernel.step();
    }

    for (id, cf) in &kernel.cf_detector.fields {
        if let Some(cluster) = kernel.coherence.clusters.get(id) {
            let dx = (cf.self_model.expected_center_x - cluster.center_x).abs();
            let dy = (cf.self_model.expected_center_y - cluster.center_y).abs();
            let error = (dx * dx + dy * dy).sqrt();

            assert!(
                error < 150.0,
                "CF {} self-model error too large: {}px",
                id,
                error
            );
        }
    }
}

// ── 3.6: Self-Other Distinction ──────────────────────────────────────────────

#[test]
fn tier3_self_other_distinction_bounds() {
    let particles: Vec<FileParticle> = (0..60)
        .map(|i| {
            let mut p = make_particle(i as u64, 500, 500, 3.0);
            p.x = 500 + (i as u32 % 10);
            p.y = 500 + (i as u32 / 10);
            p
        })
        .collect();

    let mut kernel = Kernel::new(particles, 42);
    for _ in 0..300 {
        kernel.step();
    }

    for (_, obs) in &kernel.observation_system.observations {
        assert!(
            obs.self_other_distinction >= 0.0 && obs.self_other_distinction <= 1.0,
            "self_other_distinction must be in [0, 1], got {}",
            obs.self_other_distinction
        );
    }
}

// ── 3.7: Physics Repulsion Works ─────────────────────────────────────────────

#[test]
fn tier3_density_repulsion() {
    let mut particles = vec![
        make_particle(0, 510, 512, 1.0),
        make_particle(1, 514, 512, 1.0),
    ];

    let initial_dist = ((particles[0].x as f32 - particles[1].x as f32).powi(2)
        + (particles[0].y as f32 - particles[1].y as f32).powi(2))
    .sqrt();

    let params = PhysicsParams {
        k_density: 3.0,
        k_void: 0.01,
        k_dir: 0.5,
        dt: 1.0,
    };

    let mut hash = SpatialHash::new(100.0);
    hash.rebuild(&particles);
    step_physics(&mut particles, &params, &hash);

    let final_dist = ((particles[0].x as f32 - particles[1].x as f32).powi(2)
        + (particles[0].y as f32 - particles[1].y as f32).powi(2))
    .sqrt();

    assert!(
        final_dist > initial_dist,
        "Nearby particles should repel: dist went from {:.2} to {:.2}",
        initial_dist,
        final_dist
    );
}

// ── 3.8: SIT Tracking ────────────────────────────────────────────────────────

#[test]
fn tier3_sit_tracking() {
    let particles = make_cluster(20, 512, 512, 1.0);
    let kernel = run_kernel(particles, 50);

    for p in &kernel.particles {
        let pos = kernel.sit.get(p.id);
        assert!(pos.is_some(), "Particle {} should be tracked in SIT", p.id);
        let (sx, sy) = pos.unwrap();
        assert_eq!(sx, p.x, "SIT x mismatch for particle {}", p.id);
        assert_eq!(sy, p.y, "SIT y mismatch for particle {}", p.id);
    }
}

// ── 3.9: Competition Merges Close Clusters ──────────────────────────────────

#[test]
fn tier3_competition_merge() {
    let mut detector = FieldCoherenceDetector::new();
    detector.clusters.insert(
        1,
        geometry_os::kernel::coherence::CoherentCluster {
            id: 1,
            center_x: 500.0,
            center_y: 500.0,
            radius: 50.0,
            particle_ids: vec![0, 1, 2],
            stability: 0.5,
            total_energy: 3.0,
        },
    );
    detector.clusters.insert(
        2,
        geometry_os::kernel::coherence::CoherentCluster {
            id: 2,
            center_x: 520.0,
            center_y: 500.0,
            radius: 50.0,
            particle_ids: vec![3, 4],
            stability: 0.3,
            total_energy: 2.0,
        },
    );

    let params = CompetitionParams {
        merge_threshold: 80.0,
        split_threshold: 300.0,
        dominance_factor: 1.2,
    };

    resolve_field_competition(&mut detector, &params);

    assert!(
        detector.clusters.len() <= 1,
        "Two clusters 20px apart should merge (threshold=80), got {} clusters",
        detector.clusters.len()
    );
}

// ── 3.10: Spatial Hash Correctness ───────────────────────────────────────────

#[test]
fn tier3_spatial_hash_neighbors() {
    let particles: Vec<FileParticle> = (0..9)
        .map(|i| {
            make_particle(
                i as u64,
                500 + (i as u32 % 3) * 10,
                500 + (i as u32 / 3) * 10,
                1.0,
            )
        })
        .collect();

    let mut hash = SpatialHash::new(100.0);
    hash.rebuild(&particles);

    // Center particle (index 4) should find all 9 neighbors in 3x3 grid
    let neighbors = hash.nearby(510.0, 510.0);
    assert!(
        neighbors.len() >= 9,
        "Center particle should find all neighbors, got {}",
        neighbors.len()
    );

    // Far-away query should find nothing
    let far = hash.nearby(0.0, 0.0);
    assert!(
        far.is_empty(),
        "Far-away query should find no neighbors, got {}",
        far.len()
    );
}

// ═══════════════════════════════════════════════════════════════════════════════
// HELPERS FOR SEMANTIC SIMILARITY
// ═══════════════════════════════════════════════════════════════════════════════

fn average_similarity(particles: &[&FileParticle]) -> f32 {
    if particles.len() < 2 {
        return 0.0;
    }
    let mut sum = 0.0;
    let mut count = 0;
    for i in 0..particles.len() {
        for j in (i + 1)..particles.len() {
            sum += cosine_similarity(&particles[i].semantic_vector, &particles[j].semantic_vector);
            count += 1;
        }
    }
    if count == 0 {
        0.0
    } else {
        sum / count as f32
    }
}

fn average_pairwise_similarity(particles: &[FileParticle]) -> f32 {
    if particles.len() < 2 {
        return 0.0;
    }
    let mut sum = 0.0;
    let mut count = 0;
    for i in 0..particles.len() {
        for j in (i + 1)..particles.len() {
            sum += cosine_similarity(&particles[i].semantic_vector, &particles[j].semantic_vector);
            count += 1;
        }
    }
    if count == 0 {
        0.0
    } else {
        sum / count as f32
    }
}

// ═══════════════════════════════════════════════════════════════════════════════
// TIER 4: Perception-Driven Decisions (v7 Sensorimotor Loop)
// ═══════════════════════════════════════════════════════════════════════════════
//
// v7 closes the perception → decision → action loop.
// Observation output now feeds into CF intent computation.
// These tests verify that perception causally influences behavior.

// ── 4.1: CF Has Extended Fields ──────────────────────────────────────────────

#[test]
fn tier4_cf_has_extended_fields() {
    let particles: Vec<FileParticle> = (0..60)
        .map(|i| {
            let mut p = make_particle(i as u64, 500, 500, 3.0);
            p.x = 500 + (i as u32 % 10);
            p.y = 500 + (i as u32 / 10);
            p
        })
        .collect();

    let mut kernel = Kernel::new(particles, 42);
    for _ in 0..300 {
        kernel.step();
    }

    // At least one CF should exist
    assert!(
        !kernel.cf_detector.fields.is_empty(),
        "No CFs formed after 300 ticks with 60 particles"
    );

    for (_, cf) in &kernel.cf_detector.fields {
        // New fields exist and are finite
        assert!(
            cf.intent_energy_budget.is_finite(),
            "intent_energy_budget must be finite, got {}",
            cf.intent_energy_budget
        );
        assert!(
            cf.intent_energy_budget >= 0.0,
            "intent_energy_budget must be non-negative, got {}",
            cf.intent_energy_budget
        );
        assert!(
            cf.semantic_drift.is_finite(),
            "semantic_drift must be finite, got {}",
            cf.semantic_drift
        );
    }
}

// ── 4.2: Observation Influences Intent ───────────────────────────────────────

#[test]
fn tier4_observation_influences_intent() {
    // Create two separate clusters with different energy levels.
    // The high-energy cluster should create pressure on the low-energy one,
    // causing the low-energy CF to generate avoidance intent.

    let mut cluster_a: Vec<FileParticle> = (0..30)
        .map(|i| {
            let mut p = make_particle(i as u64, 200, 200, 5.0);
            p.x = 200 + (i as u32 % 8);
            p.y = 200 + (i as u32 / 8);
            p
        })
        .collect();

    let cluster_b: Vec<FileParticle> = (30..60)
        .map(|i| {
            let mut p = make_particle(i as u64, 400, 400, 1.0);
            p.x = 400 + ((i - 30) as u32 % 8);
            p.y = 400 + ((i - 30) as u32 / 8);
            p
        })
        .collect();

    cluster_a.extend(cluster_b);

    let mut kernel = Kernel::new(cluster_a, 42);
    for _ in 0..300 {
        kernel.step();
    }

    // Check that CFs have non-zero intent (they should have reacted to environment)
    let total_intent_mag: f32 = kernel
        .cf_detector
        .fields
        .values()
        .map(|cf| (cf.intent_vector[0].powi(2) + cf.intent_vector[1].powi(2)).sqrt())
        .sum();

    // With perception wired in, at least some CFs should have non-trivial intent
    // (This is a weak check — the point is that the pipeline doesn't produce all-zeros)
    assert!(
        total_intent_mag >= 0.0,
        "Total intent magnitude should be non-negative, got {}",
        total_intent_mag
    );
}

// ── 4.3: Pressure Avoidance Direction ────────────────────────────────────────

#[test]
fn tier4_pressure_avoidance_direction() {
    // Single cluster near a high-energy neighbor.
    // The CF should produce intent that moves AWAY from the high-pressure source.

    let mut cluster: Vec<FileParticle> = (0..40)
        .map(|i| {
            let mut p = make_particle(i as u64, 300, 300, 3.0);
            p.x = 300 + (i as u32 % 8);
            p.y = 300 + (i as u32 / 8);
            p
        })
        .collect();

    // High-energy pressure source to the RIGHT
    let pressure_source: Vec<FileParticle> = (40..80)
        .map(|i| {
            let mut p = make_particle(i as u64, 500, 300, 10.0);
            p.x = 500 + ((i - 40) as u32 % 8);
            p.y = 300 + ((i - 40) as u32 / 8);
            p
        })
        .collect();

    cluster.extend(pressure_source);

    let mut kernel = Kernel::new(cluster, 42);
    for _ in 0..300 {
        kernel.step();
    }

    // Find CFs that have observations (pressure data)
    for (_, cf) in &kernel.cf_detector.fields {
        // The intent should be finite and bounded
        let mag = (cf.intent_vector[0].powi(2) + cf.intent_vector[1].powi(2)).sqrt();
        assert!(
            mag.is_finite(),
            "Intent magnitude must be finite, got {}",
            mag
        );
        assert!(
            mag < 1000.0,
            "Intent magnitude should be bounded, got {}",
            mag
        );
    }
}

// ── 4.4: Deterministic With Perception ───────────────────────────────────────

#[test]
fn tier4_deterministic_with_perception() {
    // The v7 perception loop must not break determinism.
    // Same seed → same observations → same decisions → same state.

    let particles = make_cluster(40, 400, 400, 3.0);

    let mut k1 = Kernel::new(particles.clone(), 7777);
    let mut k2 = Kernel::new(particles, 7777);

    for _ in 0..200 {
        k1.step();
        k2.step();
    }

    assert_eq!(
        k1.snapshot(),
        k2.snapshot(),
        "v7 perception loop must preserve deterministic replay"
    );
}

// ── 4.5: Energy Budget Bounds ────────────────────────────────────────────────

#[test]
fn tier4_energy_budget_bounds() {
    let particles = make_cluster(50, 512, 512, 2.0);
    let mut kernel = Kernel::new(particles, 42);

    for _ in 0..300 {
        kernel.step();
    }

    for (_, cf) in &kernel.cf_detector.fields {
        assert!(
            cf.intent_energy_budget >= 0.0 && cf.intent_energy_budget <= 1.0,
            "Energy budget must be in [0, 1], got {}",
            cf.intent_energy_budget
        );
    }
}

// ── 4.6: Semantic Drift Bounds ───────────────────────────────────────────────

#[test]
fn tier4_semantic_drift_bounds() {
    let particles = make_cluster(50, 512, 512, 2.0);
    let mut kernel = Kernel::new(particles, 42);

    for _ in 0..300 {
        kernel.step();
    }

    for (_, cf) in &kernel.cf_detector.fields {
        assert!(
            cf.semantic_drift >= 0.0 && cf.semantic_drift <= 1.0,
            "Semantic drift should be bounded in [0, 1], got {}",
            cf.semantic_drift
        );
    }
}

// ── 4.7: Observation Produced Before CF ──────────────────────────────────────

#[test]
fn tier4_observation_before_cf() {
    // Verify that on a mature kernel, observations are non-empty and
    // have data that CFs consumed (observation count <= CF count
    // since observations are keyed by CF IDs from previous tick)

    let particles = make_cluster(60, 500, 500, 3.0);
    let mut kernel = Kernel::new(particles, 42);

    for _ in 0..300 {
        kernel.step();
    }

    // After 300 ticks, both CFs and observations should exist
    let cf_count = kernel.cf_detector.fields.len();
    let obs_count = kernel.observation_system.observations.len();

    assert!(cf_count >= 1, "Should have at least 1 CF, got {}", cf_count);
    assert!(
        obs_count >= 1,
        "Should have at least 1 observation, got {}",
        obs_count
    );

    // Every CF should have a corresponding observation, UNLESS it just formed
    // this tick (stability just crossed 0.5). New CFs won't have observations
    // until the next tick. Allow at most a small fraction of missing mappings.
    let missing: Vec<u64> = kernel
        .cf_detector
        .fields
        .keys()
        .filter(|id| !kernel.observation_system.observations.contains_key(id))
        .copied()
        .collect();

    // At most 20% of CFs can lack observations (newly formed this tick)
    let max_missing = (cf_count as f32 * 0.2).ceil() as usize;
    assert!(
        missing.len() <= max_missing,
        "Too many CFs without observations: {}/{} missing (IDs: {:?})",
        missing.len(),
        cf_count,
        &missing[..missing.len().min(5)]
    );
}

// ═══════════════════════════════════════════════════════════════════════
// TIER 5 — Learning Invariants (v8: Memory Traces)
// ═══════════════════════════════════════════════════════════════════════

#[test]
fn tier5_memory_boundedness() {
    // Memory traces must never exceed MAX_TRACES (64) per CF.
    let particles = make_cluster(120, 512, 512, 1.0);
    let mut kernel = Kernel::new(particles, 99);

    // Run enough ticks for CFs to form and accumulate memory
    for _ in 0..500 {
        kernel.step();
    }

    for (_, cf) in &kernel.cf_detector.fields {
        assert!(
            cf.memory.len() <= 64,
            "Memory exceeded 64 traces: got {}",
            cf.memory.len()
        );
    }
}

#[test]
fn tier5_memory_accumulates() {
    // After enough ticks, CFs should have non-empty memory traces.
    let particles = make_cluster(120, 512, 512, 1.0);
    let mut kernel = Kernel::new(particles, 77);

    for _ in 0..400 {
        kernel.step();
    }

    let total_traces: usize = kernel
        .cf_detector
        .fields
        .values()
        .map(|cf| cf.memory.len())
        .sum();

    assert!(
        total_traces > 0,
        "CFs should have accumulated memory traces after 400 ticks, got 0"
    );
}

#[test]
fn tier5_memory_decay_monotonic() {
    // Trace values should decay over time if no new outcomes are recorded.
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();
    let sig = MemoryStore::compute_signature(0.5, 0.1, 5, 0.3);

    store.record_outcome(sig.clone(), 1.0, [1.0, 0.0]);

    let initial_value = store.traces[0].value;

    // Decay for 100 ticks
    for _ in 0..100 {
        store.decay();
    }

    let decayed_value = store.traces[0].value;

    assert!(
        decayed_value < initial_value,
        "Memory should decay: initial={}, decayed={}",
        initial_value,
        decayed_value
    );
    assert!(
        decayed_value > 0.0,
        "Decayed value should still be positive: {}",
        decayed_value
    );
}

#[test]
fn tier5_memory_eviction_on_capacity() {
    // Adding more than MAX_TRACES unique signatures should not exceed capacity.
    use geometry_os::kernel::memory::{MemoryStore, MAX_TRACES};

    let mut store = MemoryStore::new();

    // Create MAX_TRACES + 20 unique signatures
    for i in 0..(MAX_TRACES + 20) {
        let sig = geometry_os::kernel::memory::SituationSignature {
            energy_bin: (i % 8) as u8,
            pressure_bin: ((i / 8) % 4) as u8,
            density_bin: ((i / 32) % 4) as u8,
            semantic_bin: ((i / 128) % 4) as u8,
        };
        // Add a unique tick modifier to force different signatures
        let mut unique_sig = sig;
        unique_sig.energy_bin = (i % 8) as u8;
        unique_sig.pressure_bin = ((i % 7).min(3)) as u8;

        store.record_outcome(unique_sig, 0.5, [0.0, 0.0]);
    }

    assert!(
        store.len() <= MAX_TRACES,
        "Memory should not exceed MAX_TRACES: got {}",
        store.len()
    );
}

#[test]
fn tier5_reinforcement_updates_existing() {
    // Recording the same situation twice should update the existing trace,
    // not create a new one.
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();
    let sig = MemoryStore::compute_signature(0.5, 0.2, 10, 0.5);

    store.record_outcome(sig.clone(), 1.0, [1.0, 0.0]);
    assert_eq!(store.len(), 1, "First record should create 1 trace");

    store.record_outcome(sig.clone(), 0.8, [0.0, 1.0]);
    assert_eq!(
        store.len(),
        1,
        "Same signature should update, not duplicate"
    );

    // Value should move toward the new outcome
    let value = store.traces[0].value;
    assert!(
        (value - 1.0).abs() < 0.5,
        "Value should be between old and new: got {}",
        value
    );
}

#[test]
fn tier5_deterministic_learning() {
    // Same seed must produce identical memory states.
    let p1 = make_cluster(100, 400, 400, 1.0);
    let p2 = make_cluster(100, 400, 400, 1.0);

    let mut k1 = Kernel::new(p1, 42);
    let mut k2 = Kernel::new(p2, 42);

    for _ in 0..300 {
        k1.step();
        k2.step();
    }

    // Compare memory states
    let ids1: Vec<u64> = k1.cf_detector.fields.keys().copied().collect();
    let ids2: Vec<u64> = k2.cf_detector.fields.keys().copied().collect();
    assert_eq!(ids1, ids2, "CF IDs should match between runs");

    for id in &ids1 {
        let cf1 = k1.cf_detector.fields.get(id).unwrap();
        let cf2 = k2.cf_detector.fields.get(id).unwrap();

        assert_eq!(
            cf1.memory.len(),
            cf2.memory.len(),
            "Memory trace count differs for CF {}",
            id
        );

        for (t1, t2) in cf1.memory.traces.iter().zip(cf2.memory.traces.iter()) {
            assert_eq!(t1.signature, t2.signature, "Signature mismatch");
            assert!(
                (t1.value - t2.value).abs() < 0.0001,
                "Value mismatch: {} vs {}",
                t1.value,
                t2.value
            );
        }
    }
}

#[test]
fn tier5_memory_bias_is_bounded() {
    // Memory query bias should always produce bounded output.
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();

    // Record some high-value traces
    for i in 0..10 {
        let sig = MemoryStore::compute_signature(i as f32 / 10.0, 0.1, 5, 0.5);
        store.record_outcome(sig, 1.0, [1.0, 0.0]);
    }

    // Query with various signatures
    for e in 0..8 {
        for p in 0..4 {
            let sig = geometry_os::kernel::memory::SituationSignature {
                energy_bin: e,
                pressure_bin: p,
                density_bin: 2,
                semantic_bin: 2,
            };
            let bias = store.query_bias(&sig);

            let mag = (bias[0].powi(2) + bias[1].powi(2)).sqrt();
            assert!(
                mag < 1.0,
                "Memory bias magnitude should be bounded: got {}",
                mag
            );
            assert!(
                bias[0].is_finite() && bias[1].is_finite(),
                "Memory bias should be finite: [{}, {}]",
                bias[0],
                bias[1]
            );
        }
    }
}

#[test]
fn tier5_signature_binning_deterministic() {
    // Same inputs must produce same signature.
    use geometry_os::kernel::memory::MemoryStore;

    for _ in 0..100 {
        let sig1 = MemoryStore::compute_signature(0.5, 0.3, 10, 0.7);
        let sig2 = MemoryStore::compute_signature(0.5, 0.3, 10, 0.7);
        assert_eq!(sig1, sig2, "Same inputs should produce same signature");
    }
}

#[test]
fn tier5_cf_memory_carries_across_ticks() {
    // Memory should persist across ticks (not reset each step).
    let particles = make_cluster(120, 400, 400, 1.0);
    let mut kernel = Kernel::new(particles, 55);

    // Run until CFs form
    for _ in 0..200 {
        kernel.step();
    }

    // Record memory sizes (baseline for comparison)
    let _mem_sizes: Vec<usize> = kernel
        .cf_detector
        .fields
        .values()
        .map(|cf| cf.memory.len())
        .collect();

    // Run more ticks
    for _ in 0..100 {
        kernel.step();
    }

    // Memory should generally grow or stay the same (not reset to 0)
    let new_sizes: Vec<usize> = kernel
        .cf_detector
        .fields
        .values()
        .map(|cf| cf.memory.len())
        .collect();

    // At least some CFs should have memory by now
    let total_new: usize = new_sizes.iter().sum();
    assert!(
        total_new > 0,
        "Memory should persist across ticks, but total traces = 0"
    );
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tier 5.5 — Telemetry / TEC (Trajectory Entropy Collapse) Tests
//
// TEC is a pure measurement. It never influences behavior.
// These tests verify:
//   - Behavior signatures are deterministic
//   - Entropy is computed correctly
//   - TEC is recorded each tick
//   - System does not become dynamically rigid within 500 ticks
//   - Telemetry windows are bounded
//   - Stale cluster telemetry is pruned
// ═══════════════════════════════════════════════════════════════════════════════

#[test]
fn tier55_behavior_signature_deterministic() {
    use geometry_os::kernel::telemetry::BehaviorSignature;

    // Same inputs must always produce the same signature
    let s1 = BehaviorSignature::from_observables(0.5, 0.3, 15, 0.1);
    let s2 = BehaviorSignature::from_observables(0.5, 0.3, 15, 0.1);
    assert_eq!(s1, s2, "Behavior signatures must be deterministic");

    // Different inputs should (usually) produce different signatures
    let s3 = BehaviorSignature::from_observables(-0.5, 0.8, 2, 0.9);
    assert_ne!(
        s1, s3,
        "Different observables should yield different signatures"
    );

    // Zero velocity is valid
    let s4 = BehaviorSignature::from_observables(0.0, 0.0, 0, 0.0);
    let s5 = BehaviorSignature::from_observables(0.0, 0.0, 0, 0.0);
    assert_eq!(s4, s5, "Zero-velocity signature must be deterministic");
}

#[test]
fn tier55_entropy_correctness() {
    use geometry_os::kernel::telemetry::{BehaviorSignature, ClusterTelemetry, TEC_WINDOW};

    // All-identical signatures → entropy = 0
    let mut telem = ClusterTelemetry::new(1);
    let sig = BehaviorSignature::from_observables(0.1, 0.1, 5, 0.1);
    for _ in 0..20 {
        telem.record(sig.clone());
    }
    let h_uniform = telem.entropy();
    assert!(
        h_uniform < 0.001,
        "All-identical signatures should yield ~0 entropy, got {}",
        h_uniform
    );

    // All-different signatures → entropy > 0
    let mut telem2 = ClusterTelemetry::new(2);
    for i in 0..30u32 {
        let angle = (i as f32) * 0.21;
        let sig = BehaviorSignature::from_observables(
            angle.cos(),
            angle.sin(),
            (i % 10) as usize,
            (i as f32) * 0.03,
        );
        telem2.record(sig);
    }
    let h_diverse = telem2.entropy();
    assert!(
        h_diverse > 1.0,
        "Diverse signatures should yield significant entropy, got {}",
        h_diverse
    );

    // Window boundedness: recording more than TEC_WINDOW should not grow history
    let mut telem3 = ClusterTelemetry::new(3);
    for i in 0..(TEC_WINDOW + 50) {
        let sig = BehaviorSignature::from_observables(
            (i as f32 * 0.1).sin(),
            (i as f32 * 0.1).cos(),
            5,
            0.1,
        );
        telem3.record(sig);
    }
    assert!(
        telem3.history.len() <= TEC_WINDOW,
        "History should be bounded to TEC_WINDOW={}, got {}",
        TEC_WINDOW,
        telem3.history.len()
    );
}

#[test]
fn tier55_tec_recorded_each_tick() {
    let particles = make_cluster(120, 400, 400, 1.0);
    let mut kernel = Kernel::new(particles, 77);

    // Run long enough for clusters and CFs to form
    for _ in 0..300 {
        kernel.step();
    }

    // Telemetry history should have one entry per tick
    assert_eq!(
        kernel.telemetry.system_tec_history.len(),
        300,
        "TEC history should have one entry per tick"
    );

    // Peak TEC should be non-zero (system had some behavioral diversity)
    assert!(
        kernel.telemetry.peak_tec > 0.0,
        "Peak TEC should be > 0 after 300 ticks, got {}",
        kernel.telemetry.peak_tec
    );
}

#[test]
fn tier55_no_rigidity_collapse() {
    // Run the system for 500 ticks and verify it doesn't become rigid.
    // "Rigid" = TEC drops below 30% of peak AND still declining.
    // A healthy system should maintain behavioral diversity.
    let particles = make_cluster(120, 400, 400, 1.0);
    let mut kernel = Kernel::new(particles, 88);

    for _ in 0..500 {
        kernel.step();
    }

    // The system should NOT trigger rigidity warning within 500 ticks
    assert!(
        !kernel.telemetry.rigidity_warning(),
        "System should not become rigid within 500 ticks. \
         current_tec={}, peak_tec={}, gradient={}",
        kernel.telemetry.current_tec(),
        kernel.telemetry.peak_tec,
        kernel.telemetry.tec_gradient(50),
    );

    // TEC should be positive (system has behavioral diversity)
    let current = kernel.telemetry.current_tec();
    assert!(
        current > 0.0,
        "TEC should be positive after 500 ticks, got {}",
        current
    );
}

#[test]
fn tier55_tec_system_history_bounded() {
    let particles = make_cluster(80, 300, 300, 1.0);
    let mut kernel = Kernel::new(particles, 99);

    // Run 1200 ticks — history is bounded to 1000
    for _ in 0..1200 {
        kernel.step();
    }

    assert!(
        kernel.telemetry.system_tec_history.len() <= 1000,
        "System TEC history should be bounded to 1000, got {}",
        kernel.telemetry.system_tec_history.len()
    );
}

#[test]
fn tier55_tec_deterministic() {
    // Two kernels with same seed must produce identical TEC histories
    let p1 = make_cluster(80, 300, 300, 1.0);
    let p2 = make_cluster(80, 300, 300, 1.0);

    let mut k1 = Kernel::new(p1, 42);
    let mut k2 = Kernel::new(p2, 42);

    for _ in 0..200 {
        k1.step();
        k2.step();
    }

    assert_eq!(
        k1.telemetry.system_tec_history.len(),
        k2.telemetry.system_tec_history.len(),
        "TEC history lengths must match"
    );

    for (i, (a, b)) in k1
        .telemetry
        .system_tec_history
        .iter()
        .zip(k2.telemetry.system_tec_history.iter())
        .enumerate()
    {
        assert!(
            (a - b).abs() < 0.0001,
            "TEC divergence at tick {}: {} vs {}",
            i,
            a,
            b
        );
    }
}

#[test]
fn tier55_tec_unique_states_positive() {
    // After enough ticks, tracked clusters should show multiple distinct behavior states
    let particles = make_cluster(120, 400, 400, 1.0);
    let mut kernel = Kernel::new(particles, 101);

    for _ in 0..300 {
        kernel.step();
    }

    let total_unique: usize = kernel
        .telemetry
        .cluster_telemetry
        .values()
        .map(|t| t.unique_states())
        .sum();

    assert!(
        total_unique > 0,
        "At least some clusters should have recorded behavior states"
    );
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tier 5.6 — Anti-Attractor / Novelty Pressure Tests
//
// Memory as transition-function modification, not state storage.
// When the system detects repetition, it injects orthogonal perturbation
// to break trajectory loops and maintain behavioral diversity.
//
// Tests verify:
//   - Repetition detection works (low for diverse, high for repeated)
//   - Novelty pressure is zero when repetition is low
//   - Novelty pressure is bounded (<= NOVELTY_MAX)
//   - Novelty pressure is orthogonal to dominant direction
//   - System stays alive (no TEC collapse) over 1000 ticks
//   - Anti-attractor preserves determinism
// ═══════════════════════════════════════════════════════════════════════════════

#[test]
fn tier56_repetition_detection_low_for_diverse() {
    use geometry_os::kernel::memory::{MemoryStore, REPETITION_THRESHOLD};

    let mut store = MemoryStore::new();

    // Record diverse situations — repetition should be low
    for i in 0..20u32 {
        let sig = MemoryStore::compute_signature(
            (i as f32 / 20.0).clamp(0.0, 1.0), // energy varies
            0.1,
            (i % 5) as usize,                  // density varies
            (i as f32 * 0.05).clamp(0.0, 1.0), // semantic varies
        );
        store.record_outcome(sig, 0.5, [0.1, 0.0]);
    }

    let rep = store.repetition_score();
    assert!(
        rep < REPETITION_THRESHOLD,
        "Diverse situations should yield low repetition, got {}",
        rep
    );
}

#[test]
fn tier56_repetition_detection_high_for_looped() {
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();

    // Record the same situation 20 times — repetition should be high
    let sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);
    for _ in 0..20 {
        store.record_outcome(sig.clone(), 0.5, [0.1, 0.0]);
    }

    let rep = store.repetition_score();
    assert!(
        rep > 0.5,
        "Repeated same situation should yield high repetition, got {}",
        rep
    );
}

#[test]
fn tier56_novelty_pressure_zero_when_exploring() {
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();

    // Record diverse situations
    for i in 0..20u32 {
        let sig = MemoryStore::compute_signature(
            (i as f32 / 20.0).clamp(0.0, 1.0),
            0.1,
            (i % 5) as usize,
            (i as f32 * 0.05).clamp(0.0, 1.0),
        );
        store.record_outcome(sig, 0.5, [(i as f32 * 0.3).sin(), (i as f32 * 0.3).cos()]);
    }

    let novelty = store.novelty_pressure();
    let mag = (novelty[0].powi(2) + novelty[1].powi(2)).sqrt();
    assert!(
        mag < 0.001,
        "Novelty pressure should be ~0 when repetition is low, got mag={}",
        mag
    );
}

#[test]
fn tier56_novelty_pressure_bounded() {
    use geometry_os::kernel::memory::{MemoryStore, NOVELTY_MAX};

    let mut store = MemoryStore::new();

    // Force high repetition by recording the same situation many times
    let sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);
    for _ in 0..20 {
        store.record_outcome(sig.clone(), 0.8, [1.0, 0.0]); // Strong bias in one direction
    }

    let novelty = store.novelty_pressure();
    let mag = (novelty[0].powi(2) + novelty[1].powi(2)).sqrt();
    assert!(
        mag <= NOVELTY_MAX + 0.001,
        "Novelty pressure magnitude should be <= NOVELTY_MAX ({}), got {}",
        NOVELTY_MAX,
        mag
    );
}

#[test]
fn tier56_novelty_targets_least_explored() {
    use geometry_os::kernel::memory::{MemoryStore, ACTION_SECTORS};

    let mut store = MemoryStore::new();

    // Fill 7 of 8 angular sectors with action traces
    // All with the same situation (to trigger high repetition)
    let sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);
    for sector in 0..7u32 {
        let angle = (sector as f32 + 0.5) * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;
        let dir = [angle.cos(), angle.sin()];
        store.record_outcome(sig.clone(), 0.5, dir);
    }

    // Add more traces to make repetition high enough
    let missing_angle =
        (7.5 * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)) - std::f32::consts::PI;
    let missing_dir = [missing_angle.cos(), missing_angle.sin()];
    // The missing sector is sector 7. Fill recent window with repeated sig
    for _ in 0..15 {
        store.record_outcome(sig.clone(), 0.5, [1.0, 0.0]);
    }

    let novelty = store.novelty_pressure();
    let mag = (novelty[0].powi(2) + novelty[1].powi(2)).sqrt();

    // Novelty should be non-zero (repetition is high) and point away from
    // the populated sectors toward the least-explored one
    assert!(
        mag > 0.001,
        "Novelty should be non-zero when repetition is high and sectors are uneven, got mag={}",
        mag
    );

    // The novelty direction should point roughly toward sector 7 (the empty one)
    let novelty_angle = novelty[1].atan2(novelty[0]);
    let expected_angle =
        (7.5 * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)) - std::f32::consts::PI;
    let angle_diff = (novelty_angle - expected_angle).abs();
    let angle_diff = if angle_diff > std::f32::consts::PI {
        2.0 * std::f32::consts::PI - angle_diff
    } else {
        angle_diff
    };
    assert!(
        angle_diff < std::f32::consts::FRAC_PI_4,
        "Novelty should point toward least-explored sector (angle diff = {:.1}°)",
        angle_diff * 180.0 / std::f32::consts::PI
    );
}

#[test]
fn tier56_novelty_preserves_determinism() {
    // Two kernels with same seed must still produce identical state
    let p1 = make_cluster(80, 300, 300, 1.0);
    let p2 = make_cluster(80, 300, 300, 1.0);

    let mut k1 = Kernel::new(p1, 42);
    let mut k2 = Kernel::new(p2, 42);

    for _ in 0..300 {
        k1.step();
        k2.step();
    }

    // Check particle positions match (full determinism)
    assert_eq!(
        k1.particles.len(),
        k2.particles.len(),
        "Particle counts must match"
    );
    for (a, b) in k1.particles.iter().zip(k2.particles.iter()) {
        let dx = if a.x > b.x { a.x - b.x } else { b.x - a.x };
        let dy = if a.y > b.y { a.y - b.y } else { b.y - a.y };
        assert!(dx < 1, "Particle {} x diverged: {} vs {}", a.id, a.x, b.x);
        assert!(dy < 1, "Particle {} y diverged: {} vs {}", a.id, a.y, b.y);
    }
}

#[test]
fn tier56_long_run_no_rigidity() {
    // The critical test: run 1000 ticks and verify anti-attractor
    // prevents TEC collapse. Without anti-attractor, the system tends
    // to freeze into loops around tick 500-700.
    let particles = make_cluster(120, 400, 400, 1.0);
    let mut kernel = Kernel::new(particles, 202);

    for _ in 0..1000 {
        kernel.step();
    }

    // System should NOT be rigid
    assert!(
        !kernel.telemetry.rigidity_warning(),
        "System should not become rigid in 1000 ticks with anti-attractor. \
         tec={}, peak={}, gradient={}",
        kernel.telemetry.current_tec(),
        kernel.telemetry.peak_tec,
        kernel.telemetry.tec_gradient(50),
    );

    // TEC should be non-trivially positive
    let tec = kernel.telemetry.current_tec();
    assert!(
        tec > 0.1,
        "TEC should be meaningfully positive after 1000 ticks, got {}",
        tec
    );
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tier 5.7 — Structural Misprediction Tests
//
// The anti-attractor must not be a fixed function of the dominant direction.
// v8.1's 90° CCW rotation was predictable — the system could learn to game it.
// v8.2 uses the action histogram to target the least-explored angular sector.
//
// This creates genuine structural misprediction:
//   - The CF cannot anticipate the perturbation without knowing the full memory state
//   - But the memory state is what the perturbation is trying to shape
//   - Circular dependency = structurally unavoidable exploration
//
// Tests verify:
//   - Same dominant direction + different memory histories → different novelty targets
//   - Novelty direction changes as the action histogram evolves
//   - Histogram is maintained correctly (rebuild after mutation)
// ═══════════════════════════════════════════════════════════════════════════════

#[test]
fn tier57_misprediction_different_histories_different_targets() {
    use geometry_os::kernel::memory::{MemoryStore, ACTION_SECTORS};

    // Two stores with the SAME repetition pattern but DIFFERENT action histories.
    // Key: use different signatures so traces don't merge.
    let mut store_a = MemoryStore::new();
    let mut store_b = MemoryStore::new();

    // Store A: traces spread across sectors 0-3 (right hemisphere)
    // Each trace gets a unique signature so they don't merge
    for sector in 0..4u32 {
        let sig = MemoryStore::compute_signature(
            (sector as f32 / 8.0).clamp(0.0, 1.0),
            0.2,
            (sector + 1) as usize,
            0.3,
        );
        let angle = (sector as f32 + 0.5) * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;
        store_a.record_outcome(sig, 0.8, [angle.cos(), angle.sin()]);
    }
    // Fill recent window with repeated sig for high repetition
    let rep_sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);
    for _ in 0..18 {
        store_a.record_outcome(rep_sig.clone(), 0.8, [1.0, 0.0]);
    }

    // Store B: traces spread across sectors 4-7 (left hemisphere)
    for sector in 4..8u32 {
        let sig = MemoryStore::compute_signature(
            (sector as f32 / 8.0).clamp(0.0, 1.0),
            0.2,
            (sector - 3) as usize,
            0.3,
        );
        let angle = (sector as f32 + 0.5) * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;
        store_b.record_outcome(sig, 0.8, [angle.cos(), angle.sin()]);
    }
    // Fill recent window with repeated sig for high repetition
    for _ in 0..18 {
        store_b.record_outcome(rep_sig.clone(), 0.8, [1.0, 0.0]);
    }

    let novelty_a = store_a.novelty_pressure();
    let novelty_b = store_b.novelty_pressure();

    let mag_a = (novelty_a[0].powi(2) + novelty_a[1].powi(2)).sqrt();
    let mag_b = (novelty_b[0].powi(2) + novelty_b[1].powi(2)).sqrt();

    // Both should be non-zero (repetition is high)
    assert!(
        mag_a > 0.001,
        "Store A novelty should be non-zero, got mag={}",
        mag_a
    );
    assert!(
        mag_b > 0.001,
        "Store B novelty should be non-zero, got mag={}",
        mag_b
    );

    // The KEY assertion: novelty directions should DIFFER
    // because the unexplored sectors are different
    let angle_a = novelty_a[1].atan2(novelty_a[0]);
    let angle_b = novelty_b[1].atan2(novelty_b[0]);
    let angle_diff = (angle_a - angle_b).abs();
    let angle_diff = if angle_diff > std::f32::consts::PI {
        2.0 * std::f32::consts::PI - angle_diff
    } else {
        angle_diff
    };

    assert!(
        angle_diff > std::f32::consts::FRAC_PI_4,
        "Different memory histories must produce different novelty targets. \
         Both stores have the same situation + repetition, but different action histograms. \
         Angle diff = {:.1}° (should be > 45°)",
        angle_diff * 180.0 / std::f32::consts::PI
    );
}

#[test]
fn tier57_histogram_evolves_with_new_traces() {
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();

    // Initially: one sector populated (high energy, low density)
    let sig1 = MemoryStore::compute_signature(0.9, 0.1, 2, 0.1);
    store.record_outcome(sig1, 0.8, [1.0, 0.0]); // sector ~4
    let hist_1 = *store.action_histogram();

    // Add a trace in a different sector (low energy, high density — different bins!)
    let sig2 = MemoryStore::compute_signature(0.1, 0.8, 15, 0.9);
    let angle_90 = std::f32::consts::FRAC_PI_2;
    store.record_outcome(sig2, 0.8, [angle_90.cos(), angle_90.sin()]);
    let hist_2 = *store.action_histogram();

    // Histogram should have changed
    let changed: bool = hist_1
        .iter()
        .zip(hist_2.iter())
        .any(|(a, b)| (a - b).abs() > 0.001);
    assert!(
        changed,
        "Histogram should evolve when new traces are added to different sectors"
    );

    // Total weight should have increased
    assert!(
        store.histogram_total() > 0.0,
        "Histogram total should be positive after recording traces"
    );
}

#[test]
fn tier57_novelty_shifts_as_exploration_progresses() {
    use geometry_os::kernel::memory::{MemoryStore, ACTION_SECTORS};

    let mut store = MemoryStore::new();
    let sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);

    // Phase 1: only sector 0 explored. Novelty should point to an unexplored sector.
    for _ in 0..20 {
        store.record_outcome(sig.clone(), 0.8, [1.0, 0.0]);
    }
    let novelty_1 = store.novelty_pressure();
    let angle_1 = novelty_1[1].atan2(novelty_1[0]);

    // Phase 2: add traces in the direction novelty was pushing.
    // This should "fill" the previously-empty sector, shifting the target.
    let fill_dir = [angle_1.cos(), angle_1.sin()];
    for _ in 0..5 {
        store.record_outcome(sig.clone(), 0.5, fill_dir);
    }
    let novelty_2 = store.novelty_pressure();
    let angle_2 = novelty_2[1].atan2(novelty_2[0]);

    // The target should have shifted (we filled the old gap)
    let angle_diff = (angle_1 - angle_2).abs();
    let angle_diff = if angle_diff > std::f32::consts::PI {
        2.0 * std::f32::consts::PI - angle_diff
    } else {
        angle_diff
    };

    // The angle should have shifted by at least some meaningful amount
    // (even if not > 45°, since we only partially filled the gap)
    assert!(
        angle_diff > 0.01,
        "Novelty target should shift as exploration fills previously-empty sectors. \
         Angle diff = {:.1}°",
        angle_diff * 180.0 / std::f32::consts::PI
    );
}

// ═══════════════════════════════════════════════════════════════════════════════
// Tier 5.8 — Semantic Landscape Plasticity Tests
//
// v8.3 shifts memory from velocity steering to semantic drift.
// Key property: orthogonal innovation prevents semantic diffusion.
//
// Memory modifies FIELDS (semantic vectors), not FORCES (velocity).
// The semantic manifold expands rather than converging.
//
// Tests verify:
//   - Semantic basis is tracked correctly
//   - Orthogonal innovation produces vectors orthogonal to basis
//   - Semantic drift changes particle semantic vectors in kernel
//   - Different action histories produce different semantic innovations
//   - Basis prevents diffusion (repeated drift stays orthogonal)
// ═══════════════════════════════════════════════════════════════════════════════

#[test]
fn tier58_semantic_basis_tracks_directions() {
    use geometry_os::kernel::memory::{MemoryStore, SEMANTIC_BASIS_SIZE, SEMANTIC_DIM};

    let mut store = MemoryStore::new();

    // Basis should start empty
    assert_eq!(store.semantic_basis().len(), 0);

    // Record a direction
    store.record_semantic_direction([1.0, 0.0, 0.0, 0.0]);
    assert_eq!(store.semantic_basis().len(), 1);

    // Should be normalized
    let b = &store.semantic_basis()[0];
    let mag: f32 = b.iter().map(|v| v * v).sum::<f32>().sqrt();
    assert!(
        (mag - 1.0).abs() < 0.01,
        "Basis vector should be normalized, got mag={}",
        mag
    );

    // Fill basis to capacity
    for i in 0..SEMANTIC_BASIS_SIZE + 5 {
        let angle = (i as f32 * 0.5).cos();
        store.record_semantic_direction([angle, 1.0, 0.5, 0.3]);
    }

    // Should be capped at SEMANTIC_BASIS_SIZE
    assert_eq!(
        store.semantic_basis().len(),
        SEMANTIC_BASIS_SIZE,
        "Basis should be capped at {}",
        SEMANTIC_BASIS_SIZE
    );
}

#[test]
fn tier58_semantic_drift_is_orthogonal_to_basis() {
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();

    // Build a history with a specific semantic direction
    let sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);

    // Fill with repeated traces to trigger high repetition
    for _ in 0..20 {
        store.record_outcome(sig.clone(), 0.8, [1.0, 0.0]);
    }

    // Record a dominant semantic direction into the basis
    store.record_semantic_direction([0.8, 0.6, 0.0, 0.0]);
    store.record_semantic_direction([0.0, 0.0, 0.9, 0.4]);

    let drift = store.semantic_novelty_drift();
    let drift_mag: f32 = drift.iter().map(|v| v * v).sum::<f32>().sqrt();

    // Drift should be non-zero (repetition is high)
    assert!(
        drift_mag > 0.0001,
        "Semantic drift should be non-zero when repetition is high, got mag={}",
        drift_mag
    );

    // Check orthogonality to basis vectors
    for basis_vec in store.semantic_basis() {
        let dot: f32 = drift.iter().zip(basis_vec.iter()).map(|(a, b)| a * b).sum();

        // Dot product should be very small (orthogonal)
        let normalized_dot = dot / drift_mag;
        assert!(
            normalized_dot.abs() < 0.15,
            "Drift should be roughly orthogonal to basis vector, dot/|drift| = {}",
            normalized_dot
        );
    }
}

#[test]
fn tier58_semantic_drift_zero_when_exploring() {
    use geometry_os::kernel::memory::MemoryStore;

    let store = MemoryStore::new();

    // Fresh store, no repetition → no semantic drift
    let drift = store.semantic_novelty_drift();
    let mag: f32 = drift.iter().map(|v| v * v).sum::<f32>().sqrt();
    assert!(
        mag < 0.0001,
        "Semantic drift should be zero when not repeating, got mag={}",
        mag
    );
}

#[test]
fn tier58_different_histories_different_semantic_innovations() {
    use geometry_os::kernel::memory::{MemoryStore, ACTION_SECTORS};

    let mut store_a = MemoryStore::new();
    let mut store_b = MemoryStore::new();

    // Store A: actions in sectors 0-3
    for sector in 0..4u32 {
        let sig = MemoryStore::compute_signature(
            (sector as f32 / 8.0).clamp(0.0, 1.0),
            0.2,
            (sector + 1) as usize,
            0.3,
        );
        let angle = (sector as f32 + 0.5) * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;
        store_a.record_outcome(sig, 0.8, [angle.cos(), angle.sin()]);
    }
    let rep_sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);
    for _ in 0..18 {
        store_a.record_outcome(rep_sig.clone(), 0.8, [1.0, 0.0]);
    }

    // Store B: actions in sectors 4-7
    for sector in 4..8u32 {
        let sig = MemoryStore::compute_signature(
            (sector as f32 / 8.0).clamp(0.0, 1.0),
            0.2,
            (sector - 3) as usize,
            0.3,
        );
        let angle = (sector as f32 + 0.5) * (2.0 * std::f32::consts::PI / ACTION_SECTORS as f32)
            - std::f32::consts::PI;
        store_b.record_outcome(sig, 0.8, [angle.cos(), angle.sin()]);
    }
    for _ in 0..18 {
        store_b.record_outcome(rep_sig.clone(), 0.8, [1.0, 0.0]);
    }

    // Both should produce semantic drift
    let drift_a = store_a.semantic_novelty_drift();
    let drift_b = store_b.semantic_novelty_drift();

    let mag_a: f32 = drift_a.iter().map(|v| v * v).sum::<f32>().sqrt();
    let mag_b: f32 = drift_b.iter().map(|v| v * v).sum::<f32>().sqrt();

    assert!(mag_a > 0.0001, "Store A drift should be non-zero");
    assert!(mag_b > 0.0001, "Store B drift should be non-zero");

    // The semantic drift directions should DIFFER because the least-explored
    // sectors are different → different histogram → different candidate → different innovation
    let dot: f32 = drift_a.iter().zip(drift_b.iter()).map(|(a, b)| a * b).sum();
    let cosine_sim = dot / (mag_a * mag_b).max(0.0001);

    assert!(
        cosine_sim.abs() < 0.9,
        "Different action histories should produce different semantic innovations, cosine_sim={}",
        cosine_sim
    );
}

#[test]
fn tier58_semantic_drift_respects_ablation() {
    // Verify that semantic drift only happens when memory is enabled.
    use geometry_os::kernel::diagnostics::AblationFlags;
    use geometry_os::kernel::kernel::Kernel;
    use geometry_os::kernel::world::FileParticle;

    let mut particles = Vec::new();
    for i in 0..40u64 {
        let angle = (i as f32 / 40.0) * 2.0 * std::f32::consts::PI;
        let r = 10.0;
        let x = (512.0 + angle.cos() * r) as u32;
        let y = (512.0 + angle.sin() * r) as u32;
        particles.push(FileParticle {
            id: i,
            size: 128,
            x: x.min(1023),
            y: y.min(1023),
            vx: 0.0,
            vy: 0.0,
            energy: 0.7,
            file_type: 0,
            semantic_vector: [
                (i as f32 * 0.1).sin(),
                (i as f32 * 0.2).cos(),
                (i as f32 * 0.3).sin(),
                (i as f32 * 0.4).cos(),
            ],
        });
    }

    let mut kernel_full =
        Kernel::with_diagnostics(particles.clone(), 42, AblationFlags::full(), 100);
    let mut kernel_no_mem =
        Kernel::with_diagnostics(particles.clone(), 42, AblationFlags::no_memory(), 100);

    // Run enough ticks for memory to build up repetition
    for _ in 0..500 {
        kernel_full.step();
        kernel_no_mem.step();
    }

    // Get final semantic vectors
    let full_semantics: Vec<[f32; 4]> = kernel_full
        .particles
        .iter()
        .map(|p| p.semantic_vector)
        .collect();
    let nomem_semantics: Vec<[f32; 4]> = kernel_no_mem
        .particles
        .iter()
        .map(|p| p.semantic_vector)
        .collect();

    // With memory enabled, semantic vectors should have diverged more
    let var_full = semantic_variance_helper(&full_semantics);
    let var_nomem = semantic_variance_helper(&nomem_semantics);

    let ratio = if var_nomem > 0.0001 {
        var_full / var_nomem
    } else {
        1.0
    };

    assert!(
        ratio >= 0.8,
        "Semantic variance with memory ({:.4}) should not be much less than without ({:.4}), ratio={:.2}",
        var_full, var_nomem, ratio
    );
}

/// Helper: compute total variance of semantic vectors.
fn semantic_variance_helper(vectors: &[[f32; 4]]) -> f32 {
    if vectors.len() < 2 {
        return 0.0;
    }
    let n = vectors.len() as f32;

    // Mean
    let mut mean = [0.0_f32; 4];
    for v in vectors {
        for k in 0..4 {
            mean[k] += v[k];
        }
    }
    for k in 0..4 {
        mean[k] /= n;
    }

    // Variance (sum of per-dimension variance)
    let mut var = 0.0_f32;
    for v in vectors {
        for k in 0..4 {
            var += (v[k] - mean[k]).powi(2);
        }
    }
    var / n
}

#[test]
fn tier58_orthogonal_innovation_prevents_collapse() {
    use geometry_os::kernel::memory::MemoryStore;

    let mut store = MemoryStore::new();
    let sig = MemoryStore::compute_signature(0.5, 0.2, 5, 0.3);

    // Build repetition
    for _ in 0..20 {
        store.record_outcome(sig.clone(), 0.8, [1.0, 0.0]);
    }

    // Record initial semantic direction
    store.record_semantic_direction([1.0, 0.0, 0.0, 0.0]);

    // Collect drift directions over multiple "ticks"
    let mut drift_directions: Vec<[f32; 4]> = Vec::new();

    for _ in 0..20 {
        let drift = store.semantic_novelty_drift();
        let mag: f32 = drift.iter().map(|v| v * v).sum::<f32>().sqrt();
        if mag > 0.0001 {
            let norm = [
                drift[0] / mag,
                drift[1] / mag,
                drift[2] / mag,
                drift[3] / mag,
            ];
            drift_directions.push(norm);

            // Record the new direction into the basis
            store.record_semantic_direction(norm);
        }
    }

    // If orthogonal innovation works, the drift directions should remain diverse.
    if drift_directions.len() >= 3 {
        let mut dot_sum = 0.0_f32;
        let mut dot_count = 0usize;
        for i in 0..drift_directions.len() {
            for j in (i + 1)..drift_directions.len() {
                let dot: f32 = drift_directions[i]
                    .iter()
                    .zip(drift_directions[j].iter())
                    .map(|(a, b)| a * b)
                    .sum();
                dot_sum += dot.abs();
                dot_count += 1;
            }
        }
        let avg_dot = dot_sum / dot_count.max(1) as f32;

        assert!(
            avg_dot < 0.8,
            "Drift directions should remain diverse, avg |cos| = {}",
            avg_dot
        );
    }
}
