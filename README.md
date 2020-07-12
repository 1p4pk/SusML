# Sustainable Machine Learning on Edge Device Cluster - Artifical Neural Networks

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