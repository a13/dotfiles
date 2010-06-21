# -*- mode: shell-script; -*-
#Красивости и фишки дополнения
#
zstyle ':completion:*:default' list-colors ${LS_COLORS}
zstyle ':completion:*' completer _complete _list _oldlist _expand _ignored _match _correct _approximate _prefix
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' add-space true
zstyle ':completion:*:processes' command 'ps -xuf'
zstyle ':completion:*:processes' sort false
zstyle ':completion:*:processes-names' command 'ps xho command'
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' old-menu false
zstyle ':completion:*' original true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ':completion:*' word true

#Системные пользователи которых не стоит дополнять
zstyle ':completion:*:*:*:users' ignored-patterns \
root toor daemon operator bin tty kmem games news \
man sshd bind proxy _pflogd _dhcp uucp pop www \
nobody mailnull smmsp gnats jabber mysql messagebus \
dnscache dnslog ftp spamd

zstyle '*' single-ignored show
