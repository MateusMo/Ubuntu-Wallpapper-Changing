#!/bin/bash

WALLPAPER_DIR="$HOME/Imagens/wallpapers"

while true; do
  mapfile -t FILES < <(find "$WALLPAPER_DIR" -type f | shuf)

  for FILE in "${FILES[@]}"; do
    echo "Wallpaper: $FILE"

    gsettings set org.gnome.desktop.background picture-uri "file://$FILE"
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$FILE"
    gsettings set org.gnome.desktop.background picture-options "centered"

    sleep 20
  done
done

