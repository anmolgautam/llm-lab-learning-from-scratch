# Key Notes - AI Runtime Inference Interview

## Must-Know Distinctions

- Training predicts next tokens for many positions in parallel.
- Inference generates tokens autoregressively, one sampled token at a time.
- Prefill processes the whole prompt and builds KV cache.
- Decode processes one new token and reuses the KV cache.
- KV cache saves recomputation but consumes memory.
- MHA has one K/V head per query head.
- GQA shares K/V heads across groups of query heads.
- MQA shares one K/V head across all query heads.
- Continuous batching improves throughput by keeping active decode work packed.
- Paged attention reduces KV-cache fragmentation and makes memory management
  more serving-friendly.

## KV-Cache Formula

```text
bytes = 2 * L * B * S * Hkv * D * bytes_per_element
```

Where:

- `2` = K and V
- `L` = layers
- `B` = active batch/concurrent sequences
- `S` = cached sequence length
- `Hkv` = key/value heads
- `D` = head dimension

## Interview Anchor

Use this answer pattern:

```text
concept -> shape -> cost -> failure mode -> test/metric
```

Example:

```text
KV cache stores per-layer keys and values from previous tokens. Its shape is
roughly [B, Hkv, S, D] per layer for K and V. It reduces decode compute because
we do not recompute K/V for the full prefix every step, but memory grows
linearly with sequence length and concurrency. The main failures are cache shape
bugs, OOM, fragmentation, and measuring prefill/decode together. I would verify
cached decode against full forward and separately benchmark prefill latency,
decode tokens/sec, and memory.
```

## Metrics To Name

- time to first token
- inter-token latency
- decode tokens/sec
- total throughput
- p50/p95/p99 latency
- GPU memory used by weights vs KV cache
- max concurrent requests
- prompt length distribution
- output length distribution

