#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q qmplay2-git | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/256x256/apps/QMPlay2.png
export DESKTOP=/usr/share/applications/QMPlay2.desktop
export DEPLOY_QT=1
export QT_DIR=qt6
export DEPLOY_VULKAN=1
export DEPLOY_PIPEWIRE=1
export DEPLOY_PYTHON=1

# Deploy dependencies
quick-sharun /usr/bin/QMPlay2

# Turn AppDir into AppImage
quick-sharun --make-appimage
