# macOS Setup Guide

After having re-installed and moved computing machines so many times, I’ve almost got the hang of re-installing applications and bits of code. To make this a bit simpler, and to share this information for anyone else who might be interested, I’ve compiled this into a guide. This guide will end up changing and evolving with time, a sort of living document.

## System settings

Right off the bat, there are a few changes I always make to some macOS defaults that suit my uses a bit better. First of all, change the screenshot format to use PNG, and change the default save location to the ~/Downloads/ folder. I know this might be sacrilidge, but I keep my Desktop absolutely empty.

    defaults write com.apple.screencapture disable-shadow -bool true
    defaults write com.apple.screencapture location ~/Desktop/
    killall SystemUIServer

In addition, I often find myself in a caffeine induced trance when coding, and sometimes the keyboard can feel a bit slow when jumping around quickly in text on the command line. To speed this up a bit, access the Key repeat and delay settings under Settings > Keyboard.

Perhaps a personal preference, but I enjoy having my virtual desktops staying put, and not being automagically rearranged on the whims of the OS. Under Settings > Mission Control this option to rearrange spaces on recent use can be disabled.

This might be a bit of a controversial move, but with the looming disappearance of the physical ESC key, I prefer some keyboard remapping. What other key might have outlived it's usefulness in this modern age? I'm looking at you, CAPSLOCK. Under Settings > Keyboard, continue to the Modifier Keys section under the Keyboard tab. From there the CAPSLOCK key can be given new life, as a much more useful ESC key. This take a little bit of muscle memory to adapt, but as a VIM user my pinky finger appreciates the much simpler reach.

### Terminal

When using the terminal to connect to a linux server over SSH, there can sometimes be some translation problems with key commands. If you notice backspaces being interpreted as odd character strings such as ^?... Enable the 'Delete sends Control-H' under the advanced terminal settings.

To enable color coding of files when looking through a directory, add the following line to your ~/.bash_profile file,

    alias ls='ls -G'

## LaTeX

