#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# if root, don't do anything
[[ "$(whoami)" = "root" ]] && return

if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi

# text at begining of a line
PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias la='ls -lav --ignore=..'   # show long listing
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles

alias shut0='shutdown 0'

# limit recursive functions
[[ -z "$FUNCNEST" ]] && export FUNCNEST=1000

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# enable pkgfile lookup of packages when a command is not available
source /usr/share/doc/pkgfile/command-not-found.bash

# emacs
export EDITOR='emacsclient -a "" -c'
alias ec='emacsclient -nw -a "emacs -nw -a nano"'
alias ecd='emacs --daemon'

# for vterm in emacs
vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
