#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 9 unpatching BaseSystem.dmg prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 9 unpatching BaseSystem.dmg prelinkedkernel this version does not include Sound, Wifi and legacy usb fixes"
echo "\nBigSur unpatching BaseSystem prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS BaseSystem"
if [ -e /Volumes/*/BaseSystem/BaseSystembackup.dmg ]
then
cd /Volumes/*/BaseSystem/
mv BaseSystem.dmg BaseSystempatched.dmg
mv BaseSystembackup.dmg BaseSystem.dmg
echo "\nUnpatching BigSur USB Installer BKE can take up to 5 minutes"
curl https://github.com/jacklukem/BigSurfixes/raw/master/installer%20fix/com.apple.Boot3.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/blob/master/basesystemfixb9/boot%20b9%20stock.efi?raw=true --progress-bar -L -o /private/tmp/boot.efi
curl https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/HaxfixUSB.zip?raw=true --progress-bar -L -o /private/tmp/HaxfixUSB.zip
cd ..
cd Library/Preferences/SystemConfiguration/
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd .. ; cd .. ; cd ..
cd System/Library/CoreServices
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/boot.efi .
echo "Done"
echo "\nAfter reboot your BigSur should use a stock BaseSystem with BootKernelExtensions.kc\n"
else
echo "\nWarning: You don't have any USB BigSur Installer plugged\n\nNote to run directly from BigSur an ethernet or Wifi internet connection is required\n"
fi
