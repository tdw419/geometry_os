/**
 * Geometry OS - Performance Benchmark Suite
 *
 * Measures renderer performance before and after optimizations.
 * Run in browser console or as module.
 */

export class PerformanceBenchmark {
    constructor() {
        this.results = {
            before: {},
            after: {}
        };
        this.iterations = 1000;
    }

    /**
     * Run all benchmarks
     */
    async runAll(phase = 'before') {
        console.log(`\n========== Performance Benchmark: ${phase.toUpperCase()} ==========\n`);

        const results = {};

        // 1. DOM Manipulation benchmarks
        results.domCreate = this.benchmarkDOMCreate();
        results.domUpdate = this.benchmarkDOMUpdate();
        results.domQuery = this.benchmarkDOMQuery();

        // 2. State management benchmarks
        results.stateUpdate = this.benchmarkStateUpdate();
        results.stateSync = this.benchmarkStateSync();

        // 3. Rendering benchmarks
        results.renderLoop = await this.benchmarkRenderLoop();
        results.batchedUpdates = this.benchmarkBatchedUpdates();

        // 4. Memory benchmarks
        results.memoryUsage = this.benchmarkMemory();

        this.results[phase] = results;
        this.printResults(results);

        return results;
    }

    /**
     * Benchmark: DOM element creation
     */
    benchmarkDOMCreate() {
        const container = document.createElement('div');
        container.style.display = 'none';
        document.body.appendChild(container);

        const start = performance.now();

        for (let i = 0; i < this.iterations; i++) {
            const el = document.createElement('div');
            el.className = 'process-item';
            el.innerHTML = `
                <span class="pid">#${i}</span>
                <span class="pname">Process ${i}</span>
                <span class="pstate">RUNNING</span>
            `;
            container.appendChild(el);
        }

        const duration = performance.now() - start;
        document.body.removeChild(container);

        return {
            name: 'DOM Creation',
            iterations: this.iterations,
            totalMs: duration,
            avgMs: duration / this.iterations,
            opsPerSec: (this.iterations / duration) * 1000
        };
    }

    /**
     * Benchmark: DOM updates (innerHTML vs textContent vs properties)
     */
    benchmarkDOMUpdate() {
        const container = document.createElement('div');
        container.style.display = 'none';
        document.body.appendChild(container);

        // Create elements first
        const elements = [];
        for (let i = 0; i < 100; i++) {
            const el = document.createElement('div');
            el.innerHTML = `<span class="value">0</span>`;
            container.appendChild(el);
            elements.push(el.querySelector('.value'));
        }

        // Benchmark: innerHTML update
        const innerHTMLStart = performance.now();
        for (let iter = 0; iter < this.iterations / 10; iter++) {
            for (let i = 0; i < elements.length; i++) {
                elements[i].parentElement.innerHTML = `<span class="value">${iter}</span>`;
            }
        }
        const innerHTMLDuration = performance.now() - innerHTMLStart;

        // Benchmark: textContent update
        const textContentStart = performance.now();
        for (let iter = 0; iter < this.iterations / 10; iter++) {
            for (let i = 0; i < elements.length; i++) {
                elements[i].textContent = iter;
            }
        }
        const textContentDuration = performance.now() - textContentStart;

        // Recreate elements for property test
        const propElements = [];
        for (let i = 0; i < 100; i++) {
            const el = document.createElement('div');
            const span = document.createElement('span');
            span.className = 'value';
            el.appendChild(span);
            container.appendChild(el);
            propElements.push(span);
        }

        // Benchmark: direct property update
        const propStart = performance.now();
        for (let iter = 0; iter < this.iterations / 10; iter++) {
            for (let i = 0; i < propElements.length; i++) {
                propElements[i].nodeValue = iter;
            }
        }
        const propDuration = performance.now() - propStart;

        document.body.removeChild(container);

        return {
            name: 'DOM Update Methods',
            innerHTML: {
                totalMs: innerHTMLDuration,
                avgMs: innerHTMLDuration / (this.iterations / 10),
                opsPerSec: (this.iterations / 10 / innerHTMLDuration) * 1000
            },
            textContent: {
                totalMs: textContentDuration,
                avgMs: textContentDuration / (this.iterations / 10),
                opsPerSec: (this.iterations / 10 / textContentDuration) * 1000
            },
            property: {
                totalMs: propDuration,
                avgMs: propDuration / (this.iterations / 10),
                opsPerSec: (this.iterations / 10 / propDuration) * 1000
            }
        };
    }

