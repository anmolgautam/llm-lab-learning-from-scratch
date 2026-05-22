# Lesson 01 — Exercises

Paper first, then notebook.

- [ ] Take a short token sequence and write out `x` and `y` by hand (show the shift).
- [ ] For a given `logits` shape `[B, T, V]`, label what each axis means.
- [ ] Compute one cross-entropy loss by hand on toy logits (2–3 classes).
- [ ] Explain in writing why the random-init loss is near `ln(vocab_size)`.
- [ ] Explain why a model trained with teacher forcing can still generate autoregressively.

Notebook:

- [ ] Reproduce the input/target shift on a real tensor and check shapes.
- [ ] Confirm `F.cross_entropy` on uniform logits returns ≈ `ln(V)`.
