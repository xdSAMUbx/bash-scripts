#!/bin/bash

sudo apt update && sudo apt install -y \
    gcc g++ gfortran clangd \
    ninja-build cmake make \
    libopenblas-dev liblapack-dev \
    libsuitesparse-dev podman \
    python3 python3-pip \
    mingw-w64 libx11-dev

sudo apt full-upgrade -y

if ! command -v conda &>/dev/null; then
    mkdir -p "$HOME/miniconda3"
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O "$HOME/miniconda3/miniconda.sh"
    bash "$HOME/miniconda3/miniconda.sh" -b -u -p "$HOME/miniconda3"
    rm "$HOME/miniconda3/miniconda.sh"

    export PATH="$HOME/miniconda3/bin:$PATH"

    "$HOME/miniconda3/bin/conda" init --all
    source ~/.bashrc

    conda config --add channels conda-forge
    conda config --set channel_priority strict
else
    echo -e "\nConda ya esta instalado\n $(conda --version)"
fi

ruta_yml=$(realpath "$1")

if [ ! -f "$ruta_yml" ]; then
    echo -e "\nEl archivo no existe: $ruta_yml"
    exit 1
fi

conda env create -f "$ruta_yml"
