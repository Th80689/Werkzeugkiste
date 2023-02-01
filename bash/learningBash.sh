#!/bin/bash

echo -n "Enter the name of a country: "
read COUNTRY

echo -n "The official language of $COUNTRY is "

case $COUNTRY in

  Lithuania)
    echo -n "Lithuanian"
    ;;

  Romania | Moldova)
    echo -n "Romanian"
    ;;

  Italy | "San Marino" | Switzerland | "Vatican City")
    echo -n "Italian"
    ;;

  *)
    echo -n "unknown"
    ;;
esac

echo "\nist schön"

if [[ $COUNTRY =='Italy']] then echo "Italien" fi

##
echo "\$0 ist immer der File-Name - \$1 ist das erste Argument"
echo "The $0 script got the argument $1."