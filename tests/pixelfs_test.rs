use geometry_os::pixelfs::PixelFS;

#[test]
fn test_pixelfs_allocation() {
    let mut fs = PixelFS::new();

    fs.create_file("test1.txt", vec![1, 2, 3, 4, 5, 6, 7, 8])
        .unwrap();
    assert_eq!(fs.files.len(), 1);
    let f1 = &fs.files[0];
    assert_eq!(f1.name, "test1.txt");
    assert_eq!(f1.y, 4);

    fs.create_file("test2.txt", vec![10, 20, 30]).unwrap();
    assert_eq!(fs.files.len(), 2);
    let f2 = &fs.files[1];
    assert_eq!(f2.name, "test2.txt");
    assert!(f2.y >= 4);
}

#[test]
fn test_pixelfs_read_file() {
    let mut fs = PixelFS::new();
    let data = b"LDI r1, 42\nHALT".to_vec();
    fs.create_file("hello.asm", data.clone()).unwrap();

    let file = fs.read_file("hello.asm").unwrap();
    assert_eq!(file.name, "hello.asm");
    assert_eq!(file.data, data);
}

#[test]
fn test_pixelfs_read_nonexistent() {
    let fs = PixelFS::new();
    assert!(fs.read_file("nope.txt").is_none());
}

#[test]
fn test_pixelfs_delete_file() {
    let mut fs = PixelFS::new();
    fs.create_file("del.txt", vec![1, 2, 3]).unwrap();
    assert!(fs.read_file("del.txt").is_some());

    fs.delete_file("del.txt").unwrap();
    assert!(fs.read_file("del.txt").is_none());
}

#[test]
fn test_pixelfs_list_files() {
    let mut fs = PixelFS::new();
    fs.create_file("a.txt", vec![1]).unwrap();
    fs.create_file("b.txt", vec![2]).unwrap();
    fs.create_file("c.txt", vec![3]).unwrap();

    let files = fs.list_files();
    assert_eq!(files.len(), 3);
}

#[test]
fn test_pixelfs_serialization() {
    let mut fs = PixelFS::new();
    fs.create_file("hello.asm", b"LDI r1, 42\nHALT".to_vec())
        .unwrap();

    let seeds = fs.serialize_to_seeds(0).unwrap();
    assert_eq!(seeds.len(), 65536);
    assert!((seeds[0] >> 31) & 1 == 1);
    assert!((seeds[0] >> 28) & 0x7 == 4);
}

#[test]
fn test_pixelfs_roundtrip_single() {
    let mut fs = PixelFS::new();
    let data = b"LDI r1, 42\nHALT\nFILL r0, 255\n".to_vec();
    fs.create_file("hello.asm", data.clone()).unwrap();

    let seeds = fs.serialize_to_seeds(0).unwrap();
    let fs2 = PixelFS::deserialize_from_seeds(&seeds).unwrap();

    let file = fs2.read_file("hello.asm").unwrap();
    assert_eq!(file.data, data);
}

#[test]
fn test_pixelfs_roundtrip_multi() {
    let mut fs = PixelFS::new();
    let d1 = b"print('hello')".to_vec();
    let d2 = vec![0xDE, 0xAD, 0xBE, 0xEF, 0xCA, 0xFE];
    let d3 = b"FILL r0, 42\nHALT".to_vec();

    fs.create_file("script.py", d1.clone()).unwrap();
    fs.create_file("binary.bin", d2.clone()).unwrap();
    fs.create_file("prog.asm", d3.clone()).unwrap();

    let seeds = fs.serialize_to_seeds(0).unwrap();
    let fs2 = PixelFS::deserialize_from_seeds(&seeds).unwrap();

    assert_eq!(fs2.list_files().len(), 3);
    assert_eq!(fs2.read_file("script.py").unwrap().data, d1);
    assert_eq!(fs2.read_file("binary.bin").unwrap().data, d2);
    assert_eq!(fs2.read_file("prog.asm").unwrap().data, d3);
}

