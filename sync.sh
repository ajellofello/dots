#!/bin/bash

user=$(whoami)

emphasis="\e[0;33m"
success="\e[0;34m"
reset="\e[0m"
fail="\e[0;31m"

get_dest() {
  default_dest="/home/"$user"/dots"

  if [ "$1" ]; then
    echo "$1"
  else
    echo "$default_dest"
  fi
}

dest=$(get_dest "$1")
if [ ! -d "$dest" ]; then
  echo -e "dest directory \""$dest"\" does not exist
create it or change the dest directory" 1>&2
  exit 1
fi

configs=(
  "/home/"$user"/.config/kitty" 
  "/home/"$user"/.config/rofi" 
  "/home/"$user"/.config/waybar" 
  "/home/"$user"/.config/mako" 
  "/home/"$user"/.config/hypr" 
  "/home/"$user"/.config/nvim" 
  "/home/"$user"/.config/fastfetch" 
  "/home/"$user"/.config/spicetify" 
  "/home/"$user"/.bashrc" 
  "/home/"$user"/walls" 
)
config_len=${#configs[@]}
moved_configs=0

echo -e copying "$emphasis""$config_len""$reset" configs to "$emphasis""$dest""$reset"
echo

for config in ${configs[@]}
do
  dest_config="$dest"/"$(basename "$config")"
  if [ ! -d "$config" ] && [ ! -f "$config" ]; then
    echo -e "$fail"config "$config" does not exist, could not copy"$reset"
    continue
  fi

  cp -TR "$config" "$dest_config" 2>/dev/null
  echo -e copied "$emphasis""$config""$reset" to "$emphasis""$dest_config""$reset"

  ((moved_configs++))
done

echo
echo -en Moved "$emphasis""$moved_configs""$reset" out of "$emphasis""$config_len""$reset"

echo -e ""$success"
 ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____| "$reset""
