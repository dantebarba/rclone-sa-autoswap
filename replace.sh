#!/bin/sh
echo $(( ( RANDOM % 2 )  + 1 ));
sed -i '/service_account_file = /c\service_account_file = $1$(( ( RANDOM % $2 )  + 1 )).json' $0;
