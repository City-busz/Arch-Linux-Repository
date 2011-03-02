#!/bin/bash

. /etc/rc.d/functions

case "$1" in
  set)
    stat_busy "Setting Elementary's docky and gnome-panel"
    killall docky
    gconftool-2 --recursive-unset /apps/panel
    gconftool-2 --recursive-unset /apps/docky-2
    gconftool-2 --load /usr/share/elementary/gnome-panel-elementary.xml
    gconftool-2 --load /usr/share/elementary/docky-elementary.xml
    killall gnome-panel
    docky >/dev/null&
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  unset)
    stat_busy "Unsetting Elementary's docky and gnome-panel"
    killall docky
    gconftool-2 --recursive-unset /apps/panel
    gconftool-2 --recursive-unset /apps/docky-2
    killall gnome-panel
    docky >/dev/null&
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

