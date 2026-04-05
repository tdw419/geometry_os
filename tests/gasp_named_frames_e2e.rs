/// E2E test: named keyframe labels propagate through the full pipeline.
///
/// Chain: GaspDoc (keyframe.name) -> GaspCompiler::compile() -> .gasm text
///        -> assemble_filmstrip_with_labels() -> (Programs, labels)
///        -> FilmStrip -> SoftwareVm -> execute -> verify pixels & frame jumps.
///
/// This proves that `keyframe.name: "Menu"` in a .gasp document results in:
///   1. `.frame "Menu"` in the compiled .gasm output
///   2. `@Menu` resolving to the correct segment index during assembly
///   3. `FRAME r0` correctly jumping to the named frame at runtime

use pixels_move_pixels::filmstrip;
use pixels_move_pixels::gasm;
use pixels_move_pixels::gasp::{
    Canvas, Draw, GaspDoc, Keyframe, Layer, Timeline,
};
use pixels_move_pixels::gasp_compiler::GaspCompiler;
use pixels_move_pixels::software_vm::SoftwareVm;
use pixels_move_pixels::{SCREEN_BASE, SCREEN_SIZE};

fn read_screen_pixel(svm: &SoftwareVm, x: u32, y: u32) -> u32 {
    assert!(x < SCREEN_SIZE && y < SCREEN_SIZE);
    let addr = SCREEN_BASE + y * SCREEN_SIZE + x;
    svm.peek(addr)
}

/// Build a minimal GaspDoc with 3 named frames:
///   Frame 0 "Menu"    - blue rect at (0,0)
///   Frame 1 (unnamed) - empty (gap frame for tween)
///   Frame 2 "Settings" - red rect at (0,0)
fn build_test_doc() -> GaspDoc {
    GaspDoc {
        name: "frame_label_test".into(),
        version: 1,
        canvas: Canvas {
            width: 64,
            height: 64,
        },
        fps: 0,
        globals: vec![],
        symbols: Default::default(),
        timeline: Timeline {
            layers: vec![Layer {
                name: "bg".into(),
                keyframes: vec![
                    Keyframe {
                        frame: 0,
                        name: Some("Menu".into()),
                        tween: None,
                        draws: vec![Draw::Rect {
                            x: 0,
                            y: 0,
                            w: 4,
                            h: 4,
                            fill: "#0000FFFF".into(), // blue
                        }],
                    },
                    Keyframe {
                        frame: 1,
                        name: None, // unnamed gap frame
                        tween: None,
                        draws: vec![Draw::Rect {
                            x: 0,
                            y: 0,
                            w: 4,
                            h: 4,
                            fill: "#00FF00FF".into(), // green
                        }],
                    },
                    Keyframe {
                        frame: 2,
                        name: Some("Settings".into()),
                        tween: None,
                        draws: vec![Draw::Rect {
                            x: 0,
                            y: 0,
                            w: 4,
                            h: 4,
                            fill: "#FF0000FF".into(), // red
                        }],
                    },
                ],
            }],
            scripts: vec![],
        },
    }
}

#[test]
fn test_named_keyframes_produce_named_frame_labels() {
    let doc = build_test_doc();
    let compiler = GaspCompiler::new(doc);
    let output = compiler.compile().expect("compile should succeed");

    // Verify the compiled .gasm has named frame labels
    assert!(
        output.contains(".frame \"Menu\""),
        "compiled output should contain .frame \"Menu\", got:\n{}",
        output
    );
    assert!(
        output.contains(".frame \"Settings\""),
        "compiled output should contain .frame \"Settings\", got:\n{}",
        output
    );
    // Frame 1 is unnamed, should use numeric label
    assert!(
        output.contains(".frame \"1\""),
        "unnamed frame 1 should use numeric label, got:\n{}",
        output
    );

    // There should be exactly 3 frames separated by ---
    let segments: Vec<&str> = output.split("\n---\n").collect();
    assert_eq!(segments.len(), 3, "should have 3 frame segments");
}

#[test]
fn test_named_frames_assemble_with_labels() {
    let doc = build_test_doc();
    let compiler = GaspCompiler::new(doc);
    let output = compiler.compile().expect("compile should succeed");

    // Assemble as a filmstrip
    let (programs, labels) = gasm::assemble_filmstrip_with_labels(&output)
        .expect("filmstrip assembly should succeed");

    assert_eq!(programs.len(), 3, "should assemble 3 frames");

    // Verify the frame label map
    assert_eq!(
        labels.get("Menu"),
        Some(&0),
        "Menu should resolve to segment 0"
    );
    assert_eq!(
        labels.get("Settings"),
        Some(&2),
        "Settings should resolve to segment 2"
    );
}

