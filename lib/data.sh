#!/usr/bin/env bash

data_list_summaries() {
  printf '%s\n' \
    "The Brothers Karamazov" \
    "Moby-Dick" \
    "The Iliad"
}

data_list_sections() {
  local summary="$1"

  case "$summary" in
    "The Brothers Karamazov")
      printf '%s\n' \
        "Book I - A Nice Little Family" \
        "Book II - An Inappropriate Gathering" \
        "Book III - The Sensualists"
      ;;
    "Moby-Dick")
      printf '%s\n' \
        "Chapter 1 - Loomings" \
        "Chapter 2 - The Carpet-Bag" \
        "Chapter 3 - The Spouter-Inn"
      ;;
    "The Iliad")
      printf '%s\n' \
        "Book 1 - The Rage of Achilles" \
        "Book 2 - The Great Gathering" \
        "Book 3 - Helen Reviews the Champions"
      ;;
  esac
}
