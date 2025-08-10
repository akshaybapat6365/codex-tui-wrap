#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
export CODEX_TUI_MAX_WIDTH=${CODEX_TUI_MAX_WIDTH:-100}
# Record the session; exit when Codex quits
asciinema rec assets/demo.cast --command "bash -lc 'export CODEX_TUI_MAX_WIDTH=${CODEX_TUI_MAX_WIDTH}; codex --dangerously-bypass-approvals-and-sandbox'"
# Convert to GIF and push
agg -i assets/demo.cast -o assets/demo.gif -s 1440x900 -t dracula || true
if [ -f assets/demo.gif ]; then
  magick assets/demo.gif[0] assets/demo-still.png || true
fi
git add assets/demo.cast assets/demo.gif assets/demo-still.png 2>/dev/null || true
git commit -m "Add demo visuals (auto)" >/dev/null || true
git push >/dev/null || true
