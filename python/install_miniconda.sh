#!/bin/bash

output_dir=$1
name=$2
PYTHON_VERSION=$3

_output_dir=${HOME}/miniconda3
_name=default
_PYTHON_VERSION=3.9

if [ $# -gt 4 ]; then
    echo "Usage: $0 [output] [conda-env-name] [python-version]"
    exit 1;
elif [ $# -eq 3 ]; then
    output_dir="$1"
    name="$2"
    PYTHON_VERSION="$3"
elif [ $# -eq 2 ]; then
    output_dir="$1"
    name="$2"
    PYTHON_VERSION=${_PYTHON_VERSION}
elif [ $# -eq 1 ]; then
    output_dir="$1"
    name=${_name}
    PYTHON_VERSION=${_PYTHON_VERSION}
elif [ $# -eq 0 ]; then
    output_dir=${_output_dir}
    name=${_name}
    PYTHON_VERSION=${_PYTHON_VERSION}
fi

if [ $(uname) = "Darwin" ]; then
    CONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
elif [ $(uname) = "Linux" ]; then
    CONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
else
    exit 1
fi

if [ ! -e "${output_dir}/etc/profile.d/conda.sh" ]; then
    if [ ! -e miniconda.sh ]; then
        wget --tries=3 "${CONDA_URL}" -O miniconda.sh || exit 1
    fi

    bash miniconda.sh -b -p "${output_dir}" || exit 1
fi

# source "${HOME}/miniconda3/etc/profile.d/conda.sh" || exit 1
. "${HOME}/miniconda3/etc/profile.d/conda.sh" || exit 1
conda deactivate || exit 1

# If the env already exists, skip recreation
if [ -n "${name}" ] && ! conda activate ${name}; then
    conda create -yn "${name}"
fi

if [ -n "${PYTHON_VERSION}" ]; then
    conda install -y conda "python=${PYTHON_VERSION}"
else
    conda install -y conda
fi

conda install -y pip setuptools

###

conda update -n base -c defaults conda
conda activate ${name}
conda env list
if [ -f miniconda.sh ]; then
    rm miniconda.sh
fi