#[test]
fn test_pixelfs_roundtrip_long_name() {
    let mut fs = PixelFS::new();
    let data = vec![1, 2, 3, 4, 5];
    fs.create_file(
        "a_very_long_filename_that_exceeds_four_chars.txt",
        data.clone(),
    )
    .unwrap();

    let seeds = fs.serialize_to_seeds(0).unwrap();
    let fs2 = PixelFS::deserialize_from_seeds(&seeds).unwrap();

    let file = fs2
        .read_file("a_very_long_filename_that_exceeds_four_chars.txt")
        .unwrap();
    assert_eq!(file.data, data);
}

#[test]
fn test_pixelfs_delete_and_reuse() {
    let mut fs = PixelFS::new();
    fs.create_file("temp.txt", vec![1, 2, 3, 4, 5, 6, 7, 8])
        .unwrap();
    let f1 = fs.read_file("temp.txt").unwrap();
    let (x1, y1) = (f1.x, f1.y);

    fs.delete_file("temp.txt").unwrap();
    fs.create_file("new.txt", vec![10, 20, 30]).unwrap();

    let f2 = fs.read_file("new.txt").unwrap();
    assert_eq!(f2.x, x1);
    assert_eq!(f2.y, y1);
}

#[test]
fn test_pixelfs_capacity() {
    let mut fs = PixelFS::new();
    let mut count = 0;
    for i in 0..10000 {
        let name = format!("f{}", i);
        match fs.create_file(&name, vec![i as u8; 8]) {
            Ok(()) => count += 1,
            Err(_) => break,
        }
    }
    assert!(count > 100, "Expected at least 100 files, got {}", count);
}

// ── Allocation Bitmap Renderer Tests ──────────────────────────────

#[test]
fn test_render_empty_grid() {
    let fs = PixelFS::new();
    let fb = fs.render_allocation_map(None);

    assert_eq!(fb.len(), 65536, "Framebuffer must be 256x256");

    // First 1024 pixels (rows 0-3) should be red (reserved)
    for i in 0..1024 {
        assert_eq!(fb[i], 0x00FF0000, "Pixel {} should be reserved (red)", i);
    }

    // Everything else should be black (free)
    for i in 1024..65536 {
        assert_eq!(fb[i], 0x00000000, "Pixel {} should be free (black)", i);
    }
}

#[test]
fn test_render_with_single_file() {
    let mut fs = PixelFS::new();
    // 8 bytes = 2 data pixels + 1 boot pixel = 3 pixels, width=3 height=1
    fs.create_file("test.txt", vec![1, 2, 3, 4, 5, 6, 7, 8])
        .unwrap();

    let fb = fs.render_allocation_map(None);

    // File should be at y=4 (first free row after reserved), x=0
    // Pixels 1024..1027 should be white (allocated)
    let file_start = 4 * 256; // row 4, col 0 = index 1024
    for i in file_start..file_start + 3 {
        assert_eq!(fb[i], 0x00FFFFFF, "Pixel {} should be allocated (white)", i);
    }

    // Pixel just after should be black
    assert_eq!(
        fb[file_start + 3],
        0x00000000,
        "Pixel after file should be free"
    );
}

#[test]
fn test_render_after_delete_shows_hole() {
    let mut fs = PixelFS::new();
    fs.create_file("temp.txt", vec![1, 2, 3, 4, 5, 6, 7, 8])
        .unwrap();

    // Record where the file was
    let file = fs.read_file("temp.txt").unwrap();
    let file_start = (file.y as usize) * 256 + (file.x as usize);
    let file_end = file_start + (file.width as usize) * (file.height as usize);

    // Confirm it's white before delete
    let fb_before = fs.render_allocation_map(None);
    assert_eq!(fb_before[file_start], 0x00FFFFFF);

    // Delete
    fs.delete_file("temp.txt").unwrap();

    // Now those pixels should be black (hole)
    let fb_after = fs.render_allocation_map(None);
    for i in file_start..file_end {
        assert_eq!(
            fb_after[i], 0x00000000,
            "Pixel {} should be free after delete",
            i
        );
    }
}

