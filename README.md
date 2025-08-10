# Codex TUI – Word‑Safe Wrapping + Width Cap

This documents and tracks rendering improvements to the OpenAI Codex CLI TUI:

- Word‑safe wrapping: no mid‑word splits at column edges
- Width cap: compact, readable columns (default 100, tunable)
- Stream overlay: reflows with terminal size; matches history wrapping
- Stable build: removes unstable let‑chains; builds on stable Rust

Links:
- Upstream PR (draft): https://github.com/openai/codex/pull/2122
- Fork + branch (code): https://github.com/akshaybapat6365/codex/tree/tui-word-wrap-width-cap

## Install (patched local build)
```bash
# Clone fork and build
git clone https://github.com/akshaybapat6365/codex.git
cd codex/codex-rs
rustup override set 1.88.0  # or cargo +1.88.0
cargo build --release --bin codex

# Optional width cap override (default 100)
export CODEX_TUI_MAX_WIDTH=110

# Run the TUI
./target/release/codex
```

## Behavior
- Wrapping prefers whitespace; long unbroken tokens still hard‑wrap as expected.
- The content width clamps to `min(terminal_cols, CODEX_TUI_MAX_WIDTH)`.
- Streamed text reflows on width changes as new text arrives; final text is pre‑wrapped.

## Screenshots / GIF
- See `assets/` for captures (demo.gif; before.png → after.png).
- How to record: `scripts/capture.sh` (asciinema + agg). Example:
```bash
asciinema rec assets/demo.cast --command "bash -lc 'export CODEX_TUI_MAX_WIDTH=100; codex'"
agg -i assets/demo.cast -o assets/demo.gif -s 1440x900 -t dracula
```

## Configuration
- Cap width (columns): `CODEX_TUI_MAX_WIDTH` (default: 100)
- No theme changes; uses terminal theme
- No sandbox/network changes

## Security & Privacy
- No secrets or personal data included.
- Diff scan run pre‑PR (tokens/keys/PK blocks) – no hits.
- Purely UI/formatting; no behavioral changes outside rendering/build hygiene.

## Contributing
- Open an issue or comment on the PR above.
- Happy to port the changes to a smaller, surgical PR if desired by maintainers.
