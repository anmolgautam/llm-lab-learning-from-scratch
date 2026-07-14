# LLM Lab Learning Curriculum

This document defines the roadmap for building a from-scratch LLM systems lab.

The goal is not to watch tutorials or copy an existing repo. The goal is to build the core LLM stack step by step, understand the tensor mechanics, run experiments, write notes, and produce a serious engineering artifact.

The *reason* for all of it — and the depth policy that decides how far each phase goes — lives in [`MISSION.md`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/MISSION.md). This file is the route; that file is the destination.

## North Star

By the end of this curriculum, I should be able to explain, implement, debug, and measure the major pieces of a modern decoder-only LLM system:

- pretraining data flow from raw text to batches
- tokenization and sequence construction
- next-token prediction and cross entropy
- minimal GPT architecture
- modern LLaMA-style architecture
- training loops, checkpoints, logging, and reproducibility
- attention variants such as MHA, MQA, GQA, sliding-window, sparse, and compressed attention approximations
- Mixture of Experts routing and load balancing
- inference with prefill, decode, KV cache, and sampling
- post-training with SFT, LoRA/QLoRA, DPO, PPO, GRPO, and RLHF-style pipelines
- evaluation beyond training loss
- distributed training principles, reliability, and cluster-aware training
- model parallelism principles including tensor, pipeline, and expert parallelism
- GPU kernel profiling and targeted Triton optimization
- practical familiarity with Hugging Face TRL, Accelerate, DeepSpeed or FSDP, and vLLM
- reward signal and verifier design for RL training
- chat templates, tool-calling formats, and agent-training failure modes

The intended outcome is a real learning lab:

```text
implemented + tested + trained + measured + explained
```

## Target Skill Profile

This curriculum should build toward the skill profile expected from a strong LLM post-training and systems engineer.

By the end, I should have practical evidence for:

- strong PyTorch fundamentals
- from-scratch SFT implementation
- LoRA and QLoRA fine-tuning
- DPO implementation and experiments
- PPO or PPO-style RLHF understanding
- GRPO implementation or faithful small-scale reproduction
- reward signal and verifier design
- chat template design and assistant-only loss masking
- OpenAI/Anthropic-style tool-calling formats
- common failure modes in agent training
- Hugging Face TRL familiarity
- Accelerate familiarity
- DeepSpeed or FSDP familiarity
- vLLM serving familiarity
- distributed training basics
- GPU profiling basics
- research-paper-to-code practice

The goal is not to only run existing libraries. The goal is:

```text
implement the core idea from scratch
then use the library version
then compare what the library abstracts away
```

## Curriculum Philosophy

The curriculum moves in layers. Each layer depends on the previous one.

We do not study MoE before understanding Transformer blocks. We do not study DPO before understanding next-token loss. We do not study KV cache before understanding causal attention.

Every module must produce evidence:

- a paper/notebook explanation
- working code
- correctness checks
- at least one experiment
- a written summary

## Progress Rule

Progress is a level, not a boolean. See `instructor.md` for the full definition.

```text
L0 unseen -> L1 explained -> L2 implemented -> L3 verified -> L4 retained -> L5 taught back
```

A module reaches **L3 (verified)** only when all five conditions are met:

1. I can explain the concept on paper.
2. I can implement the core mechanism in code.
3. The correctness checks pass.
4. I have run at least one meaningful experiment and interpreted it.
5. I have written a concise Markdown summary in my own words.

If any condition is missing, the module is not at L3.

A module reaches **L4 (retained)** — the actual mastery bar — only when its checks, having become
items in `review/deck.md`, are passed cold weeks later with nothing open. This can never be granted
on the day the concept was taught: same-day recall measures fluency, not memory. A failed deck item
demotes the module back to L3.

There is no deadline here, which means nothing external will ever test whether Phase 2 survived to
Phase 8. The deck is what replaces the exam.

Advance the curriculum at L3. Do not wait at L4 — retention accumulates behind you while you move.

## Repository Shape

The repo separates learning artifacts from implementation artifacts.