#[test]
fn test_render_multiple_files_show_striping() {
    let mut fs = PixelFS::new();
    fs.create_file("a.txt", vec![1, 2, 3, 4]).unwrap(); // 1 boot + 1 data = 2px
    fs.create_file("b.txt", vec![5, 6, 7, 8, 9, 10]).unwrap(); // 1 boot + 2 data = 3px
    fs.create_file("c.txt", vec![11, 12]).unwrap(); // 1 boot + 1 data = 2px

    let fb = fs.render_allocation_map(None);

    // Count white pixels (allocated file data)
    let white_count = fb[1024..].iter().filter(|&&p| p == 0x00FFFFFF).count();
    // 2 + 3 + 2 = 7 white pixels
    assert_eq!(white_count, 7, "Should have 7 allocated pixels total");

    // Verify reserved region untouched
    assert_eq!(fb[0], 0x00FF0000);
    assert_eq!(fb[1023], 0x00FF0000);
}

#[test]
fn test_render_reserved_region_always_red() {
    let mut fs = PixelFS::new();
    // Fill up a bunch of files
    for i in 0..50 {
        let name = format!("file{}", i);
        fs.create_file(&name, vec![i as u8; 16]).unwrap();
    }

    let fb = fs.render_allocation_map(None);

    // Reserved region must always be red regardless of file operations
    for i in 0..1024 {
        assert_eq!(fb[i], 0x00FF0000, "Reserved pixel {} must be red", i);
    }
}

#[test]
fn test_pixelfs_visual_diff() {
    let mut fs = PixelFS::new();

    // Frame 0: Empty
    let _snapshot0 = fs.commit_frame(); // commit_frame returns snapshot of current frame before adding new

    // Frame 1: Add a file
    fs.create_file("v1.txt", vec![1; 16]).unwrap();
    let file = fs.read_file("v1.txt").unwrap();
    let file_start = (file.y as usize) * 256 + (file.x as usize);
    let _snapshot1 = fs.commit_frame();

    // Diff Frame 0 and Frame 1
    let diff = fs.diff_frames(0, 1).unwrap();

    // The reserved region should be unchanged (remains red)
    assert_eq!(diff[0], 0x00FF0000);

    // The file region should be green (0x0000FF00) because it changed from free to allocated
    assert_eq!(diff[file_start], 0x0000FF00);

    // Other free space should be black
    assert_eq!(diff[65535], 0x00000000);
}

#[test]
fn test_pixelfs_snapshot_on_commit() {
    let mut fs = PixelFS::new();
    fs.create_file("snap.txt", vec![0xAA; 4]).unwrap();

    let snapshot = fs.commit_frame();

    // Snapshot should show the allocated file
    let white_pixels = snapshot.iter().filter(|&&p| p == 0x00FFFFFF).count();
    assert_eq!(white_pixels, 2); // 1 boot + 1 data
}

#[test]
fn test_pixelfs_storage_report() {
    let mut fs = PixelFS::new();

    // Empty grid (just reserved)
    let report0 = fs.report();
    assert_eq!(report0.allocated_pixels, 0);
    assert_eq!(report0.density_pct, 0.0);
    assert_eq!(report0.fragmentation_score, 0.0);

    // Add files
    fs.create_file("f1.txt", vec![1; 16]).unwrap(); // 1 boot + 4 data = 5px
    fs.create_file("f2.txt", vec![2; 16]).unwrap(); // 1 boot + 4 data = 5px

    let report1 = fs.report();
    assert_eq!(report1.allocated_pixels, 10);
    assert!(report1.density_pct > 0.0);
    // Files are contiguous strips, so they form 1 continuous allocated region
    assert_eq!(report1.allocation_count, 1);

    // Create a hole by adding and deleting
    fs.create_file("f3.txt", vec![3; 16]).unwrap();
    fs.delete_file("f2.txt").unwrap();
    let report2 = fs.report();
    assert_eq!(report2.allocated_pixels, 10); // f1 (5) + f3 (5)
    assert_eq!(report2.allocation_count, 2); // Gap between f1 and f3
}

