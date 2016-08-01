# macOS Setup Guide

I probably do a fresh install of macOS more often than some folks, as I enjoy clearing out clutter and repopulating my machine with data I *actually* need. I figured I would make that process a bit easier. This is designed with the current El Capitan release in mind.

## System
Xcode
xcode-select --install
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location ~/Downloads/
killall SystemUIServer
Settings > Keyboard > Key repeat / delay

## Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget
brew install htop
brew install macvim
brew install pandoc

brew install python
brew install gcc

## Python
sudo easy_install pip
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

pip freeze > requirements.txt
pip install -r requirements.txt

## Mayavi
brew install qt
brew install homebrew/science/vtk5 —with-python —with-tcl
echo /usr/local/opt/vtk5/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/vtk5.pth
pip install mayavi

brew update
brew outdated
brew upgrade

## Virtual environments

pip install pip-review
pip-review —auto

## Python 3
brew install python3
pip3 install jupyter
pip3 install numpy
pip3 install scipy
pip3 install matplotlib

## GitHub
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL ADDRESS"
git credential-osxkeychain
brew install git
git config --global credential.helper osxkeychain

## To-do
- Generate script to automate most of this...
