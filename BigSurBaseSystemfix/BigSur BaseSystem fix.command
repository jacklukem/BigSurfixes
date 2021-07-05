#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSurBaseSystemfix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSurBaseSystemfix for legacy USB\n and non-APFS Mac this version does include sound, Wifi and legacy usb fixes"
echo "\nBigSur BaseSystem can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check amfi_get_out_of_my_way=1"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS BaseSystem"
if [ -e /Volumes/Install\ macOS\ Big\ Sur*/BaseSystem/BaseSystem.dmg ]
then
cd /Volumes/Install\ macOS\ Big\ Sur*/BaseSystem/
rm BaseSystem.dmg.shadow
hdiutil attach -owners on BaseSystem.dmg -shadow
echo "\nAdjusting BigSur APFS BaseSystem can take up to 15 minutes"
curl https://github.com/jacklukem/BigSurfixes/raw/master/BigSurBaseSystemfix/BigSurFixes --progress-bar -L -o /private/tmp/BigSurFixes
curl https://github.com/jacklukem/BigSurfixes/raw/master/BigSurBaseSystemfix/Utilities.plist --progress-bar -L -o /private/tmp/Utilities.plist
curl https://github.com/jacklukem/BigSurfixes/raw/master/BigSurBaseSystemfix/Info.plist --progress-bar -L -o /private/tmp/Info.plist
cd /Volumes/macOS\ Base\ System/System/Installation/CDIS/Recovery\ Springboard.app/Contents
echo "sudo cp /private/tmp/Info.plist ."
cd Resources
sudo cp /private/tmp/Utilities.plist .
cd /Volumes/macOS\ Base\ System/Applications/
sudo unzip -qo -P jacklukem /private/tmp/BigSurFixes -d .
diskutil unmount "macOS Base System"
diskutil unmount "Preboot"
cd /Volumes/*/BaseSystem/
hdiutil unmount BaseSystem.dmg -force
echo "First part Done"
echo "\nYou now should unplug and plug again your USB BigSur Installer\nthen launch the BaseSystem fix2 to complete the patching"
else
echo "\nWarning: you don't have any USB BigSur Installer plugged\n\nNote to run directly from BigSur an ethernet or wifi internet connection is required\n"
fi
