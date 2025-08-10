#!/usr/bin/env bash
set -euo pipefail
# This script shows how to record and generate GIFs for the README.
# Requires: asciinema (brew install asciinema), agg (brew install agg)
# Optionally: vhs (brew install charmbracelet/tap/vhs)

# 1) Record a session (Ctrl-D to finish):
# asciinema rec assets/demo.cast --command "bash -lc 'export CODEX_TUI_MAX_WIDTH=100; codex --dangerously-bypass-approvals-and-sandbox'"

# 2) Convert to GIF with agg:
# agg -i assets/demo.cast -o assets/demo.gif -s 1440x900 -t dracula

# 3) Take still screenshots:
# While recording, press a key combo to pause, then take OS screenshot of the terminal window.
# Save as assets/before.png and assets/after.png

# Notes:
# - Ensure the patched codex is on PATH (type -a codex should show shell function)
# - Use export CODEX_TUI_MAX_WIDTH=100 for consistent width in captures
# - Prefer monospace font and hide personal info in the terminal title/tab
