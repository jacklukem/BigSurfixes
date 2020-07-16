/System/Volumes/#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta reducetransparency fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta reducetransparency fix\nthis is for non-metal GPU to skip the Finder WindowServer crash after BigSur installation"
echo "\nBigSur reducetransparency fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur Data Volume"
if [ -e /Volumes/*/Library/KernelCollections/ ]
then
curl https://github.com/jacklukem/BigSurfixes/blob/master/BigSur%20com.apple.universalaccess.plist.zip?raw=true --progress-bar -L -o /private/tmp/transparency.zip
cd /Volumes/*/Library/KernelCollections/
cd .. ; cd ..
cd Users/*/Library/Preferences/
sudo defaults write com.apple.universalaccess.plist reduceTransparency -bool true
sudo unzip /private/tmp/transparency.zip -d .
echo "Done"
echo "\nAfter reboot your BigSur should use a reduced transparency to fix the non-metal Finder\n"
else
echo "\nWarning: seems there aren't any BigSur installation"
fi
