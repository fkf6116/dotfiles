#!/bin/bash

PLAYER="playerctl"

# Get status and metadata
STATUS=$($PLAYER status 2>/dev/null)
META=$($PLAYER metadata --format '{{artist}} - {{title}}' 2>/dev/null)

# Nerd Font icons
ICON_NOTE=""
ICON_PLAY=""
ICON_NEXT=""
ICON_PREV=""
ICON_STOP=""

# Display logic
if [ "$STATUS" = "Playing" ]; then
    echo "$ICON_NOTE $META  $ICON_PREV $ICON_PLAY $ICON_NEXT"
elif [ "$STATUS" = "Paused" ]; then
    echo "$ICON_NOTE (paused) $META  $ICON_PREV $ICON_PLAY $ICON_NEXT"
else
    echo "$ICON_NOTE Not playing"
fi

# Click handling
case "$BLOCK_BUTTON" in
    1) $PLAYER previous ;;     # Left click
    2) $PLAYER play-pause ;;   # Middle click
    3) $PLAYER next ;;         # Right click
esac

