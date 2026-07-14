# Templates

The canonical **blank state** of a workspace. These are what `scripts/init-workspace.sh` copies over
the live files when someone forks this lab and starts their own run.

They exist because the most dangerous thing a forked learning system can inherit is *someone else's
progress*. A progress table that already says "L3" for a phase you have never touched will quietly
lie to you for months.

| Template | Replaces | Why it must be blanked |
| --- | --- | --- |
| `MISSION.md` | `MISSION.md` | The mission is the compass. Inheriting someone else's is worse than having none — it points confidently in the wrong direction. |
| `progress.md` | `progress.md` | Every module returns to L0. You have not learned anything yet, and the file should say so. |
| `deck.md` | `review/deck.md` | Retention is personal. An inherited deck is a schedule for memories you never formed. |
| `GLOSSARY.md` | `GLOSSARY.md` | A term is earned by defining it correctly. You cannot inherit that. |
| `pytorch_notes.md` | `pytorch_notes.md` | The just-in-time reference is a record of what *you* have been taught. |

What is **not** templated, because it is genuinely reusable and not personal:

- `instructor.md` — the teaching contract, mastery levels, pacing, escalation ladder.
- `curriculum.md` — the 13 phases (keep it if you are learning LLM systems; replace it if not).
- `RESOURCES.md` — verified sources. Facts, not state.
- `learning-records/README.md` — the format. Only the records themselves get wiped.
- `.claude/skills/llm-lab/SKILL.md` — the session protocol.
