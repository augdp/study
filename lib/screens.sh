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
      screen_reading
      ;;
    "Thinking (not available yet)")
      action_not_implemented "Thinking"
      ;;
    "Quit"|"")
      exit 0
      ;;
  esac
}

screen_reading() {
  ui_title "Reading"

  choice="$(
    printf '%s\n' \
      "Reopen last session" \
      "See books" |
    gum choose
  )"

  case "$choice" in
    "Reopen last session")
      action_not_implemented "Reopen last session"
      ;;
    "See books")
      screen_books
      ;;
    "")
      exit 0
      ;;
  esac
}

screen_books() {
  ui_title "Books"

  summary="$(data_list_summaries | gum choose)"

  case "$summary" in
    "")
      exit 0
      ;;
    *)
      screen_summary "$summary"
      ;;
  esac
}

screen_summary() {
  local summary="$1"

  ui_title "$summary"

  section="$(data_list_sections "$summary" | gum choose)"

  case "$section" in
    "")
      exit 0
      ;;
    *)
      screen_section "$summary" "$section"
      ;;
  esac
}

screen_section() {
  local summary="$1"
  local section="$2"

  ui_title "$summary / $section"

  choice="$(
    printf '%s\n' \
      "Generate section files" \
      "Review text for section audio" \
      "Generate section audio" \
      "Launch reading session" |
    gum choose
  )"

  case "$choice" in
    "")
      exit 0
      ;;
    *)
      action_not_implemented "$choice"
      ;;
  esac
}
