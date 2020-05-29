FROM ubuntu:18.04

#IF YOU NEED TO INSTALL SOMETHINGS
RUN apt-get update && apt-get install -y\
    sudo \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Add user ubuntu with no password, add to sudo group
RUN adduser --disabled-password --gecos '' ubuntu \
    && adduser ubuntu sudo \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ubuntu
ENV APP_PATH=/home/ubuntu/
WORKDIR $APP_PATH
RUN chmod a+rwx /home/ubuntu/

COPY src/malware_prediction /home/ubuntu/SusML

# INSTALL ANACONDA
RUN curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh \
    && bash Anaconda3-2020.02-Linux-x86_64.sh -b \
    && rm Anaconda3-2020.02-Linux-x86_64.sh

ARG CONDA_PATH=/home/ubuntu/anaconda3/bin:$PATH
ENV PATH $CONDA_PATH

# Updating Anaconda packages
RUN conda update -n base -c defaults conda \
    && conda update conda \
    && conda update anaconda \
    && conda update --all

#INSTALL OPEN MPI
RUN conda install -y -c \
    conda-forge\
    openmpi

#CMAKE_PREFIX_PATH="$(dirname $(which conda))/../"
ENV CMAKE_PREFIX_PATH ${CONDA_PATH}/../

#INSTALL PACKAGES IN CONDA VENV
RUN conda install -y \
    pandas \
    scikit-learn \
    numpy \
    pyyaml \
    mkl \
    mkl-include \
    setuptools \
    cmake \
    cffi \
    typing
    
RUN conda install -y -c \
    pytorch \
    magma-cuda80

#INSTALL PYTORCH
RUN git clone --recursive https://github.com/pytorch/pytorch.git \
    && cd pytorch \
    && python3 setup.py install


