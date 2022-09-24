#!/bin/bash

#Створення імя ноди
if [ ! $MYNAME ]; then
	read -p "Введите имя вашей ноды : " MYNAME
fi
echo 'Имя вашей ноды: ' $MYNAME
sleep 1
echo "Готово"
echo "-----------------------------------------------------------------------------"
ironfish accounts:create $MYNAME
sleep 1
ironfish accounts:use $MYNAME
sleep 1
ironfish config:set nodeName $MYNAME
ironfish config:set blockGraffiti $MYNAME
ironfish config:set minerBatchSize 60000
ironfish config:set enableTelemetry true
echo "Имя ноды успешно добавлено"
echo "-----------------------------------------------------------------------------"
