#!/bin/bash

case $1 in
  "l") resizeparams="-10 0";;
  "r") resizeparams="10 0";;
  "u") resizeparams="0 -10";;
  "d") resizeparams="0 10";;
  *)
    notify-send "$(basename $0): Invalid direction (must be l, r, u ,d)"
    exit 0
    ;;
esac

floating=$(hyprctl activewindow -j | jq .floating)

if [ $floating = false ]; then
  hyprctl dispatch movewindow $1
else
  hyprctl dispatch moveactive $resizeparams
fi
