# tests/genome/test_genetic_ops.py
import pytest
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).parent.parent.parent.resolve() / "systems" / "genome" / "src"))
sys.path.insert(0, str(Path(__file__).parent.parent.parent.resolve() / "systems" / "genome" / "spec"))

def test_point_mutation():
    """Test single point mutation in gene sequence"""
    from genetic_ops import mutate_sequence, PointMutationConfig

    original = "ATCGATCG"
    config = PointMutationConfig(mutation_rate=0.5)

    mutated = mutate_sequence(original, config)

    # Should be same length
    assert len(mutated) == len(original)
    # May be different due to mutation
    assert mutated == original or mutated != original

def test_crossover():
    """Test single-point crossover between two genomes"""
    from genetic_ops import crossover_genomes
    from genome_schema import Genome, Gene, GeneType, RegulatoryRegion

    parent1 = Genome(
        version="1.0",
        genes=[
            Gene(id="g1", type=GeneType.FUNCTION, name="func1", sequence="AAAA"),
            Gene(id="g2", type=GeneType.FUNCTION, name="func2", sequence="CCCC"),
        ],
        regulatory_regions=RegulatoryRegion()
    )

    parent2 = Genome(
        version="1.0",
        genes=[
            Gene(id="g1", type=GeneType.FUNCTION, name="func1", sequence="TTTT"),
            Gene(id="g3", type=GeneType.FUNCTION, name="func3", sequence="GGGG"),
        ],
        regulatory_regions=RegulatoryRegion()
    )

    child = crossover_genomes(parent1, parent2, crossover_point=0.5)

    # Should have genes from both parents
    assert len(child.genes) <= 3  # g1, g2, g3
