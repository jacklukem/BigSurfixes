#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 3 BaseSystem.dmg prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 3 BaseSystem.dmg prelinkedkernel fix for legacy USB\n and non-APFS Mac this version does include telemetry fix, legacy usb fixes"
echo "\nBigSur BaseSystem prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS BaseSystem"
if [ -e /Volumes/*/BaseSystem/BaseSystem.dmg ]
then
cd /Volumes/*/BaseSystem/
hdiutil attach -owners on BaseSystem.dmg -shadow
echo "\nAdjusting BigSur APFS BaseSystem can take up to 10 minutes"
sudo rm "/Volumes/macOS Base System/System/Library/KernelCollections/"*.kc
sudo rm "/Volumes/macOS Base System/System/Library/PrelinkedKernels/"immutablekernel
sudo rm -r "/Volumes/macOS Base System/System/Library/Extensions/"
sudo mkdir "/Volumes/macOS Base System/System/Library/Extensions/"
curl https://github.com/jacklukem/BigSurfixes/blob/master/legacyusb%20installer%20fix/basesystemfix/basesystem3kext.zip?raw=true --progress-bar -L -o /private/tmp/basesystem3kext.zip
curl https://github.com/jacklukem/BigSurfixes/blob/master/legacyusb%20installer%20fix/basesystemfix/basesystem6kext.zip?raw=true --progress-bar -L -o /private/tmp/basesystem6kext.zip
curl https://github.com/jacklukem/BigSurfixes/blob/master/legacyusb%20installer%20fix/basesystemfix/basesystem25kext.zip?raw=true --progress-bar -L -o /private/tmp/basesystem25kext.zip
curl https://github.com/jacklukem/BigSurfixes/blob/master/legacyusb%20installer%20fix/basesystemfix/basesystem196kext.zip?raw=true --progress-bar -L -o /private/tmp/basesystem196kext.zip
cd "/Volumes/macOS Base System/System/Library/Extensions/"
sudo unzip /private/tmp/basesystem3kext.zip -d .
sudo unzip /private/tmp/basesystem6kext.zip -d .
sudo unzip /private/tmp/basesystem25kext.zip -d .
sudo unzip /private/tmp/basesystem196kext.zip -d .
sudo chmod -R 755 "/Volumes/macOS Base System/System/Library/Extensions"
sudo chown -R 0:0 "/Volumes/macOS Base System/System/Library/Extensions"
diskutil unmount "macOS Base System"
cd /Volumes/*/BaseSystem/
hdiutil unmount BaseSystem.dmg -force
echo "First part Done"
echo "\nYou now should unplug and plug again your USB BigSur Installer\nthen launch the BaseSystem fix2 to complete the patching"
else
echo "\nWarning: you don't have any USB BigSur Installer plugged\n\nNote to run directly from BigSur an ethernet or wifi internet connection is required\n"
fi
