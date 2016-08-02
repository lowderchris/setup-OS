# macOS Setup Guide

I probably do a fresh install of macOS more often than some folks, as I enjoy clearing out clutter and repopulating my machine with data I *actually* need. I figured I would make that process a bit easier. This is designed with the current El Capitan release in mind.

## System
Xcode
```bash
xcode-select --install
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location ~/Downloads/
killall SystemUIServer
```
Settings > Keyboard > Key repeat / delay

## Homebrew
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```bash
brew install wget
brew install htop
brew install macvim
brew install pandoc
```

```bash
brew install python
brew install gcc
```

## Python
```bash
sudo easy_install pip
pip install numpy
pip install scipy
pip install matplotlib
pip install ipython
```

```bash
pip install palettable
```

```bash
pip install suds
pip install pandas
pip install astropy
pip install pyfits
pip install brewer2mpl
```

```bash
pip freeze > requirements.txt
pip install -r requirements.txt
```

## Mayavi
```bash
brew install qt
brew install homebrew/science/vtk5 —with-python —with-tcl
echo /usr/local/opt/vtk5/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/vtk5.pth
pip install mayavi
```

```bash
brew update
brew outdated
brew upgrade
```

## Virtual environments

```bash
pip install pip-review
pip-review —auto
```

## Python 3
```bash
brew install python3
pip3 install numpy
pip3 install scipy
pip3 install matplotlib
```

## GitHub
```bash
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL ADDRESS"
git credential-osxkeychain
brew install git
git config --global credential.helper osxkeychain
```

## To-do
- Tidy all of this up, sync with actual script
- Add a bit of explanitory text
