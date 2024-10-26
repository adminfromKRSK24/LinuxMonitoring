#!/bin/bash

if ! [[ -n "$1" && "$#" -eq 1 ]]
then
echo "Error. You should enter parameter from range 1-4."
exit 1
fi

case "$1" in
 "1")
sort -k 9 ../04/*.log | awk '{print $0}'
;;
 "2")
sort -k 1 -u ../04/*.log | awk '{print $1}'
;;
 "3")
awk -e '$10 ~ /[45][0-9]{2}/ {print $0}' ../04/*.log
;;
 "4")
sort -k 1 -u ../04/*.log | awk -e '$10 ~ /[45][0-9]{2}/ {print $1}'
;;
esac
