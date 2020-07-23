#!/bin/bash
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.preprocess.main_processing 743456 654437
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.train.main_model 743456 sgd mseloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.train.main_model 743456 sgd bceloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.train.main_model 743456 adagrad mseloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.train.main_model 743456 adagrad bceloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.train.main_model 743456 asgd mseloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.train.main_model 743456 asgd bceloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.eval.main_eval 654437 sgd mseloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.eval.main_eval 654437 sgd bceloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.eval.main_eval 654437 adagrad mseloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.eval.main_eval 654437 adagrad bceloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.eval.main_eval 654437 asgd mseloss
mpirun -n 12 --hostfile hostfile python3 -m src.malware_prediction.eval.main_eval 654437 asgd bceloss