```text
llm-lab-learning-from-scratch/
  MISSION.md          # why: the compass, depth policy, out of scope
  curriculum.md       # route: this file
  instructor.md       # method: teaching contract, mastery levels, pacing
  progress.md         # curriculum state: where we are, at what level
  GLOSSARY.md         # canonical language
  RESOURCES.md        # trusted sources; grounding, not memory
  pytorch_notes.md    # just-in-time PyTorch reference

  learning-records/   # what the student actually knows (ADRs for understanding)
    0001-*.md

  review/
    deck.md           # spaced retrieval; the only path to L4

  reference/          # compressed cross-cutting cards; the layer that gets reopened
    shapes.md
    kv-cache-memory.md

  lessons/
    lesson_00_orientation/
      lesson.md
      lesson.ipynb
      exercises.md
      key_notes.md
      checks.md
      teaching_notes.md

  labs/
    week_01_minigpt/
      tinyseek/
      scripts/
      tests/
      configs/
      README.md

  reports/
    week_01_next_token_prediction.md

  runs/
    .gitkeep
```

`progress.md` tracks the curriculum. `learning-records/` tracks the student. They are separate files
because a module can sit "in progress" for months over an empty one — which is exactly what happened
before 2026-07-13.

Lab folders are numbered by sequence, not calendar. `week_NN` is an ordering label only — some phases (notably Phase 9) span several weeks. Do not treat one phase as one week.

### `lessons/`

Learning space. Contains explanations, scratchpad notebooks, exercises, revision notes, and pass/fail checks.

### `labs/`

Implementation space. Contains actual package code, scripts, tests, and configs.

### `reports/`

Experiment writeups. These explain what was run, what happened, and what the result means.

### `runs/`

Generated outputs from training and experiments. These should usually not be committed except for small selected artifacts.

## Standard Lesson Artifacts

Each lesson should contain:

```text
lesson.md       # main explanation and tensor-shape walkthrough
lesson.ipynb    # live scratchpad experiments
exercises.md    # tasks I must complete myself
key_notes.md    # compressed revision sheet
checks.md       # pass/fail criteria
teaching_notes.md # meta notes about what worked in the teaching process
```

The notebook is for exploration. Markdown is for cleaned understanding.

Pen and paper is used before code for diagrams, shapes, and memory-based explanations.

## Standard Lab Artifacts

Each lab should contain:

```text
tinyseek/       # reusable Python package code
scripts/        # runnable entry points
tests/          # correctness tests
configs/        # experiment configs
README.md       # how to run the lab
```

Labs should be runnable from the command line. They should not depend on hidden notebook state.

## Datasets And Reference Baselines

Concrete data choices keep the lab from drifting into abstract exploration. Use these defaults unless an experiment needs otherwise:

- TinyShakespeare: first overfit and character-level work (Phase 2)
- TinyStories: smallest dataset where a tiny model produces coherent English (Phases 3-5)
- Alpaca or a small UltraChat slice: SFT data (Phase 9a)
- UltraFeedback or a toy preference set: DPO data (Phase 9b)
- GSM8K-style math with an exact-match verifier: GRPO data (Phase 9b)

Reference baselines exist to debug against, never to copy:

- nanoGPT as a correctness oracle when a loss curve or generation looks wrong

Rule:

```text
Implement it yourself first. Use a reference only to explain a discrepancy, not to skip the work.
```

## Phase 0: Orientation And Setup

Goal: define the learning system and understand the full LLM stack map before implementation.

Topics:

- what this lab is trying to build
- how the repo is organized
- how lessons, labs, reports, and runs differ
- how progress is tracked
- how to use paper notes, notebooks, Markdown, code, and tests
- what counts as "done"

Deliverables:

- `curriculum.md`
- `instructor.md`
- `progress.md`
- `lessons/lesson_00_orientation/`
- `lessons/lesson_01_next_token_prediction/`
- `labs/week_01_minigpt/`

Exit criteria:

- I can explain the purpose of each repo area.
- I understand the module completion rule.
- The first two lesson folders and first lab folder exist.

## Phase 1: Next-Token Prediction

Goal: understand the objective that powers decoder-only language model pretraining.

Core ideas:

- tokens
- input/target shifting
- logits
- vocabulary dimension
- cross entropy
- teacher forcing
- autoregressive generation

Required tensor shapes:

```text
tokens: [N]
x:      [B, T]
y:      [B, T]
logits: [B, T, V]
loss:   scalar
```

Build:

