#!/usr/bin/env bash
#
# init-workspace.sh — reset this lab to a clean slate for a new learner.
#
# The most dangerous thing a forked learning system can inherit is someone else's progress.
# A table that already says "L3" for a phase you have never touched will lie to you for months.
# This script returns every module to L0 and empties every artifact that must be *earned*.
#
#   ./scripts/init-workspace.sh                 # same subject (LLM systems): keep the curriculum
#   ./scripts/init-workspace.sh --new-subject   # different subject: also blank curriculum & lessons
#   ./scripts/init-workspace.sh --yes           # skip the confirmation prompt
#
set -euo pipefail

NEW_SUBJECT=0
ASSUME_YES=0

for arg in "$@"; do
  case "$arg" in
    --new-subject) NEW_SUBJECT=1 ;;
    --yes|-y)      ASSUME_YES=1 ;;
    --help|-h)
      sed -n '3,12p' "$0" | sed 's/^# \{0,1\}//'
      exit 0 ;;
    *)
      echo "unknown flag: $arg (try --help)" >&2
      exit 2 ;;
  esac
done

cd "$(dirname "$0")/.."
ROOT="$(pwd)"

if [[ ! -f instructor.md || ! -d templates ]]; then
  echo "error: run this from inside the lab repo (instructor.md and templates/ not found)" >&2
  exit 1
fi

if git rev-parse --git-dir >/dev/null 2>&1; then
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "error: working tree is dirty. Commit or stash first — this script deletes files." >&2
    exit 1
  fi
fi

echo "This will reset the workspace in: $ROOT"
echo
echo "  Blanked from templates/:"
echo "    MISSION.md          -> unwritten (you will be interviewed for it)"
echo "    progress.md         -> every module back to L0"
echo "    review/deck.md      -> empty"
echo "    GLOSSARY.md         -> empty"
echo "    pytorch_notes.md    -> empty"
echo
echo "  Deleted:"
echo "    learning-records/*.md  (except README.md — the format survives)"
echo "    reference/*.md         (except README.md)"
echo "    reports/*, runs/*"
echo "    lessons/interview_ai_runtime_inference/   (previous owner's artifact)"
echo "    labs/week_08_inference_runtime/           (previous owner's artifact)"
if [[ $NEW_SUBJECT -eq 1 ]]; then
echo
echo "  --new-subject also deletes:"
echo "    curriculum.md, RESOURCES.md, lessons/*, labs/*"
fi
echo
echo "  Kept (this is the reusable machinery, not personal state):"
echo "    instructor.md, .claude/skills/llm-lab/, learning-records/README.md, templates/"
if [[ $NEW_SUBJECT -eq 0 ]]; then
echo "    curriculum.md, RESOURCES.md, lesson skeletons, labs/week_01_minigpt/"
fi
echo

if [[ $ASSUME_YES -eq 0 ]]; then
  read -r -p 'Type "reset" to proceed: ' reply
  [[ "$reply" == "reset" ]] || { echo "aborted."; exit 1; }
fi

cp templates/MISSION.md       MISSION.md
cp templates/progress.md      progress.md
cp templates/GLOSSARY.md      GLOSSARY.md
cp templates/pytorch_notes.md pytorch_notes.md
mkdir -p review && cp templates/deck.md review/deck.md

find learning-records -maxdepth 1 -name '*.md' ! -name 'README.md' -delete
find reference        -maxdepth 1 -name '*.md' ! -name 'README.md' -delete
find reports runs     -maxdepth 1 -type f ! -name '.gitkeep' -delete 2>/dev/null || true

rm -rf lessons/interview_ai_runtime_inference labs/week_08_inference_runtime

if [[ $NEW_SUBJECT -eq 1 ]]; then
  rm -rf lessons/* labs/*
  mkdir -p lessons labs
  : > curriculum.md
  : > RESOURCES.md
  cat > curriculum.md <<'EOF'
# Curriculum

The phases, in dependency order. Nothing is taught before its prerequisite.

Write this before teaching. A curriculum without a dependency order is a reading list, and a reading
list is how self-directed learning quietly becomes random paper-browsing.

## Phase 1: {name}

Goal:

Build:

Checks:

Experiments:

Deliverable:
EOF
  cat > RESOURCES.md <<'EOF'
# Resources

Trusted sources. **Teaching is grounded here, not in the instructor's memory.**

A confidently wrong number taught early becomes a misconception carried for months. When a claim is
load-bearing, cite the source or go read it. Never quote a benchmark without hardware and sizes.

Verify every link before writing it down — models fabricate plausible citations.

## Knowledge

- [Title — Author (year)](url)
  What it covers. When to reach for it.

## Wisdom (Communities)

Real skill is tested outside the learning environment — where a wrong mental model gets caught by
someone who is not being paid to be encouraging.

- [Community](url)
  Use for: {…}. Attempt the answer first; take only the residual question.

## Gaps

Areas the mission needs where no trustworthy source is pinned yet. These drive future search.

- {…}
EOF
fi

echo
echo "Workspace reset."
echo
echo "Next:"
echo "  1. Open Claude Code here and run:  /llm-lab init"
echo "     It will interview you for the mission, then write MISSION.md."
if [[ $NEW_SUBJECT -eq 1 ]]; then
echo "  2. Rewrite curriculum.md for your subject, in dependency order."
echo "  3. instructor.md's 'Correctness Standards' section is LLM-specific — replace it with"
echo "     what counts as proof in your domain. Everything else in that file is subject-agnostic."
else
echo "  2. Then run:  /llm-lab   to start Phase 1."
fi
echo
echo "Do not fill in progress.md by hand to make it look further along. That is the one file"
echo "whose only value is being honest."
