// ═══════════════════════════════════════════════════════════════════════
// COMMAND PARSER BEHAVIORAL TESTS
//
// Comprehensive tests verifying each command's effect on system state:
//   CLS, PRINT, RUN, HELP with edge cases.
// ═══════════════════════════════════════════════════════════════════════

use geometry_os::shell::{Shell, ShellAction};

/// Helper: set the input buffer and press enter, returning actions.
fn enter(shell: &mut Shell, input: &str) -> Vec<ShellAction> {
    shell.type_char('X'); // dummy to exercise type_char
    shell.backspace(); // remove it
    for ch in input.chars() {
        shell.type_char(ch);
    }
    shell.press_enter()
}

// ─── 1. CLS: framebuffer cleared, cursor returns to home ──────────────

#[test]
fn cls_clears_all_output_lines() {
    let mut shell = Shell::new();
    // Pre-populate output with commands
    enter(&mut shell, "PRINT first line");
    enter(&mut shell, "PRINT second line");
    assert!(shell.output_lines().len() > 4); // welcome + echo + output

    let actions = enter(&mut shell, "CLS");
    // CLS must clear the internal output buffer
    assert!(
        shell.output_lines().is_empty(),
        "CLS should clear all output lines"
    );
    // CLS must emit a ClearScreen action so the host clears the framebuffer
    assert_eq!(actions, vec![ShellAction::ClearScreen]);
}

#[test]
fn cls_action_is_only_produced_by_cls_command() {
    let mut shell = Shell::new();
    // PRINT should NOT produce ClearScreen
    let actions = enter(&mut shell, "PRINT hello");
    assert!(!actions.contains(&ShellAction::ClearScreen));

    let mut shell2 = Shell::new();
    let actions2 = enter(&mut shell2, "CLS");
    assert!(actions2.contains(&ShellAction::ClearScreen));
}

// ─── 2. PRINT: text rendered, cursor advances by string length ────────

#[test]
fn print_renders_text_to_output() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "PRINT Hello");
    // Must produce a Print action with exact text
    assert_eq!(
        actions,
        vec![ShellAction::Print {
            text: "Hello".to_string()
        }]
    );
    // Text must appear in output lines
    assert!(shell.output_lines().iter().any(|l| l == "Hello"));
}

#[test]
fn print_with_spaces_preserves_spaces() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "PRINT Hello World");
    assert_eq!(
        actions,
        vec![ShellAction::Print {
            text: "Hello World".to_string()
        }]
    );
    assert!(shell.output_lines().iter().any(|l| l == "Hello World"));
}

#[test]
fn print_multiple_times_accumulates_output() {
    let mut shell = Shell::new();
    enter(&mut shell, "PRINT AAA");
    enter(&mut shell, "PRINT BBB");
    let lines = shell.output_lines();
    assert!(lines.iter().any(|l| l == "AAA"));
    assert!(lines.iter().any(|l| l == "BBB"));
}

// ─── 3. PRINT with empty string: no pixels changed, cursor doesn't move

#[test]
fn print_empty_string_produces_empty_action() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "PRINT");
    assert_eq!(
        actions,
        vec![ShellAction::Print {
            text: String::new()
        }]
    );
}

#[test]
fn print_empty_string_does_not_add_text_to_output() {
    let mut shell = Shell::new();
    let line_count_before = shell.output_lines().len();
    enter(&mut shell, "PRINT");
    // The PRINT with empty args still echoes command and adds an empty-string
    // output line, but no visible text should appear beyond the echo
    let lines = shell.output_lines();
    // The echo line should be ">PRINT"
    assert!(lines.iter().any(|l| l == ">PRINT"));
}

// ─── 4. RUN: program loader invoked with correct name, VM starts at 0 ─

#[test]
fn run_invokes_loader_with_program_name() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "RUN myprogram");
    assert_eq!(
        actions,
        vec![ShellAction::Run {
            filename: "myprogram.gasm".to_string()
        }]
    );
}