- tiny token examples by hand
- input/target shift examples
- manual loss-shape walkthrough
- tiny notebook experiments

Checks:

- Given a token sequence, I can produce `x` and `y`.
- Given logits shape `[B, T, V]`, I can explain what each axis means.
- I can explain why random initial loss is near `ln(vocab_size)`.
- I can explain why generation can use a model trained with teacher forcing.

Deliverable:

- Lesson 01 notes and checks completed.

## Phase 2: Minimal Character-Level GPT

Goal: build the smallest working decoder-only Transformer that can overfit one batch.

Build:

- character tokenizer
- batch creation
- token embedding
- positional embedding
- causal self-attention
- multi-head attention
- feed-forward block
- residual connections
- layer normalization
- training loop
- generation loop
- checkpoint save/load

Checks:

- tokenizer encode/decode roundtrip works
- `get_batch` returns `x, y` with shape `[B, T]`
- `y` is `x` shifted by one token
- model forward returns logits `[B, T, V]`
- one-batch overfit succeeds
- generated text resembles the overfit batch
- causal masking prevents future-token leakage

Experiments:

- overfit one batch
- train briefly on a small text corpus
- vary context length
- vary model size

Deliverable:

- `labs/week_01_minigpt/` with working training and generation scripts
- `reports/week_01_next_token_prediction.md`

## Phase 3: Serious Training Loop

Goal: turn a prototype training script into a reusable training system.

Build:

- config-driven training
- AdamW optimizer
- learning-rate warmup
- cosine decay
- gradient clipping
- gradient accumulation
- train/validation split
- evaluation loop
- checkpoint save/resume
- metrics logging
- sample generation during training
- tokens/sec logging
- mixed precision (bf16/fp16 autocast plus gradient scaling)
- fp32 softmax/cross-entropy for numerical stability
- perplexity metric
- repetition score

Checks:

- checkpoint resume works
- same seed produces reproducible behavior within expected limits
- validation loss is computed without gradients
- gradient accumulation preserves effective batch-size logic
- overfit-batch test still works after refactor
- mixed precision run has no NaNs and matches fp32 within tolerance
- perplexity is computed correctly from validation loss

Experiments:

- constant LR vs warmup plus cosine
- with vs without gradient clipping
- small batch vs gradient accumulation
- high learning-rate failure case
- fp32 vs bf16/fp16 training stability and speed

Deliverable:

- reusable trainer and report on training stability.

## Phase 4: Data Pipeline And Tokenizer

Goal: understand how raw pretraining text becomes model-ready token batches.

Build:

- raw text loader
- cleaning pipeline
- document splitting
- train/validation split
- simple BPE tokenizer
- encode/decode
- tokenizer save/load
- binary token shards
- memory-mapped dataloader
- sequence packing
- document separator token

Checks:

- encode/decode roundtrip works on sample text
- train/validation split avoids obvious leakage
- token shards can be loaded without parsing raw text
- mmap dataset returns correct shapes
- packing does not corrupt targets

Experiments:

- character tokenizer vs BPE
- vocab size comparison
- packed vs non-packed batches
- sequence length comparison

Deliverable:

- raw data to token shards pipeline.

## Phase 5: Modern LLaMA-Style Architecture

Goal: upgrade the baseline GPT into a modern decoder-only architecture.

Build:

- RMSNorm
- RoPE
- SwiGLU
- pre-norm Transformer block
- weight tying
- PyTorch SDPA path
- parameter counting
- rough FLOPs estimate

Checks:

- RoPE applies to query/key, not value
- RMSNorm output shape matches input shape
- SwiGLU hidden dimensions are correct
- logits shape remains `[B, T, V]`
- SDPA path matches manual attention on tiny examples

Experiments:

- learned positional embedding vs RoPE
- LayerNorm vs RMSNorm
- GELU MLP vs SwiGLU
- manual attention vs SDPA

Deliverable:

- clean mini-LLaMA implementation.

## Phase 6: Attention Zoo

Goal: understand attention as a design space, not one fixed layer.

Build:

- MHA
- SDPA/Flash-style exact attention path
- MQA
- GQA
- sliding-window attention
- block-sparse attention
- dilated/strided attention
- MLA (Multi-head Latent Attention, DeepSeek-V2/V3) as the compressed-KV example
- optional NSA (Native Sparse Attention) as the hardware-aligned sparse example
- hybrid local plus compressed attention (sliding-window plus MLA)

