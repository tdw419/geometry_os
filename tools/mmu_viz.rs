//! MMU Page Table Visualizer for GeOS RISC-V Emulator
//!
//! Reads an MMU event log (JSON) produced during Linux boot and renders
//! a spatial heatmap of the Sv39 page table state.
//!
//! Output modes:
//!   --heatmap   (default) Full 4GB VA space as 1024x1024 pixel grid
//!   --l1-strip  Top-level L1 entries only (1024x1 strip, scaled to 1024x64)
//!
//! Color encoding (heatmap mode):
//!   Black   = unmapped (no walk hit this VA)
//!   Red     = megapage leaf (L1 PTE is a leaf with R/W/X flags)
//!   Blue    = pointer to L2 page table (non-leaf L1 PTE)
//!   Green   = PPN magnitude (brightness = how far into RAM)
//!   Yellow  = fault (PageFault event at this VA)
//!
//! Usage:
//!   cargo run --bin mmu_viz -- mmu_log.json output.png
//!   cargo run --bin mmu_viz -- --l1-strip mmu_log.json output.png

use std::collections::HashMap;
use std::fs::File;
use std::io::{BufReader, BufWriter, Write};

// ---- PTE constants (Sv39) ----
const PTE_V: u32 = 1 << 0;
const PTE_R: u32 = 1 << 1;
const PTE_W: u32 = 1 << 2;
const PTE_X: u32 = 1 << 3;
const PTE_U: u32 = 1 << 4;
const PTE_G: u32 = 1 << 5;
const PTE_A: u32 = 1 << 6;
const PTE_D: u32 = 1 << 7;

#[derive(Debug, serde::Deserialize)]
pub enum AccessType {
    Fetch,
    Load,
    Store,
}

#[derive(Debug, serde::Deserialize)]
#[serde(tag = "type")]
pub enum MmuEvent {
    #[serde(rename = "PageTableWalk")]
    PageTableWalk { va: u32, pa: u64, ptes: Vec<u32> },
    #[serde(rename = "PageFault")]
    PageFault {
        va: u32,
        #[allow(dead_code)]
        access: AccessType,
        #[allow(dead_code)]
        ptes: Vec<u32>,
    },
    #[serde(rename = "SatpWrite")]
    SatpWrite {
        #[allow(dead_code)]
        old: u32,
        #[allow(dead_code)]
        new: u32,
    },
}

fn pte_ppn(pte: u32) -> u32 {
    (pte >> 10) & 0x003F_FFFF
}

fn pte_flags(pte: u32) -> u32 {
    pte & 0xFF
}

fn is_leaf_pte(pte: u32) -> bool {
    (pte & (PTE_R | PTE_W | PTE_X)) != 0
}

fn is_valid_pte(pte: u32) -> bool {
    (pte & PTE_V) != 0
}

// Color type: (R, G, B)
type Rgb = (u8, u8, u8);

const BLACK: Rgb = (0, 0, 0);
const WHITE: Rgb = (255, 255, 255);

/// Classify a PTE into a color.
/// Leaf megapages: warm colors (red/orange) with PPN brightness
/// L2 pointers: cool colors (blue/cyan) with PPN brightness
/// Faults: yellow
fn classify_pte(ptes: &[u32], is_fault: bool) -> Rgb {
    if is_fault {
        return (255, 255, 0); // Yellow for faults
    }

    let l1_pte = match ptes.first() {
        Some(&p) => p,
        None => return BLACK,
    };

    if !is_valid_pte(l1_pte) {
        return (40, 40, 40); // Dark gray = invalid but present in walk
    }

    let ppn = pte_ppn(l1_pte);
    let flags = pte_flags(l1_pte);
    let brightness = ((ppn & 0xFF) as u16).min(255) as u8;
    let has_user = (flags & PTE_U) != 0;
    let has_write = (flags & PTE_W) != 0;
    let has_exec = (flags & PTE_X) != 0;

    // Spread PPN across full brightness range.
    // For Sv39, PPNs range from 0 to ~0x7FFFF (16-bit). Map top 8 bits to brightness.
    let ppn_brightness = ((ppn >> 12) & 0xFF) as u16; // bits 12-19 of PPN
    let ppn_mapped = if ppn_brightness == 0 {
        // Low PPNs -- use bits 4-11 instead
        ((ppn >> 4) & 0xFF) as u8
    } else {
        (ppn_brightness.min(255)) as u8
    };

    if is_leaf_pte(l1_pte) {
        // Megapage leaf -- red/orange dominant (warm colors)
        // Brightness shows where in physical RAM this page maps to
        let r = ppn_mapped.max(60);
        let g = if has_user { 50 } else { 0 } + if has_write { 30 } else { 0 };
        let b = if has_exec { 60 } else { 0 };
        (r, g as u8, b)
    } else {
        // Pointer to L2 page table -- blue/cyan dominant (cool colors)
        let r = if has_user { 30 } else { 0 };
        let g = if ptes.len() > 1 {
            // Has resolved L2 entries -- add green to show depth
            let l2_ppn = pte_ppn(ptes[1]);
            let l2_bright = if l2_ppn > 0xFFF {
                ((l2_ppn >> 12) & 0xFF) as u8
            } else {
                ((l2_ppn >> 4) & 0xFF) as u8
            };
            l2_bright.min(120)
        } else {
            20
        };
        let b = ppn_mapped.max(60);
        (r, g, b)
    }
}

