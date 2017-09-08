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
pip install tensorflow
pip install chainer
if [ `uname` \=\= "Darwin" ] ; then
  # OSX
  pip install http://download.pytorch.org/whl/torch-0.2.0.post3-cp35-cp35m-macosx_10_7_x86_64.whl
else
  # Linux
  pip install http://download.pytorch.org/whl/cu75/torch-0.2.0.post3-cp35-cp35m-manylinux1_x86_64.whl
fi
pip install torchvision
pip install librosa
pip install tqdm
pip install autopep8
pip install seaborn
