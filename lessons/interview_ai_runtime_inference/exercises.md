# Exercises - AI Runtime Inference Interview

Do these in order. The point is to make the interview answers come from your own
mechanical understanding, not memorized phrases.

## Paper Exercises

1. Draw the request path for a single prompt:

```text
tokenize -> prefill -> sample first token -> decode loop -> stream tokens
```

2. For `L=32`, `B=8`, `S=2048`, `Hkv=32`, `D=128`, `bf16`, compute KV-cache
   memory by hand.

3. Repeat the memory estimate for GQA with `Hkv=8` and MQA with `Hkv=1`.

4. Draw the difference between prefill attention and one-token decode attention.

5. Explain why decode is sequential even though GPU matrix multiplication is
   parallel.

## Coding Exercises

1. Implement a tiny single-head causal attention forward pass.
2. Add a cache object containing keys and values.
3. Implement `prefill(x)` that returns logits and cache.
4. Implement `decode_one(x_next, cache)` that appends one token's K/V.
5. Verify cached decode logits match full forward logits on a tiny sequence.
6. Implement temperature sampling.
7. Implement top-k filtering.
8. Implement top-p filtering.
9. Benchmark full forward generation vs cached generation.
10. Print KV-cache memory estimates for MHA, GQA, and MQA.

## System Design Exercises

1. Sketch a minimal streaming inference server.
2. Explain where batching happens and why decode batching is special.
3. Explain what can go wrong if one request is much longer than others.
4. Compare static batching, dynamic batching, and continuous batching.
5. Explain why paged KV cache helps serving systems.

## Mock Interview Prompts

Answer each in two minutes or less:

1. Why does KV cache speed up autoregressive decoding?
2. Why does KV cache increase memory usage?
3. What is the difference between prefill and decode?
4. How would you estimate maximum concurrent requests for a model?
5. Why can throughput improve while p99 latency gets worse?
6. How does GQA reduce inference memory compared with MHA?
7. What would you measure before optimizing an inference server?
8. What does vLLM optimize that a naive PyTorch generation loop does not?

