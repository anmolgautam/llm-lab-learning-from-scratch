# LLM Lab — Learning LLM Systems From Scratch

An instructor-led lab for learning the LLM stack from first principles: next-token prediction
through attention, MoE, inference, post-training, distributed training, and GPU kernels. Thirteen
phases, in dependency order, with an AI instructor that refuses to do the work for you.

It is also an experiment in what a serious LLM-led curriculum has to look like to actually work.

## The problem this is built around

Most AI tutoring produces the feeling of learning without the fact of it. You read a beautiful
explanation, nod, and cannot reproduce it three weeks later. Two failure modes cause it:

1. **Same-day recall is not memory.** Asking "did you understand?" at the end of a lesson measures
   *fluency strength* — you can retrieve it because you just did. What matters is *storage strength*:
   can you re-derive it cold, weeks later, having built four other things since? A curriculum with no
   deadline has nothing that ever tests this, so it silently accumulates forgotten phases.
2. **The model does the work.** An agent that hands you a finished implementation has taught you
   nothing. The compression *is* the exercise.

So this lab is built on two rules that most of its structure exists to enforce:

> **Mastery is retention, not completion.**
> **The student does the core work.**

## How it works

### Mastery is a level, not a checkbox

```
L0 unseen → L1 explained → L2 implemented → L3 verified → L4 retained → L5 taught back
```

**L3** means the checks passed, an experiment ran, and you wrote the summary. That's the old
definition of "done," and it's now just the halfway point.

**L4 — the actual bar — cannot be granted on the day you learn something.** It requires a delayed,
cold retrieval with nothing open, which means only the spaced review deck can award it. A failed
review item demotes a module back to L3. Levels move in both directions.

You advance the curriculum at L3. Retention accumulates behind you rather than blocking you.

### The spaced review deck

`review/deck.md`. When a lesson's checks pass, they become deck items on a 1 / 3 / 7 / 21 / 60-day
schedule. Every session **opens** with the items due today — cold, no notes, no scrollback, before
any new material. They're interleaved on purpose: a KV-cache shape drill dropped into the middle of
an MoE session is doing real work; six questions about yesterday's topic is fluency practice wearing
a costume.

An item failed three times means *the lesson is broken*, not your memory — so you re-teach the
concept and write down what the wrong mental model was.

### Learning records

`learning-records/`. ADRs for understanding. Written only when you *demonstrate* something, disclose
prior knowledge, or have a misconception corrected — never because material was covered. Coverage is
not learning.

This is the file that decides what gets taught next. `progress.md` tracks the state of the
**curriculum**; learning records track the state of the **student**. They're separate because a
status table will happily say "in progress" for three months over an empty file. Ours did.

### Grounding

`RESOURCES.md` pins 34 papers, each arXiv ID verified against the live page. The instructor is
required to **cite rather than recall** — a confidently wrong number taught in Phase 2 becomes a
misconception carried to Phase 13. Benchmark claims without hardware and tensor sizes are not
allowed, ours or anyone's.

### The anti-spoonfeed ladder

When you're stuck, the instructor escalates: clarifying question → conceptual hint → shape hint →
point at the exact line → partial code → full code, and only when being blocked has stopped being
educational. It scaffolds structure, tests, and TODOs. You write the mechanisms, the notes, and the
explanations.

## Starting your own run

Requires [Claude Code](https://claude.com/claude-code).

This repo contains **my** learning state — my mission, my progress, my records. Inheriting it would
be worse than useless: a table that already says "L3" for a phase you have never touched will lie to
you for months. So the first thing you do is wipe it.

```bash
git clone https://github.com/anmolgautam/llm-lab-learning-from-scratch my-llm-lab
cd my-llm-lab
rm -rf .git && git init          # your history, not mine

./scripts/init-workspace.sh      # every module back to L0
```

The script restores `MISSION.md`, `progress.md`, `review/deck.md`, `GLOSSARY.md`, and
`pytorch_notes.md` from `templates/`, deletes my learning records and reports, and keeps the parts
that are actually reusable — `instructor.md`, `curriculum.md`, `RESOURCES.md`, the lesson skeletons,
and the skill. It refuses to run on a dirty tree and asks for confirmation, because it deletes files.

Then:

```bash
claude
> /llm-lab init     # interviews you for the mission, writes MISSION.md
> /llm-lab          # first session
```

### Commands

| Command | Does |
| --- | --- |
| `/llm-lab` | Full session: retrieval warmup → one objective → teach in small units → close out the evidence |
| `/llm-lab review` | Retrieval warmup only. Ten minutes |
| `/llm-lab close` | Bookkeeping: promote passed checks into the deck, update levels, write records |
| `/llm-lab status` | Where you are, what's due, what's blocked |
| `/llm-lab init` | New workspace: interview for the mission, write `MISSION.md` |

The skill lives in `.claude/skills/llm-lab/` and is deliberately thin — it *sequences* a session and
nothing more. The rules live in `instructor.md`, because two copies of a teaching contract drift
apart within a month.

**`/llm-lab init` will interrogate you**, and it is supposed to. It pushes past "I want to understand
LLMs" until you produce a mission with a finish line, a depth policy, and an out-of-scope list. A
curriculum without those is an infinite reading list.

### A different subject entirely

The machinery is not LLM-specific — the mastery levels, the deck, the records, the grounding rule,
and the escalation ladder work for anything hard.

```bash
./scripts/init-workspace.sh --new-subject
```

That additionally blanks `curriculum.md`, `RESOURCES.md`, `lessons/`, and `labs/`. You write the
phases in dependency order, and you replace the **Correctness Standards** section of `instructor.md`
— it encodes what counts as proof in LLM systems (future-token leakage tests, frozen reference
models, warmup-and-sync before timing claims). Every other section of that file is subject-agnostic.

Whatever you do: **do not hand-edit `progress.md` to look further along.** It is the one file whose
entire value is being honest.

## Repository

```
MISSION.md          why we're doing this; depth policy; what's out of scope
curriculum.md       the 13 phases and their dependency order
instructor.md       teaching contract, mastery levels, pacing, artifact standards
progress.md         curriculum state: where we are, at what level
GLOSSARY.md         canonical language
RESOURCES.md        trusted sources — teaching is grounded here, not in memory
pytorch_notes.md    growing just-in-time PyTorch reference

learning-records/   what the student actually knows, and how we know
review/deck.md      spaced retrieval; the only path to L4
reference/          compressed cross-cutting cards; the layer that gets reopened

lessons/            explanations, exercises, checks, revision notes
labs/               implementation (TinySeek): package code, scripts, tests, configs
reports/            experiment writeups
runs/               generated output
```

## Status

**Honest, because the alternative is useless.** Phase 0 (orientation and the teaching system itself)
is at L3. **Everything else is L0.** The deck is empty, the glossary is empty, and there are two
learning records — one of which is about the mission changing.

The system is designed. It is not yet proven. It gets proven the first time a session runs long,
six items are due, and the deck either gets run or quietly becomes decoration. Every learning system
has that same failure mode; this one at least names it.

Follow `progress.md` if you want to watch it succeed or fail in public.

## Credit

The retention and grounding layers — spaced retrieval, fluency vs. storage strength, learning
records as ADRs, mission-first teaching, and the rule against trusting parametric knowledge — were
adapted from [Matt Pocock's `teach` skill](https://github.com/mattpocock/skills/blob/main/skills/productivity/teach/SKILL.md).
The evidence gates, correctness standards, and the refusal to hand over implementations are this
lab's own.

The learning-science underneath (retrieval practice, spacing, interleaving, desirable difficulty) is
Bjork's, not ours.
