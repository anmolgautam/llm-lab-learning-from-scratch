# Spaced Review Deck

The retention system. Without a deadline, nothing external ever tests whether Phase 2 survived to
Phase 8 — this file does.

Every session **opens** with the items due today, before any new material. Ten minutes, cold, no
notes, no scrollback. Then the new lesson begins.

## Why this exists

There are two kinds of "knowing":

- **Fluency strength** — you can retrieve it right now, because you just did it. This is what our
  end-of-lesson review questions measure, and it produces a convincing illusion of mastery.
- **Storage strength** — you can retrieve it in three weeks, cold, having built four other things
  since. This is the only kind that makes an engineer.

Storage strength is built by *desirable difficulty*: retrieval practice (recall from memory, not
recognition), spacing (let it fade a little first), and interleaving (a KV-cache drill dropped into
the middle of an MoE session). Difficulty is the enemy when acquiring knowledge and the tool when
making it durable.

## Item types

Not just trivia. An item must demand production, not recognition.

| Type | Demands |
| --- | --- |
| `recall` | Explain a mechanism cold, in your own words. |
| `shape` | Name every axis of a tensor at a given point in the stack. |
| `derive` | Reproduce a formula from first principles on paper — not quote it. |
| `code` | Re-implement a mechanism from a blank file in under ten minutes. |
| `debug` | Given a symptom, name the hypothesis and the observation that would disprove it. |

## Scheduling

Intervals, tuned to a most-days / 1-2 hour cadence:

```text
pass  →  1d  →  3d  →  7d  →  21d  →  60d  →  retired
fail  →  back to 1d, and the source module drops from mastery level 4 to level 3
```

Scheduling is by **elapsed days**, not by session count — forgetting runs on the calendar, not on
your attendance. Items go overdue when you skip days. That is fine; triage the oldest first.

Rules:

- **Cold or it does not count.** Opening the lesson file first is a fail.
- **Six items per session, maximum.** The deck serves the learning; it is not the learning.
- **Interleave deliberately.** Never draw all six items from the phase you are currently in — that
  is fluency practice wearing a costume.
- **Leeches**: an item failed three times means the *lesson* is broken, not your memory. Stop
  drilling it, go re-teach the concept properly, and write a learning record about what the wrong
  mental model was.
- **Items are born from `checks.md`.** When a lesson's checks pass, its checks become deck items.
  A check proves you can do it once; the deck proves it stuck.

## Due today

_Empty._

## Deck

_Empty. Nothing has been earned yet — Lesson 01 is still a scaffold._

The first items arrive when Lesson 01's checks pass. They will be roughly:

| ID | Item | Type | Source | Level | Last passed | Interval | Due |
| --- | --- | --- | --- | --- | --- | --- | --- |
| — | _(e.g. "Given a token stream, produce `x` and `y` by hand")_ | `shape` | Lesson 01 | — | — | — | — |
| — | _(e.g. "Why is initial loss ≈ ln(V)? Derive it.")_ | `derive` | Lesson 01 | — | — | — | — |

## Retired

Items that survived 60 days. Kept as a record — retirement is the closest thing this lab has to a
diploma.

_Empty._
