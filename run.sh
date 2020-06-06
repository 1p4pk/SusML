#!/bin/bash
mpirun -n 2 python3 src/malware_prediction/main_processing.py 20000
# mpirun -n 2 python src/malware_prediction/main_model.py