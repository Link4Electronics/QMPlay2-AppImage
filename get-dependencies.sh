#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	kvantum 	   \
    libsidplayfp   \
	lxqt-qtplugin  \
    pipewire-audio \
    pipewire-jack  \
	qt6ct

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ffmpeg-mini

# Comment this out if you need an AUR package
make-aur-package qmplay2-git

# If the application needs to be manually built that has to be done down here
