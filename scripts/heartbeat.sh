#!/bin/bash

STAMP_DIR="$HOME/.local/share/usage-tracker/$(date +%Y-%m-%d)"
mkdir -p "$STAMP_DIR"

if swaymsg -t get_outputs | grep -q '"active": true'; then
    touch "$STAMP_DIR/$(date +%H-%M)"
fi
