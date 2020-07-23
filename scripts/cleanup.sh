#!/bin/bash

for i in $(seq $1 $2); do
  if [ $i -lt 10 ]; then
    number="0$i"
  else
    number=$i
  fi
  pi="pi$number.local"
  echo "removing data from $pi"
  sshpass -p "cluster" ssh pi@"$pi" 'cd ~ && rm -rf copy.sh Dockerfile hostfile models requirements.txt run-local.sh test.py torch-1.5.whl docker-compose.yml README.md run-hostfile.sh src torch-1.5.0a0+4ff3872-cp37-cp37m-linux_armv7l.whl'
  sshpass -p "cluster" ssh pi@"$pi" 'mv ~/data ~/susml/leon_ramin'
  echo "removed data from $pi"
done
wait
