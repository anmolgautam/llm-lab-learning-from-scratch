# Week 08 - Inference Runtime Lab

> **Dormant.** This lab was scaffolded on 2026-06-25 for an interview that no
> longer exists. The mission is now mastery in dependency order (see
> `MISSION.md` and `learning-records/0001-*`), so this lab waits until Phase 8
> arrives properly — at which point there will be a model we actually built to
> cache, instead of a hypothetical one. Nothing here is earned. Nothing here is
> wasted either: the early exposure will make Phase 8 faster.

Keep implementations small, measurable, and easy to reason about.

## First Build Targets

```text
tinyseek/
  inference/
    attention.py       # tiny attention and cached decode
    sampling.py        # temperature, top-k, top-p
    kv_cache.py        # cache object and memory estimator
scripts/
  benchmark_decode.py  # full forward vs cached decode
tests/
  test_kv_cache.py     # cached decode matches full forward
  test_sampling.py     # sampling filters behave correctly
configs/
  tiny_inference.yaml
```

## Checks

- cached decode matches full forward logits on tiny deterministic examples
- cache shapes are printed and explained
- KV-cache memory estimate works for MHA, GQA, and MQA
- benchmark reports prefill and decode separately

## Status

L0 (previewed). Scaffold only, no code, no passing check. Implementation starts
when Phase 8 is reached in order — after Phases 1-7 are at L3.

