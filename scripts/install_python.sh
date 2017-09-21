#!/bin/zsh

# install pyenv
pyenv install anaconda3-2.5.0
pyenv install anaconda2-2.5.0
pyenv rehash
pyenv global anaconda3-2.5.0

# TODO: set conda path

# update conda itself
conda update conda

# install pip packages
if [ `uname` \=\= "Darwin" ] ; then
  # OSX
  pip install tensorflow
  pip install http://download.pytorch.org/whl/torch-0.2.0.post3-cp35-cp35m-macosx_10_7_x86_64.whl
else
  # Linux
  pip install tensorflow-gpu
  # NOTE: do not install tensorflow here (do in virtual env)

  pip install https://download.pytorch.org/whl/cu75/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl
  # NOTE: change from http -> https because of the proxy setting
fi

pip install torchvision
pip install chainer
pip install librosa
pip install python_speech_features
pip install tqdm
pip install autopep8
pip install flake8
pip install seaborn
pip install line_profiler


# create virtual env
conda create -n tensorflow python=3.5
conda create -n pytorch python=3.5
conda create -n chainer python=3.5
