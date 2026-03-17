#!/bin/bash

get_usage_today() {
    STAMP_DIR="$HOME/.local/share/usage-tracker/$(date +%Y-%m-%d)"
    
    if [ ! -d "$STAMP_DIR" ]; then
        echo "0h 0m"
        return
    fi

    # Count the minute-stamps
    total_minutes=$(ls "$STAMP_DIR" | wc -l)
    
    printf "%dh %dm" $((total_minutes/60)) $((total_minutes%60))
}

i3status -c ~/.config/i3status/config | while :
do
    read line
    echo "Today: $(get_usage_today) | $line" || exit 1
done
