# Checks - AI Runtime Inference Interview

This track is complete enough for interview readiness only when these checks are
true.

## Concept Checks

- [ ] I can explain prefill vs decode without using vague words like "faster"
      without saying what is faster and why.
- [ ] I can write the KV-cache memory formula from memory.
- [ ] I can explain why cache memory grows with sequence length and concurrency.
- [ ] I can explain MHA vs GQA vs MQA cache shapes.
- [ ] I can explain why decode remains sequential token by token.
- [ ] I can explain why inference is often memory-bandwidth bound.
- [ ] I can explain continuous batching at a high level.
- [ ] I can explain paged attention and KV-cache fragmentation at a high level.

## Shape Checks

- [ ] Given `[B, T, C]`, I can derive Q/K/V shapes for MHA.
- [ ] Given `Hq` and `Hkv`, I can identify whether the setup is MHA, GQA, or MQA.
- [ ] Given `L, B, S, Hkv, D, dtype`, I can estimate KV-cache memory.
- [ ] I can state the shape of logits during prefill and decode.

## Implementation Checks

- [ ] Tiny causal attention runs.
- [ ] Prefill creates a cache with expected key/value shapes.
- [ ] One-token decode appends to the cache.
- [ ] Cached decode logits match full forward logits on a tiny deterministic case.
- [ ] Temperature sampling works.
- [ ] Top-k sampling works.
- [ ] Top-p sampling works.
- [ ] Full generation vs cached generation benchmark exists.
- [ ] KV-cache memory estimator exists.

## Interview Checks

- [ ] I can answer "What happens when a prompt enters an LLM serving system?"
- [ ] I can answer "Why does KV cache help decode but not remove prefill cost?"
- [ ] I can answer "How would you debug high inference latency?"
- [ ] I can answer "How would you serve many concurrent requests?"
- [ ] I can answer "What does vLLM optimize?"
- [ ] I can answer "How do you choose between latency and throughput?"

