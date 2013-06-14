#!/bin/sh
#
# file: libsamp-keyboard.sh
# desc: return the key pressed
#
# Copyright (C) 2013 Elvin Rodas - elvinrodas@outlook.com
#
VERSION=1.0


#functions
keyboard_key() {
  local char=""
  local key=""

  # Read one character at a time
  #while IFS= read -r -n 1 -s char

  IFS= read -r -n 1 -s char
  if [ "$char" == $'\x1b' ] # \x1b is the start of an escape sequence
  then
    # Get the rest of the escape sequence (3 characters total)
    while IFS= read -r -n 2 -s rest
    do
      char="$char$rest"
      break
    done
  fi

  if [ "$char" == $'\x1b[A' ]; then # Up
    key="up"
  elif [ "$char" == $'\x1b[B' ]; then # Down
    key="down"
  elif [ "$char" == $'\x1b[D' ]; then # Left
    key="left"
  elif [ "$char" == $'\x1b[C' ]; then # Right
    key="right"
  elif [ -z "$char" ]; then # Newline
    key="enter"
  else
    # other key
    key="$char"
  fi
  echo "$key"
}

