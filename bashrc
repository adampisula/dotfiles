
# ~/.bashrc: executed by bash(1) for non-login shells.

BROWSER=/usr/bin/firefox

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;35m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w \$ '
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u\[\033[01;35m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
fi

unset color_prompt force_color_prompt

case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# source alias definitions files
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi
if [[ -f ~/.bash_profile ]]; then
    . ~/.bash_profile
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"

# -= start battery prompt =-
battery_status(){
BATTERY=/sys/class/power_supply/BAT1 #this is for pinephone and pinetab
BATSTATE=$(cat ${BATTERY}/status)
CHARGE=$(cat ${BATTERY}/capacity)
NON='\001\e[0m\002'
BLD='\001\e[1m\002'
RED='\001\e[1;31m\002'
GRN='\001\e[1;32m\002'
YEL='\001\e[1;33m\002'
COLOUR="$RED"
case "${BATSTATE}" in
  'Charged')
    BATSTT="="
  ;;
  'Charging')
    BATSTT="+"
  ;;
  'Not charging'|'Discharging')
    BATSTT="-"
  ;;
  *)
    BATSTT="*"
  ;;
esac
# prevent a charge of more than 100% displaying
if [ "$CHARGE" -gt "99" ]
then
  CHARGE=100
fi
if [ "$CHARGE" -gt "24" ]
then
  COLOUR="$YEL"
fi
if [ "$CHARGE" -gt "34" ]
then
  COLOUR="$GRN"
fi
printf "[${BATSTT}${COLOUR}${CHARGE}%%${NON}]"
} #end of battery_status()
if [ $(id -u) -eq 0 ];
then # you are root, set red colour prompt
  PS1='$(battery_status)\[\033[1;31m\]\u\[\033[0;32m\]@\h\[\033[1;34m\] \w\[\033[0m\]\$ '
else # normal user
  PS1='$(battery_status)\[\033[1;36m\]\u\[\033[0;32m\]@\h\[\033[1;34m\] \w\[\033[0m\]\$ '
fi
# -=end battery prompt=-```