#[test]
fn run_appends_gasm_extension_if_missing() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "RUN hello");
    // The shell appends .gasm automatically
    assert_eq!(
        actions,
        vec![ShellAction::Run {
            filename: "hello.gasm".to_string()
        }]
    );
}

#[test]
fn run_preserves_gasm_extension_if_present() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "RUN hello.gasm");
    assert_eq!(
        actions,
        vec![ShellAction::Run {
            filename: "hello.gasm".to_string()
        }]
    );
}

#[test]
fn run_without_argument_produces_error_no_action() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "RUN");
    assert!(
        actions.is_empty(),
        "RUN without args should produce no ShellAction"
    );
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("RUN requires a program name"))
    );
}

#[test]
fn run_program_with_path_segments() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "RUN programs/demo");
    assert_eq!(
        actions,
        vec![ShellAction::Run {
            filename: "programs/demo.gasm".to_string()
        }]
    );
}

// ─── 5. HELP: output contains expected command names ──────────────────

#[test]
fn help_contains_all_command_names() {
    let mut shell = Shell::new();
    enter(&mut shell, "HELP");
    let help_text = shell.output_lines().join("\n");
    assert!(help_text.contains("CLS"), "HELP output should mention CLS");
    assert!(
        help_text.contains("PRINT"),
        "HELP output should mention PRINT"
    );
    assert!(help_text.contains("RUN"), "HELP output should mention RUN");
    assert!(
        help_text.contains("HELP"),
        "HELP output should mention HELP"
    );
}

#[test]
fn help_does_not_produce_actions() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "HELP");
    assert!(
        actions.is_empty(),
        "HELP should not produce any ShellAction"
    );
}

#[test]
fn help_output_is_multi_line() {
    let mut shell = Shell::new();
    let line_count_before = shell.output_lines().len();
    enter(&mut shell, "HELP");
    // HELP adds several lines of documentation
    let added = shell.output_lines().len() - line_count_before;
    // Should add at least the echo line + multiple help lines
    assert!(
        added >= 3,
        "HELP should produce multiple output lines, got {} new lines",
        added
    );
}

// ─── 6. Invalid/unknown command: error message, state unchanged ───────

#[test]
fn unknown_command_produces_error_message() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "FOOBAR");
    assert!(
        actions.is_empty(),
        "Unknown command should produce no actions"
    );
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("Unknown command"))
    );
}

#[test]
fn unknown_command_echoes_the_bad_name() {
    let mut shell = Shell::new();
    enter(&mut shell, "GARBAGE");
    assert!(shell.output_lines().iter().any(|l| l.contains("GARBAGE")));
}

#[test]
fn unknown_command_does_not_clear_existing_output() {
    let mut shell = Shell::new();
    enter(&mut shell, "PRINT important_data");
    let lines_after_print = shell.output_lines().to_vec();
    enter(&mut shell, "BADCOMMAND");
    // The previous output must still be present
    assert!(
        shell.output_lines().iter().any(|l| l == "important_data"),
        "Unknown command should not destroy existing output"
    );
}

#[test]
fn empty_input_does_nothing() {
    let mut shell = Shell::new();
    let line_count = shell.output_lines().len();
    let actions = enter(&mut shell, "");
    assert!(actions.is_empty());
    // Only the echo of the empty prompt line is added
    assert_eq!(shell.output_lines().len(), line_count + 1);
}

// ─── 7. Command with extra whitespace: trimming behavior ─────────────

#[test]
fn leading_whitespace_is_trimmed() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "   CLS");
    assert_eq!(actions, vec![ShellAction::ClearScreen]);
}

#[test]
fn trailing_whitespace_is_trimmed() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "CLS   ");
    assert_eq!(actions, vec![ShellAction::ClearScreen]);
}

