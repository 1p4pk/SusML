# Sustainable Machine Learning on Edge Device Cluster - Artifical Neural Networks

This repository is part of the course [Sustainable Machine Learning on Edge Device Cluster](https://hpi.de/naumann/teaching/teaching/ss-20/sustainable-machine-learning-on-edge-device-clusters.html) summer term 2020 at the HPI.

## Materials

Besides the implementation, additional material in the form benchmark data and presentations held during the seminar.

### Google Drive:

* [Benchmark data](https://drive.google.com/drive/folders/1m8KCkAstGpLxFs7SJ0gM9I_Z59ZkVES5?usp=sharing)
* [Intermediate presentation](https://docs.google.com/presentation/d/1q1JiXwiCJ-CYxnTSbNDTJqabvHvvbh_kEjPIV_YdhaA/edit?usp=sharing)
* [Final presentation](https://docs.google.com/presentation/d/1V32sN1jL21H2kcCZJdHrBnFcJk5_i_03Nlagb8Pw6V0/edit?usp=sharing)

## Run

First, connect to the master:

```console
ssh raspberrypi.local
```
Afterwards, check if connection is working, which should print the hostnames:

```console
mpirun -n 2 --hostfile  hostfile hostname
```

If both hostnames are displayed, the actual training can be started:

```console
mpirun -n 2 python -m src.malware_prediction.train.main_model <NUM_ROW_TRAIN> <OPTIMIZER> <LOSS_FUNCTION>
```

## Developement

### Setup

### Virtual python environment

Create virtual environment:

```console
python3 -m venv venv
```

Activate virtual environment:

```console
source venv/bin/activate
```

Install dependencies:

```console
pip install -r requirements.txt
```
