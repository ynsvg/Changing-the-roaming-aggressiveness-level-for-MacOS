#!/bin/bash

#read -p "Хочешь изменить агрессивность(1) или вернуть настройки по умолчанию(2)? (1/2): " par_choise

#if [ $par_choise == "1" ]; then
#read -p "Выбери значение агрессивности роуминга Wi-Fi (1-4; 1 - наименьшая агрессивность, 4 - наибольшая): " aggressiveness_level

#sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int $aggressiveness_level

#sudo ifconfig en0 down
#sudo ifconfig en0 up

#echo "Готово!"
#fi

#case par_choice in
   # 1) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 1
   # ;;
   # 2) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 2
  #  ;;
  #  3) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 3
    #;;
   # 4) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 4
   # ;;
#esac

PS3='Выберите операцию: '

select choice in "Изменить агрессивность роуминга" "Вернуть настройки по умолчанию" "Выйти"; do
    case $choice in
        "Изменить агрессивность роуминга") read -p "Выбери значение агрессивности роуминга Wi-Fi (1-4; 1 - наименьшая агрессивность, 4 - наибольшая): " aggressiveness_level
        case $aggressiveness_level in
        1) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 1;;
        2) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 2;;
        3) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 3;;
        4) sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel -int 4;;
        *) echo "Введите другое значение!" && continue;;
        esac
        
        sudo ifconfig en0 down
        sudo ifconfig en0 up
        echo "Готово!"
        break;;
        
        "Вернуть настройки по умолчанию") sudo defaults delete /Library/Preferences/SystemConfiguration/com.apple.airport.preferences AggressivenessLevel
        sudo ifconfig en0 down
        sudo ifconfig en0 up
        echo "Готово!"
        break;;
        
        "Выйти")
        break;;
    
    
    *) echo "Выберите другое значение";;
    esac
    done



#sudo ifconfig en0 down
#sudo ifconfig en0 up

#echo "Готово!"

#fi