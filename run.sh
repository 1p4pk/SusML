#!/bin/bash
mpirun -n 2 --hostfile hostfile python3 src/malware_prediction/main_processing.py $1
mpirun -n 2 --hostfile hostfile python3 src/malware_prediction/main_model.py