/// Render full 4GB heatmap: X = VPN1 (0..1024), Y = VPN0 (0..1024)
fn render_heatmap(events: &[MmuEvent]) -> Vec<Rgb> {
    let mut grid = vec![BLACK; 1024 * 1024];
    let mut fault_mask = vec![false; 1024 * 1024];

    // Collect faults first
    for event in events {
        if let MmuEvent::PageFault { va, .. } = event {
            let vpn1 = (*va >> 22) as usize;
            let vpn0 = ((*va >> 12) & 0x3FF) as usize;
            if vpn1 < 1024 && vpn0 < 1024 {
                fault_mask[vpn0 * 1024 + vpn1] = true;
            }
        }
    }

    // Paint walks (last write wins)
    for event in events {
        if let MmuEvent::PageTableWalk { va, ptes, .. } = event {
            let vpn1 = (*va >> 22) as usize;
            let vpn0 = ((*va >> 12) & 0x3FF) as usize;
            if vpn1 < 1024 && vpn0 < 1024 {
                let is_fault = fault_mask[vpn0 * 1024 + vpn1];
                grid[vpn0 * 1024 + vpn1] = classify_pte(ptes, is_fault);
            }
        }
    }

    grid
}

/// Render L1-only strip: one pixel per VPN1 entry (1024 wide, 1 tall -> scaled to 64)
fn render_l1_strip(events: &[MmuEvent]) -> Vec<Rgb> {
    // Collect the "most complete" L1 PTE for each VPN1 slot
    let mut best_l1: HashMap<u32, Vec<u32>> = HashMap::new();
    let mut l1_faults: HashMap<u32, bool> = HashMap::new();

    for event in events {
        match event {
            MmuEvent::PageTableWalk { va, ptes, .. } => {
                let vpn1 = *va >> 22;
                // Keep the entry with the most PTEs (deepest walk)
                let current_depth = best_l1.get(&vpn1).map(|p| p.len()).unwrap_or(0);
                if ptes.len() >= current_depth {
                    best_l1.insert(vpn1, ptes.clone());
                }
            },
            MmuEvent::PageFault { va, .. } => {
                l1_faults.insert(*va >> 22, true);
            },
            _ => {},
        }
    }

    // Build 1024-pixel strip
    let mut strip = vec![BLACK; 1024];
    for (vpn1, ptes) in &best_l1 {
        if *vpn1 < 1024 {
            let is_fault = l1_faults.get(vpn1).copied().unwrap_or(false);
            strip[*vpn1 as usize] = classify_pte(ptes, is_fault);
        }
    }

    // Scale to 64 rows tall
    let mut img = Vec::with_capacity(1024 * 64);
    for _ in 0..64 {
        img.extend_from_slice(&strip);
    }
    img
}

