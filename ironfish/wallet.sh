#!/bin/bash

#Створення імя ноди
if [ ! $myname ]; then
	read -p "Введите имя вашей ноды : " myname
fi
echo 'Имя вашей ноды: ' $myname
sleep 1
echo 'export='$myname >> $HOME/.ironfish/config.json
echo "Готово"
echo "-----------------------------------------------------------------------------"
ironfish accounts:create myname
sleep 1
ironfish accounts:use $myname
sleep 1
ironfish config:set nodeName $myname
ironfish config:set blockGraffiti $myname
ironfish config:set minerBatchSize 60000
ironfish config:set enableTelemetry true
echo "Имя ноды успешно добавлено"
echo "-----------------------------------------------------------------------------"
