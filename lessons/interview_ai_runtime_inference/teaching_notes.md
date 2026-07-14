# Teaching Notes - AI Runtime Inference Interview

This lesson is a front-loaded interview track. It intentionally prioritizes
serving/runtime concepts before the full curriculum reaches Phase 8.

## Teaching Constraints

- Do not pretend earlier phases are complete.
- Teach only the missing foundations needed for inference.
- Keep every explanation tied to shapes, costs, and failure modes.
- Prefer small executable cache examples over broad architecture lectures.
- Ask interview-style questions after each concept.

## Watch For Confusions

- Thinking KV cache removes all attention cost.
- Mixing up prefill parallelism and decode sequential dependence.
- Treating batch size and concurrency as identical in all contexts.
- Forgetting that sampling and tokenization can introduce CPU bottlenecks.
- Handwaving vLLM as simply "faster" instead of naming memory management,
  batching, and paged KV cache.

