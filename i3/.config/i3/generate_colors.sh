#!/bin/sh

wal -q -i "$HOME/wallpaper.jpg"

WAL="$HOME/.cache/wal/colors"
OUT="$HOME/.config/i3/colors.conf"

cat > "$OUT" <<EOF
set \$bg-color            $(sed -n '1p' "$WAL")
set \$inactive-bg-color   $(sed -n '3p' "$WAL")
set \$text-color          $(sed -n '8p' "$WAL")
set \$urgent-color        $(sed -n '5p' "$WAL")
set \$border-color        $(sed -n '2p' "$WAL")

bar {
    status_command i3blocks
    font pango:Poppins 9

    colors {
        background         \$bg-color
        statusline         \$text-color
        separator          \$inactive-bg-color

        focused_workspace  \$border-color \$text-color \$bg-color
        active_workspace   \$border-color \$inactive-bg-color \$text-color
        inactive_workspace \$bg-color \$inactive-bg-color \$text-color
        urgent_workspace   \$urgent-color \$urgent-color \$text-color
    }
}
EOF

i3-msg reload
