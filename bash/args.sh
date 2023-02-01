#!/bin/bash

#### Argumente ####

# $0 hat immer den File-Namen, $n das n-te Argument
echo "Aufruf durch $0 mit Parameter $1."
echo "Argument 2 ist $2."
## im Array $@ sind automatisch alle Argumente 
## - und in @# automatisch die Anzahl der Argumente 
echo "Insgesamt also folgende $# Argumente (als Stream): $@"
echo " --- oder einzeln (als Loop ausgelesen)"
for i in $@
do
    echo $i
done

#### Optionen ####
# Optionen sind "dash-letter" - Kombinationen, z.B. "-r"
#   mit oder ohne darauf folgenden Argumenten
# mit getopts kann ein Skript darauf zugreifen
#    : nach Buchstabe: Pflichtfeld

while getopts :u:p:ab option; do
        case $option in
                u) user=$OPTARG;;
                p) pass=$OPTARG;;
                a) echo "got the A flag";;
                b) echo "got the B flag";;
                ?) echo "I don't know what $OPTARG is!";;
        esac
done

echo "user:$user / pass: $pass"

#### User input - read options ####
echo "What is your password?"
read -s pass # -s Eingabe nicht anzeigen

read -p "What's your favorite animal? " animal # -p: Prompt und Eingabe auf einer Zeile

echo "Name: $name, Password: $pass, Fave Animal: $animal"

echo "Which animal"
select animal in "cat" "dog" "bird" "fish"

do
    echo "You selected $animal!"
    break
done

echo "---- nochmal Optionen ----"
## Eingabeliste anzeigen
select animal in "cat" "dog" "quit"
do
       case $animal in 
               cat) echo "Cats like to sleep.";;
               dog) echo "Dogs like to play catch.";;
               quit) break;;
               *) echo "I'm not sure what that is.";;
        esac
done

## Eingabe: read-Optionen
#  -i Default-Angaben
#  -e Read-Editor - wenn man mit Defaults arbeitet
#  -p Prompt und Eingabe auf einer Linie 
read -ep "What is your pet's name? " -i "Pabu" petname

echo $petname

## Eingabe erzwingen mit -z (zero) Test
read -p "What would you like for dinner?" dinner

while [[ -z $dinner ]]
do
    read -p "Please submit your dinner order." dinner
done

echo "You will be having $dinner for dinner!"
