#
# ~/.bashrc
#

# Run only on interactive shells
[[ $- != *i* ]] && return


# Prompt
PS1='\[\033[01;36m\]\W\
\[\033[01;34m\] ❯\
\[\033[00m\] '


# Key bindings
bind '"\C-f":"cd_with_fzf\n"'
bind '"\C-o":"open_with_fzf\n"'


# Environment Variables
export VISUAL=vim
export EDITOR="$VISUAL"


# Aliases
#shopt -s expand_aliases
alias ls="ls --color=auto --group-directories-first"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ll="ls -lhN"
alias cp="cp -i"				#  confirm before overwriting something
alias rm="rm -vI"				#  a bit safer rm
alias df="df -h"				#  human-readable sizes
alias free="free -h"			#  human-readable sizes

alias yay="yay --answerdiff All"
alias clip="xclip -selection c"
alias spelling='aspell -c -t'
alias configit='/usr/bin/git --git-dir=$HOME/dotfiles.git/ --work-tree=$HOME' 
alias yt='XDG_CONFIG_HOME=/home/eyal/.youtube XDG_DATA_HOME=/home/eyal/.youtube newsboat'


# Fix Locale
unset LANG 
source /etc/profile.d/locale.sh


# Autocompletion
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion


# History
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist  # Combine multiline commands into one in history
export HISTCONTROL=ignoredups:ignorespace #  Commands with leading space do not get added to history
export HISTIGNORE="&:ls:[bf]g:exit"  # Ignore ls without options and builtin commands


# Properly handle window resizing
shopt -s checkwinsize


# Colors for manpages
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline


# Fuzzy Finder functions
cd_with_fzf() 
{
	cd $HOME && \
	cd $(fd -t d | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden) && \
	echo "$PWD"
}

cd_with_fzfh() 
{
	cd $HOME && \
	cd $(fd -t d -H | fzf --preview="tree -L 1 {}" --bind="space:toggle-preview" --preview-window=:hidden) && \
	echo "$PWD"
}

open_with_fzf_once()
{
	FZF_CHOICE=$(fd -t f -H -I | fzf)
	nohup xdg-open "$FZF_CHOICE" & exit
}

open_with_fzf()
{
	fd -t f -H -I | \
	fzf |
	xargs -ro -d "\n" xdg-open 2<&-
}

pacs() 
{
    sudo pacman -S $(pacman -Ssq | fzf -m --preview="pacman -Si {}" --preview-window=:hidden --bind=space:toggle-preview)
}


# Helper functions
ex()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

colors() 
{
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
