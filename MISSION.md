# Mission: LLM Systems And Post-Training Engineering

This is the compass for the whole lab. Every teaching decision — what to teach next, how deep to
go, what to cut, which resources to pin — traces back to this file. If a session's work does not
serve this mission, it does not happen.

## Why

Be hired and function as an LLM systems / post-training engineer: someone who can be handed a
model, a cluster, and a vague objective, and who ships a correct, measured, explainable system.

The concrete form this takes is **TinySeek**: a from-scratch decoder-only LLM stack in `labs/`
that is trained, served, post-trained, distributed, and benchmarked — where every claim is backed
by a check and an experiment, and every line can be explained without notes.

The repo is the evidence. There is no deadline, so the only currency is proof.

## Success looks like

- Implement any core mechanism of the modern LLM stack from scratch, with a correctness check that
  would catch a subtle bug — not just code that runs.
- Explain, cold and without notes, why each mechanism exists, what it costs, and what breaks when
  it is wrong.
- Take a research paper, extract the mechanism, implement it, test it against a reference, and
  report an honest benchmark.
- Debug from evidence: given a broken loss curve, a NaN, a rank mismatch, or a slow kernel, form a
  hypothesis and name the observation that would disprove it.
- Answer every question in `curriculum.md`'s Capstone Questions without handwaving.
- Reach mastery level 4 (see `instructor.md`) on every skill in the Target Skill Matrix in
  `progress.md` — meaning the knowledge survived a delayed retrieval, not just a same-day check.

## Constraints

- **Cadence**: most days, 1-2 hours. The system must survive a small daily slice, not weekend
  heroics. Phases break into units that fit in one sitting.
- **Hardware**: Mac (MPS) primary; short rented NVIDIA GPU runs for cloud-only work
  (vLLM, QLoRA, DDP/FSDP, Triton). Cloud budget $100-200 total.
- **Background**: new to PyTorch at the start. PyTorch is taught just-in-time, never as a
  standalone course.
- **No deadline**: which removes the external forcing function. Retention and evidence gates
  replace it. Nothing counts as learned because time passed.

## Depth policy

Role-aligned, not uniform. Depth follows what an LLM systems / post-training engineer is actually
expected to own:

- **Deep** (implement from scratch, test, experiment, benchmark): training loops, attention and its
  variants, data/tokenization, inference and KV cache, SFT/LoRA, DPO/GRPO, reward and verifier
  design, distributed data parallelism.
- **Working** (implement a toy version, then use the library and explain what it abstracts): MoE,
  TRL, Accelerate, FSDP/DeepSpeed, vLLM, model parallelism.
- **Shallow-but-real** (one honest end-to-end result, not expertise): Triton kernels, profiling.
  Enough to read a trace, write one kernel that matches PyTorch, and benchmark it without lying.

Shallow-but-real is still real: it produces a passing check and a measured number. It just does not
get months.

## Out of scope

Protects the zone of proximal development. These are deliberately not chased:

- Production CUDA/Triton kernel engineering.
- A production paged-attention engine (we read vLLM's design; we do not rebuild it).
- Trillion-token data pipelines and frontier-scale infrastructure.
- The full RLHF/RLAIF stack with a trained reward model at scale.
- Large public benchmark suites (MMLU, HELM, SWE-bench).
- Interview cramming. The interview track that front-loaded Phase 8 is retired; see
  `learning-records/0001-mission-shift-from-interview-to-mastery.md`.

## Revision

Missions change. When this one does, update this file and write a learning record capturing the
shift — do not leave a stale compass steering future sessions.
