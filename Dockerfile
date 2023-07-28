# get nvidia/cuda docker for cuda 11.2 and ubuntu 20.04
# 'devel' is needed for cuda compiler
FROM nvidia/cuda:11.2.0-cudnn8-runtime-ubuntu20.04

# Variables
ENV ENV_NAME=cas_main_dl
ENV PYTHON_VERSION=3.9

# switch shell sh (default in Linux) to bash
SHELL ["/bin/bash", "-c"]

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
 && rm -rf /var/lib/apt/lists/*

# setup ssh pwd access for root (take care of pwd below!)
ENV TZ=Europe/Zurich
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
 && apt-get update && apt-get install -y openssh-server \
 && mkdir /var/run/sshd \
 && echo 'root:zK3Ph7@45' | chpasswd \
 && sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
 && sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
 && echo "export VISIBLE=now" >> /etc/profile

# Install Miniconda and Python 3.9
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/root/miniconda/bin:$PATH
RUN curl -sLo ~/miniconda.sh \
    https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh \
 && conda install -y python=$PYTHON_VERSION \
 && conda clean -ya \
 && echo ". /root/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc

# create conda env for python 3.9
RUN conda update conda \
 && conda create -n $ENV_NAME python=$PYTHON_VERSION \
 && echo "conda activate $ENV_NAME" >> ~/.bashrc

# add env to path (for pip), set as default
ENV PATH=/root/miniconda/envs/$ENV_NAME/bin:$PATH
ENV CONDA_DEFAULT_ENV $ENV_NAME

# tensorflow
RUN pip install \
    'tensorflow==2.8.2' tensorflow-datasets 'tensorflow-addons==0.18.0'

# cuda libs for gpu support
RUN conda install -y -c conda-forge cudatoolkit=11.2.2 
RUN pip install nvidia-cudnn-cu11

# extra libs
RUN pip install matplotlib "scikit-learn<1.0.0" pandas tqdm "scikit-image<0.19" "numpy<1.23.0"  wget notebook ipywidgets

# restart ssh upon container entry (to enable ssh tunneling into container)
ENTRYPOINT service ssh restart && bash

