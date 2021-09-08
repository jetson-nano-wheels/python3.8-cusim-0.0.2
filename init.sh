#!/bin/bash

if [[ ! -d venv ]] ; then
    # Ensure site-packages are available so python can
    # access jsmin and anything else.
    python3.8 -m venv --system-site-packages venv
    source venv/bin/activate
    pip install --upgrade pip setuptools wheel build Cython
fi

if [[ ! -d jetson-nano-submodules/commons ]] ; then
    git submodule add git@github.com:jetson-nano-wheels/commons jetson-nano-wheels/commons
fi

source venv/bin/activate
source jetson-nano-wheels/commons/envs.sh

./jetson-nano-wheels/commons/init.sh


# See https://cusim.readthedocs.io/en/latest/install.html
if [[ ! -d cusim-dir ]] ; then
    git clone -q git@github.com:js1010/cusim.git cusim-dir
fi


# Note the --ignore-installed enables venv installs
# to 'ignore' system installs.


# This addresses an issue when installing h5py. See https://stackoverflow.com/a/65220265
# and also see https://github.com/jetson-nano-wheels/commons/init.sh

pip install -v pybind11 versioned-hdf5 h5py jsmin==2.0
