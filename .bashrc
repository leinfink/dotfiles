#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

source /usr/share/doc/pkgfile/command-not-found.bash

### custom commands and aliases ###

workon() {
    source $HOME/.virtualenvs/"$1"/bin/activate
    cd $HOME/Dokumente/Programming/"$1"/
}

alias django-run='python manage.py runserver --settings=config.settings.local'
alias django-run-testing='python manage.py runserver --settings=config.settings.testing'

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
source /usr/share/bash-completion/completions/git
__git_complete g __git_main

### end custom commands ###

# Node Version Manager NVM
source /usr/share/nvm/init-nvm.sh
