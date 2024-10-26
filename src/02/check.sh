#!/bin/bash

if ! [[ -n "$1" && "$#" -eq 3 ]]
then
echo "Error. You have entered more or less than 3 parameteres."
exit 1
fi

if ! [[ "${#1}" =~ ^[1-7]$ ]]
then
echo "Error. Folder name cannot be longer than 7 characters."
exit 1
fi

if ! [[ "$1" =~ ^[A-Za-z]{1,7}$ ]]
then
echo "Error. Folder name can consist only english letters."
exit 1
fi

if ! [[ "${#file_name}" =~ ^[1-7]$ ]]
then
echo "Error. File name cannot be longer than 7 characters."
exit 1
fi

if ! [[ "${#file_ext}" =~ ^[1-3]$ ]]
then
echo "Error. File extension cannot be longer than 3 characters and shorter than 1."
exit 1
fi

if ! [[ "$2" =~ ^[A-Z\.a-z]{1,11}$ ]]
then
echo "Error. File name can consist only english letters."
exit 1
fi

if ! [[ "$3" =~ [1-100][Mm][Bb]$ ]]
then
echo "Error. Check the spelling of the file size. File size should be positive and not 100Mb."
exit 1
fi

function script_time {
    end_date=$(date +%y-%m-%d\ %H:%M:%S)
    end_sec=$(date +%s)
    work_sec=$(($end_sec - $start_sec))
    echo "Script start -" $start_date | tee -a log.log
    echo "Script end -" $end_date | tee -a log.log
    echo "Script runtime -" $work_sec seconds | tee -a log.log
}
