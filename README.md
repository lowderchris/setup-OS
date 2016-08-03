# macOS Setup Guide

I probably do a fresh install of macOS more often than some folks, as I enjoy clearing out clutter and repopulating my machine with data I *actually* need. I figured I would make that process a bit easier. This is designed with the current El Capitan release in mind.

## System
Install Xcode via app store
```bash
xcode-select --install
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location ~/Downloads/
killall SystemUIServer
```
Settings > Keyboard > Key repeat / delay (Set these as appropriate)

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
brew install python3
brew install gcc
```

```bash
brew update
brew outdated
brew upgrade
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
pip install sunpy
pip install pyfits
pip install brewer2mpl
```

```bash
pip3 install numpy
pip3 install scipy
pip3 install matplotlib
pip3 install pyfits
pip3 install sunpy
pip3 install ipython
```

```bash
pip freeze > requirements.txt
pip install -r requirements.txt
pip install pip-review
pip-review —auto
```

```bash
```
## Mayavi
```bash
brew install qt
brew install homebrew/science/vtk5 —with-python —with-tcl
echo /usr/local/opt/vtk5/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/vtk5.pth
pip install mayavi
```


## Virtual environments
With virtual environments, python packages beyond the core set installed above can be configured on a project-by-project basis. They will be installed locally for the given directory.
For Python 2.7, virtualenv.
For Python 3, the bundled pyvenv works.

## GitHub
```bash
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL ADDRESS"
git credential-osxkeychain
brew install git
git config --global credential.helper osxkeychain
```

## SSH
Setup config with server names
```bash
ssh-keygen -t rsa
scp id_rsa.pub remoteserver:~/
cat ~/id_rsa.pub >> authorized_keys
```

## To-do
- Add a bit of explanitory text?
