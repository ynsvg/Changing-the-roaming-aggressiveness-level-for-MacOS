#!/bin/bash

read -p "Хочешь изменить агрессивность(1) или вернуть настройки по умолчанию(2)? (1/2): " par_choise

if [ $par_choise == "1" ]; then
read -p "Выбери значение агрессивности роуминга Wi-Fi (1-4; 1 - наименьшая агрессивность, 4 - наибольшая): " aggressiveness_level
dasdasdads
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int $aggressiveness_level

sudo ifconfig en0 down
sudo ifconfig en0 up

echo "Готово!"
fi

if [ $par_choise == "2" ]; then
sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel

sudo ifconfig en0 down
sudo ifconfig en0 up

echo "Готово!"

fi
