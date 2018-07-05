# change_wallpaper
Use the recent "Astronomy Picture of the Day" by NASA as your desktop wallpaper (Python script for Mac OS X, should be easy do
adapt for Linux or Windows)

## Installation
To install run the following command in your terminal:
```bash
cd <change_wallpaper_dir>
bash INSTALL.sh
```

This will create the folder specified to save APOD images, update all paths needed by the change_wallpaper script, and create a
symlink to the io.brocklobsta.changewallpaper.pist in ~/Library/LaunchAgents.


## Uninstall
To stop this service from running periodically execute the following command:
```bash
mv ~/Library/LaunchAgents/io.brocklobsta.changewallpaper.plist ~/.Trash
```

Note: This will not delete any saved pictures.
