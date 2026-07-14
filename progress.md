# LLM Lab Progress

This file tracks the state of the **curriculum**: where we are, what has been evidenced, and at what
mastery level. It does not track what the student knows — that lives in `learning-records/`, and it
is the file that decides what gets taught next.

Mission: [`MISSION.md`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/MISSION.md)
Curriculum: [`curriculum.md`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/curriculum.md)
Instructor guide: [`instructor.md`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/instructor.md)
Review deck: [`review/deck.md`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/review/deck.md)

## Current State

```text
Current phase: Phase 1 - Next-Token Prediction
Current lesson: lessons/lesson_01_next_token_prediction (scaffold; nothing taught yet)
Current lab:    labs/week_01_minigpt (scaffold)
Cadence:        most days, 1-2 hours
Status:         resumed in strict dependency order after the interview track was retired
Last updated:   2026-07-13
```

## Active Next Action

Teach Lesson 01 for real. It is currently an empty skeleton — the prose, the worked example, and the
derivation are all unwritten.

Sequence, one unit at a time with a question between each:

1. PyTorch preflight: integer indexing/slicing, `softmax` over the vocab axis, `F.cross_entropy` and
   its `[B*T, V]` vs `[B*T]` shape contract, broadcasting.
2. Intuition for next-token prediction, before any formula.
3. Input/target shifting by hand on a tiny sequence.
4. Cross-entropy derived from first principles, not stated.
5. Why initial loss is near `ln(V)` — derived, not asserted.
6. Why teacher forcing produces a model that works autoregressively.
7. Pass the Lesson 01 checks, then promote them into `review/deck.md`.

## Mastery Levels

```text
L0 unseen -> L1 explained -> L2 implemented -> L3 verified -> L4 retained -> L5 taught back
```

**L3 (verified)** requires: paper explanation, working implementation, passing checks, one
interpreted experiment, a written summary, answered review questions, checks promoted into the deck,
and this file updated.

**L4 (retained)** requires a cold, delayed retrieval via `review/deck.md`. It cannot be granted on
the day a concept is taught, and a failed deck item demotes L4 back to L3.

Advance the curriculum at L3. Do not stall waiting for L4 — the deck collects it behind you.

## Module Status

| Phase | Module | Runs on | Level | Evidence | Notes |
| --- | --- | --- | --- | --- | --- |
| 0 | Orientation And Setup | local | L3 | repo scaffold: `lessons/`, `labs/week_01_minigpt/`, `reports/`, `runs/`, teaching system | Scaffolded 2026-05-22; teaching system rebuilt 2026-07-13 |
| 1 | Next-Token Prediction | local (MPS) | L0 | none — lesson files are empty skeletons | **Active.** Teaching starts here |
| 2 | Minimal Character-Level GPT | local (MPS) | L0 | none | First real lab |
| 3 | Serious Training Loop | local (MPS) | L0 | none | Requires mini GPT |
| 4 | Data Pipeline And Tokenizer | local (MPS) | L0 | none | Requires basic training loop |
| 5 | LLaMA-Style Architecture | local (MPS) | L0 | none | Requires baseline GPT |
| 6 | Attention Zoo | local (MPS) | L0 | none | Requires architecture fluency; includes MLA |
| 7 | Mixture Of Experts | local (MPS) | L0 | none | Requires Transformer block fluency |
| 8 | Inference Systems | local + cloud | L0 (previewed) | `lessons/interview_ai_runtime_inference/` — written, never checked | **Previewed, not earned.** See LR-0001. Re-derive against a model we built |
| 9a | SFT And Adapters | local (+cloud for QLoRA) | L0 | none | Requires base model and training loop |
| 9b | Preference And RL | local | L0 | none | DPO + GRPO; PPO is a traced objective |
| 9c | Tool-Calling And Agents | local | L0 | none | Formats, parsers, failure taxonomy |
| 10 | Evaluation And Capstone | local | L0 | none | Requires previous modules |
| 11 | Distributed Training And Reliability | cloud (multi-GPU) | L0 | none | Targeted short rented-GPU runs |
| 12 | Model Parallelism | local toy / cloud real | L0 | none | Toy linear layers run local; real multi-device needs cloud |
| 13 | GPU Kernels And Triton | cloud (NVIDIA) | L0 | none | Triton is CUDA-only; shallow-but-real per `MISSION.md` |