[MacTeX](https://www.tug.org/mactex/) and [TeXShop](http://pages.uoregon.edu/koch/texshop/) are my absolutely favorites. Trust me. MacTeX also includes the wonderfully useful tool, LaTeXiT. By entering a snippet of LaTeX math code into the prompt, a drag-and-droppable PDF or image is created. This is especially useful with dropping equations into Keynote. Did I mention Keynote. You should give Keynote a run for presentations. Again, trust me.

## Xcode

Having the Xcode suite, while not fully required, is the easiest way to get started with these install pre-requisites. While the majority of software only requires the Xcode command line tools, having the full suite would ensure full compatibility down the road.

Xcode itself can be installed via the macOS app store, or alternatively from their [developer website](https://developer.apple.com/downloads). Afterwards, the command line tools can be installed via,

    xcode-select --install

This will install the required command line tools for the rest of this installation process… as well as fueling the dream of one day having time to try my hand at creating a simple iOS app...

Xcode has integration with version control, especially git and GitHub. Beautiful side-by-side difference comparisons allow for quick and seamless committing and pushing to remote sources. A GitHub account can be added under the Xcode settings preference pane, where an SSH key can be generated and imported into GitHub online. Under the source control tab of the preference pane, editor information can be updated as well. One could always just use the terminal instead...

## Homebrew

### Installation

[Homebrew](http://brew.sh) is a package manager for macOS, allowing the installation of some core software packages that aren’t bundled with macOS. Installation is a breeze,

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

(Note that at the moment, due to changes in how Homebrew handles compilation options, some of the following may need to be revised, or handled using a custom tap)

### Usage

Down the road, packages can be upgraded to newer versions published by authors. This can be achieved by commanding homebrew to check for updates, find outdated packages, and then undergo the upgrading process,

    brew update
    brew outdated
    brew upgrade

### Install a few packages

I’m a fan of the VIM text editor, so that's almost an immediate install,

    brew install macvim

To connect to remote servers and have windows tunneled over the connection, you'll need the [XQuartz](https://www.xquartz.org) libraries. Luckily, this can now be installed with the homebrew cask commands via,

    brew cask install xquartz

Creating animations from individual figure frames or converting between video formats is only a command line away with [ffmpeg](https://ffmpeg.org), which can be installed with,

    brew install ffmpeg

Almost last but not least, a great (in my opinion) text editor, [VIM](http://www.vim.org) can be installed via homebrew as well. VIM is lightweight, great for working over a painfully slow connection, and is available on almost every machine by default. It *does* have a bit of a learning curve, however.

    brew install vim

One more thing... homebrew packages that have a corresponding macOS application bundle can have this installed to the /Applications/ directory. This will allow for macOS to have something to easily point to as a default application for opening particular file types, etc.

    brew linkapps

## Python

### Core

[Python](https://www.python.org) is the language of choice for many researchers, and is actively developed and maintained. Best of all, the open-source community has adopted this for many open science analysis packages. Even better, there’s no license manager to deal with!

Many folks will recommend installing a version of python bundled with other python packages geared at scientific analysis. I enjoy having a bit more control over which packages are installed, and how I go about updating these. I’ve also never met a software wizard I trust. How easy is it to install python with homebrew?

    brew install python

Done. Almost like magic.

The next step will take a moment longer to install, depending on the system being installed to. GCC is a software compiler bundle, which we’ll need to install a few other packages down the road, notably some FORTRAN routines. So I’d recommend running the following command, and running out to grab a coffee. Your CPU will be engaged for a short while.

    brew install gcc

### Science packages

There are a number of additional packages that make scientific analysis and presentation much easier on the python platform. For that, we’ll need the `pip3` or `pip` tool, depending on which version of python was installed.

[NumPy](http://www.numpy.org) allows for more advanced array handling within python.

    pip3 install numpy

[SciPy](https://www.scipy.org) contains a variety of mathematics, science, and engineering packages for signal analysis, processing, etc.

    pip3 install scipy

[Matplotlib](http://matplotlib.org) provides a beautiful set of data visualization tools for use within python. Syntax and appearance mimics that in Matlab, which can make the transition a bit easier for some folks seeing the light. A [gallery](http://matplotlib.org/gallery.html) has more examples than you have time to explore. The palettable package provides more extensive color table management, as well as a library of Wes Anderson film-inspired color palettes... because of course that exists.

    pip3 install matplotlib
    pip3 install palettable

[iPython](http://ipython.org) is an interactive command line interface for python, again making it more akin to a Matlab-like-environment.

    pip3 install ipython

A few other packages will enable some astronomy libraries, as well as tools for dealing with reading large databases. Many packages will eventually call for these as pre-requisites, so I’d go ahead and install these now.

    pip3 install astropy
    pip3 install pandas
    pip3 install h5py

Last, but certainly not least, we can install the [SunPy](http://sunpy.org) package, which aims to replace many of the standard solar software routines. In particular, providing a free and open replacement for the SolarSoft packages is of key interest. While SolarSoft itself is a great resource, the reliance on IDL licensing is less than ideal.

    pip3 install sunpy

Installing SunPy itself should pick up any additional required packages... in fact you could even skip most of the individual component installs, and just start with SunPy... but that's no fun. And with that, you now have a fully functional solar physics battlestation.

### Upgrading pip packages

Once you've got a nice stable installation setup and running, what better than to upgrade packages to break existing code and workflows. For the brave (or for those with virtual environments setup) all packages can be upgraded with pip in one (two) fell swoop(s).

    pip3 freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U

### Virtual environments

After installing this core set of packages, you might run into a bit of code that requires something more obscure. Rather than polluting this main tree of package installation, virtual environments allow a user to install required packages locally, in the project working directory. This will then allow either more obscure packages, or older versions that cannot be upgraded without breaking some code. First, the env directory must be created, and then sourced before use to modify the python path prior to package installation and use.

    python -m venv /path/to/new/directory
    source /path/to/new/directory/bin/activate

## SSH

Using SSH is one of the main ways I get around from the various computer systems I work with each day. After a few hundred times of entering usernames and passwords manually, this got to be a bit of a pain. There are two ways to simplify this process. The first is to create a configuration file in the location ~/.ssh/config that will store shortcuts to full server paths and usernames. Each server will have an entry,

    Host shortname
    HostName actual.long.path.to.server.edu.com.biz
    User username

Now, let's say that you have a trickier situation, and that a proxy server exists between you and the machine you want to connect to. You could either setup shortcuts on all these machines, or setup a way to automagically connect through the proxy server.

    Host shortname
    HostName final.path.of.server
    User username
    ProxyJump path.of.proxy.server

The above setup will allow you to easily connect without the need for pesky usernames or full addresses. Going a step further, you can create authenticated keys for machines in your SSH path, that will recognize trusted machines without typing in a password each time you connect, or run a scp command, or an rsync job...

    local> ssh-keygen -t rsa
    local> scp id_rsa.pub remoteserver:~/
    remote> cat ~/id_rsa.pub >> authorized_keys

And finally, if you work between two machines quite a bit, rsync is a very useful tool to synchronize changes between directories without needing to transfer every file.

    rsync -avuz machine1:/path/to/dir machine2:/path/to/dir

## Other tools

[Git](https://git-scm.com) is a great tool for version control of files in a project directory. An updated version can easily be installed using Homebrew.

    brew install git

From here, one optional modification is to specify the GUI tool used when viewing diffs and merges with the git commands difftool and mergetool. On macOS, there's a lovely visual tool for comparing changes between files that can be set as the default. Another optional choice is vimdiff, or gvimdiff.

    git config --global merge.tool opendiff
    git config --global diff.tool opendiff
    git config --global difftool.prompt false

Finally, while each repository can selectively ignore particular filetypes, configure a global list of files to forget about.

    echo .DS_Store >> ~/.gitignore
    git config --global core.excludesfile ~/.gitignore

[GitHub](https://github.com) allows for an online repository of project version control with git. It's a great way to work with open source code on the web. Private repositories are also available if needed. After setting up an account online, setup is a breeze.

    git config --global user.name "YOUR NAME"
    git config --global user.email "YOUR EMAIL ADDRESS"

From here, SSH authorization can be enabled by generating a local SSH key through the method outlined above, and storing that with GitHub through the web interface.

[InkScape](https://inkscape.org/en/) is a fantastic GUI tool for vector graphic design, particularly great for figure design. The author has resorted in the past to painstakingly creating figures with tools such as XFig or LaTeX/TikZ... but that can be time consuming.

    brew cask install inkscape

[Pandoc](http://pandoc.org) is a fantastic tool for the automated conversion between a number of language types, from Markdown, LaTeX, HTML, ePub, etc. This is a great tool for writing notes up in one language, Markdown, for instance, and then enables the easy conversion into a number of other document types.

    brew install pandoc

[Mayavi](http://docs.enthought.com/mayavi/mayavi/index.html) uses the VTK toolkit to provide an environment for 3d visualization of scientific data. While the documentation can sometimes be a bit lacking, it's a great tool for viewing more complex datasets. Did I mention you can script it from Python?!

    brew install qt
    brew install homebrew/science/vtk5 —with-python —with-tcl
    echo /usr/local/opt/vtk5/lib/python2.7/site-packages >> /usr/local/lib/python2.7/site-packages/vtk5.pth
    pip install mayavi

*Note that currently with changes to Homebrew disabling custom installation flags without resorting to custom taps, this method may be deprecated.*

Amphetamine is a great macOS tool, replacing a tool I previously used (Caffeine), to keep a mac computer awake. Granular controls allow for preventing sleep for a temporary duration, specifying charge conditions, and more. Great for running code on a laptop and being able to lock the computer and step away for a while.

[MenuMeters](https://github.com/emcrisostomo/MenuMeters) provides a method to display current CPU, memory, disk, and network activity in a variety of ways unobtrusively in the macOS menu bar. This is great to keep an eye on running processes, avoiding the alternative method of guestimating CPU usage based on the tone of whirring fans...

# iOS Setup Guide

With iPads becoming a more feasible option for some remote working tasks, I thought I would document some useful setup tips and apps of interest.

## iCloud Drive

iCloud Drive is one of the major components that makes this possible. With my Documents and Desktop folders synced to the cloud, changes made either on macOS or iOS are synced seamlessly. Conflicts from offline editing can be resolved straightforwardly. This has the added benefit of providing an automatic backup of critical data that doesn't require an external disk, and just plain works.

The native Files app allows browsing around this cloud file system, and is somewhat a replacement for Finder. Tags can also provide a useful tool for organization outside the traditional folder format.

## Work apps
The app suite formerly known as iWork... Pages, Numbers, and Keynote provide excellent tools for dealing with office documents. With a recent code revamp to align with their macOS counterparts, there's less of barrier to getting work done despite the platform.

## Other apps
[Working Copy](https://itunes.apple.com/us/app/working-copy/id896694807?mt=8) provides something I thought I'd never see on iOS... an interface for dealing with Git and GitHub version control. Cloning remote repositories creates local copy, with most arcane git commands reduced to a few swipes. A native editor inside the app allows for syntax highlighted changes, along with visual difference comparisons once ready to commit. A quick toggle for Working Copy inside the Files app allows for other apps to access cloned repository files as well.

[Texpad](https://itunes.apple.com/us/app/texpad-latex-editor/id550419159?mt=8) is a LaTeX editor with real-time and offline typesetting... what more could you want.

[Terminus](https://itunes.apple.com/us/app/termius-ssh-client/id549039908?mt=8) is an SSH client, for connecting to remote servers. I couldn't see myself using this for extensive sessions, especially without an external keyboard, but it seems promising for quick edits and jobs.
