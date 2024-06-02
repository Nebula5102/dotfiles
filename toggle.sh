#!/run/current-system/sw/bin/bash

script_filepath="$HOME/.config/kitty/open.sh"
launch_filepath="$HOME/.config/kitty/launch.conf"
toggle_filepath="$HOME/toggle.sh"

comment_line=5
toggle_line=9
toggle=0

if [ "$toggle" -eq 1 ]; then
    sed -i "${comment_line}s/^# //" "$script_filepath"
    sed -i "${toggle_line}s/.*/toggle=0/" "$toggle_filepath"
    echo "launch sh -c '~/.config/kitty/open.sh && neofetch --source ~/Pictures/ascii_2.txt && exec fish'" > ~/.config/kitty/launch.conf
    echo "Safe for work"
else
    sed -i "${comment_line}s/^/# /" "$script_filepath"
    sed -i "${toggle_line}s/.*/toggle=1/" "$toggle_filepath"
    . "$script_filepath"
    echo "Hacker mode activated"
fi

