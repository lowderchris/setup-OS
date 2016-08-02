#!/bin/bash

## Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## Brew a few bits of software
brew install wget
brew install htop
brew install macvim
brew install pandoc

brew install python
brew install python3
brew install gcc

sudo easy_install pip

## Python 2 modules
pip install numpy
pip install scipy
pip install matplotlib
pip install ipython

pip install palettable

pip install suds
pip install pandas
pip install astropy
pip install pyfits
pip install brewer2mpl

# Python 3 modules
pip3 install numpy
pip3 install scipy
pip3 install matplotlib

## All done
echo "Hello, macOS."
