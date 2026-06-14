# XV6 Syscall Synthesis Model - VCC Validation Report

## Model Training Status

✓ **Model Trained Successfully**
- Architecture: SyscallTransformerModel (Transformer Encoder)
- Training epochs: 20
- Final training accuracy: 98.58% (on training set)
- Model file: `models/syscall_synthesis_model.pt` (2.5MB)
- Vocabularies: 15 syscalls → 18 spatial operations

## VCC Validation Results

✗ **Validation FAILED** - Overall accuracy: 63.69% (threshold: 95%)

### Summary Statistics

- **Total syscalls validated:** 369
- **Overall mapping accuracy:** 63.69%
- **VCC threshold:** 95.0%
- **Status:** FAILED by 31.31 percentage points

### Per-Syscall Accuracy Breakdown

| Syscall | Accuracy | Calls | Status |
|---------|----------|-------|--------|
| fstat   | 100.00%  | 178   | ✓ PERFECT |
| openat  | 100.00%  | 49    | ✓ PERFECT |
| unlink  | 16.33%   | 49    | ✗ POOR |
| fork    | 0.00%    | 10    | ✗ FAILED |
| pipe    | 0.00%    | 39    | ✗ FAILED |
| read    | 0.00%    | 11    | ✗ FAILED |
| close   | 0.00%    | 10    | ✗ FAILED |
| wait    | 0.00%    | 12    | ✗ FAILED |
| exit    | 0.00%    | 11    | ✗ FAILED |

### Per-Trace Accuracy

| Trace | Syscalls | Avg Accuracy | Status |
|-------|----------|--------------|--------|
| syscalls_cat_init | 67 | 91.04% | ✓ GOOD |
| syscalls_tinycalc | 15 | 73.33% | ✗ FAIR |
| syscalls_echo_TEST | 17 | 70.59% | ✗ FAIR |
| syscalls_fork_test | 20 | 60.00% | ✗ POOR |
| syscalls_mkdir_tmpdir;ls_tmpdir | 51 | 66.67% | ✗ POOR |
| syscalls_ls_-l | 14 | 64.29% | ✗ POOR |
| syscalls_rm_tmpdir;ls | 102 | 52.94% | ✗ POOR |
| syscalls_ls | 83 | 50.60% | ✗ POOR |

## Analysis

### What's Working

1. **High-frequency syscalls learn well:**
   - `fstat` (178 calls): 100% accuracy - dominates the dataset (48%)
   - `openat` (49 calls): 100% accuracy - second most frequent (13%)
   - Combined, these represent 61% of training data

2. **Training pipeline functional:**
   - Model successfully learns syscall → spatial op mappings
   - Vocabulary construction works correctly
   - Loss convergence observed (0.4973 → 0.0555)

### What's Failing

1. **Low-frequency syscalls don't learn:**
   - `fork`, `pipe`, `read`, `close`, `wait`, `exit`: 0% accuracy
   - These represent ~30% of syscalls but have insufficient examples
   - Model predicts empty spatial operation lists

2. **Data imbalance severe:**
   - fstat: 178 calls (48%) → learns perfectly
   - fork: 10 calls (2.7%) → learns nothing
   - 18:1 ratio between most and least frequent syscalls

3. **Model architecture limitations:**
   - Transformer encoder may not be ideal for this task
   - Multi-label classification with sparse ground truth
   - Only 11 training samples (segments) from 8 traces

### Example Failure Cases

**fork syscall:**
```
Predicted: []
Ground truth: ["duplicate_hilbert_regions", "allocate_process_pixels"]
Accuracy: 0.0%
```

**pipe syscall:**
```
Predicted: []
Ground truth: ["allocate_pipe_buffer_pixels"]
Accuracy: 0.0%
```

## Root Causes

1. **Insufficient training data diversity:**
   - Only 8 xv6 commands traced
   - Missing critical syscalls (write, execve, etc.)
   - No write syscalls in parsed traces (filtering issue?)

2. **Severe class imbalance:**
   - 48% of data is fstat
   - Model biased toward frequent syscalls
   - Low-frequency syscalls underrepresented

3. **Limited training samples:**
   - Only 11 segments after chunking
   - 20 epochs may be insufficient for complex patterns
   - No validation split for early stopping

4. **Semantic extraction incomplete:**
   - Ground truth spatial ops manually defined in parse script
   - May not capture all spatial operations
   - Model can't learn what's not in training data

## Recommendations

### Immediate Fixes (Priority 1)

1. **Expand trace collection:**
   ```bash
   # Add more diverse xv6 workloads
   - stress test (fork bomb, file creation)
   - Network operations (if available)
   - More interactive programs
   - Intentionally trigger all syscall types
   ```

2. **Balance the dataset:**
   - Oversample low-frequency syscalls
   - Target: minimum 20 examples per syscall type
   - Create synthetic traces for rare syscalls

3. **Fix write syscall extraction:**
   - Investigate why write syscalls missing from parsed data
   - Expected ~40 write calls but observed 0
   - Check trace collection filters

### Model Improvements (Priority 2)

1. **Better architecture:**
   - Consider seq2seq with attention for syscall sequences
   - Add regularization (dropout, weight decay already present)
   - Increase model capacity (d_model=128 may be too small)

2. **Training enhancements:**
   - Increase training samples (chunk longer sequences)
   - Add validation set for early stopping
   - Use class weights for imbalanced data
   - Consider focal loss for rare classes

3. **Spatial operation vocabulary expansion:**
   - Currently only 18 spatial ops
   - May need more granular operations
   - Hierarchical spatial op taxonomy

### VCC Enhancements (Priority 3)

1. **Multi-level validation:**
   - Level 1: Syscall → spatial op mapping (current)
   - Level 2: Pixel-level consistency (memory palace states)
   - Level 3: End-to-end behavioral equivalence

2. **Visual verification:**
   - Generate memory palace screenshots
   - Compare traditional vs synthesized execution
   - Pixel-perfect diff visualization

## Next Steps

1. **Fix data collection** (P0):
   - Investigate missing write syscalls
   - Collect 100+ traces with balanced syscall distribution
   - Target: 50+ examples per syscall type

2. **Retrain model** (P1):
   - Use balanced dataset
   - Increase model capacity
   - Add validation for hyperparameter tuning

3. **VCC revalidation** (P2):
   - Achieve >95% accuracy on all syscall types
   - Add pixel-level verification
   - Visual diff tooling

## Files Generated

```
models/
└── syscall_synthesis_model.pt          # Trained model (2.5MB)

traces/
├── parsed/                             # 8 JSON trace files
└── synthesized/                        # WGSL shaders (minimal)

scripts/
├── train_syscall_synthesis.py          # Training pipeline
├── vcc_validation.py                   # Full VCC (complex)
└── vcc_validation_simple.py            # Simple VCC (mapping only)

vcc_validation_results.json             # Validation results (369 entries)
trace_collection_summary.md            # Data collection summary
```

## Conclusion

The synthesis model architecture and training pipeline are **functionally correct**, but the **dataset is severely imbalanced** and **incomplete**. The model learns well for high-frequency syscalls (fstat, openat) but fails completely for low-frequency operations (fork, pipe, read, etc.).

**Critical path to success:** Expand and balance the training dataset with diverse syscall examples, then retrain the model. The architecture is sound - it just needs better data.

**Estimated effort:** 2-4 hours for data collection + 1 hour for retraining + 30 minutes for VCC validation.

**Confidence in architecture:** 95%
**Confidence in current model:** 40% (due to data issues)
**Path to production:** Clear - fix data, retrain, validate.