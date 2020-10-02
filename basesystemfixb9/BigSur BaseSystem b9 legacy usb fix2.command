#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 9 BaseSystem.dmg prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 9 BaseSystem.dmg prelinkedkernel fix for legacy USB\n and non-APFS Mac this version does include Sound, Wifi and legacy usb fixes"
echo "\nBigSur BaseSystem prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS BaseSystem"
if [ -e /Volumes/*/BaseSystem/BaseSystem.dmg.shadow ]
then
cd /Volumes/*/BaseSystem/
hdiutil convert -format ULFO -o ~/Downloads/BaseSystem2.dmg BaseSystem.dmg -shadow
mv BaseSystem.dmg BaseSystembackup.dmg
rm BaseSystem.dmg.shadow
mv ~/Downloads/BaseSystem2.dmg BaseSystem.dmg
echo "\nPatching BigSur USB Installer prelinkedkernel can take up to 10 minutes"
curl https://github.com/jacklukem/BigSurfixes/raw/master/installer%20fix/com.apple.Boot.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist
curl https://github.com/jacklukem/BigSurfixes/blob/master/patched%20prelinkedkernel/prelinkedkernelb3penryn.zip?raw=true --progress-bar -L -o /private/tmp/prelinkedkernel.zip
curl https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/boot.efi?raw=true --progress-bar -L -o /private/tmp/boot.efi
curl https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/HaxfixUSB.zip?raw=true --progress-bar -L -o /private/tmp/HaxfixUSB.zip
cd ..
cd Library/Preferences/SystemConfiguration/
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd .. ; cd .. ; cd ..
cd System/Library
mkdir PrelinkedKernels
cd PrelinkedKernels
sudo unzip /private/tmp/prelinkedkernel.zip -d .
cd ..
cd CoreServices
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/boot.efi .
cd .. ; cd .. ; cd ..
sudo unzip /private/tmp/HaxfixUSB.zip -d .
mv HaxFixUSB/* .
echo "Done"
echo "\nAfter reboot your BigSur should use a patched BaseSystem with prelinkedkernel instead of BootKernelExtensions.kc\n and legacy USB , Sound and Wifi should work on USB BigSur Installer\n"
else
echo "\nWarning: you should launch first BaseSystem fix or you don't have any USB BigSur Installer plugged\n\nNote to run directly from BigSur an ethernet or Wifi internet connection is required\n"
fi
