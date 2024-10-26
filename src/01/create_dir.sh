#! /bin/bash

first_name_dir=$3
all_long_dir=${#3}
tmp_sign_end=${first_name_dir: -1}
date_now=`date +%d%m%y`

if [ $all_long_dir -lt 4 ]; # проверка, чтобы было больше 4 символов
then
    for (( j=$all_long_dir; j<4; j++ ))
    do
        first_name_dir+=$tmp_sign_end
    done
fi 

# Блок осуществляет парсер по пятому элементу скрипта, разделяя на два эл-та по "."
# сохраняя имя файла, разрешения; 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
IFS='.' read -a my_array2 <<< $5  # # # # # # # # # # # # # # # # # #
first_name_file=${my_array2[0]}         # # # # # # # # # # # # # # #
permission_file=${my_array2[1]}   # # # # # # # # # # # # # # # # # #
all_long_file=${#first_name_file}       # # # # # # # # # # # # # # #
tmp_sign_end_f=${first_name_file: -1}   # # # # # # # # # # # # # # #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

# Блок генерирующий начальное имя файла, проверяя, чтобы имя было не менее 4 символов
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
if [ $all_long_file -lt 4 ]; # проверка, чтобы было больше 4 символов
then
    for (( j=$all_long_file; j<4; j++ ))
    do
        first_name_file+=$tmp_sign_end_f
    done
fi 
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

function space_system {
    free_space="$(df -BM | grep "/dev/sda2" | awk '{print $4}' | sed 's/M//')"
    if [[ "$free_space" -le 1000 ]]
    then
        echo "Free space < 1Gb."; exit
    fi
}


for (( g=0; g<$2; g++ )) # здесь создается директория путем добавления буквы к концу строки
do
    space_system
    name_dir_cpu=$first_name_dir"_"$date_now
    long_dir_cpu=${#name_dir_cpu}; 
    if [[ $long_dir_cpu>256 ]]; then exit;  fi
    mkdir -p $1/$name_dir_cpu # если использую без sudo, то ошибка (mkdir: cannot create directory ‘/test’: Permission denied)
    echo "$1/$name_dir_cpu $date_now" >> log.log
    tmp_name=$first_name_file
    for (( h=0; h<$4; h++ )); do
        name_file_cpu=$tmp_name"_"$date_now"."$permission_file
        long_file_cpu=${#name_file_cpu}; 
        if [[ $long_file_cpu>256 ]]; then exit;  fi
        fallocate -l $6 $1/$name_dir_cpu/$name_file_cpu
        echo "$1/$name_dir_cpu/$name_file_cpu $date_now $6" >> ../04/log.log
        tmp_name+=$tmp_sign_end_f
        space_system
    done
    first_name_dir+=$tmp_sign_end # генерация имени путем добавления буквы к концу имени файла
done
