#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[92m;%s\a' "$color"

printf "$'\e[40m'BigSur MacBook4,1 BaseSystem fix prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur MacBook4,1 BaseSystem fix2 for legacy USB\n and non-APFS Mac this version does include Sound, Wifi and legacy usb fixes"
echo "\nBigSur MacBook4,1 BaseSystem prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS BaseSystem"
if [ -e /Volumes/BigSurBaseSystemfix/BaseSystem/BaseSystem.dmg.shadow ]
then
cd /Volumes/BigSurBaseSystemfix/BaseSystem/
hdiutil convert -format ULFO -o ~/Downloads/BaseSystem2.dmg BaseSystem.dmg -shadow
mv BaseSystem.dmg BaseSystembackup.dmg
rm BaseSystem.dmg.shadow
mv ~/Downloads/BaseSystem2.dmg BaseSystem.dmg
echo "\nPatching BigSur USB Installer prelinkedkernel can take up to 10 minutes"
curl https://github.com/jacklukem/BigSurfixes/blob/master/macbook41/prelinkedkernelMB41_BT_GMAX3100.zip?raw=true --progress-bar -L -o /private/tmp/prelinkedkernel.zip
curl https://github.com/jacklukem/BigSurfixes/blob/master/macbook41/kext.zip?raw=true --progress-bar -L -o /private/tmp/kext.zip
cd ..
cd System/Library/PrelinkedKernels
sudo unzip -o /private/tmp/prelinkedkernel.zip -d .
cd ..
cd CoreServices
sudo mv PlatformSupport.plist PlatformSupport.plist2
sudo bless --folder . --bootefi ./boot.efi --label "BigSur MacBook41 BS fix"
cd .. ; cd .. ; cd ..
rm -r kext
mkdir kext
cd kext
sudo unzip -o /private/tmp/kext.zip -d .
rm -r __MACOSX
cd ..
echo "Done"
echo "\nAfter reboot your BigSur should use a patched BaseSystem for MacBook4,1 with prelinkedkernel instead of BootKernelExtensions.kc\n and legacy USB , Sound and Wifi should work on USB BigSur Installer\n"
else
echo "\nWarning: you should launch first BaseSystem fix or you don't have any BigSurBaseSystem plugged\n\nNote to run directly from BigSur an ethernet or Wifi internet connection is required\n"
fi