Definitions:

- FlashAttention is an efficient exact attention kernel strategy.
- MQA/GQA reduce KV heads and KV-cache memory.
- Sliding-window attention limits attention to local context.
- Sparse attention selects a subset of positions or blocks.
- MLA compresses keys/values into a low-rank latent vector, shrinking the KV cache while keeping multi-head expressiveness.
- NSA (optional) is a hardware-aligned, natively trainable sparse attention that selects and compresses blocks of context.

Checks:

- all attention modules preserve expected shapes
- causal masking works
- future-token leakage test passes
- MQA/GQA KV-cache shapes are correct
- KV-cache decode matches full forward on tiny examples
- MLA latent KV cache is smaller than MHA/GQA and decode still matches full forward on tiny examples
- sliding attention fails expected long-range retrieval cases

Experiments:

- speed benchmark
- memory benchmark
- KV-cache size comparison
- synthetic needle retrieval
- long-context copy task

Deliverable:

- attention zoo with benchmark report.

## Phase 7: Mixture Of Experts

Goal: understand sparse expert routing and why MoE is both a modeling and systems problem.

Build:

- dense FFN baseline
- top-1 MoE
- top-2 MoE
- router logits
- token dispatch
- expert combine
- capacity factor
- load balancing loss
- optional router z-loss
- optional shared expert
- expert usage metrics

Checks:

- router probabilities are valid
- top-k routing selects expected experts on toy logits
- expert outputs combine correctly
- load-balancing loss changes expert usage
- router collapse can be demonstrated

Experiments:

- dense vs MoE with same activated parameters
- dense vs MoE with same total parameters
- top-1 vs top-2 routing
- load balancing on vs off
- number of experts comparison

Deliverable:

- mini MoE Transformer block and routing report.

## Phase 8: Inference Systems

Goal: understand why inference is a separate system from training.

Build:

- prefill
- decode
- KV cache
- MHA KV cache
- GQA KV cache
- MQA KV cache
- temperature sampling
- top-k sampling
- top-p sampling
- batched generation
- streaming generation
- minimal FastAPI SSE endpoint
- vLLM smoke test with a small open model
- OpenAI-compatible local serving endpoint
- basic tool-calling response format parser

Checks:

- KV-cache decode matches full forward logits on tiny examples
- cache shape is correct for MHA/GQA/MQA
- top-k and top-p filters behave as expected
- streaming generation yields tokens incrementally
- vLLM server returns completions for a small model
- OpenAI-compatible endpoint schema is understood
- tool-call JSON/XML format is parsed and validated

Experiments:

- full forward generation vs KV-cache generation
- MHA vs GQA vs MQA cache memory
- prefill latency vs prompt length
- decode tokens/sec
- batch size vs throughput
- custom mini server vs vLLM qualitative architecture comparison

Deliverable:

- mini inference engine and benchmark report.

## Phase 9: Post-Training

Goal: understand how a base model becomes assistant-like and how modern LLM post-training pipelines are built.

This is the largest phase, so it is split into three sub-phases done in dependency order: supervised fine-tuning first, then preference/RL optimization, then tool-calling and agents.

### Phase 9a: Supervised Fine-Tuning And Adapters

Goal: turn a base model into an instruction follower and learn parameter-efficient fine-tuning.

Build:

- chat template
- SFT dataset format
- assistant-only loss masking
- SFT training loop
- LoRA adapter implementation
- QLoRA concept reproduction with low-bit loading (cloud GPU, since bitsandbytes is CUDA-only)
- Hugging Face TRL SFT comparison
- Accelerate-based training script

Checks:

- assistant-only mask is correct
- SFT loss is computed only where intended
- LoRA updates adapter weights while base weights stay frozen
- QLoRA memory tradeoff is explained even if the full run is hardware-limited
- TRL SFT run is compared against the from-scratch implementation

Experiments:

- base vs SFT behavior
- SFT with vs without assistant-only masking
- full fine-tuning vs LoRA
- LoRA rank comparison

Deliverable:

- tiny base model to tiny instruction-tuned model pipeline.

### Phase 9b: Preference And RL Optimization

Goal: understand preference optimization and verifiable-reward RL.

