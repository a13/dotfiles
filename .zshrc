source /etc/profile
source ~/.profile

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

preexec() {
        [[ -t 1 ]] || return
        case $TERM in
                *xterm*|*rxvt|(dt|k|E)term*) print -Pn "\e]2;<$1> [%~]\a"
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

export EDITOR="/usr/bin/vim"
export PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
export PAGER=most
export G_BROKEN_FILENAMES=1

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.wmv=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'

source ~/.zsh/comp.zsh
source ~/.zsh/bindkey.sh
source ~/.zsh/functions.sh
source ~/.zsh/shell.alias

#[[ $EMACS = t ]] && unsetopt zle

if [ "$TERM" = "dumb" ]
then
  unsetopt zle
  unsetopt prompt_cr
  unsetopt prompt_subst
  unfunction precmd
  unfunction preexec
  PS1='$ '
fi
