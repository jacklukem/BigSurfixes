#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[92m;%s\a' "$color"

printf "$'\e[40m'BigSur BaseSystem fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur BaseSystem fix2 for legacy USB\n and non-APFS Mac this version does not legacy usb fixes"
echo "\nBigSur BaseSystem fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check amfi_get_out_of_my_way=1"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS BaseSystem"
if [ -e /Volumes/*/BaseSystem/BaseSystem.dmg.shadow ]
then
cd /Volumes/*/BaseSystem/
hdiutil convert -format ULFO -o ~/Downloads/BaseSystem2.dmg BaseSystem.dmg -shadow
mv BaseSystem.dmg BaseSystembackup.dmg
rm BaseSystem.dmg.shadow
mv ~/Downloads/BaseSystem2.dmg BaseSystem.dmg
echo "\nPatching BigSur USB Installer can take up to 15 minutes"

curl https://github.com/jacklukem/BigSurfixes/raw/master/installer%20fix/com.apple.Boot3.plist --progress-bar -L -o /private/tmp/com.apple.Boot.plist

curl https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/boot.efi?raw=true --progress-bar -L -o /private/tmp/boot.efi
curl https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/HaxfixUSB.zip?raw=true --progress-bar -L -o /private/tmp/HaxfixUSB.zip
curl https://github.com/jacklukem/BigSurfixes/blob/master/installer%20fix/nonmetalkext.zip?raw=true --progress-bar -L -o /private/tmp/kext.zip
cd ..
cd Library/Preferences/SystemConfiguration/
sudo cp -a /private/tmp/com.apple.Boot.plist .
cd .. ; cd .. ; cd ..
cd System/Library/CoreServices
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo cp -a /private/tmp/boot.efi .
sudo bless --folder . --bootefi ./boot.efi --label "BigSur Installer (BaseSystem fix)"
cd .. ; cd .. ; cd ..
mkdir custom
sudo unzip -o /private/tmp/HaxfixUSB.zip -d .
sudo unzip -o /private/tmp/kext.zip -d .
mv HaxFixUSB/* .
rm -r HaxFixUSB __MACOSX
echo "Done"
echo "\nAfter reboot your BigSur should use a patched BaseSystem with stock BootKernelExtensions.kc\n \n"
else
echo "\nWarning: you should launch first BaseSystem fix or you don't have any USB BigSur Installer plugged\n\nNote to run directly from BigSur an ethernet or Wifi internet connection is required\n"
fi
