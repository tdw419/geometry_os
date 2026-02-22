#!/usr/bin/env python3
"""
Continuous Benchmarking for Geometry OS Visual Shell

Tracks PixiJS render performance over time.
Results stored in benchmark_history.json for trend analysis.
"""

import json
import subprocess
import sys
import time
from pathlib import Path
from datetime import datetime
from typing import List, Dict, Any

HISTORY_FILE = Path(__file__).parent / "benchmark_history.json"
BENCHMARKS_DIR = Path(__file__).parent / "benchmarks"

# Performance thresholds
THRESHOLDS = {
    "fps_min": 55,           # Minimum acceptable FPS
    "frame_time_max": 20,    # Maximum frame time in ms
    "memory_max": 512,       # Maximum memory in MB
    "gpu_memory_max": 256,   # Maximum GPU memory in MB
}


def get_git_info() -> Dict[str, str]:
    """Get current git commit info."""
    result = subprocess.run(
        ["git", "log", "-1", "--format=%H %s", "--no-show-signature"],
        capture_output=True, text=True
    )
    if result.returncode == 0:
        parts = result.stdout.strip().split(" ", 1)
        return {
            "commit": parts[0][:8],
            "message": parts[1] if len(parts) > 1 else ""
        }
    return {"commit": "unknown", "message": ""}


def run_puppeteer_benchmark(url: str, duration: int = 10) -> Dict[str, Any]:
    """Run benchmark using Puppeteer to collect performance metrics."""
    
    script = f"""
const puppeteer = require('puppeteer');

(async () => {{
    const browser = await puppeteer.launch({{
        headless: true,
        args: ['--enable-gpu', '--no-sandbox']
    }});
    
    const page = await browser.newPage();
    await page.setViewport({{ width: 1920, height: 1080 }});
    
    // Collect metrics
    const metrics = [];
    const startTime = Date.now();
    
    await page.goto('{url}', {{ waitUntil: 'networkidle0' }});
    
    // Warmup
    await new Promise(r => setTimeout(r, 2000));
    
    // Benchmark loop
    for (let i = 0; i < {duration * 10}; i++) {{
        const m = await page.metrics();
        const performance = await page.evaluate(() => ({{
            fps: window.__GEOMETRY_OS_FPS || 60,
            frameTime: window.__GEOMETRY_OS_FRAME_TIME || 16.67,
            sprites: window.__GEOMETRY_OS_SPRITE_COUNT || 0,
            drawCalls: window.__GEOMETRY_OS_DRAW_CALLS || 0
        }}));
        metrics.push({{ ...m, ...performance }});
        await new Promise(r => setTimeout(r, 100));
    }}
    
    // Get memory info
    const memory = await page.evaluate(() => {{
        const info = performance.memory || {{}};
        return {{
            usedJSHeapSize: info.usedJSHeapSize || 0,
            totalJSHeapSize: info.totalJSHeapSize || 0
        }};
    }});
    
    await browser.close();
    
    // Calculate averages
    const avgFps = metrics.reduce((a, m) => a + m.fps, 0) / metrics.length;
    const avgFrameTime = metrics.reduce((a, m) => a + m.frameTime, 0) / metrics.length;
    const avgSprites = metrics.reduce((a, m) => a + m.sprites, 0) / metrics.length;
    const avgDrawCalls = metrics.reduce((a, m) => a + m.drawCalls, 0) / metrics.length;
    
    console.log(JSON.stringify({{
        avgFps,
        avgFrameTime,
        avgSprites,
        avgDrawCalls,
        memoryUsedMB: memory.usedJSHeapSize / 1024 / 1024,
        duration: {duration},
        samples: metrics.length
    }}));
}})().catch(e => {{
    console.error(JSON.stringify({{ error: e.message }}));
    process.exit(1);
}});
"""
    
    result = subprocess.run(
        ["node", "-e", script],
        capture_output=True, text=True, timeout=duration + 60
    )
    
    if result.returncode != 0:
        return {"error": result.stderr or result.stdout}
    
    try:
        return json.loads(result.stdout.strip().split('\n')[-1])
    except:
        return {"error": "Failed to parse output", "raw": result.stdout}


