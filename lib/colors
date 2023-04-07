#!/bin/bash

_PALETTE="1"

function _color_text() {
  echo -e " \e[$_PALETTE;$2m$1\e[0m"
}

function color_echo_red() {
  _color_text "$1" "31"
}

function color_echo_green() {
  _color_text "$1" "32"
}

function color_echo_blue() {
  _color_text "$1" "34"
}