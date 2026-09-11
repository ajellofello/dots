#!/bin/sh

# creates symlinks between all top level directories in the dots
# directory to their respective place either $HOME/<path> or
# $HOME/.config/<path>

emphasis="\e[0;33m"
success="\e[0;34m"
reset="\e[0m"

dots="$HOME/dots"
configs=$(ls -a)
linked_configs=0

if [ ! -d $dots ]; then
  echo $dots doesn\'t exist. PLS clone the repo or put it into the expected location 1>&2
  exit 1
fi

for config in ${configs[@]}
do
  src="$dots/$config"

  if [ $config = "." ] || [ $config = ".." ] || [ $config = ".git" ] || [ $config = "link.sh" ] || [ $config = "README.md" ]; then
    continue
  fi

  if [ $config = "bashrc" ]; then
    dst="$HOME/.bashrc"
  elif [ $config = "walls" ]; then
    dst="$HOME/$config"
  elif [ $config = "spicetify" ]; then
    # I am only keeping my theme configuration for spicetify and nothing
    # else so I have to change both the src and dst
    src="$HOME/dots/spicetify/Themes"
    dst="$HOME/.config/spicetify/Themes"
  else
    dst="$HOME/.config/$config"
  fi

  if [ -d $dst ] || [ -f $dst ]; then
    rm -rf $dst
  fi

  echo -e "$emphasis$src$reset -> $emphasis$dst$reset"
  ln -sf $src $dst
  ((linked_configs++))
done

echo
echo -e Linked $emphasis$linked_configs$reset configs
echo -e ""$success"
 ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____| 
"$reset""

