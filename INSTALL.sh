#!/bin/bash

# This script will:
# 1) create the folder used to save images
# 2) modify change_wallpaper script to save images in said directory
# 3) modify .plist with correct paths
# 4) create symlink in ~/Library/LaunchAgents/io.brocklobsta.changewallpaper.plist pointing to io.brocklobsta.changewallpaper.plist

echo "This script setup macOS to fetch an image and set it as the desktop backgroud"
WALLPAPER_DIR="${HOME}/Pictures/APOD"
read -p "Enter directory to save images. [${WALLPAPER_DIR}]: " INPUT
WALLPAPER_DIR=${INPUT:-$WALLPAPER_DIR}
echo "Saving images to ${WALLPAPER_DIR}"

# Create directory if not created
mkdir -p ${WALLPAPER_DIR}

# Modify WALLPAPER_DIR in change_wallpaper script
sed -i '' "s|WALLPAPER_DIR =.*|WALLPAPER_DIR = \"$WALLPAPER_DIR\"|" change_wallpaper

# Modify Plist with correct paths
plutil -remove ProgramArguments.0 io.brocklobsta.changewallpaper.plist
plutil -replace ProgramArguments.0 -string "$(pwd)/change_wallpaper" io.brocklobsta.changewallpaper.plist
plutil -replace StandardOutPath -string "$(pwd)/stdout.log" io.brocklobsta.changewallpaper.plist
plutil -replace StandardErrorPath -string "$(pwd)/stderr.log" io.brocklobsta.changewallpaper.plist

# Create symlink so change_wallper runs periodically
PLIST_PATH="${HOME}/Library/LaunchAgents/io.brocklobsta.changewallpaper.plist"
ln -fs $(pwd)/io.brocklobsta.changewallpaper.plist ${PLIST_PATH}
echo "created symlink at ${PLIST_PATH}"

# Make change_wallpaper executable
chmod a+x change_wallpaper