#!/bin/bash
mpirun -n 2 python src/malware_prediction/main_processing.py
mpirun -n 2 python src/malware_prediction/main_model.py