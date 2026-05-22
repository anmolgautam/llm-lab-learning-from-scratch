# PyTorch Notes — Running Glossary

This file grows as PyTorch primitives are introduced, just-in-time, lesson by lesson. It is a cumulative reference: when a lesson's preflight introduces an op, add it here in your own words with a tiny shape example.

Rule:

```text
Only add a primitive after you have actually used it in a lesson.
No pre-loading the whole library.
```

## Entry Format

For each entry:

- what it does (one line)
- the shape contract or signature that matters
- one tiny example
- the gotcha that bit me (if any)

## Entries

_(empty — first entries land during Phase 1: integer indexing/slicing for the input/target shift, softmax over the vocab dimension, `F.cross_entropy` and its `[B*T, V]` vs `[B*T]` shape contract, and broadcasting.)_
