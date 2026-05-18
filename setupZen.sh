#!/bin/bash

# set -euo pipefail
# Configures the behavior of the script to make it more robust.
# -e Ensures that if a command fails, the script will stop there.
# -u Ensures that if you try to use an undefined or unset variable, the script exits with an error.
# -o pipefail Ensures that in case of a failure in a pipeline, the script will return the exit status of the first failing command in the pipeline instead of just the last one(default behavior).

# [ $? -eq 0 ] here $? is representing the exit status of the last executed command with 0 being success

set -euo pipefail

app_name=zen
official_package_download_link="https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-x86_64.tar.xz"
dowloaded_tar_save_location_and_file_name="$HOME/zen.linux-x86_64.tar.xz"
local_desktop_entry="$HOME/.local/share/applications/$app_name.desktop"
final_installation_directory="$HOME/.local/bin"
executable_path=$final_installation_directory/zen/zen
executable_icon_path="$final_installation_directory/zen/browser/chrome/icons/default/default128.png"

echo "Welcome to Zen browser tarball installer, just chill and wait for the installation to complete!"
sleep 2

echo "Downloading the latest package"
curl -L -o $dowloaded_tar_save_location_and_file_name $official_package_download_link
if [ $? -eq 0 ]; then
    echo "OK"
else
    echo "Download failed. Curl was not found or is not installed"
    exit
fi
sleep 1

echo "Creating neccessary folders"
mkdir -p $HOME/.local/share/applications
mkdir -p $final_installation_directory

echo "Extracting Zen Browser..."
tar -xvJf $dowloaded_tar_save_location_and_file_name
sleep 1
mv zen/ $final_installation_directory
echo "Package was successfully untarred and moved to the final install directory!"

touch $local_desktop_entry
echo "
[Desktop Entry]
Name=Zen Browser
Comment=Experience tranquillity while browsing the web without people tracking you!
Keywords=web;browser;internet
Exec=$executable_path %u
Icon=$executable_icon_path
Terminal=false
StartupNotify=true
StartupWMClass=zen
NoDisplay=false
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
Categories=Network;WebBrowser;
Actions=new-window;new-private-window;profile-manager-window;
[Desktop Action new-window]
Name=Open a New Window
Exec=$executable_path --new-window %u
[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=$executable_path --private-window %u
[Desktop Action profile-manager-window]
Name=Open the Profile Manager
Exec=$executable_path --ProfileManager
" >> $local_desktop_entry

echo "Created local desktop entry successfully"
echo "Installation is successful"

exit 0

