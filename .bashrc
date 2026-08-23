# If not running interactively, don't do anything
[[ $- != *i* ]] && return

cowsay -t $(uptime -p)

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# setting nvim aliases
alias vi="nvim"
alias vim="nvim"

# aliasing my configuration syncing script
alias sync="/home/"$(whoami)"/./scripts/sync.sh"

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
  git branch --show-current &> /dev/null

  if [[ "$?" == 0 ]];then
    branch="$red($(git branch --show-current))$reset "
  else
    branch=""
  fi
    export PS1="$branch$green\u@\h$reset:$blue\w$reset\$ "
}
export PROMPT_COMMAND=prompt_command

export PATH=$HOME/.local/bin:$PATH

export PATH=$PATH:/home/fih/.spicetify

