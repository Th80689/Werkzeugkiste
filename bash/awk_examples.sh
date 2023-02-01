# Beispieldatei erstellen
echo "ID Wert Kommentar" > beispiel.txt 
echo "1 fruit rhubarb" >> beispiel.txt
echo "2 fruit banana" >> beispiel.txt

echo "SYNTAX awk: awk options 'selection _criteria {action}' input-file > output-file"
echo ""
echo "--- Gesamten Inhalt zeigen ---"
awk '{print}' beispiel.txt 

echo "--- nur zweite Zeile zeigen ---"
awk 'NR==2 {print}' beispiel.txt 

echo "--- nur 1. und 3. Spalte zeigen ---"
awk '{print $1, $3}' beispiel.txt 

echo "--- Zeile mit Suchkriterium zeigen ---"
awk '/banana/ {print}' beispiel.txt 