#[test]
fn test_pixelfs_undo_redo() {
    let mut fs = PixelFS::new();
    fs.create_file("a.txt", vec![1, 2, 3]).unwrap();
    fs.create_file("b.txt", vec![4, 5, 6]).unwrap();
    assert_eq!(fs.list_files().len(), 2);

    // Delete b
    fs.delete_file("b.txt").unwrap();
    assert_eq!(fs.list_files().len(), 1);

    // Undo: b should be back
    assert!(fs.undo());
    assert_eq!(fs.list_files().len(), 2);
    assert_eq!(fs.read_file("b.txt").unwrap().data, vec![4, 5, 6]);

    // Redo: b gone again
    assert!(fs.redo());
    assert_eq!(fs.list_files().len(), 1);

    // Undo stack empty
    assert!(!fs.redo());

    // Undo again (restores b again)
    assert!(fs.undo());
    assert_eq!(fs.list_files().len(), 2);

    // New mutation clears redo stack
    fs.create_file("c.txt", vec![7, 8]).unwrap();
    fs.delete_file("c.txt").unwrap();
    assert!(fs.undo()); // undo delete of c -> back to 3 files
    assert_eq!(fs.list_files().len(), 3);
    assert!(fs.redo()); // redo: delete c again
    assert_eq!(fs.list_files().len(), 2);
}

#[test]
fn test_pixelfs_defrag_compacts_files() {
    let mut fs = PixelFS::new();

    // Create files with deliberate gaps
    fs.create_file("a.txt", vec![1; 8]).unwrap(); // 3px: boot(1) + data(2)
    fs.create_file("b.txt", vec![2; 16]).unwrap(); // 5px: boot(1) + data(4)
    fs.create_file("c.txt", vec![3; 4]).unwrap(); // 2px: boot(1) + data(1)

    // Delete middle file to create a gap
    fs.delete_file("b.txt").unwrap();

    // Verify fragmentation exists
    let report_before = fs.report();
    assert_eq!(report_before.allocated_pixels, 5); // a(3) + c(2)
    assert_eq!(report_before.allocation_count, 2); // Gap between a and c

    // Defrag
    let (moved, free_px) = fs.defrag();
    assert!(moved >= 1, "At least one file should have moved");
    assert!(free_px > 0, "Should have free pixels after compaction");

    // After defrag, files should be contiguous
    let report_after = fs.report();
    assert_eq!(report_after.allocated_pixels, 5); // Same data, just moved
    assert_eq!(report_after.allocation_count, 1); // No gap now

    // Verify file data survived the move
    let a = fs.read_file("a.txt").unwrap();
    assert_eq!(a.data, vec![1; 8]);
    let c = fs.read_file("c.txt").unwrap();
    assert_eq!(c.data, vec![3; 4]);
}

#[test]
fn test_pixelfs_png_persistence() {
    let mut fs = PixelFS::new();
    let data = b"PERSISTENCE TEST".to_vec();
    fs.create_file("test.bin", data.clone()).unwrap();

    let path = "/tmp/geos_persist_test.rts.png";
    fs.save_to_png(0, path).unwrap();

    // Load back
    let fs2 = PixelFS::load_from_png(path).unwrap();
    assert_eq!(fs2.list_files().len(), 1);
    let f = fs2.read_file("test.bin").unwrap();
    assert_eq!(f.data, data);
    assert_eq!(f.x, 0);
    assert_eq!(f.y, 4);

    // Cleanup
    let _ = std::fs::remove_file(path);
}

#[test]
fn test_pixelfs_defrag_empty() {
    let mut fs = PixelFS::new();
    let (moved, free_px) = fs.defrag();
    assert_eq!(moved, 0);
    assert_eq!(free_px, (256 - 4) * 256); // All free except reserved rows
}

// ── Pixel Encoding/Decoding Tests (pack_name/unpack_name) ─────────

#[test]
fn test_pack_unpack_short_name() {
    use geometry_os::pixelfs::pack_name;

    let name = "foo";
    let seeds = pack_name(name);
    assert_eq!(seeds.len(), 1, "Short name should pack into 1 seed");

    // First 8 bits contain length in upper byte, then 3 chars
    assert!((seeds[0] >> 24) & 0xFF == 3);
    assert_eq!(seeds[0] & 0xFF, 'f' as u32);
    assert_eq!((seeds[0] >> 8) & 0xFF, 'o' as u32);
    assert_eq!((seeds[0] >> 16) & 0xFF, 'o' as u32);
}

