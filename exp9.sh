#clear
#cpu_threshold=9.0%
#mem_threshold=2.0%
#CPU_USAGE=$(uptime | cut -d"," -f4 | cut -d":" -f2 | cut -d" " -f2 | sed -e "s/\.//g")
#CPU_USAGE_THRESHOLD=800
#PROCESS=$(ps aux r)
#TOPPROCESS=$(ps -eo pid -eo pcpu -eo command | sort -k 2 -r |  | head -n 1)grep -v PID
# for PID in $ `ps aux`
# do
  #  if  [ `%CPU ` -gt 9.0%][ `%MEM ` -gt 2.0% ]
   # then
	#   kill PID
   # else
	#  echo "process doesn't exist"
   # fi

#done " '
#!/bin/bash

if [ $# -ne 2 ];
then
    echo "Invalid number of arguments"
    exit 0
fi

while true;
do
    SIZE=$(pmap $1|grep total|grep -o "[0-9]*")
    SIZE=${SIZE%%K*}
    SIZEMB=$((SIZE/1024))
    echo "Process id =$1 Size = $SIZEMB MB"
    if [ $SIZEMB -gt $2 ]; then
        printf "SIZE has exceeded.\nKilling the process......"
        kill -9 "$1"
        echo "Killed the process"
        exit 0
    else
        echo "SIZE has not yet exceeding"
    fi

    sleep 10
done