GRPO is the real RL implementation in this lab because it has no value model and works well with verifiable rewards. Full from-scratch PPO is deliberately demoted: it is the most failure-prone objective here, so we trace and log its components rather than ship a brittle full implementation.

Build:

- preference pair dataset
- DPO loss (from scratch)
- frozen reference model
- GRPO-style group-relative objective on a verifiable toy task
- PPO objective trace: identify and log each component (no full from-scratch loop required)
- reward function interface
- rule-based verifier interface
- model-judged reward interface
- rubric-guided reward example
- Hugging Face TRL DPO comparison
- simple preference evaluation

Checks:

- DPO chosen/rejected logprobs are correct
- reference model is frozen
- DPO loss decreases on a tiny controlled dataset
- GRPO group-relative rewards are computed correctly on toy samples
- PPO objective components are identified and logged
- reward/verifier outputs are deterministic where intended
- TRL DPO run is compared against the from-scratch implementation

Experiments:

- SFT vs DPO behavior
- DPO beta sensitivity
- DPO vs GRPO on a toy verifiable setup
- GRPO on math/verifiable toy tasks
- reward hacking demonstration
- verifier strictness comparison

Deliverable:

- preference and RL report covering DPO, GRPO, PPO objective concepts, and reward/verifier design.

### Phase 9c: Tool-Calling And Agents

Goal: understand tool-calling data formats and agent-training failure modes.

Build:

- tool-calling dataset format
- OpenAI-style tool call format
- Anthropic-style tool use format
- agent trajectory format

Checks:

- tool-call format validates against schema
- agent trajectory parser preserves actions, observations, and final answer

Experiments:

- tool-call format-following evaluation
- agent failure-mode analysis

Deliverable:

- tool-calling and agent-format report covering schemas, parsers, and a failure taxonomy.

## Phase 10: Evaluation And Capstone

Goal: measure behavior, document tradeoffs, and turn the repo into a serious artifact.

Build:

- perplexity eval
- overfit-batch test
- repetition score
- format-following eval
- instruction-following eval
- chat-template correctness eval
- tool-call schema eval
- agent trajectory eval
- reward-model/verifier agreement eval
- preference win-rate eval
- needle retrieval eval
- copy task
- attention benchmark suite
- KV-cache equivalence test suite

Checks:

- eval scripts are runnable from CLI
- benchmark configs are saved
- selected results are written to reports
- README explains what is implemented and what is simplified
- reward/verifier eval includes known positive and negative examples
- tool-call eval catches malformed calls
- agent eval records failure categories, not just pass/fail

Deliverable:

- final capstone report.

## Phase 11: Distributed Training And Reliability

Goal: understand the moat-level engineering principles behind reliable scaled training.

This phase is not about training a frontier model. It is about learning the machinery that makes frontier training possible:

- many processes
- many devices
- data sharding
- gradient synchronization
- checkpoint/restart
- fault tolerance
- throughput measurement
- memory sharding
- rank-aware logging
- failure recovery

The budget-conscious version is:

```text
small model + small dataset + real distributed machinery
```

That is enough to learn the principles without wasting money on large runs.

Build:

- `torchrun` single-node training
- single-node DDP
- optional two-node DDP on rented GPUs
- Accelerate launch workflow
- process group initialization
- rank, local rank, and world size handling
- distributed sampler
- rank-aware logging
- rank-aware checkpointing
- checkpoint resume after interruption
- gradient accumulation with DDP
- mixed precision with DDP
- global batch-size calculation
- throughput measurement
- GPU utilization logging
- basic communication-overhead measurement
- failure simulation
- basic FSDP experiment
- DeepSpeed ZeRO smoke test
- optional DeepSpeed ZeRO comparison if the core PyTorch version is understood first

Key concepts:

- process vs device
- global rank vs local rank
- world size
- data parallelism
- gradient synchronization
- all-reduce
- distributed data sharding
- global batch size
- effective batch size
- communication overhead
- stragglers
- checkpoint consistency
- optimizer state memory
- parameter sharding
- activation memory
- fault tolerance

Checks:

