#!/bin/bash
{
  flock -n 1 || exit 1
  pactl set-sink-volume @DEFAULT_SINK@ +5%
  sleep 0.2
} 1>/tmp/.volume-scroll.lock