## Target Skill Matrix

Role-aligned skills, at the depth `MISSION.md` calls for. Mastery is L4 — retained cold, weeks
later — not "the checks passed once."

| Skill | Depth | Level | Required Evidence |
| --- | --- | --- | --- |
| PyTorch fundamentals | deep | L0 | implement model, training loop, tests, and debugging notes |
| Tokenization | deep | L0 | char tokenizer, BPE tokenizer, encode/decode tests |
| Attention | deep | L0 | MHA/MQA/GQA/sliding/sparse/MLA implementations and tests |
| Chat templates | deep | L0 | template implementation, assistant-only mask test |
| SFT | deep | L0 | from-scratch SFT loop and TRL comparison |
| LoRA | deep | L0 | adapter implementation, frozen-base test, rank experiment |
| QLoRA | working | L0 | memory tradeoff explanation and small run if hardware allows |
| DPO | deep | L0 | from-scratch DPO loss, reference model, beta experiment |
| PPO | working | L0 | faithful objective walkthrough with each component logged |
| GRPO | deep | L0 | toy group-relative objective on verifiable task |
| RLHF concepts | working | L0 | reward model/verifier pipeline and report |
| Reward signal design | deep | L0 | at least two reward functions plus reward hacking demo |
| Verifier design | deep | L0 | rule-based verifier with positive/negative test cases |
| Inference: prefill/decode/KV cache | deep | L0 | cached decode matches full forward; cache memory derived by hand |
| Sampling and batching | deep | L0 | top-k/top-p correctness, batch size vs throughput curve |
| Tool-calling formats | working | L0 | OpenAI/Anthropic-style schemas and parser tests |
| Agent training failure modes | working | L0 | failure taxonomy and small eval report |
| Hugging Face TRL | working | L0 | SFT/DPO run compared with from-scratch version |
| Accelerate | working | L0 | launch workflow and config explanation |
| DeepSpeed or FSDP | working | L0 | memory-sharding experiment or smoke test |
| vLLM | working | L0 | cloud serving smoke test and architecture comparison |
| Distributed training (DDP) | deep | L0 | DDP run, rank/data checks, checkpoint resume |
| Model parallelism | working | L0 | toy column/row-parallel linear matching dense, pipeline bubble sim |
| GPU profiling | shallow-but-real | L0 | profiler trace, bottleneck analysis, honest benchmark report |
| Triton kernels | shallow-but-real | L0 | one kernel matching PyTorch within tolerance, benchmarked honestly |
| Research paper to code | deep | L0 | one paper mechanism implemented with notes and tests |

## What The Student Actually Knows

Not tracked here. See [`learning-records/`](/Users/anmolgautam/Documents/learning/llm-lab-learning-from-scratch/learning-records/).

Current records:

- **LR-0001** — mission shifted from interview prep to mastery; Phase 8 is previewed, not earned.
- **LR-0002** — new to PyTorch; taught just-in-time via per-lesson preflight.

Nothing else is evidenced. There are no L4 skills, no glossary terms, and no retired deck items yet,
because no check has ever passed.

## Hypothesized Weak Areas

**These are unevidenced priors, not findings.** They were guessed before any teaching happened, and
they exist only to tell the instructor where to look first. Each one gets confirmed or killed by a
learning record as soon as there is real evidence.

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

## Current Blockers

None.

## Session Log

### 2026-04-26

Created the initial learning system: `curriculum.md`, `instructor.md`, `progress.md`.

Decisions: layered curriculum from next-token prediction to GPU kernels; learning artifacts separate
from implementation artifacts; `teaching_notes.md` per lesson for future product insight; progress
tracked by evidence, not calendar time.

### 2026-05-20

Revised the curriculum: dropped the standalone PyTorch phase for just-in-time preflight plus a
running `pytorch_notes.md`; split Phase 9 into 9a/9b/9c; replaced toy HCA/CSA with MLA (optional NSA)
in Phase 6; pinned datasets and nanoGPT as a debug-only reference; pulled mixed precision and eval
primitives forward into Phase 3; added the local-vs-cloud map and budget earmark.