- single-GPU and DDP losses match on a tiny controlled run within expected tolerance
- each rank receives different data
- every sample is covered correctly across ranks
- only rank 0 writes normal logs
- checkpoints include enough state to resume correctly
- resume works after a simulated interruption
- global batch-size math is correct
- gradient accumulation works correctly with DDP synchronization
- throughput is measured in tokens/sec
- multi-GPU speedup or lack of speedup is explained
- FSDP memory behavior is measured on a small model
- Accelerate config is understood, not treated as magic
- DeepSpeed/FSDP memory-saving mechanism is explained

Experiments:

- 1 GPU vs 2 GPU DDP
- batch size scaling
- gradient accumulation vs more GPUs
- checkpoint interval tradeoff
- single-node DDP vs two-node DDP if budget allows
- on-demand instance vs spot interruption recovery
- DDP vs FSDP memory behavior
- DDP vs Accelerate workflow comparison
- FSDP vs DeepSpeed ZeRO concept comparison
- dataloader bottleneck experiment
- communication overhead experiment with tiny vs larger model

RunPod or cloud budget strategy:

- do most development locally or on one cheap GPU
- rent GPUs only for targeted distributed experiments
- use short runs measured in minutes or a few hours
- prefer small models and small datasets
- use persistent storage for checkpoints
- practice interruption recovery deliberately
- record cost, runtime, GPU type, and tokens/sec for each cloud experiment

Deliverable:

- `labs/week_11_distributed_training/`
- `reports/week_11_distributed_training_reliability.md`

Minimum serious outcome:

- I can explain how DDP works.
- I can run a small model with `torchrun`.
- I can verify that ranks see different data.
- I can resume from a distributed checkpoint.
- I can explain why multi-GPU training may fail to scale.
- I can describe when FSDP/ZeRO-style sharding becomes necessary.

Advanced outcome:

- I can run a two-node DDP job.
- I can recover from simulated interruption.
- I can produce a throughput and reliability report.
- I can explain the difference between model correctness bugs, distributed synchronization bugs, and infrastructure failures.

## Phase 12: Model Parallelism

Goal: understand how training changes when the model itself no longer fits comfortably on one device.

This phase comes after DDP/FSDP because tensor parallelism and pipeline parallelism are more intrusive than data parallelism. They change how layers are implemented and how intermediate activations move across devices.

Build:

- toy column-parallel linear layer
- toy row-parallel linear layer
- tensor-parallel MLP block
- tensor-parallel attention head splitting
- all-reduce, all-gather, and reduce-scatter examples
- toy Megatron-style Transformer block
- basic pipeline-parallel schedule simulation
- microbatching for pipeline parallelism
- expert parallelism overview for MoE
- communication-volume calculations

Key concepts:

- data parallelism vs tensor parallelism
- parameter sharding vs layer sharding
- column-parallel linear
- row-parallel linear
- attention-head parallelism
- sequence parallelism at a high level
- pipeline stages
- pipeline bubbles
- microbatching
- expert parallelism
- communication/computation tradeoff

Checks:

- toy column-parallel linear matches normal linear output
- toy row-parallel linear matches normal linear output
- tensor-parallel MLP matches dense MLP on tiny inputs
- split attention heads recombine correctly
- collectives are used for the correct reason
- pipeline schedule is explained with a diagram
- communication costs are estimated for at least one layer

Experiments:

- normal linear vs toy tensor-parallel linear
- communication overhead with small vs larger hidden sizes
- pipeline bubble simulation with different microbatch counts
- expert parallel dispatch sketch for MoE tokens

Deliverable:

- `labs/week_12_model_parallelism/`
- `reports/week_12_model_parallelism.md`

Minimum serious outcome:

- I can explain why DDP is not enough when the model is too large.
- I can explain column-parallel and row-parallel linear layers.
- I can describe where communication happens in tensor-parallel attention and MLPs.
- I can explain pipeline bubbles and why microbatching helps.
- I can explain why expert parallelism matters for MoE.

## Phase 13: GPU Kernels And Triton

Goal: understand how PyTorch operations map to GPU kernels and when custom kernels matter.

This phase comes after model correctness, inference, and distributed basics. Kernel work should answer a measured bottleneck, not replace foundational understanding.

Build:

