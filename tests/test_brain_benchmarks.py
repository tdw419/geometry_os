"""Tests for brain fitness benchmarks."""


class TestBrainBenchmarks:
    """Test brain fitness evaluation benchmarks."""

    def test_benchmark_module_exists(self):
        """brain_benchmarks module should exist."""
        from systems.evolution_daemon import brain_benchmarks
        assert brain_benchmarks is not None

    def test_coherence_benchmark_exists(self):
        """coherence benchmark should exist."""
        from systems.evolution_daemon.brain_benchmarks import coherence_benchmark
        assert callable(coherence_benchmark)

    def test_perplexity_benchmark_exists(self):
        """perplexity benchmark should exist."""
        from systems.evolution_daemon.brain_benchmarks import perplexity_benchmark
        assert callable(perplexity_benchmark)

    def test_coherence_benchmark_returns_float(self):
        """coherence benchmark should return float."""
        from systems.evolution_daemon.brain_benchmarks import coherence_benchmark
        result = coherence_benchmark("Once upon a time there was a little dog.")
        assert isinstance(result, float)
        assert 0 <= result <= 1

    def test_perplexity_benchmark_returns_float(self):
        """perplexity benchmark should return float."""
        from systems.evolution_daemon.brain_benchmarks import perplexity_benchmark
        result = perplexity_benchmark("Once upon a time", "there was a little dog")
        assert isinstance(result, float)

    def test_coherence_benchmark_empty_text(self):
        """coherence benchmark handles empty text."""
        from systems.evolution_daemon.brain_benchmarks import coherence_benchmark
        result = coherence_benchmark("")
        assert result == 0.0

    def test_coherence_benchmark_short_text(self):
        """coherence benchmark handles short text."""
        from systems.evolution_daemon.brain_benchmarks import coherence_benchmark
        result = coherence_benchmark("Hi")
        assert result == 0.0  # Too short

    def test_coherence_benchmark_good_text(self):
        """coherence benchmark scores good text highly."""
        from systems.evolution_daemon.brain_benchmarks import coherence_benchmark
        good_text = "Once upon a time, there was a little dog. The dog liked to play. Then the dog went home."
        result = coherence_benchmark(good_text)
        assert result > 0.3  # Should have reasonable score

    def test_perplexity_benchmark_empty_completion(self):
        """perplexity benchmark handles empty completion."""
        from systems.evolution_daemon.brain_benchmarks import perplexity_benchmark
        result = perplexity_benchmark("Prompt", "")
        assert result == 1.0  # Maximum perplexity

    def test_run_benchmark_suite_exists(self):
        """run_benchmark_suite should exist."""
        from systems.evolution_daemon.brain_benchmarks import run_benchmark_suite
        assert callable(run_benchmark_suite)

    def test_run_benchmark_suite_returns_dict(self):
        """run_benchmark_suite should return dictionary."""
        from systems.evolution_daemon.brain_benchmarks import run_benchmark_suite
        results = run_benchmark_suite(["Test text one.", "Test text two."])
        assert isinstance(results, dict)
        assert 'coherence' in results
        assert 'avg_coherence' in results

    def test_run_benchmark_suite_empty_list(self):
        """run_benchmark_suite handles empty list."""
        from systems.evolution_daemon.brain_benchmarks import run_benchmark_suite
        results = run_benchmark_suite([])
        assert results['avg_coherence'] == 0.0
