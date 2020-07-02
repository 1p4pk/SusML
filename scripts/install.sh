#!/bin/bash

for i in $(seq $2 $3); do
  if [ $i -lt 10 ]; then
    number="0$i"
  else
    number=$i
  fi
  pi="pi$number.local"
  echo "installing $1 on $pi"
  sshpass -p "cluster" ssh pi@"$pi" 'source /home/pi/susml/leon_ramin/bin/activate && pip install '"$1"''
  echo "installed $1 on $pi"
done
wait
