# macOS Setup Guide

After having re-installed and moved computing machines so many times, I’ve almost got the hang of re-installing applications and bits of code. To make this a bit simpler, and to share this information for anyone else who might be interested, I’ve compiled this into a guide. This guide will end up changing and evolving with time, a sort of living document.

The script residing in this directory will attempt to automate some of these install tasks.

## System settings

Right off the bat, there are a few changes I always make to some macOS defaults that suit my uses a bit better. First of all, change the screenshot format to use PNG, and change the default save location to the ~/Downloads/ folder. I know this might be sacrilidge, but I keep my Desktop absolutely empty.

	defaults write com.apple.screencapture disable-shadow -bool true
	defaults write com.apple.screencapture location ~/Downloads/
	killall SystemUIServer

In addition, I often find myself in a caffeine induced trance when coding, and sometimes the keyboard can feel a bit slow when jumping around quickly in text on the command line. To speed this up a bit, access the Key repeat and delay settings under Settings > Keyboard.

## LaTeX

[MacTeX](https://www.tug.org/mactex/) and [TeXShop](http://pages.uoregon.edu/koch/texshop/) are my absolutely favorites. Trust me. MacTeX also includes the wonderfully useful tool, LaTeXiT. By entering a snippet of LaTeX math code into the prompt, a drag-and-droppable PDF or image is created. This is especially useful with dropping equations into Keynote. Did I mention Keynote. You should give Keynote a run for presentations. Again, trust me.

## Xcode

Having the Xcode suite, while not fully required, is the easiest way to get started with these install pre-requisites. While the majority of software only requires the Xcode command line tools, having the full suite would ensure full compatibility down the road.

Xcode itself can be installed via the macOS app store, or alternatively from their [developer website](https://developer.apple.com/downloads). Afterwards, the command line tools can be installed via,

	xcode-select --install

This will install the required command line tools for the rest of this installation process… as well as fueling the dream of one day having time to try my hand at creating a simple iOS app...

## Homebrew

### Installation

[Homebrew](http://brew.sh) is a package manager for macOS, allowing the installation of some core software packages that aren’t bundled with macOS. Installation is a breeze,

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

So easy. *cough*MacPorts*cough*

### Usage

As a simple test of this installation, we can install the package `htop`. This is a straightforward terminal view of system resources.

	brew install htop

Down the road, packages can be upgraded to newer versions published by authors. This can be achieved by commanding homebrew to check for updates, find outdated packages, and then undergo the upgrading process,

	brew update
	brew outdated
	brew upgrade

### Install a few packages

`wget` is a great tool for grabbing content from a web URL. `curl` is an alternative pre-loaded on macOS, but I can never recall the syntax.

	brew install wget

I’m a fan of the VIM text editor, so I’ll install that as well,

	brew install macvim

## Python

### Core

[Python](https://www.python.org) is the language of choice for many researchers, and is actively developed and maintained. Best of all, the open-source community has adopted this for many open science analysis packages. Even better, there’s no license manager to deal with!

An earlier version of python comes bundled with macOS, but we can do a bit better. Depending on your needs as a researcher, there are two major versions to consider. 2.7.11 is the last stable version of the 2.x versions of python. Many older repositories of code rely on syntax and packages in this version. With the introduction of python 3.x, changes were made to clean-up and modernize the language. As you might imagine, this left a few older code packages broken.

You can choose either version for use, but I’d recommend starting with python 3.x for modernity. The older version of python installed with macOS will remain for use with legacy code.

Many folks will recommend installing a version of python bundled with other python packages geared at scientific analysis. I enjoy having a bit more control over which packages are installed, and how I go about updating these. I’ve also never met a software wizard I trust. How easy is it to install python with homebrew?

	brew install python3

Done. Almost like magic.

The next step will take a moment longer to install, depending on the system being installed to. GCC is a software compiler bundle, which we’ll need to install a few other packages down the road, notably some FORTRAN routines. So I’d recommend running the following command, and running out to grab a coffee. Your CPU will be engaged for a short while.

	brew install gcc

### Science packages

There are a number of additional packages that make scientific analysis and presentation much easier on the python platform. For that, we’ll need the `pip3` or `pip` tool, depending on which version of python was installed.

[NumPy](http://www.numpy.org) allows for more advanced array handling within python.

	pip3 install numpy

[SciPy](https://www.scipy.org) contains a variety of mathematics, science, and engineering packages for signal analysis, processing, etc.

	pip3 install scipy

[Matplotlib](http://matplotlib.org) provides a beautiful set of data visualization tools for use within python. Syntax and appearance mimics that in Matlab, which can make the transition a bit easier for some folks seeing the light. A [gallery](http://matplotlib.org/gallery.html) has more examples than you have time to explore.

	pip3 install matplotlib

[iPython](http://ipython.org) is an interactive command line interface for python, again making it more akin to a Matlab-like-environment.

	pip3 install ipython

A few other packages will enable some astronomy libraries, as well as tools for dealing with reading large databases. Many packages will eventually call for these as pre-requisites, so I’d go ahead and install these now.

	pip3 install astropy
	pip3 install pyfits
	pip3 install pandas
	pip3 install suds

Last, but certainly not least, we can install the [SunPy](http://sunpy.org) package, which aims to replace many of the standard solar software routines. In particular, providing a free and open replacement for the SolarSoft packages is of key interest. While SolarSoft itself is a great resource, the reliance on IDL licensing is less than ideal.

	pip3 install sunpy

And with that, you now have a fully functional solar physics battlestation.

### Virtual environments

After installing this core set of packages, you might run into a bit of code that requires something more obscure. Rather than polluting this main tree of package installation, virtual environments allow a user to install required packages locally, in the project working directory. This will then allow either more obscure packages, or older versions that cannot be upgraded without breaking some code. For Python 3, the pyvenv tool (included by default) can be used for this. First, the env directory must be created, and then sourced to activate while managing packages.

	pyvenv dirpath
	source dirpath/bin/activate

### Python 2 legacy code

While sticking with Python 3.x is probably best for the long-run, you might occasionally run across some code that relies on older packages. In that case, install Python 2 with the following,

	sudo easy_install pip
	pip install numpy
	pip install scipy
	pip install matplotlib
	pip install ipython

## SSH

Using SSH is one of the main ways I get around from the various computer systems I work with each day. After a few hundred times of entering usernames and passwords manually, this got to be a bit of a pain. There are two ways to simplify this process. The first is to create a configuration file in ~/.ssh/config that will store shortcuts to full server paths and usernames. Each server will have an entry,

	Host shortname
	HostName actual.long.path.to.server.edu.com.biz
	User username

Now, let's say that you have a trickier situation, and that a proxy server exists between you and the machine you want to connect to. You could either setup shortcuts on all these machines, or setup a way to automagically connect through the proxy server.

	Host shortname
	HostName final.path.of.server
	User username
	ProxyCommand ssh proxyuser@proxy.server.address nc %h %p 2> /dev/null

The above setup will allow you to easily connect without the need for pesky usernames or full addresses. Going a step further, you can create authenticated keys for machines in your SSH path, that will recognize trusted machines without typing in a password each time you connect, or run a scp command, or an rsync job...

	local> ssh-keygen -t rsa
	local> scp id_rsa.pub remoteserver:~/
	remote> cat ~/id_rsa.pub >> authorized_keys

And finally, if you work between two machines quite a bit, rsync is a very useful tool to synchronize changes between directories without needing to transfer every file.

	rsync -avuz machine1:/path/to/dir machine2:/path/to/dir

## Other tools

[GitHub](https://github.com) allows for an online repository of project version control with git. It's a great way to work with open source code on the web. Private repositories are also available if needed. After setting up an account online, setup is a breeze.

	git config --global user.name "YOUR NAME"
	git config --global user.email "YOUR EMAIL ADDRESS"
	git credential-osxkeychain
	brew install git
	git config --global credential.helper osxkeychain

[Pandoc](http://pandoc.org) is a fantastic tool for the automated conversion between a number of language types, from Markdown, LaTeX, HTML, ePub, etc. This is a great tool for writing notes up in one language, Markdown, for instance, and then enables the easy conversion into a number of other document types.

	brew install pandoc

[Jekyll](https://jekyllrb.com) is a great tool for building a responsive, static website from content files. In my case, I use this to generate blog files and serve these up to GitHub for rendering. This is easily installed with the already installed Homebrew.

	brew install ruby

Then, in a new terminal session (to allow paths to update),

	gem install jekyll

[Mayavi](http://docs.enthought.com/mayavi/mayavi/index.html) uses the VTK toolkit to provide an environment for 3d visualization of scientific data. While the documentation can sometimes be a bit lacking, it's a great tool for viewing more complex datasets. Did I mention you can script it from Python?!

	brew install qt
	brew install homebrew/science/vtk5 —with-python —with-tcl
	echo /usr/local/opt/vtk5/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/vtk5.pth
	pip install mayavi
