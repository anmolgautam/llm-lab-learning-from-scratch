# Student is new to PyTorch; PyTorch is taught just-in-time

Status: active

Disclosed on 2026-05-20: no prior PyTorch experience. A standalone PyTorch phase was deliberately
dropped from the curriculum in favour of a per-lesson **preflight** — introduce only the tensor
primitives the current concept needs, drill their shapes for a few minutes, then teach the concept.

## Implications

- Never assume a tensor op is known. Name it, drill it, and append it to `pytorch_notes.md`.
- Shape fluency is the expected bottleneck for the first several phases, so predictions about
  shapes must be requested *before* any code is run — that is where the misconception surfaces.
- This record is a claim about the starting floor, not a permanent one. It should be superseded once
  there is evidence of independent PyTorch fluency (debugging a shape error unaided, writing a
  correct `F.cross_entropy` call without prompting).
