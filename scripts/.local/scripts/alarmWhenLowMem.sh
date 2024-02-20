#Checks for low memory.

#!/bin/bash

#cutoff_frac is basically how much used memory can be at in terms of how much
#total memory you have...2 is 1/2 of 100% or an alert when you're using 50% mem, etc.
cutoff_frac=2

total_mem=$(free|awk '/^Mem:/{print $2}')
let "threshold = $total_mem / $cutoff_frac"

while :
do

    free_mem=$(free|awk '/^Mem:/{print $4}')

    if [ $free_mem -lt $threshold ]
        then
        notify-send "Low memory!!"
    fi

    sleep 5

done

exit