#[test]
fn test_pack_unpack_4_char_name() {
    use geometry_os::pixelfs::{pack_name, unpack_name};

    let name = "test";
    let seeds = pack_name(name);
    assert_eq!(
        seeds.len(),
        2,
        "4 chars need 2 seeds (first has 3 + length, second has 1)"
    );

    let unpacked = unpack_name(&seeds);
    assert_eq!(unpacked, name);
}

#[test]
fn test_pack_unpack_long_name() {
    use geometry_os::pixelfs::{pack_name, unpack_name};

    let name = "very_long_filename.txt";
    let seeds = pack_name(name);
    let unpacked = unpack_name(&seeds);
    assert_eq!(unpacked, name);
}

#[test]
fn test_pack_unpack_unicode_escaped() {
    use geometry_os::pixelfs::{pack_name, unpack_name};

    // Test UTF-8 bytes get packed/unpacked correctly
    let name = "hello_world.asm";
    let seeds = pack_name(name);
    let unpacked = unpack_name(&seeds);
    assert_eq!(unpacked, name);
}

#[test]
fn test_unpack_empty_seeds() {
    use geometry_os::pixelfs::unpack_name;

    let result = unpack_name(&[]);
    assert_eq!(result, "");
}

#[test]
fn test_unpack_zero_length() {
    use geometry_os::pixelfs::unpack_name;

    // Seed with length=0 in upper byte
    let seeds = vec![0u32];
    let result = unpack_name(&seeds);
    assert_eq!(result, "");
}

#[test]
fn test_pack_boundary_cases() {
    use geometry_os::pixelfs::{pack_name, unpack_name};

    // 3 chars exactly
    let name3 = "abc";
    let seeds3 = pack_name(name3);
    assert_eq!(seeds3.len(), 1);
    assert_eq!(unpack_name(&seeds3), name3);

    // 7 chars (3 in first seed + 4 in second)
    let name7 = "abcdefg";
    let seeds7 = pack_name(name7);
    assert_eq!(seeds7.len(), 2);
    assert_eq!(unpack_name(&seeds7), name7);

    // 8 chars (3 + 4 + 1)
    let name8 = "abcdefgh";
    let seeds8 = pack_name(name8);
    assert_eq!(seeds8.len(), 3);
    assert_eq!(unpack_name(&seeds8), name8);
}

// ── Spatial Storage Layout Tests ─────────────────────────────────

#[test]
fn test_pixel_grid_new_reserves_first_4_rows() {
    use geometry_os::pixelfs::PixelGrid;

    let grid = PixelGrid::new();

    // First 1024 pixels (rows 0-3) should be reserved
    for i in 0..1024 {
        assert!(grid.allocation_map[i], "Pixel {} should be reserved", i);
    }

    // Rest should be free
    for i in 1024..65536 {
        assert!(!grid.allocation_map[i], "Pixel {} should be free", i);
    }
}

#[test]
fn test_pixel_grid_allocate_marks_correct_region() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();
    grid.allocate(0, 4, 5, 3);

    // Check that the 5x3 region starting at (0,4) is marked
    for y in 4..7 {
        for x in 0..5 {
            let idx = (y * 256 + x) as usize;
            assert!(
                grid.allocation_map[idx],
                "Pixel ({},{}) should be allocated",
                x, y
            );
        }
    }

    // Check that areas outside are still free
    assert!(!grid.allocation_map[(4 * 256 + 5) as usize]); // Just to the right
                                                           // Note: y=3 is in reserved region, so we skip checking "just above"
}

#[test]
fn test_pixel_grid_deallocate_frees_region() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();
    grid.allocate(10, 20, 5, 5);

    // Verify allocated
    assert!(grid.allocation_map[(20 * 256 + 10) as usize]);

    // Deallocate
    grid.deallocate(10, 20, 5, 5);

    // Verify freed
    for y in 20..25 {
        for x in 10..15 {
            let idx = (y * 256 + x) as usize;
            assert!(
                !grid.allocation_map[idx],
                "Pixel ({},{}) should be free after deallocate",
                x, y
            );
        }
    }
}

