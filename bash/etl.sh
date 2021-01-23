#ETL-Status Check
clear

echo "ETL-Status-Chec" + date
ps | grep bash > etl.txt
ps | grep usr > etl.txt
