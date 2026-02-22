use criterion::{black_box, criterion_group, criterion_main, Criterion};

pub fn criterion_benchmark(c: &mut Criterion) {
    c.bench_function("visual_shell_placeholder", |b| b.iter(|| {
        black_box(20 + 20)
    }));
}

criterion_group!(benches, criterion_benchmark);
criterion_main!(benches);
