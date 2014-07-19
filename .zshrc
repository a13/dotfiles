#source /etc/profile
source ~/.profile
. ~/.zsh/mouse.zsh
zle-toggle-mouse

autoload -U compinit
compinit
autoload -U incremental-complete-word
zle -N incremental-complete-word


autoload -U insert-files
zle -N insert-files
autoload -U predict-on
zle -N predict-on
zle -N predict-off
bindkey "^X^A" predict-on # C-x C-z
#bindkey "^S" predict-off # C-z
autoload zmv

# $PROMPT style
fpath=(~/.zsh/functions $fpath)
autoload -U promptinit
promptinit
prompt lazy

source ~/.zsh/env.sh
source ~/.zsh/comp.zsh
source ~/.zsh/bindkey.zsh
source ~/.zsh/functions.sh
source ~/.zsh/shell.alias

preexec() {
        [[ -t 1 ]] || return
        case $TERM in
                *xterm*|*rxvt*|(dt|k|E)term*) print -Pn "\e]2;<$1> [%~]\a"
                ;;
        esac
}
# csh compatibility
setenv() {
        typeset -x "${1}${1:+=}${(@)argv[2,$#]}"
}
freload() {
        while (( $# )); do; unfunction $1; autoload -U $1; shift; done
}
typeset -U path cdpath fpath manpath

HISTFILE=~/.zhistory
SAVEHIST=7770
HISTSIZE=777
DIRSTACKSIZE=20

setopt  APPEND_HISTORY
setopt  HIST_IGNORE_ALL_DUPS
setopt  HIST_IGNORE_SPACE
setopt  HIST_REDUCE_BLANKS
setopt  No_Beep


#[[ $EMACS = t ]] && unsetopt zle

case "$TERM" in
    dumb)
        unsetopt zle
        unsetopt prompt_cr
        unsetopt prompt_subst
        unfunction precmd
        unfunction preexec
        PS1='$ '
        ;;        
    screen*)
        ;;
    *)
        screen
        ;;
esac
