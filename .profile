# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:/usr/NX/bin:$PATH"
fi

XCURSOR_THEME=Obsidian
XDG_DATA_DIRS=/usr/share:/usr/share:/usr/local/share
QT_PLUGIN_PATH=/home/dk/.kde/lib/kde4/plugins/:/usr/lib/kde4/plugins/
export GTK_RC_FILES=/etc/gtk/gtkrc:/home/dk/.gtkrc::/home/dk/.kde/share/config/gtkrc
export GTK2_RC_FILES=/etc/gtk-2.0/gtkrc:/home/dk/.gtkrc-2.0::/home/dk/.kde/share/config/gtkrc-2.0
stty -ixon


#if [ "$TERM" != "screen" ] && [ ! $NOSCREEN ] ; then
#    screen -R
#    exit
#fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

