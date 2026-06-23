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
        action_not_implemented "open Thinking"
        ;;
      "Quit"|"")
        action_quit
        ;;
    esac
  done
}

screen_reading() {
  while true; do
    ui_title "Reading"

    choice="$(
      {
        data_list_summaries
        printf '%s\n' " "
        printf '%s\n' "Add new book"
        printf '%s\n' "  "
        printf '%s\n' "Back" "Quit"
      } | gum choose
    )"

    case "$choice" in
      " " | "  ")
        ;;
      "Add new book")
        action_add_new_book
        ;;
      "Back")
        return 0
        ;;
      "Quit"|"")
        action_quit
        ;;
      *)
        screen_book "$choice"
        ;;
    esac
  done
}

screen_book() {
  local summary="$1"

  while true; do
    ui_title "$summary"

    choice="$(
      {
        printf '%s\n' \
          "Read book" \
          "Manage book files"
        printf '%s\n' " "
        data_list_sections "$summary"
        printf '%s\n' "  "
        printf '%s\n' \
          "Back" \
          "Quit"
      } | gum choose
    )"

    case "$choice" in
      " " | "  ")
        ;;
      "Read book")
        action_launch_book_reading_session "$summary"
        ;;
      "Manage book files")
        action_manage_book_files "$summary"
        ;;
      "Back")
        return 0
        ;;
      "Quit"|"")
        action_quit
        ;;
      *)
        screen_section "$summary" "$choice"
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
      {
        printf '%s\n' \
          "Read section" \
          "Manage section files"
        printf '%s\n' " "
        printf '%s\n' \
          "Back" \
          "Quit"
      } | gum choose
    )"

    case "$choice" in
      " ")
        ;;
      "Read section")
        action_launch_section_reading_session "$summary" "$section"
        ;;
      "Manage section files")
        action_manage_section_files "$summary" "$section"
        ;;
      "Back")
        return 0
        ;;
      "Quit"|"")
        action_quit
        ;;
    esac
  done
}
