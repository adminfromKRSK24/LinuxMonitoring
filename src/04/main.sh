#! /bin/bash

. ./sourse.sh

FLOOR=100
RANGE=1000

number=0   #initialize
while [[ "$number" -le "$FLOOR" ]] # если n1 меньше или равно n2    
do
  number=$RANDOM
  let "number %= $RANGE"  # Ограничение "сверху" числом $RANGE.
done


for (( i=1; i<=5; i++ ))
do
    for (( j=0; j<$number; j++ ))
    do
        echo "$(f_ip) - "$(whoami)" - [$(f_date)] \"$(f_method) $(f_url) HTTP/1.1\" $(f_response) $RANDOM "-" \"$(f_agents)\"" >> ./"log""_""$i"".log"
        # echo "$(f_ip) - "$(whoami)" - ["$date"] \"$(f_method) $(f_url) HTTP/1.1\" $(f_response) $RANDOM "-" \"$(f_agents)\"" >> ./"log""_""$i"".log"
    done
done