#[test]
fn test_named_frame_goto_and_play() {
    // Build a .gasp doc where:
    //   Frame 0 "Menu" draws a blue rect
    //   Frame 2 "Settings" draws a red rect
    // Then assemble a custom .gasm that:
    //   - Starts on frame 0 (Menu), draws blue
    //   - Jumps to frame 2 (Settings) via @Settings label
    //   - Draws red on frame 2
    //
    // We use a hand-crafted .gasm to exercise the @label resolution directly.

    let source = r#".frame "Menu"
LDI r0, 0
LDI r1, 0
LDI r2, 0x0000FFFF
RECTF r0, r1, 0x00040004
; Jump to Settings frame
LDI r0, @Settings
FRAME r0
HALT
---

.frame "Transition"
HALT
---

.frame "Settings"
LDI r0, 0
LDI r1, 0
LDI r2, 0xFF0000FF
RECTF r0, r1, 0x00040004
HALT
"#;

    let (programs, labels) = gasm::assemble_filmstrip_with_labels(source)
        .expect("filmstrip should assemble");

    assert_eq!(programs.len(), 3, "should have 3 frames");
    assert_eq!(labels.get("Menu"), Some(&0));
    assert_eq!(labels.get("Settings"), Some(&2));

    // Build filmstrip and load into VM
    let segments: Vec<Vec<u32>> = programs.iter().map(|p| p.pixels.clone()).collect();
    let strip = filmstrip::filmstrip_from_segments(&segments);

    let base_addr = 5000u32;
    let mut svm = SoftwareVm::new();
    strip.load_into_software_vm(&mut svm, base_addr);
    strip.spawn_filmstrip_vm(&mut svm, 0, base_addr);

    // Execute frame 0 (Menu) -- should draw blue then jump to Settings
    svm.execute_frame();

    // After frame 0, the VM should have jumped to frame 2 (Settings)
    // and executed it within the same timeslice (FRAME doesn't halt).
    let vm0 = svm.vm_state(0);
    eprintln!(
        "After execute_frame 1: halted={} frame_ptr={} pc={} state={}",
        vm0.halted, vm0.attention_mask, vm0.pc, vm0.state
    );

    // The FRAME jump + rect draw + HALT should all complete in one execute_frame call
    // since FRAME keeps the VM running.
    assert_eq!(
        vm0.halted, 1,
        "VM should have halted after Menu -> Settings jump + draw, got halted={}",
        vm0.halted
    );
    assert_eq!(
        vm0.attention_mask, 2,
        "should be on frame 2 (Settings), got frame_ptr={}",
        vm0.attention_mask
    );

    // Verify the red rect was drawn on frame 2
    let pixel = read_screen_pixel(&svm, 0, 0);
    assert_eq!(
        pixel, 0xFF0000FF,
        "pixel (0,0) should be red after Settings frame, got {:08X}",
        pixel
    );
}

#[test]
fn test_gasp_compiled_named_frame_goto() {
    // Full pipeline: GaspDoc -> compile -> assemble -> VM execute
    // Uses a GaspDoc with named keyframes and a frame script that jumps.

    let doc = GaspDoc {
        name: "goto_test".into(),
        version: 1,
        canvas: Canvas {
            width: 64,
            height: 64,
        },
        fps: 0,
        globals: vec![],
        symbols: Default::default(),
        timeline: Timeline {
            layers: vec![Layer {
                name: "bg".into(),
                keyframes: vec![
                    Keyframe {
                        frame: 0,
                        name: Some("Menu".into()),
                        tween: None,
                        draws: vec![Draw::Rect {
                            x: 0,
                            y: 0,
                            w: 4,
                            h: 4,
                            fill: "#0000FFFF".into(),
                        }],
                    },
                    Keyframe {
                        frame: 1,
                        name: None,
                        tween: None,
                        draws: vec![],
                    },
                    Keyframe {
                        frame: 2,
                        name: Some("Settings".into()),
                        tween: None,
                        draws: vec![Draw::Rect {
                            x: 0,
                            y: 0,
                            w: 4,
                            h: 4,
                            fill: "#FF0000FF".into(),
                        }],
                    },
                ],
            }],
            // Frame script on frame 0 that jumps to Settings
            scripts: vec![pixels_move_pixels::gasp::FrameScript {
                frame: 0,
                code: "LDI r0, @Settings\nFRAME r0\n".into(),
            }],
        },
    };

    let compiler = GaspCompiler::new(doc);
    let output = compiler.compile().expect("compile should succeed");

    // Verify named labels in output
    assert!(output.contains(".frame \"Menu\""), "should have Menu label");
    assert!(
        output.contains(".frame \"Settings\""),
        "should have Settings label"
    );
    // The frame script should reference @Settings
    assert!(
        output.contains("@Settings"),
        "frame script should contain @Settings reference"
    );

    // Assemble and run
    let (programs, labels) = gasm::assemble_filmstrip_with_labels(&output)
        .expect("filmstrip should assemble");

    assert_eq!(labels.get("Menu"), Some(&0));
    assert_eq!(labels.get("Settings"), Some(&2));

    let segments: Vec<Vec<u32>> = programs.iter().map(|p| p.pixels.clone()).collect();
    let strip = filmstrip::filmstrip_from_segments(&segments);

    let base_addr = 5000u32;
    let mut svm = SoftwareVm::new();
    strip.load_into_software_vm(&mut svm, base_addr);
    strip.spawn_filmstrip_vm(&mut svm, 0, base_addr);

    // Execute frame 0 (Menu) -- should draw blue then jump to Settings
    svm.execute_frame();

    let vm0 = svm.vm_state(0);
    assert_eq!(
        vm0.attention_mask, 2,
        "should have jumped to frame 2 (Settings) via @Settings label"
    );

    // Execute frame 2 (Settings) -- draws red
    svm.execute_frame();

    // Verify red pixel
    let pixel = read_screen_pixel(&svm, 0, 0);
    assert_eq!(
        pixel, 0xFF0000FF,
        "pixel should be red after Settings frame, got {:08X}",
        pixel
    );

    let vm0 = svm.vm_state(0);
    assert_eq!(vm0.halted, 1, "VM should halt after Settings");
}
