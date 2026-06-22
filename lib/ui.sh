#!/usr/bin/env bash

ui_require_gum() {
  if ! command -v gum >/dev/null 2>&1; then
    echo "Error: gum is not installed or not in PATH." >&2
    exit 1
  fi
}

ui_title() {
  gum style \
    --border normal \
    --padding "1 2" \
    --margin "1 0" \
    "$1"
}

ui_pause() {
  echo
  read -r -p "Press Enter to continue..."
}
