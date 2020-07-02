#!/bin/bash

for i in $(seq $1 $2); do
  if [ $i -lt 10 ]; then
    number="0$i"
  else
    number=$i
  fi
  pi="pi$number.local"
  mkdir ./data/"$pi"
  echo "downloading data from $pi"
  sshpass -p "cluster" scp -r pi@"$pi:~/data/train/train_encoded.csv" ./data/"$pi"
  sshpass -p "cluster" scp -r pi@"$pi:~/data/test/test_encoded.csv" ./data/"$pi"
  sshpass -p "cluster" scp -r pi@"$pi:~/data/benchmark" ./data/"$pi"
  echo "dowloaded data from $pi"
done
wait
