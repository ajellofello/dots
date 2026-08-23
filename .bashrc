# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
# setting nvim aliases
alias vi="nvim"
alias vim="nvim"

# aliasing my configuration syncing script
alias sync="/home/"$(whoami)"/./scripts/sync.sh"

# COLORS :D
RESET="\[\e[0m\]"
BLACK="\[\e[0;30m\]"
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
PURPLE="\[\e[0;35m\]"
CYAN="\[\e[0;36m\]"
WHITE="\[\e[0;37m\]"

function prompt_command {
	git branch --show-current &> /dev/null
	RET=$?

	if [[ "$RET" == 0 ]];then
		BRANCH="$RED($(git branch --show-current))$RESET "
	else
		BRANCH=""
	fi
	export PS1="$BRANCH$GREEN\u@\h$RESET:$BLUE\w$RESET\$ "
}
export PROMPT_COMMAND=prompt_command

export PATH=$HOME/.local/bin:$PATH

export PATH=$PATH:/home/fih/.spicetify
