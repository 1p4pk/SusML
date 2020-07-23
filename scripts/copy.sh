#!/bin/bash

for i in $(seq $2 $3); do
  if [ $i -lt 10 ]; then
    number="0$i"
  else
    number=$i
  fi
  pi="pi$number.local"
  echo "sending data to $pi"
  sshpass -p "cluster" scp -r $1 pi@"$pi:~/"
  echo "sent data to $pi"
done
wait
