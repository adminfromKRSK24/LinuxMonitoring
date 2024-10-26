#!/bin/bash
dir_name=$1
file_ext=${2#*\.}
file_name=${2#\.*}
. ./check.sh
start_date=$(date +%y-%m-%d\ %H:%M:%S)
start_sec=$(date +%s)
cur_date="$(date +%d%m%y)"

while [[ ${#dir_name} -lt 5 ]]; do
  dir_name+="${dir_name: -1}"
done
while [[ ${#file_name} -lt 5 ]]; do
  file_name+="${file_name: -1}"
done

free_space="$(df -BM | grep "/dev/sda2" | awk '{print $4}' | sed 's/M//')"
while [[ "$free_space" -gt 1000 ]]; do
path=$(find / -type d -writable 2>/dev/null | shuf -n1)
if ! [[ "$path" =~ /bin|/sbin|/proc|/sys ]]; then
    mkdir -p "$path/""$dir_name""_$cur_date" . 2>/dev/null
    echo "$path/""$dir_name""_$cur_date"" $(date +%d_%m_%y)" >> log.log
    for (( b = 0; b < $((1 + RANDOM % 100)); b++ )); do
        if [[ "$free_space" -gt 1000 ]]; then
            file_path_name="$path/""$dir_name""_$cur_date"/"$file_name""_$cur_date"".$file_ext"
            fallocate -l $3 $file_path_name 2>/dev/null
            echo "$file_path_name" "$(date +%d_%m_%y)" "$3" >> log.log
            file_name+="${file_name: -1}"
        fi
            free_space="$(df -BM | grep "/dev/sda2" | awk '{print $4}' | sed 's/M//')"
    done
    dir_name+="${dir_name: -1}"
    continue
fi
done
echo "Free space left in file system is less than 1Gb."
script_time