- profiling with `torch.profiler`
- GPU timing with warmup and synchronization
- naive PyTorch RMSNorm benchmark
- Triton RMSNorm kernel
- naive PyTorch elementwise kernel comparison
- simple Triton elementwise kernel
- optional simple Triton matmul exploration
- RoPE benchmark and optional Triton RoPE kernel
- sampling benchmark
- attention benchmark comparing manual attention, PyTorch SDPA, and Flash-style implementations when available

Key concepts:

- Python orchestration vs GPU execution
- kernel launch overhead
- memory bandwidth
- arithmetic intensity
- fusion
- global memory reads/writes
- shared memory at a high level
- occupancy at a high level
- CUDA vs Triton vs PyTorch ops
- why FlashAttention is an exact attention kernel strategy, not a new attention pattern

Checks:

- Triton outputs match PyTorch outputs within tolerance
- benchmarks use warmup
- benchmarks synchronize before timing
- speedup claims include tensor sizes and hardware
- memory movement is explained
- profiler output is interpreted correctly

Experiments:

- PyTorch RMSNorm vs Triton RMSNorm
- fused vs unfused elementwise operations
- manual attention vs SDPA
- sequence length impact on attention memory/time
- RoPE implementation variants
- sampling bottleneck exploration

Deliverable:

- `labs/week_13_gpu_kernels/`
- `reports/week_13_gpu_kernels_triton.md`

Minimum serious outcome:

- I can read a profiler trace and identify bottlenecks.
- I can explain why some PyTorch code is slow even if it is mathematically correct.
- I can write a small Triton kernel that matches PyTorch.
- I can benchmark kernels honestly.
- I can explain when custom kernels are worth it and when they are premature.

## Capstone Questions

By the end, I should be able to answer these without handwaving:

- How does raw text become training batches?
- Why do we shift inputs and targets?
- What does cross entropy optimize in next-token prediction?
- What exactly does causal masking prevent?
- How do Q, K, and V shapes change across heads?
- How do MHA, MQA, and GQA differ?
- Why does KV cache change inference complexity?
- Why is prefill different from decode?
- Why does sliding attention fail long-distance retrieval?
- What do compressed attention variants approximate?
- Why can MoE increase total capacity without activating all parameters?
- Why does MoE routing collapse?
- Why does load balancing matter?
- What is assistant-only masking?
- How do LoRA and QLoRA change fine-tuning memory and trainable parameters?
- Why does DPO need a reference model?
- How do PPO and GRPO differ from DPO?
- What makes a reward signal useful instead of exploitable?
- What is a verifier, and when is it better than a learned reward model?
- How do chat templates affect loss masking and generation behavior?
- What are common failure modes in agent post-training?
- How do OpenAI-style and Anthropic-style tool-calling formats structure tool use?
- Why is train loss not enough to evaluate model behavior?
- What changes when training moves from one process to many processes?
- What does DDP synchronize, and when?
- How do rank, local rank, and world size differ?
- Why must data be sharded across ranks?
- What must be saved for a reliable distributed checkpoint?
- Why can adding GPUs fail to improve throughput?
- When do FSDP or ZeRO-style approaches become necessary?
- What does Accelerate abstract away?
- What does DeepSpeed ZeRO shard?
- What does vLLM optimize for inference?
- What kinds of failures happen in real cluster training?
- Why is tensor parallelism more intrusive than DDP?
- How do column-parallel and row-parallel linear layers work?
- Where does communication happen in a tensor-parallel Transformer block?
- What are pipeline bubbles, and why does microbatching reduce them?
- Why does expert parallelism matter for MoE?
- What is a GPU kernel?
- Why is Python not doing the actual matrix multiplication in PyTorch?
- What is kernel fusion?
- Why does memory bandwidth often dominate LLM inference?
- What does Triton provide compared with raw CUDA?
- Why is FlashAttention a kernel strategy rather than a new attention pattern?

## What Is Intentionally Out Of Scope Initially

These are important, but they come after the first complete lab:

- production CUDA or Triton kernels
- production paged-attention engine implementation like vLLM
- trillion-token data pipeline
- full RLHF/RLAIF stack
- large benchmark suites such as MMLU, HELM, or SWE-bench

The distinction is:

```text
In scope: understand and practice the principles at small scale.
Out of scope initially: reproduce frontier-scale production infrastructure.
```

The first target is not GPT-5.5-scale infrastructure. The first target is a correct, measured, from-scratch LLM systems lab that can later grow into serious distributed systems work.
