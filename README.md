# python3.8-cusim-0.0.2

Cusim 0.0.2 for Python 3.8 running on the Nvidia Jetson Tegra.


## How to use

If you have `pip` (which should be run in a suitable virtual environment) this should work:

```sh
pip install -v pybind11 versioned-hdf5 h5py jsmin==2.0
pip install 'https://github.com/jetson-nano-wheels/python3.8-cusim-0.0.2/releases/download/v0.0.1/cusim-0.0.2-cp38-cp38-linux_aarch64.whl'
```


## How to contribute

  1. [Fork this repo](https://github.com/jetson-nano-wheels/python3.8-cusim-0.0.2/fork)
  2. Add a branch for your new feature.
  3. Run the `init.sh` script.

Like this:

```sh
git clone git@github.com:jetson-nano-wheels/python3.8-cusim-0.0.2
cd python3.8-cusim-0.0.2
git checkout -b feature-my-fancy-addition
./init.sh
```

After that, do your edits, commit and push to your repo, and send a pull-request if you like 😃
