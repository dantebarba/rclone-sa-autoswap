#!/bin/sh
echo "$(date) INFO: Swap replace start";
sa_number=$(( ( RANDOM % $3 )  + 1 ));
echo "$(date) INFO: SA selected is: $2$sa_number.json";
cp $1 $1.bak
sed -i "/service_account_file = /c\service_account_file = $2$sa_number.json" $1.bak;
cat $1.bak > $1;
rm $1.bak;