    /**
     * Benchmark: DOM query methods
     */
    benchmarkDOMQuery() {
        const container = document.createElement('div');
        container.style.display = 'none';
        document.body.appendChild(container);

        // Create structure
        for (let i = 0; i < 100; i++) {
            const el = document.createElement('div');
            el.id = `item-${i}`;
            el.className = 'item';
            el.dataset.pid = i;
            container.appendChild(el);
        }

        // Benchmark: getElementById
        const getByIdStart = performance.now();
        for (let iter = 0; iter < this.iterations; iter++) {
            const el = document.getElementById(`item-${iter % 100}`);
            el?.classList.contains('item');
        }
        const getByIdDuration = performance.now() - getByIdStart;

        // Benchmark: querySelector
        const querySelectorStart = performance.now();
        for (let iter = 0; iter < this.iterations; iter++) {
            const el = container.querySelector(`#item-${iter % 100}`);
            el?.classList.contains('item');
        }
        const querySelectorDuration = performance.now() - querySelectorStart;

        // Benchmark: cached references
        const cache = new Map();
        for (let i = 0; i < 100; i++) {
            cache.set(`item-${i}`, document.getElementById(`item-${i}`));
        }

        const cachedStart = performance.now();
        for (let iter = 0; iter < this.iterations; iter++) {
            const el = cache.get(`item-${iter % 100}`);
            el?.classList.contains('item');
        }
        const cachedDuration = performance.now() - cachedStart;

        document.body.removeChild(container);

        return {
            name: 'DOM Query Methods',
            getElementById: {
                totalMs: getByIdDuration,
                avgMs: getByIdDuration / this.iterations,
                opsPerSec: (this.iterations / getByIdDuration) * 1000
            },
            querySelector: {
                totalMs: querySelectorDuration,
                avgMs: querySelectorDuration / this.iterations,
                opsPerSec: (this.iterations / querySelectorDuration) * 1000
            },
            cached: {
                totalMs: cachedDuration,
                avgMs: cachedDuration / this.iterations,
                opsPerSec: (this.iterations / cachedDuration) * 1000
            }
        };
    }

    /**
     * Benchmark: State update patterns
     */
    benchmarkStateUpdate() {
        // Naive state: direct object mutation
        class NaiveState {
            constructor() {
                this.data = { count: 0, items: [] };
            }

            increment() {
                this.data.count++;
            }

            addItem(item) {
                this.data.items.push(item);
            }
        }

        // Optimized state: immutable with change detection
        class OptimizedState {
            constructor() {
                this._data = { count: 0, items: [] };
                this._changed = new Set();
            }

            get data() {
                return this._data;
            }

            increment() {
                this._data = { ...this._data, count: this._data.count + 1 };
                this._changed.add('count');
            }

            addItem(item) {
                this._data = { ...this._data, items: [...this._data.items, item] };
                this._changed.add('items');
            }

            getChanged() {
                const changed = Array.from(this._changed);
                this._changed.clear();
                return changed;
            }
        }

        const naive = new NaiveState();
        const optimized = new OptimizedState();

        // Benchmark naive
        const naiveStart = performance.now();
        for (let i = 0; i < this.iterations; i++) {
            naive.increment();
            if (i % 10 === 0) naive.addItem({ id: i });
        }
        const naiveDuration = performance.now() - naiveStart;

        // Benchmark optimized
        const optimizedStart = performance.now();
        for (let i = 0; i < this.iterations; i++) {
            optimized.increment();
            if (i % 10 === 0) optimized.addItem({ id: i });
        }
        const optimizedDuration = performance.now() - optimizedStart;

        return {
            name: 'State Update Patterns',
            naive: {
                totalMs: naiveDuration,
                avgMs: naiveDuration / this.iterations
            },
            optimized: {
                totalMs: optimizedDuration,
                avgMs: optimizedDuration / this.iterations
            },
            improvement: ((naiveDuration - optimizedDuration) / naiveDuration * 100).toFixed(1) + '%'
        };
    }

