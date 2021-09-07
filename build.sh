#!/bin/bash

./init.sh

source venv/bin/activate
source jetson-nano-wheels/commons/envs.sh

# See https://cusim.readthedocs.io/en/latest/install.html
# Note, do not attempt to install jsmin since pip will
# try using a version for Python 2. See init.sh.
pushd cusim-dir && git submodule update --init \
    && sed -i'.bak' 's/h5py.*// ; s/jsmin.*// ; s/numpy.*//' requirements.txt \
    && pip install -r requirements.txt \
    && python -m 'grpc_tools.protoc' --python_out cusim/ --proto_path cusim/proto/ config.proto \
    && python setup.py clean -vv \
    && python setup.py build -vv \
    && python setup.py bdist_wheel -vv -d ../dist
popd
