# Lesson 01 — Next-Token Prediction

> Skeleton. You fill the prose in your own words as we work through each unit.

## Goal

<!-- What is the objective that powers decoder-only pretraining? -->

## Why it matters

<!-- Why is "predict the next token" enough to learn language/skills? -->

## Intuition

<!-- Plain-language picture before any formulas. -->

## Tensor shapes (reference — verify each as we go)

```text
tokens: [N]          # one long stream of token ids
x:      [B, T]       # input context window
y:      [B, T]       # targets = x shifted left by one
logits: [B, T, V]    # score per vocab item at each position
loss:   scalar       # mean cross-entropy over B*T positions
```

## Formulas

<!-- Cross-entropy for one position; mean over positions. Derive, don't just state. -->

## Worked example

<!-- One tiny sequence: build x and y by hand; compute one loss by hand. -->

## Common confusions

<!-- e.g. why ~ln(V) at init; why teacher forcing trains a model usable autoregressively. -->