    /**
     * Benchmark: State to DOM sync
     */
    benchmarkStateSync() {
        const container = document.createElement('div');
        container.style.display = 'none';
        document.body.appendChild(container);

        // Create UI structure
        const elements = {};
        for (let i = 0; i < 10; i++) {
            const el = document.createElement('div');
            el.id = `stat-${i}`;
            container.appendChild(el);
            elements[i] = el;
        }

        // Naive sync: update everything every time
        const naiveSync = (state) => {
            for (let i = 0; i < 10; i++) {
                elements[i].textContent = state[`value${i}`];
            }
        };

        // Optimized sync: only update changed
        const optimizedSync = (state, changed) => {
            for (const key of changed) {
                const idx = parseInt(key.replace('value', ''));
                if (elements[idx]) {
                    elements[idx].textContent = state[key];
                }
            }
        };

        // Create state
        const state = {};
        for (let i = 0; i < 10; i++) {
            state[`value${i}`] = i;
        }

        // Benchmark naive
        const naiveStart = performance.now();
        for (let iter = 0; iter < this.iterations; iter++) {
            // Only change one value
            state.value0 = iter;
            naiveSync(state);
        }
        const naiveDuration = performance.now() - naiveStart;

        // Benchmark optimized
        const changed = ['value0'];
        const optimizedStart = performance.now();
        for (let iter = 0; iter < this.iterations; iter++) {
            state.value0 = iter;
            optimizedSync(state, changed);
        }
        const optimizedDuration = performance.now() - optimizedStart;

        document.body.removeChild(container);

        return {
            name: 'State to DOM Sync',
            naive: {
                totalMs: naiveDuration,
                avgMs: naiveDuration / this.iterations
            },
            optimized: {
                totalMs: optimizedDuration,
                avgMs: optimizedDuration / this.iterations
            },
            improvement: ((naiveDuration - optimizedDuration) / naiveDuration * 100).toFixed(1) + '%'
        };
    }

    /**
     * Benchmark: Render loop simulation
     */
    async benchmarkRenderLoop() {
        const frames = 60;
        const frameTime = 1000 / 60;

        // Simulate render loop with naive updates
        const naiveTimes = [];
        let naiveState = { fps: 0, processes: 0, memory: 0 };

        for (let i = 0; i < frames; i++) {
            const start = performance.now();

            // Simulate state update
            naiveState = {
                fps: 60 + Math.random() * 5,
                processes: 10 + Math.floor(Math.random() * 5),
                memory: 50 + Math.random() * 20
            };

            // Simulate DOM updates (naive)
            document.getElementById('stat-fps')?.textContent;
            document.getElementById('stat-procs')?.textContent;

            naiveTimes.push(performance.now() - start);
            await new Promise(r => setTimeout(r, 1));
        }

        const naiveAvg = naiveTimes.reduce((a, b) => a + b, 0) / frames;

        return {
            name: 'Render Loop (60 frames)',
            avgFrameMs: naiveAvg,
            maxFrameMs: Math.max(...naiveTimes),
            minFrameMs: Math.min(...naiveTimes),
            targetMs: frameTime,
            meeting: naiveAvg < frameTime ? 'PASS' : 'FAIL'
        };
    }

    /**
     * Benchmark: Batched vs individual updates
     */
    benchmarkBatchedUpdates() {
        const container = document.createElement('div');
        container.style.display = 'none';
        document.body.appendChild(container);

        // Create elements
        for (let i = 0; i < 50; i++) {
            const el = document.createElement('div');
            el.id = `batch-${i}`;
            el.className = 'batch-item';
            container.appendChild(el);
        }

        // Individual updates (causes reflows)
        const individualStart = performance.now();
        for (let iter = 0; iter < this.iterations / 10; iter++) {
            for (let i = 0; i < 50; i++) {
                const el = document.getElementById(`batch-${i}`);
                el.style.width = `${10 + iter % 100}px`;
                el.style.height = `${10 + iter % 100}px`;
                el.style.background = `rgb(${iter % 255}, 0, 0)`;
            }
        }
        const individualDuration = performance.now() - individualStart;

        // Batched updates (using classList and data attributes)
        const batchedStart = performance.now();
        for (let iter = 0; iter < this.iterations / 10; iter++) {
            // Read phase
            const updates = [];
            for (let i = 0; i < 50; i++) {
                updates.push({
                    el: document.getElementById(`batch-${i}`),
                    width: 10 + iter % 100,
                    height: 10 + iter % 100,
                    color: iter % 255
                });
            }

            // Write phase (batched)
            requestAnimationFrame(() => {
                for (const update of updates) {
                    update.el.style.cssText = `width: ${update.width}px; height: ${update.height}px; background: rgb(${update.color}, 0, 0);`;
                }
            });
        }
        const batchedDuration = performance.now() - batchedStart;

        document.body.removeChild(container);

        return {
            name: 'Batched Updates',
            individual: {
                totalMs: individualDuration,
                avgMs: individualDuration / (this.iterations / 10)
            },
            batched: {
                totalMs: batchedDuration,
                avgMs: batchedDuration / (this.iterations / 10)
            },
            note: 'Batched uses requestAnimationFrame for write phase'
        };
    }

