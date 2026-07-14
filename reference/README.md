# Reference

Compressed, cross-cutting knowledge. The durable layer.

Lessons are rarely revisited; reference cards are. A lesson teaches one thing once, in the order it
made sense to learn it. A reference card answers one question forever, in the order you will need to
look it up — and it spans lessons, which is exactly what a per-lesson `key_notes.md` cannot do.

## The split

- `lessons/NN/key_notes.md` — the revision sheet for *that lesson*. Lesson-local. Written while the
  material is warm.
- `reference/*.md` — the card you will actually open in Phase 11 to remember something from Phase 4.
  Cross-cutting. Written when a concept proves it recurs.

When a `key_notes.md` entry turns out to be needed in a second, unrelated lesson, that is the signal
to promote it into a card here.

## Rules

- **A card answers a question, not a topic.** "How much memory does the KV cache need?" beats
  "KV cache."
- **Terse. Table- and formula-shaped.** If it reads like prose, it belongs in a lesson.
- **Every claim carries its source** — a paper from `RESOURCES.md`, or the experiment in `reports/`
  that produced the number. Benchmark numbers without hardware and tensor sizes are lies.
- **Uses `GLOSSARY.md` terms exclusively.**
- **Written by the student.** The instructor may scaffold the skeleton and correct it, but
  compressing the knowledge is the exercise.

## Planned cards

Created when earned, not upfront:

- `shapes.md` — the shape conventions of the whole stack, one table. `[B, T, C]` through
  `[B, H, T, D]` to `[B, T, V]`, and where each transformation happens.
- `kv-cache-memory.md` — the memory formula, and how MHA/GQA/MQA/MLA change it.
- `attention-variants.md` — the zoo, in one comparison table: what each one trades away.
- `distributed-vocabulary.md` — rank, local rank, world size, global vs. effective batch size, what
  each collective actually moves.
- `debugging-order.md` — the standard descent: shape → dtype → device → tiny input → known output →
  loss sanity → gradient sanity → overfit one batch.
- `benchmark-discipline.md` — warmup, synchronize, report hardware and sizes, never claim a speedup
  without both.
