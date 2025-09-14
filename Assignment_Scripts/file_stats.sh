#!/bin/bash

FILE="$1"

if [ ! -f "$FILE" ]; then
  echo "File not found!"
  exit 1
fi

# Count lines, words, characters
LINES=$(wc -l < "$FILE")
WORDS=$(wc -w < "$FILE")
CHARS=$(wc -m < "$FILE")

# Find longest word
LONGEST_WORD=$(tr -cs '[:alnum:]' '[\n*]' < "$FILE" | awk '{ if (length > max) { max = length; longest = $0 } } END { print longest }')

echo "Lines: $LINES"
echo "Words: $WORDS"
echo "Characters: $CHARS"
echo "Longest word: $LONGEST_WORD"
