#!/bin/bash

#Створення імя ноди
if [ ! $myname ]; then
	read -p "Введите имя вашей ноды : " myname
fi
echo 'Имя вашей ноды: ' $myname
sleep 1
echo "Готово"
echo "-----------------------------------------------------------------------------"
ironfish accounts:create $myname
ironfish accounts:use $myname
ironfish config:set nodeName $myname
ironfish config:set blockGraffiti $myname
ironfish config:set minerBatchSize 60000
ironfish config:set enableTelemetry true
echo "Имя ноды успешно добавлено"
echo "-----------------------------------------------------------------------------"