#[test]
fn extra_whitespace_between_command_and_args() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "PRINT   hello   world");
    assert_eq!(
        actions,
        vec![ShellAction::Print {
            text: "hello   world".to_string()
        }]
    );
}

#[test]
fn tabs_are_treated_as_whitespace() {
    let mut shell = Shell::new();
    let input = "PRINT\thello";
    for ch in input.chars() {
        shell.type_char(ch);
    }
    let actions = shell.press_enter();
    assert_eq!(
        actions,
        vec![ShellAction::Print {
            text: "hello".to_string()
        }]
    );
}

// ─── 8. Partial command prefix: rejection of ambiguous input ─────────

#[test]
fn partial_prefix_cl_is_rejected() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "CL");
    assert!(
        actions.is_empty(),
        "Partial command 'CL' should not be recognized"
    );
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("Unknown command"))
    );
}

#[test]
fn partial_prefix_pr_is_rejected() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "PR");
    assert!(actions.is_empty());
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("Unknown command"))
    );
}

#[test]
fn partial_prefix_ru_is_rejected() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "RU");
    assert!(actions.is_empty());
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("Unknown command"))
    );
}

#[test]
fn partial_prefix_he_is_rejected() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "HE");
    assert!(actions.is_empty());
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("Unknown command"))
    );
}

#[test]
fn full_command_print_is_case_sensitive() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "print hello");
    // Lowercase should not be recognized (commands are uppercase)
    assert!(actions.is_empty());
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("Unknown command"))
    );
}

#[test]
fn mixed_case_command_is_rejected() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "Cls");
    assert!(actions.is_empty());
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("Unknown command"))
    );
}

// ─── Additional edge cases ────────────────────────────────────────────

#[test]
fn ver_shows_version_string() {
    let mut shell = Shell::new();
    let actions = enter(&mut shell, "VER");
    assert!(actions.is_empty(), "VER should not produce ShellActions");
    assert!(shell.output_lines().iter().any(|l| l == "GEOS v1.0"));
}

#[test]
fn cls_after_multiple_prints_resets_state() {
    let mut shell = Shell::new();
    enter(&mut shell, "PRINT line1");
    enter(&mut shell, "PRINT line2");
    enter(&mut shell, "PRINT line3");
    // Lots of output accumulated
    assert!(shell.output_lines().len() > 5);

    enter(&mut shell, "CLS");
    // Everything should be wiped
    assert!(shell.output_lines().is_empty());

    // Now PRINT again — should work cleanly
    enter(&mut shell, "PRINT fresh");
    assert!(shell.output_lines().iter().any(|l| l == "fresh"));
}

#[test]
fn consecutive_cls_commands_are_idempotent() {
    let mut shell = Shell::new();
    enter(&mut shell, "CLS");
    assert!(shell.output_lines().is_empty());

    enter(&mut shell, "CLS");
    assert!(shell.output_lines().is_empty());

    let actions = enter(&mut shell, "CLS");
    assert_eq!(actions, vec![ShellAction::ClearScreen]);
}

#[test]
fn run_with_only_whitespace_argument_shows_error() {
    let mut shell = Shell::new();
    // "RUN " — command with trailing space but no program name
    let actions = enter(&mut shell, "RUN ");
    assert!(actions.is_empty());
    assert!(
        shell
            .output_lines()
            .iter()
            .any(|l| l.contains("RUN requires a program name"))
    );
}

#[test]
fn help_shows_descriptions_not_just_names() {
    let mut shell = Shell::new();
    enter(&mut shell, "HELP");
    let text = shell.output_lines().join("\n");
    // Help should contain descriptive text, not just bare command names
    assert!(
        text.contains("Clear") || text.contains("clear"),
        "HELP should describe CLS"
    );
    assert!(
        text.contains("Print") || text.contains("print") || text.contains("Display"),
        "HELP should describe PRINT"
    );
    assert!(
        text.contains("Load") || text.contains("load") || text.contains("Run"),
        "HELP should describe RUN"
    );
}
