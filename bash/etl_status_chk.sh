#!/bin/bash
#ETL-Status Check
clear
user=$(whoami)
day=$(date +%d.%m.%Y-%H:%M:%S)
# Muster definieren
dac='/ps'
P2='263'
P3='NIX'

echo "----------------------------------------------------"
echo "-- ETL-Status-Check - User $user"
echo "-- Zeitpunkt $day"
echo "----------------------------------------------------"

# Muster in Prozessen suchen
ps | grep $dac > /dev/null
chk1=$?
ps | grep $P2 > /dev/null
chk2=$?
ps | grep $P3 > /dev/null
chk3=$?

if [ $chk1 -eq 0 ]; then
      echo "OK - DAC ist AKTIV"
else  echo "WARNUNG: DAC ist INAKTIV" 
fi

if [ $chk2 -eq 0 ]; then
      echo "OK - INFA ... ist AKTIV"
else  echo "WARNUNG: INFA ... ist INAKTIV" 
fi

if [ $chk3 -eq 0 ]; then
      echo "OK - INFA ... ist AKTIV"
else  echo "WARNUNG: INFA ... ist INAKTIV" 
fi