def check_thresholds(results: Dict[str, Any]) -> List[str]:
    """Check if results exceed thresholds."""
    alerts = []
    
    if results.get("avgFps", 0) < THRESHOLDS["fps_min"]:
        alerts.append(f"FPS {results['avgFps']:.1f} below minimum {THRESHOLDS['fps_min']}")
    
    if results.get("avgFrameTime", 0) > THRESHOLDS["frame_time_max"]:
        alerts.append(f"Frame time {results['avgFrameTime']:.1f}ms exceeds max {THRESHOLDS['frame_time_max']}ms")
    
    if results.get("memoryUsedMB", 0) > THRESHOLDS["memory_max"]:
        alerts.append(f"Memory {results['memoryUsedMB']:.1f}MB exceeds max {THRESHOLDS['memory_max']}MB")
    
    return alerts


def load_history() -> List[Dict]:
    """Load benchmark history."""
    if HISTORY_FILE.exists():
        with open(HISTORY_FILE) as f:
            return json.load(f)
    return []


def save_history(history: List[Dict]):
    """Save benchmark history."""
    with open(HISTORY_FILE, "w") as f:
        json.dump(history[-100:], f, indent=2)  # Keep last 100 runs


def analyze_trend(history: List[Dict], metric: str, window: int = 10) -> Dict:
    """Analyze trend for a specific metric."""
    recent = [h for h in history[-window:] if metric in h.get("results", {})]
    if len(recent) < 3:
        return {"trend": "insufficient_data"}
    
    values = [h["results"][metric] for h in recent]
    avg = sum(values) / len(values)
    recent_avg = sum(values[-3:]) / 3
    
    if recent_avg < avg * 0.95:
        trend = "degrading"
    elif recent_avg > avg * 1.05:
        trend = "improving"
    else:
        trend = "stable"
    
    return {
        "trend": trend,
        "average": round(avg, 2),
        "recent_average": round(recent_avg, 2),
        "samples": len(values)
    }


def run_benchmarks() -> Dict[str, Any]:
    """Run all benchmarks."""
    results = {}
    
    # Main Visual Shell benchmark
    print("Running Visual Shell benchmark...")
    vs_result = run_puppeteer_benchmark(
        "http://localhost:8000/systems/visual_shell/web/index.html",
        duration=10
    )
    results["visual_shell"] = vs_result
    
    # Additional benchmarks can be added here
    
    return results


def main():
    print("=== Geometry OS Continuous Benchmark ===")
    print(f"Time: {datetime.now().isoformat()}")
    
    # Run benchmarks
    results = run_benchmarks()
    
    # Check thresholds
    all_alerts = []
    for name, r in results.items():
        alerts = check_thresholds(r)
        if alerts:
            all_alerts.extend([f"[{name}] {a}" for a in alerts])
    
    # Get git info
    git_info = get_git_info()
    
    # Record in history
    history = load_history()
    record = {
        "timestamp": datetime.now().isoformat(),
        "commit": git_info["commit"],
        "message": git_info["message"],
        "results": results,
        "alerts": all_alerts
    }
    history.append(record)
    save_history(history)
    
    # Print results
    print("\n=== Results ===")
    for name, r in results.items():
        if "error" in r:
            print(f"{name}: ERROR - {r['error']}")
        else:
            print(f"{name}:")
            print(f"  FPS: {r.get('avgFps', 0):.1f}")
            print(f"  Frame Time: {r.get('avgFrameTime', 0):.1f}ms")
            print(f"  Memory: {r.get('memoryUsedMB', 0):.1f}MB")
    
    # Print alerts
    if all_alerts:
        print("\n=== ALERTS ===")
        for alert in all_alerts:
            print(f"⚠️  {alert}")
    
    # Print trends
    print("\n=== Trends ===")
    for metric in ["avgFps", "avgFrameTime", "memoryUsedMB"]:
        trend = analyze_trend(history, metric)
        print(f"{metric}: {trend['trend']} (avg: {trend.get('average', 'N/A')})")
    
    # Save summary for CI
    summary_file = Path(__file__).parent / "benchmark_summary.json"
    with open(summary_file, "w") as f:
        json.dump({
            "passed": len(all_alerts) == 0,
            "alerts": all_alerts,
            "results": results,
            "commit": git_info["commit"]
        }, f, indent=2)
    
    return 0 if len(all_alerts) == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
