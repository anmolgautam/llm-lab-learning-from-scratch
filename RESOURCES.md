# Resources

The trusted sources for this lab. **Teaching is grounded here, not in the instructor's memory.**

A confidently wrong number taught in Phase 2 becomes a misconception carried to Phase 13. When a
claim is load-bearing — a KV-cache memory formula, what PagedAttention actually does, the GQA ratio
in a real model — cite the source or go read it. Benchmark numbers are never quoted without hardware
and tensor sizes.

Every arXiv link below was verified on 2026-07-13 to resolve to the stated title. Years are v1
submission dates and sometimes differ from venue years.

## Knowledge

### Foundations (Phases 1-3)

- [Attention Is All You Need — Vaswani et al. (2017)](https://arxiv.org/abs/1706.03762)
  The Transformer. Use for: the original attention formulation, the `sqrt(d_k)` scaling argument.
  Note it is encoder-decoder; we build decoder-only.
- [Language Models are Unsupervised Multitask Learners — Radford et al. (2019)](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf)
  GPT-2. Use for: the decoder-only architecture we actually build, and the claim that next-token
  prediction alone induces capability.
- [Decoupled Weight Decay Regularization — Loshchilov & Hutter (2017)](https://arxiv.org/abs/1711.05101)
  AdamW. Use for: why weight decay is decoupled from the gradient update. Phase 3.
- [Mixed Precision Training — Micikevicius et al. (2017)](https://arxiv.org/abs/1710.03740)
  Use for: loss scaling, why fp32 master weights exist, where fp16 overflows. Phase 3.
- [Training Compute-Optimal Large Language Models — Hoffmann et al. (2022)](https://arxiv.org/abs/2203.15556)
  Chinchilla. Use for: the tokens-vs-parameters tradeoff. Context for why our tiny models are
  trained the way they are.
- [karpathy/nanoGPT](https://github.com/karpathy/nanoGPT)
  **Debug oracle only.** Use for: explaining a discrepancy when our loss curve or generation looks
  wrong. Never to skip the implementation.

### Modern Architecture (Phase 5)

- [RoFormer: Enhanced Transformer with Rotary Position Embedding — Su et al. (2021)](https://arxiv.org/abs/2104.09864)
  RoPE. Use for: why rotation encodes relative position, and why it applies to Q/K but never V.
- [Root Mean Square Layer Normalization — Zhang & Sennrich (2019)](https://arxiv.org/abs/1910.07467)
  RMSNorm. Use for: what LayerNorm's mean-centering was actually buying, and why dropping it works.
- [GLU Variants Improve Transformer — Shazeer (2020)](https://arxiv.org/abs/2002.05202)
  SwiGLU. Sole author — no "et al." Use for: the gated FFN and the hidden-dimension bookkeeping.
- [LLaMA: Open and Efficient Foundation Language Models — Touvron et al. (2023)](https://arxiv.org/abs/2302.13971)
  Use for: how RMSNorm + RoPE + SwiGLU compose into the architecture we are cloning.

### Attention Zoo (Phase 6)

- [Fast Transformer Decoding: One Write-Head is All You Need — Shazeer (2019)](https://arxiv.org/abs/1911.02150)
  MQA. Sole author. Use for: the original argument that decode is memory-bandwidth-bound.
- [GQA: Training Generalized Multi-Query Transformer Models from Multi-Head Checkpoints — Ainslie et al. (2023)](https://arxiv.org/abs/2305.13245)
  Use for: the quality/memory interpolation between MHA and MQA, and real head-group ratios.
- [FlashAttention — Dao et al. (2022)](https://arxiv.org/abs/2205.14135)
  Use for: why it is an *exact* attention kernel strategy, not a new attention pattern. IO-awareness,
  tiling, recomputation.
- [FlashAttention-2 — Dao (2023)](https://arxiv.org/abs/2307.08691)
  Sole author. Use for: work partitioning and where FA-1 left parallelism on the table.
- [Longformer: The Long-Document Transformer — Beltagy et al. (2020)](https://arxiv.org/abs/2004.05150)
  Use for: sliding-window attention and the global-token escape hatch.
- [Generating Long Sequences with Sparse Transformers — Child et al. (2019)](https://arxiv.org/abs/1904.10509)
  Use for: strided and fixed sparse patterns.
- [Mistral 7B — Jiang et al. (2023)](https://arxiv.org/abs/2310.06825)
  Use for: sliding-window attention as shipped in a real model, plus GQA in practice.
- [DeepSeek-V2 — DeepSeek-AI (2024)](https://arxiv.org/abs/2405.04434)
  The MLA citation (MLA is not in the title; the abstract is where it is defined). Corporate byline,
  so there is no clean first-author form. Use for: low-rank latent KV compression.
- [Native Sparse Attention — Yuan et al. (2025)](https://arxiv.org/abs/2502.11089)
  Optional. Cite as Yuan et al., **not** as a DeepSeek byline. Use for: hardware-aligned, natively
  trainable sparse attention.
- [Efficient Streaming Language Models with Attention Sinks — Xiao et al. (2023)](https://arxiv.org/abs/2309.17453)
  Use for: why naive window eviction destroys the model, and what an attention sink is.

### Mixture Of Experts (Phase 7)

- [GShard — Lepikhin et al. (2020)](https://arxiv.org/abs/2006.16668)
  Use for: expert capacity, token dropping, the sharding view of MoE.
- [Switch Transformers — Fedus et al. (2021)](https://arxiv.org/abs/2101.03961)
  Use for: top-1 routing, the load-balancing auxiliary loss, router z-loss, capacity factor.
- [DeepSeekMoE — Dai et al. (2024)](https://arxiv.org/abs/2401.06066)
  Use for: fine-grained experts and the shared-expert design.

### Inference (Phase 8)

- [Efficient Memory Management for LLM Serving with PagedAttention — Kwon et al. (2023)](https://arxiv.org/abs/2309.06180)
  The vLLM paper. Use for: KV-cache fragmentation, paged blocks, continuous batching. We read this
  design; per `MISSION.md` we do not rebuild it.
- [vLLM documentation](https://docs.vllm.ai/en/latest/)
  Note: `/en/latest/` is the main-branch developer preview. Prefer the stable-release build when
  pinning docs to a version we actually run.

### Post-Training (Phase 9)

- [Training language models to follow instructions with human feedback — Ouyang et al. (2022)](https://arxiv.org/abs/2203.02155)
  InstructGPT. Use for: the SFT → reward model → RLHF pipeline as originally shipped.
- [LoRA — Hu et al. (2021)](https://arxiv.org/abs/2106.09685)
  Use for: the low-rank update, which weights get adapted, why the base stays frozen.
- [QLoRA — Dettmers et al. (2023)](https://arxiv.org/abs/2305.14314)
  Use for: NF4, double quantization, paged optimizers, and the memory arithmetic.
- [Direct Preference Optimization — Rafailov et al. (2023)](https://arxiv.org/abs/2305.18290)
  Use for: the derivation from the RLHF objective, why a frozen reference model is required, what
  beta controls.
- [Proximal Policy Optimization Algorithms — Schulman et al. (2017)](https://arxiv.org/abs/1707.06347)
  Use for: the clipped surrogate objective. We trace its components; we do not ship a full loop.
- [DeepSeekMath — Shao et al. (2024)](https://arxiv.org/abs/2402.03300)
  The GRPO paper. Use for: the group-relative objective and why it drops the value model.
- [Hugging Face TRL documentation](https://huggingface.co/docs/trl/index)
  Use for: the library comparison after each from-scratch implementation. Read it to find out what
  it abstracts away, not to skip the work.

### Distributed And Parallelism (Phases 11-12)

- [PyTorch Distributed Overview](https://docs.pytorch.org/tutorials/beginner/dist_overview.html)
  Use for: process groups, DDP mechanics, `torchrun`.
- [ZeRO: Memory Optimizations Toward Training Trillion Parameter Models — Rajbhandari et al. (2019)](https://arxiv.org/abs/1910.02054)
  Use for: what each ZeRO stage shards (optimizer state, gradients, parameters) and the memory math.
- [PyTorch FSDP: Experiences on Scaling Fully Sharded Data Parallel — Zhao et al. (2023)](https://arxiv.org/abs/2304.11277)
  Use for: FSDP's actual implementation and where it differs from DeepSpeed ZeRO.
- [Megatron-LM — Shoeybi et al. (2019)](https://arxiv.org/abs/1909.08053)
  Use for: column-parallel and row-parallel linear layers, and exactly where the all-reduces land in
  a tensor-parallel block.
- [GPipe — Huang et al. (2018)](https://arxiv.org/abs/1811.06965)
  Use for: pipeline bubbles and why microbatching shrinks them.

### Kernels (Phase 13)

- [Triton: An Intermediate Language and Compiler for Tiled Neural Network Computations — Tillet, Kung & Cox (2019)](https://www.eecs.harvard.edu/~htk/publication/2019-mapl-tillet-kung-cox.pdf)
  Author-hosted PDF. The ACM DOI (`10.1145/3315508.3329973`) is correct but paywalled and blocks
  automated access — use this link. Use for: the tiled programming model and what Triton gives you
  over raw CUDA.

## Wisdom (Communities)

Real skill is tested outside the learning environment. These are where a wrong mental model gets
caught by someone who is not being paid to be encouraging.

- [vLLM GitHub Discussions](https://github.com/vllm-project/vllm/discussions)
  Use for: inference and serving questions, once we have a specific reproducible one.
- [r/LocalLLaMA](https://reddit.com/r/LocalLLaMA)
  Use for: practical inference, quantization, and serving experience. High noise, high signal at the
  edges. Filter accordingly.
- **GPU MODE** (Discord, formerly CUDA MODE) — find the current invite; do not trust a stale link.
  Use for: kernel and profiling questions in Phase 13.
- **EleutherAI** (Discord) — find the current invite.
  Use for: training, architecture, and post-training questions from people who have actually run
  them at scale.

Rule: **attempt the answer first, then take the residual question to the community.** A question
that has not been narrowed to a reproducible case is not ready to be asked.

## Gaps

Areas the mission needs where no pinned source exists yet. These drive future search — fill them
before teaching the phase.

- **Tokenization / BPE (Phase 4)** — no primary source pinned yet. Need the original BPE paper
  (Sennrich et al.) and something concrete on byte-level BPE as GPT-2 actually implements it.
- **Chat templates and assistant-only masking (Phase 9a)** — mostly folklore and library code, not
  papers. Need a trustworthy reference for the loss-masking convention.
- **Reward hacking and verifier design (Phase 9b)** — the curriculum wants a reward-hacking demo but
  there is no pinned source on failure taxonomies.
- **Tool-calling formats (Phase 9c)** — vendor docs, not papers. Pin the current OpenAI and Anthropic
  tool-use specs when the phase arrives; they drift, so pin a dated version.
- **Evaluation beyond loss (Phase 10)** — need a source on repetition metrics and format-following
  evals that is better than "everyone does it this way."
