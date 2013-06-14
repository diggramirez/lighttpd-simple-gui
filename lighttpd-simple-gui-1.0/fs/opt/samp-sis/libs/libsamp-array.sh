#!/bin/sh
#
# libsamp-array.sh
#
# Copyright (C) 2013 Elvin Rodas - elvinrodas@outlook.com
#
VERSION=1.0


#functions

count() {
  i=0
  case $1 in
  "array")
    i=-1
    for x in $@; do
      let i=$i+1
    done
    ;;
  "file")
    while read x; do
      let i=$i+1
    done < $2
    ;;
  esac
  return $i
}

last_index() {
  count $@
  let max=$?-1
  return $max
}
