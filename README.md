# intro

This is a collection of useful user preference files and scripts

# setup

Run the setup bash script to move files appropriately
This will work on most Debian based OSs

### vim

##### vundle

Vim plugins are managed by [vundle](https://github.com/VundleVim/Vundle.vim) which is a git submodule in this repository. To get vundle either clone this repository with the `--recursive` flag or run the following commands

{% highlight bash %}
cd .vim/bundle/vundle
git submodule init
git submodule update
{% end highlight %}

##### YCM

You must [compile YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation).

# install_py_libs

Executing this script installs some commonly used python libraries.

# pip_update_all.py

Executing this script with `python3 pip_update_all.py` will update all the python packages using the version of pip associated with the python interpreter specified.
