#!/bin/bash

center_text() {
  local text="$1"
  local cols=$(tput cols)
  local text_len=${#text}
  local padding=$(( (cols - text_len) / 2 ))
  local rows=

  if (( padding > 0 )); then
    printf "%*s%s%*s\n" "$padding" "" "$text" "$padding" ""
  else
    echo "$text" # If text is too long, just print it without centering
  fi
}


center_all() {
  # Get terminal dimensions
  local term_cols=$(tput cols)
  local term_lines=$(tput lines)

  # Store the text from function arguments into an array
  local text=("$@")
  local num_lines=${#text[@]}

  # Calculate padding for vertical centering
  local pad_lines=$(( (term_lines - num_lines) / 2 ))

  # Clear the screen
  clear

  # Print top vertical padding
  for ((i=0; i<pad_lines; i++)); do
    echo
  done

  # Print and horizontally center each line of text
  for line in "${text[@]}"; do
    local pad_cols=$(( (term_cols - ${#line}) / 2 ))
    printf "%*s%s\n" "$pad_cols" "" "$line"
  done

  # Print bottom vertical padding
  # (Optional: The remaining lines will automatically be blank)
}
# Example usage:

seconds=0

trap "printf \"\033[?25h\" && exit 0" SIGINT
trap "printf \"\033[?25h\" && exit 0" SIGKILL

clear
printf "\033[?25l"

while true
do
    minutes=$((seconds / 60))
    left_seconds=$((seconds % 60))

    tstring=$(printf "%02d:%02d" $minutes $left_seconds)

    center_all "$tstring"
    sleep 1
    seconds=$((seconds+1))
done

# center_all "Hello, World!"
# center_all "This is a longer string to demonstrate centering."
