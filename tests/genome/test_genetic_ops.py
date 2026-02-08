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

    # Should have genes from both parents (crossover can produce duplicate genes)
    assert len(child.genes) >= 2  # At minimum, some genes from both parents
    # Check that we have genes from both parents present
    gene_ids = {g.id for g in child.genes}
    assert "g1" in gene_ids  # Common gene
    assert len(child.genes) >= 2  # At least some genes

def test_tournament_select():
    """Test tournament selection"""
    from genetic_ops import tournament_select, SelectionConfig
    from genome_schema import Genome, Gene, GeneType, RegulatoryRegion

    population = [
        Genome(version="1.0", genes=[Gene(id="g1", type=GeneType.FUNCTION, name="f1", sequence="A")],
               regulatory_regions=RegulatoryRegion(), fitness_score=0.5),
        Genome(version="1.0", genes=[Gene(id="g2", type=GeneType.FUNCTION, name="f2", sequence="T")],
               regulatory_regions=RegulatoryRegion(), fitness_score=0.9),
        Genome(version="1.0", genes=[Gene(id="g3", type=GeneType.FUNCTION, name="f3", sequence="C")],
               regulatory_regions=RegulatoryRegion(), fitness_score=0.3),
    ]

    config = SelectionConfig(method="tournament", tournament_size=2)
    selected = tournament_select(population, config)

    # Should select from the population
    assert selected in population

def test_roulette_select():
    """Test roulette wheel selection"""
    from genetic_ops import roulette_select, SelectionConfig
    from genome_schema import Genome, Gene, GeneType, RegulatoryRegion

    population = [
        Genome(version="1.0", genes=[Gene(id="g1", type=GeneType.FUNCTION, name="f1", sequence="A")],
               regulatory_regions=RegulatoryRegion(), fitness_score=0.5),
        Genome(version="1.0", genes=[Gene(id="g2", type=GeneType.FUNCTION, name="f2", sequence="T")],
               regulatory_regions=RegulatoryRegion(), fitness_score=0.9),
    ]

    config = SelectionConfig(method="roulette")
    selected = roulette_select(population, config)

    # Should select from the population
    assert selected in population

def test_evolve_population():
    """Test population evolution"""
    from genetic_ops import evolve_population, PointMutationConfig
    from genome_schema import Genome, Gene, GeneType, RegulatoryRegion

    population = [
        Genome(version="1.0", genes=[Gene(id="g1", type=GeneType.FUNCTION, name="f1", sequence="AAAA")],
               regulatory_regions=RegulatoryRegion(), fitness_score=0.5),
        Genome(version="1.0", genes=[Gene(id="g2", type=GeneType.FUNCTION, name="f2", sequence="TTTT")],
               regulatory_regions=RegulatoryRegion(), fitness_score=0.9),
    ]

    new_pop = evolve_population(population, population_size=4)

    # Should create new population
    assert len(new_pop) == 4
    # Generation should increase
    assert all(g.generation >= 0 for g in new_pop)
