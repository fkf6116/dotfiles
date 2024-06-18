#!/bin/bash

# #!/bin/bash (if using bash and not zsh. Type "echo $0" into command line to see what kind you're using. Mine says /usr/bin/zsh

#### Change "~/Downloads/wallpapers/" to the folder/directory you keep you wallpaper images.

wall=~/wallpapers/desktop-wallpaper/nord/nord-43.png

# Picks background wallpaper
swaybg -i $wall

# generate color scheme
wal -c
wal -i $wall

# Enable this (by removing the # next to pywalfox update) if you use firefox AND downloaded the pywalfox extension and installed repository.
# pywalfox update

# Deletes the sww cache
