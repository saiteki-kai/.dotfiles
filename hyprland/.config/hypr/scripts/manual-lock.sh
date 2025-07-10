#!/bin/bash
# This script is used to lock the Hyprland session using hyprlock.

timeout=10

loginctl lock-session

# Stop any currently playing media
playerctl stop || true

sleep "$timeout"

pgrep -x hyprlock
hyprctl dispatch dpms off
