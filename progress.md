# LLM Lab Progress

This file tracks learning progress, implementation progress, blockers, and teaching-system observations.

Curriculum: [`curriculum.md`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/curriculum.md)  
Instructor guide: [`instructor.md`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/instructor.md)

## Current State

```text
Current phase: Phase 1 - Next-Token Prediction
Current lesson: lesson_01_next_token_prediction
Current lab: week_01_minigpt (scaffold only)
Status: scaffold complete; teaching Phase 1 (next-token prediction)
Last updated: 2026-05-22
```

## Active Next Action

Work through Lesson 01 (next-token prediction): intuition → cross-entropy → tensor
shapes → one loss by hand → notebook checks. Fill the notes in
`lessons/lesson_01_next_token_prediction/` and tick its `checks.md`.

## Completion Standard

A module is complete only when all conditions are met:

- paper explanation is done
- implementation works
- checks pass
- at least one experiment ran
- Markdown summary is written
- review questions are answered
- progress file is updated

## Module Status

| Phase | Module | Runs on | Status | Evidence | Notes |
| --- | --- | --- | --- | --- | --- |
| 0 | Orientation And Setup | local | complete | repo scaffold: `lessons/`, `labs/week_01_minigpt/`, `reports/`, `runs/` | Lesson/lab folders scaffolded 2026-05-22 |
| 1 | Next-Token Prediction | local (MPS) | in progress | `lessons/lesson_01_next_token_prediction/` (scaffold) | Teaching now |
| 2 | Minimal Character-Level GPT | local (MPS) | not started | none | First lab |
| 3 | Serious Training Loop | local (MPS) | not started | none | Requires mini GPT |
| 4 | Data Pipeline And Tokenizer | local (MPS) | not started | none | Requires basic training loop |
| 5 | LLaMA-Style Architecture | local (MPS) | not started | none | Requires baseline GPT |
| 6 | Attention Zoo | local (MPS) | not started | none | Requires architecture fluency; includes MLA |
| 7 | Mixture Of Experts | local (MPS) | not started | none | Requires Transformer block fluency |
| 8 | Inference Systems | local + cloud | not started | none | vLLM / OpenAI-endpoint parts need a cloud GPU |
| 9a | SFT And Adapters | local (+cloud for QLoRA) | not started | none | Requires base model and training loop |
| 9b | Preference And RL | local | not started | none | DPO + GRPO; PPO is a traced objective |
| 9c | Tool-Calling And Agents | local | not started | none | Formats, parsers, failure taxonomy |
| 10 | Evaluation And Capstone | local | not started | none | Requires previous modules |
| 11 | Distributed Training And Reliability | cloud (multi-GPU) | not started | none | Targeted short rented-GPU runs |
| 12 | Model Parallelism | local toy / cloud real | not started | none | Toy linear layers run local; real multi-device needs cloud |
| 13 | GPU Kernels And Triton | cloud (NVIDIA) | not started | none | Triton is CUDA-only |

## Target Skill Matrix

This table tracks role-aligned skills we want evidence for.

| Skill | Status | Required Evidence |
| --- | --- | --- |
| PyTorch fundamentals | not started | implement model, training loop, tests, and debugging notes |
| Tokenization | not started | char tokenizer, BPE tokenizer, encode/decode tests |
| Attention | not started | MHA/MQA/GQA/sliding/sparse implementations and tests |
| Chat templates | not started | template implementation, assistant-only mask test |
| SFT | not started | from-scratch SFT loop and TRL comparison |
| LoRA | not started | adapter implementation, frozen-base test, rank experiment |
| QLoRA | not started | memory tradeoff explanation and small run if hardware allows |
| DPO | not started | from-scratch DPO loss, reference model, beta experiment |
| PPO | not started | toy PPO-style RLHF loop or faithful objective walkthrough |
| GRPO | not started | toy group-relative objective on verifiable task |
| RLHF concepts | not started | reward model/verifier pipeline and report |
| Reward signal design | not started | at least two reward functions plus reward hacking demo |
| Verifier design | not started | rule-based verifier with positive/negative test cases |
| Tool-calling formats | not started | OpenAI/Anthropic-style schemas and parser tests |
| Agent training failure modes | not started | failure taxonomy and small eval report |
| Hugging Face TRL | not started | SFT/DPO run compared with from-scratch version |
| Accelerate | not started | launch workflow and config explanation |
| DeepSpeed or FSDP | not started | memory-sharding experiment or smoke test |
| vLLM | not started | cloud serving smoke test and architecture comparison |
| Distributed training | not started | DDP run, rank/data checks, checkpoint resume |
| GPU profiling | not started | profiler trace, bottleneck analysis, benchmark report |
| Research paper to code | not started | one paper mechanism implemented with notes and tests |

## Current Blockers

No technical blockers yet.

## Weak Areas To Watch

These are expected weak areas until proven otherwise:

