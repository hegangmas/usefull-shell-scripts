#! /bin/bash

case "$(pidof amadeus.x86 | wc -w)" in

0)  echo "Restarting Amadeus:     $(date)" >> /var/log/amadeus.txt
    /etc/amadeus/amadeus.x86 &
    ;;
1)  # all ok
    ;;
*)  echo "Removed double Amadeus: $(date)" >> /var/log/amadeus.txt
    kill $(pidof amadeus.x86 | awk '{print $1}')
    ;;
esac