#[test]
fn test_pixel_grid_find_region_first_available() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();

    // Find a 10x10 region - should start at (0, 4) since rows 0-3 are reserved
    let result = grid.find_region(10, 10);
    assert_eq!(result, Some((0, 4)));

    // After allocating, find next available
    grid.allocate(0, 4, 10, 10);
    let result2 = grid.find_region(10, 10);
    // Next should be to the right at (10, 4)
    assert_eq!(result2, Some((10, 4)));
}

#[test]
fn test_pixel_grid_find_region_none_when_full() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();

    // Fill entire grid (except reserved region with huge blocks)
    let result = grid.find_region(255, 252);
    assert_eq!(
        result, None,
        "Should not find space for region that won't fit"
    );
}

#[test]
fn test_pixel_grid_find_region_wraps_to_next_row() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();

    // Allocate near end of row - leaves space at x=250..255 (only 6 pixels)
    grid.allocate(0, 4, 50, 1);
    grid.allocate(50, 4, 50, 1);
    grid.allocate(100, 4, 50, 1);
    grid.allocate(150, 4, 50, 1);
    grid.allocate(200, 4, 50, 1);

    // Find a 100px wide region - won't fit on row 4 (only 6px left), should go to row 5
    let result = grid.find_region(100, 1);
    assert_eq!(result, Some((0, 5)), "Should wrap to next row");
}

#[test]
fn test_pixel_grid_storage_report_metrics() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();

    let report = grid.report();
    assert_eq!(report.total_pixels, 65536);
    assert_eq!(report.reserved_pixels, 1024);
    assert_eq!(report.allocated_pixels, 0);
    assert_eq!(report.density_pct, 0.0);
    assert_eq!(report.fragmentation_score, 0.0);
    assert_eq!(report.largest_free_block, 64512);

    // Allocate a region
    grid.allocate(0, 4, 100, 10);
    let report2 = grid.report();
    assert_eq!(report2.allocated_pixels, 1000);
    assert!(report2.density_pct > 0.0);
    assert_eq!(report2.sediment_depth, 13); // 4 + 10 - 1
}

#[test]
fn test_pixel_grid_fragmentation_detection() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();

    // Create fragmented allocation pattern: A, B, delete B, C
    grid.allocate(0, 4, 50, 5);
    grid.allocate(50, 4, 50, 5);
    grid.deallocate(50, 4, 50, 5);
    grid.allocate(100, 4, 50, 5);

    let report = grid.report();
    // allocation_count counts per-row transitions. With a gap between two 50x5 blocks
    // on each of 5 rows, we get 10 allocation regions (2 per row).
    // fragmentation_score is gaps / allocation_count, should be > 0 due to the gap.
    assert!(
        report.allocation_count >= 2,
        "Should detect multiple allocation regions"
    );
    assert!(
        report.fragmentation_score > 0.0,
        "Should have non-zero fragmentation"
    );
}

#[test]
fn test_pixel_grid_largest_free_block() {
    use geometry_os::pixelfs::PixelGrid;

    let mut grid = PixelGrid::new();

    // Leave a big gap at the end of row 4
    grid.allocate(0, 4, 50, 1);
    grid.allocate(100, 4, 50, 1);

    let report = grid.report();
    // The gap is 50 pixels (from 50 to 100) but row 5 onwards has 256*251 = 64256 free
    // Largest should be row 5+ region
    assert!(
        report.largest_free_block > 64000,
        "Should find large contiguous block"
    );
}

// ── PixelFS Move File Tests ───────────────────────────────────────

#[test]
fn test_pixelfs_move_file_success() {
    let mut fs = PixelFS::new();
    fs.create_file("move_test.txt", vec![1, 2, 3, 4]).unwrap();

    let old_loc = {
        let f = fs.read_file("move_test.txt").unwrap();
        (f.x, f.y)
    };

    // Move to new location
    fs.move_file("move_test.txt", 10, 20).unwrap();

    let new_loc = {
        let f = fs.read_file("move_test.txt").unwrap();
        (f.x, f.y)
    };

    assert_eq!(new_loc, (10, 20));
    assert_ne!(old_loc, new_loc);
}

