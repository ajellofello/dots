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
  echo $dots doesn\'t exist. PLS clone the repo or smt 1>&2
  exit 1
fi

for config in ${configs[@]}
do
  src="$dots/$config"

  if [ $config = "." ] || [ $config = ".." ] || [ $config = ".git" ] || [ $config = "link.sh" ]; then
    continue
  fi

  if [ $config = ".bashrc" ] || [ $config = "walls" ]; then
    dst="$HOME/$config"
  else
    dst="$HOME/.config/$config"
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

