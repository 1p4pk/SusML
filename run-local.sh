#!/bin/bash
# $1=training row number
# $2=test row number
# $3=optimizer name
# $4=loss function
mpirun -n 2 python3 src/malware_prediction/main_processing.py $1 $2
mpirun -n 2 python3 src/malware_prediction/main_model.py $1 $3 $4
mpirun -n 2 python3 src/malware_prediction/main_eval.py $2