- tensor shape fluency in attention
- loss-shape reasoning
- train/validation leakage
- causal masking correctness
- debugging from evidence instead of guessing
- reward hacking and verifier design
- tool-call schema correctness
- library abstraction blindness with TRL/Accelerate/DeepSpeed/vLLM
- distributed rank/world-size mental model
- honest benchmarking discipline

## Mastered Areas

Nothing marked mastered yet.

Mastery requires:

- clean explanation
- working code
- passing checks
- experiment evidence
- review answers

## Session Log

### 2026-04-26

Created the initial learning system:

- `curriculum.md`
- `instructor.md`
- `progress.md`

Decisions:

- Use a layered curriculum from next-token prediction to GPU kernels.
- Separate learning artifacts from implementation artifacts.
- Add `teaching_notes.md` per lesson to capture future SaaS/product insights.
- Track progress by evidence, not calendar time.

Next:

- scaffold Lesson 00, Lesson 01, Week 01 lab, `reports/`, and `runs/`.

### 2026-05-20

Reviewed the curriculum with the instructor and applied targeted revisions:

- Dropped a standalone PyTorch phase in favor of just-in-time PyTorch (preflight step per lesson) plus a running `pytorch_notes.md` glossary.
- Split Phase 9 into 9a (SFT/LoRA/QLoRA), 9b (DPO/GRPO, PPO as a traced objective), and 9c (tool-calling/agents).
- Replaced the vague toy HCA/CSA attention with MLA (and optional NSA) in Phase 6.
- Pinned datasets (TinyShakespeare, TinyStories, Alpaca/UltraChat, UltraFeedback, GSM8K) and nanoGPT as a debug-only reference.
- Pulled mixed precision and eval primitives (perplexity, repetition) forward into Phase 3.
- Added a local-vs-cloud map and a budget earmark; clarified that `week_NN` is sequence, not calendar.

Decisions:

- Hardware: Mac (MPS) primary, occasional rented NVIDIA GPU for cloud-only phases.
- Background: new to PyTorch, so PyTorch is taught on demand inside each lesson.
- Goal: deep skill-building, no deadline; do the full 13 phases properly.

Next:

- scaffold Lesson 00, Lesson 01, Week 01 lab, `reports/`, and `runs/`, then begin Phase 1 with a just-in-time PyTorch preflight.

### 2026-05-22

Set up git versioning (baseline commit on `main`) and scaffolded the lesson/lab structure:

- `lessons/lesson_00_orientation/` and `lessons/lesson_01_next_token_prediction/` with the six standard artifacts each (`lesson.md`, `lesson.ipynb`, `exercises.md`, `key_notes.md`, `checks.md`, `teaching_notes.md`).
- `labs/week_01_minigpt/` with `tinyseek/`, `scripts/`, `tests/`, `configs/`, `README.md`.
- `reports/` and `runs/` placeholders.

Phase 0 complete (scaffold exists). Began Phase 1 teaching: next-token prediction.

Next:

- finish Lesson 01 units (intuition → cross-entropy → shapes → paper loss → checks), then move to Phase 2 (minimal char-level GPT).

## Teaching-System Observations

These observations are about the future instructor-led SaaS/product direction.

### Working Hypotheses

- A strong LLM-led upskilling system should force artifacts, not passive reading.
- The student should predict before running code.
- Checks prevent false confidence better than explanations alone.
- One idea at a time is necessary for deep technical learning.
- Markdown notes and paper diagrams serve different purposes.
- The instructor should scaffold structure, but the student should implement core logic.

### Patterns To Test

- Does paper-first shape drawing reduce coding confusion?
- Do explicit checks improve retention?
- Does `teaching_notes.md` capture enough product insight?
- How much skeleton code is optimal before it becomes over-helping?
- How often should review questions be asked?

### Confusion Log

No learner confusion logged yet.

### Teaching Adjustments

No adjustments yet.

## Cloud Budget Notes

Budget target for advanced systems experiments:

```text
$100-200 total
```

Use budget only for targeted experiments:

- short single-GPU runs
- short two-GPU or two-node DDP labs
- checkpoint/restart tests
- throughput measurements
- optional FSDP experiment

Rough earmark of the $100-200 across phases:

- Phase 8: vLLM + QLoRA smoke tests (~$15-30)
- Phase 9a: one QLoRA fine-tune run (~$10-20)
- Phase 11: single-node 2-GPU DDP + FSDP memory experiment (~$25-50)
- Phase 11 (optional): two-node DDP + interruption recovery (~$20-40)
- Phase 13: Triton kernel benchmarking on one NVIDIA GPU (~$15-30)

Avoid:

- long pretraining runs
- large model experiments without a clear question
- expensive instances before local correctness is proven

Every cloud run should record:

- provider
- GPU type
- number of GPUs
- runtime
- cost estimate
- model size
- batch size
- sequence length
- tokens/sec
- result