Decisions: Mac (MPS) primary with occasional rented NVIDIA GPU; student is new to PyTorch (now
LR-0002); no deadline, do all 13 phases properly.

### 2026-05-22

Set up git versioning and scaffolded `lessons/lesson_00_orientation/`,
`lessons/lesson_01_next_token_prediction/`, `labs/week_01_minigpt/`, `reports/`, `runs/`.

Phase 0 complete. Began Phase 1 — though in practice only the skeleton was created; no teaching
happened.

### 2026-06-25

Pivoted for an AI runtime engineer interview. Added `lessons/interview_ai_runtime_inference/` and
`labs/week_08_inference_runtime/README.md`, front-loading Phase 8.

### 2026-07-13

**Interview retired; the lab is rebuilt for mastery.** Analysed an external teaching skill and found
our system strong on rigor (evidence gates, correctness standards, anti-spoonfeed escalation) and
blind on retention and grounding. With no deadline, nothing external would ever test whether Phase 2
survived to Phase 8.

Added:

- `MISSION.md` — hireable LLM systems / post-training engineer, with TinySeek as the artifact, plus a
  depth policy (deep / working / shallow-but-real) and an explicit out-of-scope list.
- Mastery levels L0-L5 in `instructor.md`, replacing the binary complete/incomplete flag. L4 requires
  a delayed cold retrieval and cannot be granted on the day of teaching.
- `review/deck.md` — spaced retrieval on 1/3/7/21/60-day intervals, interleaved, opening every
  session. This is the only path to L4.
- `learning-records/` — ADRs for understanding, replacing the aspirational "Weak Areas"/"Mastered"
  sections that had sat empty for three months.
- `GLOSSARY.md` and `RESOURCES.md` — canonical language, and a rule that the instructor cites rather
  than recalls.
- `reference/` — the cross-cutting card layer that outlives lesson folders.

Honest reckoning: the module table was reset. Phase 1 was marked "in progress" but `lesson.md` is an
empty skeleton, so it is L0. Phase 8's interview lesson is L0 (previewed) — written, never checked,
and it grants no credit.

Next: teach Lesson 01 properly, starting with the PyTorch preflight.

## Teaching-System Observations

Working hypotheses about LLM-led upskilling. These feed the product direction; they do not override
the primary goal of teaching well.

- Force artifacts, not passive reading.
- The student should predict before running code.
- Checks prevent false confidence better than explanations do.
- One idea at a time is necessary for deep technical learning.
- Markdown notes and paper diagrams serve different purposes.
- The instructor should scaffold structure; the student implements the core logic.
- **New (2026-07-13):** same-day review questions measure fluency, not mastery. A system without a
  deadline needs spaced retrieval or it silently accumulates forgotten phases. This is the most
  likely failure mode of any self-directed LLM curriculum, and it is invisible from the inside.
- **New (2026-07-13):** tracking module status is not the same as tracking learner state. A status
  table said "in progress" for three months over an empty file.

### Patterns To Test

- Does paper-first shape drawing reduce coding confusion?
- Do explicit checks improve retention, or only confidence?
- Does the spaced deck actually get run, or is it the first thing dropped when a session runs long?
- How much skeleton code is optimal before it becomes over-helping?
- Do learning records change what gets taught next, or just get written and ignored?

### Confusion Log

Empty. Nothing has been taught yet.

## Cloud Budget Notes

Budget: `$100-200` total, for targeted experiments only.

Rough earmark:

- Phase 8: vLLM + QLoRA smoke tests (~$15-30)
- Phase 9a: one QLoRA fine-tune run (~$10-20)
- Phase 11: single-node 2-GPU DDP + FSDP memory experiment (~$25-50)
- Phase 11 (optional): two-node DDP + interruption recovery (~$20-40)
- Phase 13: Triton kernel benchmarking on one NVIDIA GPU (~$15-30)

Avoid: long pretraining runs, large models without a clear question, expensive instances before
local correctness is proven.

Every cloud run records: provider, GPU type, GPU count, runtime, cost estimate, model size, batch
size, sequence length, tokens/sec, result.
