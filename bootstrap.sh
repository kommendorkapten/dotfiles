#!/bin/sh

set -u
set -e

if [ ! -e ~/.ssh/id_ecdsa ]; then
    ssh-keygen -t ecdsa
fi

OLD_DIR=`pwd`
DIR=`mktemp -d`
ME=`whoami`
cd ${DIR}

BUNDLE=https://github.com/kommendorkapten/configs/archive/refs/heads/master.zip
SITE_LISP=/usr/local/share/emacs/site-lisp

cd ${DIR}
curl -LsO ${BUNDLE}
unzip master.zip
cd configs-master
# Install configuration files
cp .emacs ~/.emacs
cp .profile ~/.profile

su 

# install packages
printf "Installing packages..."
pkg_add -I packages.x11
printf "done\n"

# Go mode
file=https://raw.githubusercontent.com/dominikh/go-mode.el/master/go-mode.el
curl -sS ${file} > ${SITE_LISP}/go-mode.el

# Dtrace mode
file=https://raw.githubusercontent.com/dotemacs/dtrace-script-mode/master/dtrace-script-mode.el
curl -sS ${file} > ${SITE_LISP}/dtrace-script-mode.el

# enable apm
printf "Enable apmd..."
rcctl set apmd status on
rcctl set apmd flags -A
rcctl start apmd
printf "done\n"

su ${ME}

# Clean up
cd ${OLD_DIR}
rm -rf ${DIR}

exit 0