    /**
     * Benchmark: Memory usage
     */
    benchmarkMemory() {
        const memory = performance.memory || {
            usedJSHeapSize: 0,
            totalJSHeapSize: 0,
            jsHeapSizeLimit: 0
        };

        // Force GC if available
        if (window.gc) window.gc();

        return {
            name: 'Memory Usage',
            usedMB: (memory.usedJSHeapSize / 1024 / 1024).toFixed(2),
            totalMB: (memory.totalJSHeapSize / 1024 / 1024).toFixed(2),
            limitMB: (memory.jsHeapSizeLimit / 1024 / 1024).toFixed(2),
            note: 'Chrome only - performance.memory API'
        };
    }

    /**
     * Print benchmark results
     */
    printResults(results) {
        console.log('\n--- Benchmark Results ---\n');

        for (const [key, result] of Object.entries(results)) {
            console.log(`\n[${result.name || key}]`);

            if (result.iterations) {
                console.log(`  Iterations: ${result.iterations}`);
                console.log(`  Total: ${result.totalMs?.toFixed(2)}ms`);
                console.log(`  Average: ${result.avgMs?.toFixed(4)}ms`);
                console.log(`  Ops/sec: ${result.opsPerSec?.toFixed(0)}`);
            } else {
                for (const [subKey, value] of Object.entries(result)) {
                    if (typeof value === 'object') {
                        console.log(`  ${subKey}:`);
                        for (const [k, v] of Object.entries(value)) {
                            console.log(`    ${k}: ${typeof v === 'number' ? v.toFixed(4) : v}`);
                        }
                    } else {
                        console.log(`  ${subKey}: ${value}`);
                    }
                }
            }
        }
    }

    /**
     * Compare before and after results
     */
    compare() {
        if (!this.results.before || !this.results.after) {
            console.log('Run benchmark with phase="before" and phase="after" first');
            return;
        }

        console.log('\n========== PERFORMANCE COMPARISON ==========\n');

        const metrics = ['domCreate', 'domUpdate', 'domQuery', 'stateUpdate', 'stateSync'];
        const improvements = [];

        for (const metric of metrics) {
            const before = this.results.before[metric];
            const after = this.results.after[metric];

            if (!before || !after) continue;

            console.log(`\n[${metric}]`);

            if (before.totalMs && after.totalMs) {
                const improvement = ((before.totalMs - after.totalMs) / before.totalMs * 100);
                improvements.push(improvement);
                console.log(`  Total: ${before.totalMs.toFixed(2)}ms → ${after.totalMs.toFixed(2)}ms (${improvement > 0 ? '+' : ''}${improvement.toFixed(1)}%)`);
            }

            if (before.avgMs && after.avgMs) {
                const improvement = ((before.avgMs - after.avgMs) / before.avgMs * 100);
                console.log(`  Average: ${before.avgMs.toFixed(4)}ms → ${after.avgMs.toFixed(4)}ms (${improvement > 0 ? '+' : ''}${improvement.toFixed(1)}%)`);
            }
        }

        const avgImprovement = improvements.reduce((a, b) => a + b, 0) / improvements.length;
        console.log(`\n========================================`);
        console.log(`Average Improvement: ${avgImprovement > 0 ? '+' : ''}${avgImprovement.toFixed(1)}%`);
        console.log(`========================================\n`);
    }
}

// Auto-run if loaded directly
if (typeof window !== 'undefined') {
    window.PerformanceBenchmark = PerformanceBenchmark;
    console.log('PerformanceBenchmark loaded. Run: const bench = new PerformanceBenchmark(); bench.runAll("before")');
}
