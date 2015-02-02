#!/bin/sh

case "$(pidof ss-ctrl | wc -w)" in

0)      echo "Restarting ssctrl:     $(date)" >> /tmp/ssctl.txt
        /usr/bin/ss-ctrl -d &
        ;;
1)      # all ok
        ;;
*)      echo "Removed double ssctl: $(date)" >> /var/log/amadeus.txt
        kill $(pidof ss-ctrl | awk '{print $1}')
        ;;
esac
