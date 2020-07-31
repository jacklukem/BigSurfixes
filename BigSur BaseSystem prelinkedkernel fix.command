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
diskutil mount Preboot
if [ -e /Volumes/*/BaseSystem/ ]
then
cd /Volumes/*/BaseSystem/
hdiutil attach -owners on BaseSystem.dmg -shadow
echo "\nAdjusting BigSur APFS BaseSystem can takes up to 10 minutes"
sudo rm "/Volumes/macOS Base System/System/Library/KernelCollections/"*.kc
cd /Volumes/macOS Base System/System/Library/Extensions
for x in *
do
    # This reuses the same line of console output repeatedly
    # so progress is visible without printing 400+ lines
    echo -n "Removing old $x..."
    rm -rf "$x"
    echo -ne "\033[2K" ; printf "\r"
    echo -n "Copying new $x..."
    cp -r "/System/Library/Extensions/$x" "$x"
    echo -ne "\033[2K" ; printf "\r"
done
chmod -R 755 "/Volumes/macOS Base System/System/Library/Extensions"
chown -R 0:0 "/Volumes/macOS Base System/System/Library/Extensions"
diskutil unmount "macOS Base System"
diskutil unmount Preboot
diskutil unmount "Preboot 1"
cd /Volumes/*/BaseSystem/
hdiutil convert -format ULFO -o BaseSystem2.dmg BaseSystem.dmg -shadow
mv BaseSystem.dmg BaseSystembackup.dmg
mv BaseSystem2.dmg BaseSystem.dmg
rm BaseSystem.dmg.shadow
echo "\nPatching BigSur USB Installer prelinkedkernel can take up to 10 minutes"
curl https://github.com/jacklukem/BigSurfixes/raw/master/installer%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/blob/master/patched%20prelinkedkernel/prelinkedkernelb3penryn.zip?raw=true --progress-bar -L -o /private/tmp/prelinkedkernel.zip
curl https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/boot.efi?raw=true --progress-bar -L -o /private/tmp/boot.efi
cd ..
cd Library/Preferences/SystemConfiguration/
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd .. ; cd .. ; cd ..
cd System/Library/PrelinkedKernels
sudo unzip /private/tmp/prelinkedkernel.zip -d .
cd ..
cd CoreServices
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/boot.efi .
echo "Done"
echo "\nAfter reboot your BigSur should use a patched BaseSystem with prelinkedkernel instead of BootKernelExtensions.kc\n and legacy USB and Wifi should work on USB BigSur Installer\n"
else
echo "\nWarning: you don't have any USB BigSur Installer plugged\n\nNote to run directly from BigSur an ethernet internet connection is required\n"
fi
