bindkey -d                                      # reset
#bindkey -v                                     # vi key bindings
bindkey -e                                       # emacs key bindings
autoload -U edit-command-line
zle -N  edit-command-line
bindkey -M emacs "^X^E" edit-command-line

# Keyboard configuration
bindkey "\e[2~"         quoted-insert           # Insert
bindkey "\e[3~"         delete-char             # Suppr
bindkey "\e[1~"         beginning-of-line       # Home
bindkey "\e[4~"         end-of-line             # End
bindkey "\e[5~"         up-line-or-history      # Previous
bindkey "\e[6~"         down-line-or-history    # Next

# those two are for rxvt
bindkey "\e[7~"         beginning-of-line
bindkey "\e[8~"         end-of-line

# some xterms, freebsd console
bindkey "\e[H"          beginning-of-line
bindkey "\e[F"          end-of-line

# on some exotic xterms
bindkey "\eOH"          beginning-of-line
bindkey "\eOF"          end-of-line
bindkey "\eOd"          backward-word
bindkey "\eOc"          forward-word

# on nxterms
bindkey "\e[\C-@"       beginning-of-line
bindkey "\e[e"          end-of-line

if [ "${TERM%%-*}" = xterm ]; then
        #
        # Application keypad and cursor of xterm
        # with NumLock ON
        #
        # Operators
        bindkey -s "\eOo"       "/"
        bindkey -s "\eOj"       "*"
        bindkey -s "\eOm"       "-"
        bindkey -s "\eOk"       "+"
        bindkey -s "\eOl"       "+"
        bindkey "\eOM"          accept-line

        # Colon and dot
        # bindkey -s "\eOl"     ","
        bindkey -s "\eOn"       "."

        # Numbers
        bindkey -s "\eOp"       "0"
        bindkey -s "\eOq"       "1"
        bindkey -s "\eOr"       "2"
        bindkey -s "\eOs"       "3"
        bindkey -s "\eOt"       "4"
        bindkey -s "\eOu"       "5"
        bindkey -s "\eOv"       "6"
        bindkey -s "\eOw"       "7"
        bindkey -s "\eOx"       "8"
        bindkey -s "\eOy"       "9"
fi

#
# Application keypad and cursor of xterm
#
bindkey "\eOD"          backward-char
bindkey "\eOC"          forward-char
bindkey "\eOA"          up-line-or-history
bindkey "\eOB"          down-line-or-history
#bindkey "\eOE" re-read-init-file