/// Render a timeline strip: each row = snapshot at a point in time
/// Shows how page table state evolves during boot
fn render_timeline(events: &[MmuEvent], bucket_size: usize) -> (Vec<Rgb>, usize) {
    // Group events into time buckets
    let walks: Vec<_> = events
        .iter()
        .filter(|e| matches!(e, MmuEvent::PageTableWalk { .. }))
        .collect();

    let n_buckets = (walks.len() + bucket_size - 1) / bucket_size;
    if n_buckets == 0 {
        return (vec![BLACK; 1024], 1);
    }

    // Track unique VPN1 slots per bucket
    let mut rows = Vec::with_capacity(n_buckets * 1024);

    // Accumulate state (each bucket shows cumulative state up to that point)
    let mut accumulated: HashMap<u32, Vec<u32>> = HashMap::new();

    for (i, event) in walks.iter().enumerate() {
        if let MmuEvent::PageTableWalk { va, ptes, .. } = event {
            let vpn1 = *va >> 22;
            let current_depth = accumulated.get(&vpn1).map(|p| p.len()).unwrap_or(0);
            if ptes.len() >= current_depth {
                accumulated.insert(vpn1, ptes.clone());
            }
        }

        // End of bucket -- emit a row
        if (i + 1) % bucket_size == 0 || i == walks.len() - 1 {
            let mut row = vec![BLACK; 1024];
            for (vpn1, ptes) in &accumulated {
                if *vpn1 < 1024 {
                    row[*vpn1 as usize] = classify_pte(ptes, false);
                }
            }
            rows.extend_from_slice(&row);
        }
    }

    let actual_rows = rows.len() / 1024;
    (rows, actual_rows)
}

fn save_ppm(path: &str, data: &[Rgb], w: usize, h: usize) -> std::io::Result<()> {
    let file = File::create(path)?;
    let mut writer = BufWriter::new(file);
    write!(writer, "P6\n{w} {h}\n255\n")?;
    for &(r, g, b) in data {
        writer.write_all(&[r, g, b])?;
    }
    Ok(())
}

fn save_png(path: &str, data: &[Rgb], w: usize, h: usize) -> std::io::Result<()> {
    let file = File::create(path)?;
    let mut encoder = png::Encoder::new(BufWriter::new(file), w as u32, h as u32);
    encoder.set_color(png::ColorType::Rgb);
    encoder.set_depth(png::BitDepth::Eight);
    let mut writer = encoder.write_header()?;
    // Flatten RGB tuples into a single byte stream
    let raw: Vec<u8> = data.iter().flat_map(|&(r, g, b)| [r, g, b]).collect();
    writer.write_image_data(&raw)?;
    Ok(())
}

fn print_legend() {
    eprintln!("Color Legend:");
    eprintln!("  Black     = unmapped (no walk hit this VA)");
    eprintln!("  Dark gray = invalid PTE (V=0)");
    eprintln!("  Red       = megapage leaf (L1 PTE has R/W/X flags)");
    eprintln!("    brightness = PPN magnitude");
    eprintln!("    +green tinge = user-accessible (U flag)");
    eprintln!("    +blue tinge = executable (X flag)");
    eprintln!("  Blue      = pointer to L2 page table");
    eprintln!("    brightness = PPN magnitude");
    eprintln!("  Yellow    = page fault at this VA");
    eprintln!("  Green tinge on blue = has resolved L2 children");
    eprintln!();
}

