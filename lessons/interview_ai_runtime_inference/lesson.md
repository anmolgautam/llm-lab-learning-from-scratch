# Interview Track - AI Runtime Engineer: Inference Module

Goal: prepare for an AI runtime / inference engineer interview by learning the
LLM serving path deeply enough to explain, implement, debug, and measure it.

This track intentionally front-loads Phase 8. It does not mark earlier phases as
complete. We will borrow only the foundations needed for inference:

- next-token prediction
- causal attention
- Transformer forward pass shapes
- prefill vs decode
- KV-cache layout
- batching and scheduling
- memory bandwidth and latency/throughput tradeoffs
- vLLM-style paged attention concepts

## Interview Target

For this role, the interviewer is likely to care less about training a model and
more about whether you can reason about serving one:

- What happens when a prompt arrives?
- Why is prefill different from decode?
- Why does KV cache help?
- What are the shapes and memory costs of the cache?
- Why is inference often memory-bandwidth bound?
- How do batching and scheduling improve throughput?
- What tradeoffs appear when serving many concurrent requests?
- What does a system like vLLM optimize?
- How would you debug slow tokens/sec, high latency, or OOMs?

## Mental Model

LLM inference has two major phases:

```text
prefill: run the full prompt through the model once and build KV cache
decode: generate one new token at a time while reusing cached keys/values
```

Prefill is parallel across prompt tokens. Decode is sequential across generated
tokens because each new token depends on the previous sampled token.

KV cache changes decode from "recompute all previous keys and values every step"
to "append the new key/value and attend over cached history." It saves compute,
but it does not make attention free. Each decode step still reads prior KV
memory.

## Core Shapes

Use these symbols:

```text
B      batch size
T      prompt/context length
S      generated sequence length so far
V      vocabulary size
C      model hidden size
Hq     query heads
Hkv    key/value heads
D      head dimension
L      number of layers
```

Common shapes:

```text
tokens:        [B, T]
hidden:        [B, T, C]
q:             [B, Hq, T, D]
k/v prefill:   [B, Hkv, T, D]
logits:        [B, T, V]
next logits:   [B, V]

KV cache per layer:
k_cache:       [B, Hkv, S, D]
v_cache:       [B, Hkv, S, D]
```

For MHA, `Hkv = Hq`.
For MQA, `Hkv = 1`.
For GQA, `1 < Hkv < Hq`.

## Memory Formula

Approximate KV-cache memory:

```text
bytes = 2 * L * B * S * Hkv * D * bytes_per_element
```

The leading `2` is for keys and values.

This formula is interview gold. It explains why long context, concurrency, and
MHA-style caches become expensive.

## First Implementation Targets

1. Write a tiny attention forward pass without cache.
2. Add prefill cache creation.
3. Add one-token decode using the cache.
4. Prove cached decode matches full forward on a tiny deterministic example.
5. Add temperature, top-k, and top-p sampling.
6. Benchmark full-context generation vs cached generation.
7. Estimate MHA vs GQA vs MQA cache memory.

## Serving-System Targets

After the local mechanics are clear, study the serving layer:

- request lifecycle
- token streaming
- continuous batching
- prompt batching vs decode batching
- latency vs throughput
- queueing and admission control
- prefix/cache reuse
- paged attention and KV-cache fragmentation
- OpenAI-compatible completion/chat response shapes

## Debugging Questions

When inference is slow or unstable, inspect in this order:

1. Are tensor shapes correct?
2. Is decode recomputing prompt tokens accidentally?
3. Is KV cache on the expected device and dtype?
4. Is batch size too small to utilize hardware?
5. Is concurrency causing KV-cache OOM?
6. Is sampling or CPU-side postprocessing the bottleneck?
7. Are measurements synchronized and separated into prefill/decode?

## Interview Answer Pattern

For each topic, answer in this structure:

```text
concept -> shape -> cost -> failure mode -> how to test/measure
```

Example:

```text
KV cache stores keys and values per layer so decode can reuse previous tokens.
The cache shape is roughly [layers, batch, kv_heads, seq, head_dim] for K and V.
Memory grows linearly with layers, batch/concurrency, sequence length, kv heads,
and dtype size. It can OOM under long-context or high-concurrency workloads.
I would test it by checking cached decode matches full forward and by measuring
prefill latency, decode tokens/sec, and cache memory as sequence length grows.
```

