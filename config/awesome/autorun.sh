#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}


# Programs to run on startup
run unclutter -idle 3  # hide cursor after 3 seconds of inactivity
run numlockx on # enable numlock
