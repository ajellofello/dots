# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# I want the funny cow!!!!
cowsay -t $(uptime -p)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# setting nvim aliases
alias vi="nvim"
alias vim="nvim"

# COLORS :D
reset="\[\e[0m\]"
black="\[\e[0;30m\]"
red="\[\e[0;31m\]"
green="\[\e[0;32m\]"
yellow="\[\e[0;33m\]"
blue="\[\e[0;34m\]"
purple="\[\e[0;35m\]"
cyan="\[\e[0;36m\]"
white="\[\e[0;37m\]"

prompt_command() {
  # set command status
  if [ "$?" == 0 ]; then
    cmdstat="$white&$reset"
  else
    cmdstat="$red&$reset"
  fi

  # get git branch
  branch=$(git branch --show-current 2> /dev/null)

  if [ "$branch" != "" ]; then
    branch="$red$branch$reset "
  fi

  # set shell
  export PS1="$cmdstat $branch{ $cyan\W$reset } "
}

export PROMPT_COMMAND=prompt_command
export PATH=$PATH:/home/fih/.spicetify

