#!/bin/sh

# creates symlinks between all top level directories in the dots
# directory to their respective place either $HOME/<path> or
# $HOME/.config/<path>

emphasis="\e[0;33m"
success="\e[0;34m"
reset="\e[0m"

dots="$HOME/dots"
linked_configs=0

configs=$(ls -a)
configs_to_link=0

for config in ${configs[@]}
do
  if [ $config = "." ] || [ $config = ".." ] || [ $config = ".git" ] || [ $config = "link.sh" ]; then
    continue
  fi

  ((configs_to_link++))
done


if [ ! -d $dots ]; then
  echo $dots doesn\'t exist. PLS clone the repo or smt 1>&2
  exit 1
fi

link_config() {
  local src=$1
  local dst=$2

  echo -e "$emphasis$src$reset -> $emphasis$dst$reset"
  ln -s $src $dst
  ((linked_configs++))
}

echo -e Going to link $emphasis$configs_to_link$reset
echo

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

  if [ -d $dst ] || [ -f $dst ]; then
    rm -rf $dst
  fi

  link_config $src $dst
done

echo
echo -e Linked $emphasis$linked_configs$reset out of $emphasis$configs_to_link$reset
echo -e ""$success"
 ____   ___  _   _ _____
|  _ \ / _ \| \ | | ____|
| | | | | | |  \| |  _|
| |_| | |_| | |\  | |___
|____/ \___/|_| \_|_____| 
"$reset""

