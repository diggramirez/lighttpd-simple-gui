#!/bin/sh
#
# libsamp-forms.sh
#
# Copyright (C) 2013 Elvin Rodas - elvinrodas@outlook.com
#
VERSION=1.0

#include library
. /lib/libtaz.sh
. /opt/samp-sis/libs/libsamp-array.sh

#functions

form_title() {
  boldify " $@"
  separator
}

form_header() {
  newline
  boldify " $1"
  echo " $2"
  separator
}
form_footer() {
  separator
  echo " $@"
}

form_label() {
  echo -n " $(colorize 38 "$@")"
}
form_input() {
  form_label "$@" && read answer
}
form_confirm() {
  form_label "$@" && confirm
}

form_exit_msg() {
  form_label "End... You can now close this window."
  newline
}
