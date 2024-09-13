#!/bin/sh
# Install dotfiles using stow

for folder in */; do
    echo "stow $folder"

    stow -t "$HOME" -D "$folder"
    stow -t "$HOME" -v "$folder"

    printf "\n"
done
