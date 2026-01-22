#!/bin/bash

# Get all spaces
SPACES=$(yabai -m query --spaces)
WINDOWS=$(yabai -m query --windows)

# Initialize empty array for each space
declare -A apps_by_space

# Parse windows and group them by space
echo "$WINDOWS" | jq -r '.[] | "\(.space) \(.app)"' | while read -r space app; do
    if [ -n "${apps_by_space[$space]}" ]; then
        # Check if app is already in the list
        if [[ ! "${apps_by_space[$space]}" =~ "$app" ]]; then
            apps_by_space[$space]="${apps_by_space[$space]}, $app"
        fi
    else
        apps_by_space[$space]="$app"
    fi
done

# Get current space
CURRENT_SPACE=$(yabai -m query --spaces --space | jq '.index')

# Build the display string
DISPLAY=""
for space in "${!apps_by_space[@]}"; do
    if [ "$space" = "$CURRENT_SPACE" ]; then
        DISPLAY="$DISPLAY${apps_by_space[$space]} | "
    fi
done

# Remove trailing separator
DISPLAY=${DISPLAY% | }

# Update sketchybar
sketchybar --set apps_by_space label="$DISPLAY" 