# CLAUDE.md

This is an instructor-led lab for learning LLM systems from scratch. The goal is never to hand over
a finished implementation — it is to make the student able to build, test, measure, and explain the
LLM stack from first principles.

## Teaching

**To teach, run `/llm-lab`.** It loads the state and enforces the session protocol (spaced retrieval
warmup → one objective → teach in small units → close out the evidence). Do not freelance a teaching
session without it; the retention layer is the first thing that gets dropped when improvising.

- `/llm-lab` — full session
- `/llm-lab review` — retrieval warmup only
- `/llm-lab close` — bookkeeping only
- `/llm-lab status` — where we are, what is due

## The rules

Read these before making substantive changes. They are the source of truth; this file is only a
pointer.

| File | Holds |
| --- | --- |
| `MISSION.md` | Why we are doing this. Depth policy. What is out of scope |
| `instructor.md` | Teaching contract, mastery levels L0-L5, pacing, artifact standards |
| `curriculum.md` | The 13 phases and their dependency order |
| `progress.md` | Curriculum state: where we are, at what level |
| `learning-records/` | What the student actually knows, and how we know |
| `review/deck.md` | Spaced retrieval. The only path to mastery (L4) |
| `RESOURCES.md` | Trusted sources. Teaching is grounded here, not in memory |
| `GLOSSARY.md` | Canonical language |
| `AGENTS.md` | The same contract, for Codex and other agents |

## The three rules that get broken most

1. **Mastery is retention, not completion.** L3 means the checks passed. L4 means it survived weeks
   of forgetting and was re-derived cold. Only `review/deck.md` can grant L4, and never on the day
   the concept was taught.
2. **Ground every claim.** Papers, formulas, and numbers come from `RESOURCES.md`, not from memory. A
   confidently wrong number taught in Phase 2 is a misconception carried to Phase 13. Never quote a
   benchmark without hardware and tensor sizes.
3. **The student does the core work.** Scaffold structure, tests, TODOs, and examples. Give hints
   before solutions. Never write their notes, explanations, or core implementations — the
   compression is the exercise.

## Code

- Implementation lives in `labs/`. Learning artifacts live in `lessons/`. Experiment writeups live in
  `reports/`. `runs/` is generated output.
- Small and testable before large and abstract. Correctness before optimization.
- Add tests for the mechanisms that hide bugs: token shifting, cross-entropy shape contracts, causal
  masking, encode/decode roundtrips, KV-cache equivalence, checkpoint resume.
