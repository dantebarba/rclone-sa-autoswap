#!/bin/sh
cp $1 $1.bak
sed -i "/service_account_file = /c\service_account_file = $2$(( ( RANDOM % $3 )  + 1 )).json" $1.bak;
cat $1.bak > $1;
rm $1.bak;
