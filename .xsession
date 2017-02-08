#!/bin/sh


export XCURSOR_THEME=Obsidian
export XDG_DATA_DIRS=/usr/share:/usr/share:/usr/local/share
export QT_PLUGIN_PATH=$HOME/.kde/lib/kde4/plugins/:/usr/lib/kde4/plugins/
export QT_GRAPHICSSYSTEM=raster
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
# for Gtk+ theme
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
#export GTK2_RC_FILES=/etc/gtk-2.0/gtkrc:$HOME/.gtkrc-2.0::$HOME/.kde/share/config/gtkrc-2.0

# english interface
export LC_MESSAGES=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8

xrdb -load ~/.Xresources
sh ~/.jackdrc 2>/dev/null &

#test -f ~/.wallpaper \
#    && feh --no-xinerama --bg-scale ~/.wallpaper \
#    || xsetroot -solid black
feh --no-xinerama --bg-scale ~/.wallpaper &

pgrep yeahconsole >>/dev/null || yeahconsole &

# keyboard
# xxkb &
# reset all
setxkbmap us -option
# english, russian, emacs
# Caps Lock as Ctrl, Both Shift-Keys together toggle Caps Lock, Enable extra typographic characters
# setxkbmap us+typo,ru -option "ctrl:nocaps,shift:both_capslock" -variant ",ruu"
# experimental layout
setxkbmap us -option; setxkbmap us+typo+"modifiers(rctl_switch_multikey)+c720(swapwin)+c720(fn_keys)+c720(editing)",rup -option "ctrl:nocaps,shift:both_capslock,grp:toggle,nbsp:level4"  -print | xkbcomp -I"$HOME/.xkb" - "$DISPLAY"
# libX11 workaround :(
xkbcomp $DISPLAY - | egrep -v "group . = AltGr;" | xkbcomp - $DISPLAY
# remap some keys
# xmodmap ~/.Xmodmap
xbindkeys
# nice beep
xset b 40 8000 15

#
`which laptop-detect` && {
    synclient RightEdge=800
#    pgrep batcontrol.sh >>/dev/null || ~/bin/batcontrol.sh &
}
lxpanelx --colormap system &
#lxpanel &
#lxqt-panel &
test -z $_LXSESSION_PID && $HOME/bin/stumpwm
