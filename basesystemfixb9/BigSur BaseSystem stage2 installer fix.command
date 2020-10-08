#!/bin/sh
#!/bin/bash
# simple Bash Menu Script by jackluke


printf '\e[96m;%s\a' "$color"

printf "$'\e[40m'BigSur beta 9 stage2 BaseSystem.dmg prelinkedkernel fix by jackluke"

printf "\n\n\n"

clear && printf '\e[3J'
echo "Welcome to the BigSur beta 9 stage2 BaseSystem.dmg prelinkedkernel this version does not include Sound, Wifi and legacy usb fixes"
echo "\nBigSur stage2 BaseSystem prelinkedkernel fix can't be executed as standard user if you want to suspend the script just press CTRL+Z"
echo "\nto apply this fix your current account password is required\notherwise the script can't process\n"
echo "\nSetting nvram parameter to enforce compatibility check"
sudo nvram boot-args="-no_compat_check"
echo "Done"
echo "\nDetecting and adjusting BigSur APFS Data macOS Installer"
if [ -e /Volumes/*/"macOS Install Data"/"Locked Files" ] && [ -e /Volumes/*/BaseSystem/BaseSystembackup.dmg ]
then
sudo chflags -R nouchg /Volumes/*/"macOS Install Data"/"Locked Files"/
cd /Volumes/*/BaseSystem/
sudo cp BaseSystem.dmg /Volumes/*/"macOS Install Data"/
cd System/Library/KernelCollections/
cd ..
cd PrelinkedKernels
sudo cp prelinkedkernel /Volumes/*/"macOS Install Data"/"Locked Files"/
sudo mv prelinkedkernel BootKernelExtensions.kc
echo "\nDone\n"
echo "\nAfter reboot your BigSur stage2 macOS Installer should use a patched BaseSystem with BootKernelExtensions.kc as prelinkedkernel\n"
else
echo "\nWarning: You don't have any USB BigSur Installer plugged or any BigSur macOS Install Data\n"
fi