fn print_stats(events: &[MmuEvent]) {
    let mut n_walks = 0usize;
    let mut n_faults = 0usize;
    let mut n_satp = 0usize;
    let mut unique_vpn1 = HashMap::new();

    for event in events {
        match event {
            MmuEvent::PageTableWalk { va, ptes, .. } => {
                n_walks += 1;
                let vpn1 = *va >> 22;
                let current = unique_vpn1
                    .get(&vpn1)
                    .map(|p: &Vec<u32>| p.len())
                    .unwrap_or(0);
                if ptes.len() >= current {
                    unique_vpn1.insert(vpn1, ptes.clone());
                }
            },
            MmuEvent::PageFault { .. } => n_faults += 1,
            MmuEvent::SatpWrite { .. } => n_satp += 1,
        }
    }

    eprintln!("Event Summary:");
    eprintln!("  PageTableWalk: {n_walks}");
    eprintln!("  PageFault:     {n_faults}");
    eprintln!("  SatpWrite:     {n_satp}");
    eprintln!();

    // Classify L1 entries
    let mut n_leaf = 0;
    let mut n_ptr = 0;
    let mut n_invalid = 0;
    for ptes in unique_vpn1.values() {
        if let Some(&pte) = ptes.first() {
            if !is_valid_pte(pte) {
                n_invalid += 1;
            } else if is_leaf_pte(pte) {
                n_leaf += 1;
            } else {
                n_ptr += 1;
            }
        }
    }

    eprintln!(
        "L1 Page Directory ({} unique VPN1 slots):",
        unique_vpn1.len()
    );
    eprintln!("  Leaf megapages:  {n_leaf}");
    eprintln!("  L2 pointers:    {n_ptr}");
    eprintln!("  Invalid:        {n_invalid}");

    // Show which VPN1 regions are populated
    let vpn1s: Vec<u32> = unique_vpn1.keys().copied().collect();
    if !vpn1s.is_empty() {
        let min_v = *vpn1s.iter().min().unwrap();
        let max_v = *vpn1s.iter().max().unwrap();
        eprintln!(
            "  VPN1 range: {min_v} - {max_v} (0x{:08X} - 0x{:08X})",
            min_v << 22,
            (max_v + 1) << 22
        );

        // Show vmalloc vs kernel split
        let kernel_vpn1: Vec<_> = vpn1s.iter().filter(|&&v| v < 512).copied().collect();
        let vmalloc_vpn1: Vec<_> = vpn1s.iter().filter(|&&v| v >= 512).copied().collect();
        eprintln!(
            "  Kernel VA (VPN1 < 512):  {} entries {}",
            kernel_vpn1.len(),
            if kernel_vpn1.is_empty() {
                String::new()
            } else {
                format!("{:?}", kernel_vpn1)
            }
        );
        eprintln!(
            "  Vmalloc/Device (VPN1 >= 512): {} entries {:?}",
            vmalloc_vpn1.len(),
            vmalloc_vpn1
        );
    }
    eprintln!();
}

fn main() {
    let mut args: Vec<String> = std::env::args().collect();
    args.remove(0); // remove program name

    let mut mode = "heatmap";
    let mut positional = Vec::new();

    for arg in &args {
        if arg == "--heatmap" {
            mode = "heatmap";
        } else if arg == "--l1-strip" {
            mode = "l1-strip";
        } else if arg == "--timeline" {
            mode = "timeline";
        } else {
            positional.push(arg.clone());
        }
    }

    if positional.is_empty() {
        eprintln!("Usage: mmu_viz [MODE] <mmu_log.json> [output.png]");
        eprintln!();
        eprintln!("Modes:");
        eprintln!("  --heatmap   (default) Full 4GB VA space (1024x1024)");
        eprintln!("  --l1-strip  L1 page directory strip (1024x64)");
        eprintln!("  --timeline  Cumulative state evolution over time");
        eprintln!();
        print_legend();
        std::process::exit(1);
    }

    let log_path = &positional[0];
    let out_path = positional.get(1).cloned().unwrap_or_else(|| match mode {
        "l1-strip" => "mmu_l1_strip.png".to_string(),
        "timeline" => "mmu_timeline.png".to_string(),
        _ => "mmu_heatmap.png".to_string(),
    });

    // Detect output format from extension
    let use_png = out_path.ends_with(".png");
    let use_ppm = out_path.ends_with(".ppm");
    if !use_png && !use_ppm {
        eprintln!("Warning: unrecognized extension, defaulting to PNG");
    }

    let file = File::open(log_path).expect("failed to open log file");
    let events: Vec<MmuEvent> =
        serde_json::from_reader(BufReader::new(file)).expect("failed to parse JSON");

    eprintln!("Loaded {} MMU events from {}", events.len(), log_path);
    eprintln!();
    print_stats(&events);
    print_legend();

    let (data, w, h) = match mode {
        "heatmap" => {
            eprintln!("Rendering full heatmap (1024x1024)...");
            let grid = render_heatmap(&events);
            (grid, 1024, 1024)
        },
        "l1-strip" => {
            eprintln!("Rendering L1 strip (1024x64)...");
            let strip = render_l1_strip(&events);
            (strip, 1024, 64)
        },
        "timeline" => {
            let bucket_size = (events.len() / 64).max(1);
            eprintln!("Rendering timeline (bucket_size={bucket_size})...");
            let (data, rows) = render_timeline(&events, bucket_size);
            (data, 1024, rows)
        },
        _ => unreachable!(),
    };

    if use_ppm || !use_png {
        save_ppm(&out_path, &data, w, h).expect("failed to save PPM");
    }
    if use_png {
        save_png(&out_path, &data, w, h).expect("failed to save PNG");
    }

    eprintln!("Saved {}x{} image to {}", w, h, out_path);
}
