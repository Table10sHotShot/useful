### Install Python packages

Online machine:

    pip3 download --dest /path/to/removable_media_folder pkg1 pkg2 ... pkgN

Offline machine:

    sudo pip3 install --no-index --find-links /path/to/removable_media_folder pkg1 pkg2 ... pkgN

### Install packages from Ubuntu PPA

Offline machine:

    sudo apt-offline set --install-packages pkg1 pkg2 ... pkgN --update --upgrade /path/to/removable_media/apt.sig
    
Online machine:

    sudo apt-offline get --bundle /path/to/removable_media/apt.zip /path/to/removable_media/apt.sig

Offline machine:

    sudo apt-offline install /path/to/removable_media/apt.zip
    sudo apt-get install pkg1 pkg2 ... pkgN
