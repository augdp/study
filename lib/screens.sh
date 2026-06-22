#!/usr/bin/env bash

screen_main() {
  ui_title "Study TUI"

  choice="$(
    printf '%s\n' \
      "Reading" \
      "Thinking (not available yet)" \
      "Quit" |
    gum choose
)"

case "$choice" in
  "Reading")
    action_not_implemented "Reading screen"
    ;;
  "Thinking (not available yet)")
    action_not_implemented "Thinking"
    ;;
  "Quit"|"")
    exit 0
    ;;
  esac
}
