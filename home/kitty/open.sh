#!/run/current-system/sw/bin/bash
# Generate a random number between 1 and 4
random_number=$((1 + (RANDOM % 5)))

random_number=6

# TODO: change this to just call open instead of writing to config file

# Choose the neofetch ascii based on the random number
case $random_number in
    1)
        echo "launch sh -c '~/.config/kitty/open.sh && neofetch --source ~/Pictures/ascii_1.txt && exec fish'" > ~/.config/kitty/launch.conf;;
    2)
        echo "launch sh -c '~/.config/kitty/open.sh && neofetch --source ~/Pictures/ascii_3.txt && exec fish'" > ~/.config/kitty/launch.conf;;
    3)
        echo "launch sh -c '~/.config/kitty/open.sh && neofetch --source ~/Pictures/ascii_4.txt && exec fish'" > ~/.config/kitty/launch.conf;;
    4)
        echo "launch sh -c '~/.config/kitty/open.sh && neofetch --source ~/Pictures/ascii_6.txt && exec fish'" > ~/.config/kitty/launch.conf;;
    5)
        echo "launch sh -c '~/.config/kitty/open.sh && neofetch --source ~/Pictures/ascii_7.txt && exec fish'" > ~/.config/kitty/launch.conf;;
    6)
        echo "launch sh -c '~/.config/kitty/open.sh && neofetch --source ~/Pictures/ascii_2.txt && exec fish'" > ~/.config/kitty/launch.conf;;
esac
