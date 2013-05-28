#!/bin/sh

export QT_GRAPHICSSYSTEM=raster
# for Gtk+ theme
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# english interface
export LC_MESSAGES=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8

sh ~/.jackdrc 2>/dev/null &

test -f ~/.wallpaper \
    && feh --no-xinerama --bg-scale ~/.wallpaper \
    || xsetroot -solid black

pgrep yeahconsole >>/dev/null || yeahconsole &

# keyboard
xxkb &
# reset all
setxkbmap us -option 
# english, russian, emacs
setxkbmap us,ru,us -option "ctrl:nocaps,menu:compose"
# libX11 workaround :(
xkbcomp $DISPLAY - | egrep -v "group . = AltGr;" | xkbcomp - $DISPLAY
xmodmap ~/.Xmodmap
xbindkeys
# nice beep
xset b 40 8000 15

#
`which laptop-detect` && {
    synclient RightEdge=800
#    pgrep batcontrol.sh >>/dev/null || ~/bin/batcontrol.sh &
}

lxpanelx --colormap system &
$HOME/bin/stumpwm
