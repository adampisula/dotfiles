alias vim="nvim"
alias ls="lsd"
alias s="sudo"
alias e="exit"
alias c="clear"

alias abs="realpath"
alias apt="sudo apt"
alias apti="sudo apt install"
alias aptr="sudo apt remove"
alias md="~/Scripts/music/download.sh"

alias l="ls"
alias ll="ls -alF"
alias la="ls -A"
alias cp="cp -i"
alias mv="mv -i"

alias gc="git clone"
alias gpl="git pull"
alias gps="git push"

alias airplane="nmcli networking off"

alias mpv="devour mpv"
alias feh="devour feh"
alias zathura="devour zathura"
alias thunar="devour thunar"


alias open="xdg-open"
alias copy="xclip -sel clip"

alias vimrc="vim ~/.config/nvim/init.vim"
alias i3-config="vim ~/.config/i3/config"
alias xr-config="vim ~/.Xresources && xrdb ~/.Xresources"

alias br="urxvt&"

alias reset="reset && . ~/.bash_profile"
alias ffchrome="cd ~/.mozilla/firefox/uumogs28.deifault-release/chrome"
alias audio-reset="puleaudio -k && sudo alsa force-reload && pulseaudio --start"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias wttr="curl -s wttr.in | head -n 7 | tail -n 6; printf '\n'"
alias wallpaper="feh --randomize --no-fehbg --bg-fill"