#[test]
fn test_pixelfs_move_file_collision() {
    let mut fs = PixelFS::new();
    fs.create_file("file1.txt", vec![1, 2, 3, 4]).unwrap();
    fs.create_file("file2.txt", vec![5, 6, 7, 8]).unwrap();

    let f2 = fs.read_file("file2.txt").unwrap();
    let target = (f2.x, f2.y);

    // Try to move file1 onto file2
    let result = fs.move_file("file1.txt", target.0, target.1);
    assert!(result.is_err(), "Should fail due to collision");

    // File1 should still be at its original location
    let f1 = fs.read_file("file1.txt").unwrap();
    assert!(f1.x != target.0 || f1.y != target.1);
}

#[test]
fn test_pixelfs_move_file_boundary() {
    let mut fs = PixelFS::new();
    fs.create_file("boundary.txt", vec![1, 2, 3, 4]).unwrap();

    let (orig_x, orig_y) = {
        let f = fs.read_file("boundary.txt").unwrap();
        (f.x, f.y)
    };

    // Try to move beyond grid boundaries
    let result = fs.move_file("boundary.txt", 255, 255);
    assert!(
        result.is_err(),
        "Should fail when file would extend beyond grid"
    );

    // Verify file hasn't moved
    let file_after = fs.read_file("boundary.txt").unwrap();
    assert_eq!(file_after.x, orig_x);
    assert_eq!(file_after.y, orig_y);
}

#[test]
fn test_pixelfs_move_file_nonexistent() {
    let mut fs = PixelFS::new();
    let result = fs.move_file("nonexistent.txt", 10, 20);
    assert!(result.is_err());
}

#[test]
fn test_pixelfs_move_file_undo() {
    let mut fs = PixelFS::new();
    fs.create_file("move_undo.txt", vec![1, 2, 3]).unwrap();

    let old_pos = {
        let f = fs.read_file("move_undo.txt").unwrap();
        (f.x, f.y)
    };

    fs.move_file("move_undo.txt", 50, 60).unwrap();
    assert!(fs.undo());

    let restored_pos = {
        let f = fs.read_file("move_undo.txt").unwrap();
        (f.x, f.y)
    };

    assert_eq!(
        restored_pos, old_pos,
        "Undo should restore original position"
    );
}

// ── PixelFS Get File At Coordinate Tests ──────────────────────────

#[test]
fn test_get_file_at_inside_region() {
    let mut fs = PixelFS::new();
    fs.create_file("at_test.txt", vec![1, 2, 3, 4]).unwrap();

    let file = fs.read_file("at_test.txt").unwrap();
    let inside_x = file.x + file.width / 2;
    let inside_y = file.y + file.height / 2;

    let found = fs.get_file_at(inside_x, inside_y);
    assert!(found.is_some());
    assert_eq!(found.unwrap().name, "at_test.txt");
}

#[test]
fn test_get_file_at_outside_region() {
    let mut fs = PixelFS::new();
    fs.create_file("at_test.txt", vec![1, 2, 3, 4]).unwrap();

    let file = fs.read_file("at_test.txt").unwrap();
    let outside_x = file.x + file.width + 5;
    let outside_y = file.y;

    let found = fs.get_file_at(outside_x, outside_y);
    assert!(found.is_none());
}

#[test]
fn test_get_file_at_reserved_region() {
    let fs = PixelFS::new();

    // Query reserved region (rows 0-3)
    let found = fs.get_file_at(0, 0);
    assert!(found.is_none(), "Should not find file in reserved region");
}

#[test]
fn test_get_file_at_exact_corner() {
    let mut fs = PixelFS::new();
    fs.create_file("corner.txt", vec![1, 2, 3, 4]).unwrap();

    let file = fs.read_file("corner.txt").unwrap();

    // Top-left corner (inclusive)
    let found1 = fs.get_file_at(file.x, file.y);
    assert!(found1.is_some());

    // Bottom-right corner (exclusive)
    let found2 = fs.get_file_at(file.x + file.width, file.y + file.height);
    assert!(found2.is_none(), "Bottom-right corner should be outside");
}

// ── PixelFS Storage Report Integration Tests ─────────────────────

