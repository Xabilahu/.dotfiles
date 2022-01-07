#!/bin/bash

function set_bash_prompt () {
	local status=$?
	local COLOR_DIVIDER="\[\e[30;1m\]"
	local COLOR_USERNAME="\[\e[32;1m\]"
	local COLOR_GITBRANCH="\[\e[33;1m\]"
	local COLOR_VENV="\[\e[36;1m\]"
	local COLOR_GREEN="\[\e[32;1m\]"
	local COLOR_MAGENTA="\[\e[31;1m\]"
	local COLOR_PATH_OK="\[\e[34;1m\]"
	local COLOR_PATH_ERR="\[\e[35;1m\]"
	local COLOR_NONE="\[\e[0m\]"

	local PATH_COLOR=${COLOR_PATH_ERR}
	if test $status -eq 0 ; then
	  PATH_COLOR=${COLOR_PATH_OK}
	fi

	local GIT_PS1=""
	local CONDA_PS1=""
	if ! git_loc="$(type -p "$git_command_name")" || [ -z "$git_loc" ]; then
		if [ -d .git ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
			local GIT_BRANCH=$(git symbolic-ref --short HEAD)
			local GIT_STATUS="${COLOR_PATH_ERR}✗${COLOR_DIVIDER}"
			if output=$(git status --porcelain) && [ -z "$output" ]; then
				GIT_STATUS="${COLOR_GREEN}✓${COLOR_DIVIDER}"
			fi
			GIT_PS1=" ${COLOR_GITBRANCH} ${GIT_BRANCH}${COLOR_DIVIDER} ${GIT_STATUS}"
		fi
	fi

	if ! test -z "$CONDA_DEFAULT_ENV" ; then
		CONDA_PS1="${COLOR_VENV}(`basename \"$CONDA_DEFAULT_ENV\"`)${COLOR_DIVIDER} "
	fi

	PS1="${CONDA_PS1}${COLOR_USERNAME}\u@\h${COLOR_DIVIDER}${COLOR_NONE}:${COLOR_DIVIDER}${PATH_COLOR}\w${COLOR_DIVIDER}${GIT_PS1}${COLOR_MAGENTA} \$${COLOR_DIVIDER}${COLOR_NONE} "
}

# coloured ls
alias ls='lsd'
alias ll='lsd -lia'
alias vim='nvim'

export GPG_TTY=$(tty)
export EDITOR='nvim'

# JAVA stuff
export JAVA_HOME="/usr/lib/jvm/default"

# GOLANG stuff
export GO111MODULE=on

# Own env-vars
export STOW_FOLDERS="general alacritty nvim spotify tmux xournalpp"
export SCRIPTING_UTILS="$HOME/.dotfiles/utils.sh"

export PATH=$HOME/.local/bin:$PATH
export PROMPT_COMMAND=set_bash_prompt

# Activate miniconda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh && conda activate
