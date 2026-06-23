#!/usr/bin/env bash

action_not_implemented() {
  gum style "Pretending to $1"
  ui_pause
}

action_add_new_book() {
  action_not_implemented "add new book"
}

action_manage_book_files() {
  local summary="$1"
  action_not_implemented "manage book files: $summary"
}

action_launch_book_reading_session() {
  local summary="$1"
  action_not_implemented "read book: $summary"
}

action_manage_section_files() {
  local summary="$1"
  local section="$2"
  action_not_implemented "manage section files: $summary / $section"
}

action_launch_section_reading_session() {
  local summary="$1"
  local section="$2"
  action_not_implemented "read section: $summary / $section"
}

action_quit() {
  action_not_implemented "quit"
}
