# Do nothing if not running interactively
[ -z "$PS1" ] && return

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S  '
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

PATH=$PATH:~/bin

export LS_OPTIONS='--color=auto -h'
alias ll='ls $LS_OPTIONS -al'
alias l='ls $LS_OPTIONS -l'
alias la='ls $LS_OPTIONS -a'
alias ls='ls $LS_OPTIONS'
alias die='killall fluxbox'
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'
alias eject='eject -T'
alias lock='xscreensaver-command -lock'
alias rmusic='ncmpc -h seashanty -c'
alias playing='mpc -h seashanty current'

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

export BROWSER="firefox"
export EDITOR="vim"

BLUE="\[\033[0;34m\]"
RED="\[\033[0;31m\]"
LIGHT_RED="\[\033[1;31m\]"
WHITE="\[\033[1;37m\]"
NO_COLOUR="\[\033[0m\]"
case $TERM in
    xterm*|rxvt*)
            TITLEBAR='\[\033]0;\u@\h:\w\007\]'
            ;;
    *)
            TITLEBAR=""
            ;;
esac
PS1="${TITLEBAR}\
$BLUE[$RED\$(date +%H%M)$BLUE]\
$BLUE[$LIGHT_RED\u@\h:\w$BLUE]\
$BLUE\$(__git_ps1 '[')\
$LIGHT_RED\$(__git_ps1 '%s')\
$BLUE\$(__git_ps1 ']')\
$WHITE\$$NO_COLOUR "

eval $(TERM=$TERM keychain --eval -q)

if [ -f ~/.bash_prompt ]; then
	. ~/.bash_prompt
fi

if [ -f ~/.bashrc_anchor ]; then
	. ~/.bashrc_anchor
fi

# git ps1 display options:
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=auto
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
