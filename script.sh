#!/bin/bash

PS3='Выберите операцию: '

select choice in "Изменить агрессивность роуминга" "Вернуть настройки по умолчанию" "Выйти"; do
    case $choice in
        "Изменить агрессивность роуминга")
            while true; do
                read -p "Выбери значение агрессивности роуминга Wi-Fi (1-4; 1 - наименьшая агрессивность, 4 - наибольшая): " aggressiveness_level
                case $aggressiveness_level in
                    1) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 1; break;;
                    2) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 2; break;;
                    3) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 3; break;;
                    4) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 4; break;;
                    *) echo "Введите другое значение!";;
                esac
            done
        
        sudo ifconfig en0 down
        sudo ifconfig en0 up
        echo "Готово!"
        break;;
        
        "Вернуть настройки по умолчанию") 
        if sudo defaults read /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel &> /dev/null; then
            sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel
            echo "Настройки агрессивности роуминга Wi-Fi восстановлены по умолчанию."
            else
                echo "Настройки агрессивности роуминга Wi-Fi уже установлены по умолчанию."
        fi
        
        sudo ifconfig en0 down
        sudo ifconfig en0 up
        break;;

        "Выйти")
        break;;

        *) echo "Неверный выбор. Попробуйте снова.";;
    esac
done