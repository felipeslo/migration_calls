#!/bin/bash

#Script needs to be executed on the same day.

#Vars for script
day=`date +%d`
month=`date +%m`
year=`date +%Y`

origen=/var/spool/asterisk/monitor
destiny=/var/spool/asterisk/storage_calls

storage_mounted=`cat $destiny/.check`

if [ $storage_mounted -eq 1 ]
then
mkdir -p $destiny/$year/$month/$day

mv $origen/$year/$month/$day/* $destiny/$year/$month/$day/

rm -r $origen/$year/$month/$day/

ln -s $destiny/$year/$month/$day $origen/$year/$month/$day

chown -R asterisk: $destiny
chown -R asterisk: $origen

else

echo "Diretorio de origem não montado"

fi