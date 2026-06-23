#!/usr/bin/env bash

screen_main() {
  while true; do
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
        action_not_available "Thinking"
        ;;
      "Quit"|"")
        exit 0
        ;;
    esac
  done
}

screen_reading() {
  while true; do
    ui_title "Reading"

    choice="$(
      printf '%s\n' \
        "Reopen last session" \
        "See books" \
        "Back" \
        "Quit" |
      gum choose
    )"

    case "$choice" in
      "Reopen last session")
        action_not_implemented "Reopen last session"
        ;;
      "See books")
        screen_books
        ;;
      "Back")
        return 0
        ;;
      "Quit"|"")
        exit 0
        ;;
    esac
  done
}

screen_books() {
  while true; do
    ui_title "Books"

    summary="$(
      {
        data_list_summaries
        printf '%s\n' "Back" "Quit"
      } | gum choose
    )"

    case "$summary" in
      "Back")
        return 0
        ;;
      "Quit"|"")
        exit 0
        ;;
      *)
        screen_summary "$summary"
        ;;
    esac
  done
}

screen_summary() {
  local summary="$1"

  while true; do
    ui_title "$summary"

    section="$(
      {
        data_list_sections "$summary"
        printf '%s\n' "Back" "Quit"
      } | gum choose
    )"

    case "$section" in
      "Back")
        return 0
        ;;
      "Quit"|"")
        exit 0
        ;;
      *)
        screen_section "$summary" "$section"
        ;;
    esac
  done
}

screen_section() {
  local summary="$1"
  local section="$2"

  while true; do
    ui_title "$summary / $section"

    choice="$(
      printf '%s\n' \
        "Generate section files" \
        "Review text for section audio" \
        "Generate section audio" \
        "Launch reading session" \
        "Back" \
        "Quit" |
      gum choose
    )"

    case "$choice" in
      "Back")
        return 0
        ;;
      "Quit"|"")
        exit 0
        ;;
      *)
        action_not_implemented "$choice"
        ;;
    esac
  done
}
