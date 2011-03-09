#!/bin/bash

. /etc/rc.d/functions

case "$1" in
  set)
    stat_busy "Setting Linux Mint's gnome-panel"
    gconftool-2 --recursive-unset /apps/panel
    gconftool-2 --load /usr/share/mint/gnome-panel-mint.xml
    killall gnome-panel
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  unset)
    stat_busy "Unsetting Linux Mint's gnome-panel"
    gconftool-2 --recursive-unset /apps/panel
    killall gnome-panel
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  *)
    echo "usage: $0 {set|unset}"
esac
exit 0

