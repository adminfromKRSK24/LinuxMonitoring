#! /bin/bash

source ./count_parametrs.cfg

#Проверка количества букв для имени папки
long_stick_name_dir=${#3}

if [[ $2 =~ [a-zA-Zа-яА-Я] ]] # проверяем второй аргумент на буквы
then
    echo "error_2"; exit
fi

if [[ $3 =~ [0-9] ]] # проверяем третий аргумент на числа
then
    echo "error_3"; exit
fi

if [ $long_stick_name_dir -gt $long_stick_name_dir_const ] # проверяем третий аргумент на кол-во символов
then
    echo "error_3.1"; exit
fi

if [[ $4 =~ [a-zA-Zа-яА-Я] ]] # проверяем четвертый аргумент на буквы
then
    echo "error_4"; exit
fi

if [[ $5 =~ [0-9] ]] # проверяем пятый аргумент на числа
then
    echo "error_5"; exit
fi

# разделить строку с помощью пользовательского разделителя
IFS='.' read -a my_array2 <<< $5    
long_name_file=${#my_array2[0]} 
long_permission_file=${#my_array2[1]}

#проверка на кол-во эл-тов в наз-и файла или разрешении
if [[ $long_name_file -gt $long_name_file_const ]] || [[ $long_permission_file -gt $long_permission_file_const ]]
then
    echo "error_5.1"; exit
fi

size_file=${6: 0: $(( ${#6}-2 ))}
type_size=${6: -2}
if ! [ "$type_size" == "Kb" ]; then echo "type_only: Kb"; exit; fi
if [[ $size_file =~ [a-zA-Zа-яА-Я] ]]; then echo "only_numbers"; exit; fi
if [[ size_file -gt 100 ]] || [[ size_file -eq 0 ]]; then echo "error_memory"; exit; fi
