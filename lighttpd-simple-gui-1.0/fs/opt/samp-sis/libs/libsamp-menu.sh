#!/bin/sh
#
# libsamp-menu.sh
#
# Copyright (C) 2013 Elvin Rodas - elvinrodas@outlook.com
#
VERSION=1.0

#include library
. /lib/libtaz.sh
. /opt/samp-sis/libs/libsamp-array.sh
. /opt/samp-sis/libs/libsamp-keyboard.sh

#functions

  #
menu_read() { #the_file selected_item
  local the_file=$1
  local selected=$2
  local i=0
  #local OLDIFS=$IFS
  
  # [ ! -f $the_file ] && { echo "$the_file file not found"; exit 99; }
  #IFS=$'\t' # the delimiter of the file, using tab here.
  while read line; do
    if [ ! -z "$line" ]; then #check if the is not blank
      if [ $i == $selected ]; then
        echo " $(colorize 31 [X]) $(boldify "$line")"
      else
        echo " [ ] $line"
      fi
      let i=$i+1
    fi
  done < $the_file
  #IFS=$OLDIFS
}

menu_reselect() { #direction(up|down) selected limit
  #kb_key public
  local index=$2
  local kb_key=$1
  local limit=$3

  if [ $kb_key == "up" ]; then #up
   if [ $index -gt 0 ]; then
     let index=$index-1
   fi
  elif [ $kb_key == "down" ]; then #down
    if [ $index -lt $limit ];then
      let index=$index+1
    fi
  fi

  return $index
}
