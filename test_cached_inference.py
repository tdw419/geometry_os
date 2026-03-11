import asyncio
from transformers import AutoTokenizer
from systems.visual_shell.wgsl.pixel_brain_pipeline import PixelBrainPipeline
import time

async def test_cached_inference():
    print("🧠 Geometry OS - Cached CPU Inference Test")
    print("=" * 50)

    # 1. Load Pipeline
    brain_path = "gpt_neo_125m_brain.rts.png"
    print(f"\n📦 Loading brain atlas: {brain_path}")
    start = time.time()
    brain = PixelBrainPipeline(brain_path)
    print(f"   Loaded in {time.time() - start:.1f}s")

    # 2. Warmup cache (preload all weights)
    print("\n🔥 Warming up weight cache...")
    start = time.time()
    cached = brain.warmup_cache()
    warmup_time = time.time() - start
    stats = brain.cache_stats()
    print(f"   Cached {cached} sectors in {warmup_time:.1f}s")
    print(f"   Cache size: {stats['total_mb']:.1f} MB")

    # 3. Tokenize
    tokenizer = AutoTokenizer.from_pretrained("EleutherAI/gpt-neo-125M")
    prompt = "The computer"
    input_tokens = tokenizer.encode(prompt)
    print(f"\n📝 Prompt: '{prompt}' (Tokens: {input_tokens})")

    # 4. First forward pass (from cache)
    print("\n🚀 Testing cached inference...")
    start = time.time()
    logits = brain.forward(input_tokens[0], position=0)
    first_pass_time = time.time() - start
    print(f"   First forward pass: {first_pass_time:.3f}s")

    # 5. Generate 5 tokens
    print("\n⚡ Generating 5 tokens...")
    start = time.time()
    generated = brain.generate(input_tokens, max_tokens=5)
    gen_time = time.time() - start
    output_text = tokenizer.decode(generated)
    print(f"   Generated in {gen_time:.2f}s")
    print(f"   Tokens/sec: {5 / gen_time:.2f}")
    print(f"\n✨ Result: '{prompt}' -> '{output_text}'")

    # 6. Summary
    print("\n" + "=" * 50)
    print("📊 Performance Summary:")
    print(f"   Warmup (one-time): {warmup_time:.1f}s")
    print(f"   Single token: {first_pass_time:.3f}s")
    print(f"   Generation: {gen_time:.2f}s for 5 tokens ({5/gen_time:.2f} tok/s)")

if __name__ == "__main__":
    asyncio.run(test_cached_inference())
