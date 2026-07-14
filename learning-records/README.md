# Learning Records

These are ADRs for understanding. They record what the student *actually knows* — not what was
covered — and they are the primary input for deciding what to teach next.

`progress.md` tracks the state of the **curriculum**. These records track the state of the
**student's mind**. Do not confuse the two: a module can be scaffolded, taught, and written up
without a single learning record being earned.

## Format

`NNNN-dash-case-title.md`, incrementing. One to three sentences is a complete record.

```md
# {Short title of what was learned or established}

{What was learned or established, and why it changes what to teach next.}
```

Optional sections, only when they earn their place:

- **Status**: `active` | `superseded by LR-NNNN`
- **Evidence**: how understanding was demonstrated (a question answered cold, a check that passed,
  a bug found unaided, prior experience cited).
- **Implications**: what this unlocks or rules out for future sessions.

## Write one when

1. **Understanding was demonstrated** on something non-trivial — evidence the concept can be *used*
   correctly, not merely that it was explained to you. This raises the floor for what to teach next.
2. **Prior knowledge was disclosed** — "I already know X." Record the claimed depth so we do not
   re-teach it, and so we can catch it if the claim turns out to be shallow.
3. **A misconception was corrected** — high-value. These predict future stumbling blocks in related
   topics, and they are the best raw material for `teaching_notes.md`.
4. **The mission shifted** — cross-link `MISSION.md` and update it.

## Do not write one when

- Material was merely covered. Coverage is not learning.
- A term is already defined in `GLOSSARY.md`. Do not duplicate.
- It is session activity. That belongs in `progress.md`'s session log. These are decision-grade
  insights, not a journal.

## Supersession

When a later record contradicts an earlier one — understanding deepened, or an early claim of
knowledge proved shallow — mark the old record `Status: superseded by LR-NNNN` rather than deleting
it. How the understanding evolved is itself the signal the teaching product is trying to capture.