#[test]
fn test_storage_report_summarize() {
    use geometry_os::pixelfs::PixelFS;

    let mut fs = PixelFS::new();
    let report = fs.report();
    let summary = report.summarize();

    assert!(summary.contains("0.0% full"));
    assert!(summary.contains("Health: Excellent"));
}

#[test]
fn test_storage_report_health_classification() {
    use geometry_os::pixelfs::PixelFS;
    let mut fs = PixelFS::new();

    // Create some fragmentation
    for i in 0..10 {
        fs.create_file(&format!("file{}", i), vec![i as u8; 8])
            .unwrap();
        if i % 2 == 0 && i > 0 {
            fs.delete_file(&format!("file{}", i)).unwrap();
        }
    }

    let report = fs.report();
    let summary = report.summarize();

    // Check that summary contains health info
    assert!(summary.contains("Health:"));
}

// ── PixelFS Serialization Edge Cases ──────────────────────────────

#[test]
fn test_serialize_invalid_frame() {
    let fs = PixelFS::new();
    let result = fs.serialize_to_seeds(999);
    assert!(result.is_err());
}

#[test]
fn test_deserialize_empty_seeds() {
    let result = PixelFS::deserialize_from_seeds(&[]);
    assert!(result.is_err());
}

#[test]
fn test_serialize_deserialize_empty_fs() {
    let fs = PixelFS::new();
    let seeds = fs.serialize_to_seeds(0).unwrap();

    assert_eq!(seeds.len(), 65536);

    let fs2 = PixelFS::deserialize_from_seeds(&seeds).unwrap();
    assert_eq!(fs2.list_files().len(), 0);
}

#[test]
fn test_diff_frames_invalid_indices() {
    let fs = PixelFS::new();

    let result1 = fs.diff_frames(0, 1);
    assert!(result1.is_err(), "Should fail for out-of-bounds frame 1");

    let result2 = fs.diff_frames(999, 0);
    assert!(result2.is_err(), "Should fail for out-of-bounds frame 999");
}

#[test]
fn test_commit_frame_creates_new_grid() {
    let mut fs = PixelFS::new();

    assert_eq!(fs.grids.len(), 1);

    let snapshot = fs.commit_frame();

    assert_eq!(fs.grids.len(), 2, "Should have added a new grid");
    assert_eq!(snapshot.len(), 65536);

    // New grid should have reserved region but no files
    let report = fs.report();
    assert_eq!(report.allocated_pixels, 0);
}

#[test]
fn test_file_data_preserved_after_move() {
    let mut fs = PixelFS::new();
    let data = vec![0xDE, 0xAD, 0xBE, 0xEF, 0xCA, 0xFE, 0xBA, 0xBE];
    fs.create_file("preserve.txt", data.clone()).unwrap();

    fs.move_file("preserve.txt", 50, 50).unwrap();

    let file = fs.read_file("preserve.txt").unwrap();
    assert_eq!(file.data, data, "Data should survive move");
}

#[test]
fn test_multiple_moves_and_undo_redo_chain() {
    let mut fs = PixelFS::new();
    fs.create_file("chain.txt", vec![1, 2, 3]).unwrap();

    let pos0 = {
        let f = fs.read_file("chain.txt").unwrap();
        (f.x, f.y)
    };

    fs.move_file("chain.txt", 10, 10).unwrap();
    fs.move_file("chain.txt", 20, 20).unwrap();
    fs.move_file("chain.txt", 30, 30).unwrap();

    let pos3 = {
        let f = fs.read_file("chain.txt").unwrap();
        (f.x, f.y)
    };

    assert_eq!(pos3, (30, 30));

    // Undo back to original
    assert!(fs.undo()); // undo 30,30
    assert!(fs.undo()); // undo 20,20
    assert!(fs.undo()); // undo 10,10

    let pos_restored = {
        let f = fs.read_file("chain.txt").unwrap();
        (f.x, f.y)
    };

    assert_eq!(pos_restored, pos0);

    // Redo forward
    assert!(fs.redo()); // redo 10,10
    assert!(fs.redo()); // redo 20,20
    assert!(fs.redo()); // redo 30,30

    let pos_redone = {
        let f = fs.read_file("chain.txt").unwrap();
        (f.x, f.y)
    };

    assert_eq!(pos_redone, pos3);
}
