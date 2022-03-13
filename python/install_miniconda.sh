# !/bin/bash

set -euo pipefail

output_dir=${HOME}/miniconda3
name=$1
PYTHON_VERSION=$2

if [ $(uname) \=\= "Darwin" ]; then
    CONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh
else
    CONDA_URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
fi

if [ ! -e "${output_dir}/etc/profile.d/conda.sh" ]; then
    if [ ! -e miniconda.sh ]; then
        wget --tries=3 "${CONDA_URL}" -O miniconda.sh
    fi

    bash miniconda.sh -b -p "${output_dir}"
fi

source "${output_dir}/etc/profile.d/conda.sh"
conda deactivate

# If the env already exists, skip recreation
if [ -n "${name}" ] && ! conda activate ${name}; then
    conda create -yn "${name}"
fi
conda activate ${name}

if [ -n "${PYTHON_VERSION}" ]; then
    conda install -y conda "python=${PYTHON_VERSION}"
else
    conda install -y conda
fi

conda install -y pip setuptools

conda update -n base -c defaults conda
