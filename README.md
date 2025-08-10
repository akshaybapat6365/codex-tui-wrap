# Codex TUI – Word-Safe Wrapping + Width Cap

This repo documents and tracks improvements to the OpenAI Codex CLI TUI rendering:

- Word-safe wrapping (no mid-word splits at column edges)
- Sensible width cap (default 100 columns), tunable via `CODEX_TUI_MAX_WIDTH`
- Streaming overlay rewraps as new text arrives and respects terminal width
- Stable Rust build hygiene (removed unstable `let` chains)

Upstream PR (draft):
- https://github.com/openai/codex/pull/2122

Fork + branch with code:
- https://github.com/akshaybapat6365/codex/tree/tui-word-wrap-width-cap

## Local build (from the fork)
```bash
# clone fork
git clone https://github.com/akshaybapat6365/codex.git
cd codex/codex-rs
# use repo's toolchain (or rustup 1.88)
rustup override set 1.88.0
# build
cargo build --release --bin codex
# optional: cap width (default 100)
export CODEX_TUI_MAX_WIDTH=110
# run
./target/release/codex
```

## Notes
- Extremely long unbroken tokens (e.g., huge URLs) will still hard-wrap.
- No changes to sandboxing or network behavior; this is purely UI/formatting.
- Feedback and upstream discussion happen on the PR above.
